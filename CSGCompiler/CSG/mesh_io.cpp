#include <CSG/mesh_io.h>
#include <CSG/mesh.h>
#include <CSG/line_stream.h>
#include <fstream>
#include <map>

namespace {
    std::map<std::string, CSG::Loader> loaders_;
    std::map<std::string, CSG::Saver> savers_;
}

namespace CSG {
    void register_loader(Loader L, const std::string extension) {
	loaders_[extension] = L;
    }

    void register_saver(Saver S, const std::string extension) {
	savers_[extension] = S;
    }
}

namespace {
    using namespace CSG;

    /****** STL *********************************************************/

    bool mesh_save_STL_ascii(
	const Mesh& M, const std::filesystem::path& filename
    ) {
	std::ofstream out(filename);
	if(!out) {
	    Logger::err("IO")
		<< "Could not open " << filename
		<< std::endl;
	    return false;
	}
	out << std::setprecision(19);
	out << "solid geogram" << std::endl;
	for(index_t t = 0; t < M.nb_triangles(); ++t) {
	    // Seriously, this ASCII STL format is soooo verbose !!!
	    // Crazy...

	    vec3 p[3] = {
		M.point(M.triangle_vertex(t,0)),
		M.point(M.triangle_vertex(t,1)),
		M.point(M.triangle_vertex(t,2))
	    };

	    out << "facet normal " << normalize(cross(p[1]-p[0],p[2]-p[0]))
		<< std::endl;
	    out << "outer loop" << std::endl;
	    for(index_t lv=0; lv<3; ++lv) {
		if(M.dimension() == 2) {
		    out << "vertex " << M.point_2d(M.triangle_vertex(t,lv))
			<< " 0"
			<< std::endl;
		} else {
		    out << "vertex " << M.point_3d(M.triangle_vertex(t,lv))
			<< std::endl;
		}
	    }
	    out << "endloop" << std::endl;
	    out << "endfacet" << std::endl;
	}
	out << "endsolid" << std::endl;
	return true;
    }


    bool mesh_load_STL_ascii(Mesh& M, const std::filesystem::path& filename) {
	LineInput in(filename);
	if(!in.OK()) {
	    return false;
	}

	M.clear();
	M.set_dimension(3);

	index_t current_chart = 0;
	bool facet_opened = false;
	vector<index_t> facet_vertices;

	while(!in.eof() && in.get_line()) {
	    in.get_fields();
	    if(in.field_matches(0, "outer")) {
		facet_vertices.resize(0);
		facet_opened = true;
	    } else if(in.field_matches(0, "endloop")) {
		facet_opened = false;
		if(facet_vertices.size() != 3) {
		    Logger::err("I/O") << in.line_number()
				       << ": facet with "
				       << facet_vertices.size()
				       << " vertices"
				       << std::endl;
		    M.clear();
		    return false;
		}
		index_t t = M.create_triangle(
		    facet_vertices[0], facet_vertices[1], facet_vertices[2]
		);
	    } else if(in.field_matches(0, "vertex")) {
		if(in.nb_fields() < 4) {
		    Logger::err("I/O")
			<< "Line " << in.line_number()
			<< ": vertex line has " << in.nb_fields() - 1
			<< " fields (at least 3 required)"
			<< std::endl;
		    return false;
		}
		vec3 p(
		    in.field_as_double(1),
		    in.field_as_double(2),
		    in.field_as_double(3)
		);
		index_t v = M.create_vertex(p);
		facet_vertices.push_back(v);
	    } else if(in.field_matches(0, "solid")) {
		current_chart++;
	    }
	}

	if(facet_opened) {
	    M.clear();
	    Logger::err("I/O")
		<< "Line " << in.line_number()
		<< ": current facet is not closed"
		<< std::endl;
	    return false;
	}

	if(M.nb_triangles() == 0) {
	    Logger::err("I/O")
		<< "STL file does not contain any facet"
		<< std::endl;
	    return false;
	}


	return true;
    }

    template <class T> bool fread(FILE* F, T& data, const char* what) {
	if(fread(&data, 1, sizeof(data), F) != sizeof(data)) {
	    Logger::err("IO") << "Error while reading " << what << std::endl;
	    return false;
	}
	return true;
    }

    template <class T> bool fwrite(FILE* F, const T& data, const char* what) {
	if(fwrite(&data, 1, sizeof(data), F) != sizeof(data)) {
	    Logger::err("IO") << "Error while writing " << what << std::endl;
	    return false;
	}
	return true;
    }

    bool mesh_save_STL_binary(
	const Mesh& M, const std::filesystem::path& filename
    ) {
	FILE* F = fopen(filename.c_str(), "wb");
	if(F == nullptr) {
	    Logger::err("IO") << "Could not open " << filename << std::endl;
	    return false;
	}

	char header[80];
	::memset(header, 0, 80);
	strcpy(header, "generated with thingiCSG compiler");

	if(!fwrite(F, header, "header")) {
	    fclose(F);
	    return false;
	}

	uint32_t nb_triangles = M.nb_triangles();
	if(!fwrite(F, nb_triangles, "nb_triangles")) {
	    fclose(F);
	    return false;
	}

	for(index_t t=0; t<M.nb_triangles(); ++t) {
	    vec3 p[3] = {
		M.point(M.triangle_vertex(t,0)),
		M.point(M.triangle_vertex(t,1)),
		M.point(M.triangle_vertex(t,2))
	    };
	    vec3 n = normalize(cross(p[1]-p[0],p[2]-p[0]));
	    struct {
		float N[3];
		float XYZ[9];
	    } T;
	    T.N[0] = float(n.x);
	    T.N[1] = float(n.y);
	    T.N[2] = float(n.z);
	    for(index_t lv=0; lv<3; ++lv) {
		for(index_t c=0; c<3; ++c) {
		    T.XYZ[lv*3+c] = float(p[lv][c]);
		}
	    }

	    if(!fwrite(F, T, "triangle")) {
		fclose(F);
		return false;
	    }

	    uint16_t attrib = 0;
	    if(!fwrite(F, attrib, "attrib")) {
		fclose(F);
		return false;
	    }
	}

	fclose(F);
	return true;
    }

    bool mesh_load_STL_binary(Mesh& M, const std::filesystem::path& filename) {
	M.clear();
	M.set_dimension(3);

	FILE* F = fopen(filename.c_str(), "rb");
	if(F == nullptr) {
	    Logger::err("IO") << "Could not open " << filename << std::endl;
	    return false;
	}

	char header[80];
	if(!fread(F, header, "header")) {
	    fclose(F);
	    return false;
	}

	uint32_t nb_triangles;
	if(!fread(F, nb_triangles, "nb_triangles")) {
	    fclose(F);
	    return false;
	}

	M.create_vertices(nb_triangles*3);
	M.create_triangles(nb_triangles);

	for(index_t t = 0; t < nb_triangles; t++) {
	    struct {
		float N[3];
		float XYZ[9];
	    } T;
	    if(!fread(F, T, "triangle")) {
		fclose(F);
		return false;
	    }
	    uint16_t attrib;
	    if(!fread(F, attrib, "attrib")) {
		fclose(F);
		return false;
	    }

	    M.point_3d(3*t)   = vec3(T.XYZ[0], T.XYZ[1], T.XYZ[2]);
	    M.point_3d(3*t+1) = vec3(T.XYZ[3], T.XYZ[4], T.XYZ[5]);
	    M.point_3d(3*t+2) = vec3(T.XYZ[6], T.XYZ[7], T.XYZ[8]);
	    M.set_triangle(t, 3*t, 3*t+1, 3*t+2);
	}

	fclose(F);
	return true;
    }

    bool mesh_load_STL(
	Mesh& M, const std::filesystem::path& filename
    ) {
	FILE* F = fopen(filename.c_str(), "rb");
	if(F == nullptr) {
	    Logger::err("IO") << "Could not open " << filename << std::endl;
	    return false;
	}

	// The safe way of checking whether an STL file is
	// binary is to check whether the size of the file
	// matches the size deduced from the number of triangles
	// (many binary STL files start with SOLID although it
	//  is supposed to be only for ASCII STL files)
	fseek(F, 80, SEEK_SET);
	int32_t nb_triangles;
	if(fread(&nb_triangles, sizeof(nb_triangles), 1, F) != 1) {
	    Logger::err("I/O")
		<< "Cannot deduce the format of STL file"
		<< std::endl;
	    fclose(F);
	    return false;
	}
	fseek(F, 0, SEEK_END);
	long file_size = ftell(F);
	fclose(F);
	bool result;
	if(file_size == long(nb_triangles * 50 + 84)) {
	    result = mesh_load_STL_binary(M, filename);
	} else {
	    result = mesh_load_STL_ascii(M, filename);
	}
	return result;
    }

    bool mesh_save_STL(
	const Mesh& M, const std::filesystem::path& filename
    ) {
	return mesh_save_STL_binary(M, filename);
    }

    /****** OBJ *********************************************************/

    bool mesh_save_OBJ(
	const Mesh& M, const std::filesystem::path& filename
    ) {
	std::ofstream out(filename);
	if(!out) {
	    throw(
		std::logic_error(
		    std::string("Could not open ") + filename.c_str()
		)
	    );
	}
	out << std::setprecision(19);
	for(index_t v=0; v<M.nb_vertices(); ++v) {
	    out << "v " << M.point(v) << std::endl;
	}
	for(index_t t=0; t<M.nb_triangles(); ++t) {
	    out << "f "
		<< M.triangle_vertex(t,0)+1 << " "
		<< M.triangle_vertex(t,1)+1 << " "
		<< M.triangle_vertex(t,2)+1
		<< std::endl;
	}
	for(index_t e=0; e<M.nb_edges(); ++e) {
	    out << "l "
		<< M.edge_vertex(e,0)+1 << " "
		<< M.edge_vertex(e,1)+1
		<< std::endl;
	}
	return true;
    }

    bool mesh_load_OBJ(
	Mesh& M, const std::filesystem::path& filename
    ) {
	LineInput in(filename);
	if(!in.OK()) {
	    return false;
	}

	M.clear();
	M.set_dimension(3);

	while(!in.eof() && in.get_line()) {
	    in.get_fields();
	    if(in.field_matches(0,"v")) {
		vec3 p(
		    in.field_as_double(1),
		    in.field_as_double(2),
		    in.field_as_double(3)
		);
		M.create_vertex(p);
	    } else if(in.field_matches(0,"f")) {
		M.create_triangle(
		    in.field_as_int(1)-1,
		    in.field_as_int(2)-1,
		    in.field_as_int(3)-1
		);
	    }
	}
	return true;
    }

    /****** OFF *********************************************************/

    bool mesh_save_OFF(
	const Mesh& M, const std::filesystem::path& filename
    ) {
	std::ofstream out(filename);
	if(!out) {
	    throw(
		std::logic_error(
		    std::string("Could not open ") + filename.c_str()
		)
	    );
	}
	out << std::setprecision(19);
	out << "OFF" << std::endl;
	out << M.nb_vertices() << " " << M.nb_triangles() << " " << M.nb_edges()
	    << std::endl;
	for(index_t v=0; v<M.nb_vertices(); ++v) {
	    out << M.point(v) << std::endl;
	}
	for(index_t t=0; t<M.nb_triangles(); ++t) {
	    out << "3 "
		<< M.triangle_vertex(t,0) << " "
		<< M.triangle_vertex(t,1) << " "
		<< M.triangle_vertex(t,2)
		<< std::endl;
	}
	return true;
    }

    bool mesh_load_OFF(
	Mesh& M, const std::filesystem::path& filename
    ) {
	LineInput in(filename);
	if(!in.OK()) {
	    return false;
	}

	M.clear();
	M.set_dimension(3);

	in.get_line();
	in.get_fields();
	if(in.nb_fields() == 1 && in.field_matches(0,"OFF")) {
	    in.get_line();
	    in.get_fields();
	}

	if(in.nb_fields() != 3) {
	    Logger::err("IO") << "Invalid header" << std::endl;
	    return false;
	}

	index_t nb_vertices = index_t(in.field_as_int(0));
	index_t nb_facets = index_t(in.field_as_int(1));

	M.create_vertices(nb_vertices);
	M.create_triangles(nb_facets);
	// M.create_edges(nb_edges);
	for(index_t v=0; v<nb_vertices; ++v) {
	    if(in.eof()) {
		Logger::err("IO") << "File appears to be truncated" << std::endl;
		return false;
	    }
	    in.get_line();
	    in.get_fields();
	    if(in.nb_fields() != 3) {
		Logger::err("IO") << "Invalid vertex" << std::endl;
		return false;
	    }
	    vec3 p(
		in.field_as_double(0),
		in.field_as_double(1),
		in.field_as_double(2)
	    );
	    M.point_3d(v) = p;
	}
	for(index_t t=0; t<nb_facets; ++t) {
	    if(in.eof()) {
		Logger::err("IO") << "File appears to be truncated" << std::endl;
		return false;
	    }
	    in.get_line();
	    in.get_fields();
	    if(in.nb_fields() != 4) {
		Logger::err("IO") << "Invalid face" << std::endl;
		return false;
	    }
	    if(in.field_as_int(0) != 3) {
		Logger::err("IO") << "Only triangles are supported" << std::endl;
		return false;
	    }
	    M.set_triangle(
		t,
		index_t(in.field_as_int(1)),
		index_t(in.field_as_int(2)),
		index_t(in.field_as_int(3))
	    );
	}

	return true;
    }

    /******************************************************************/

}

namespace CSG {

    bool mesh_load(
	Mesh& M, const std::filesystem::path& filename, bool verbose
    ) {
	if(verbose) {
	    Logger::out("IO") << "Loading " << filename << std::endl;
	}

	std::string K = String::tolower(filename.extension().string());
	auto it = loaders_.find(K);
	if(it != loaders_.end()) {
	    return it->second(M, filename);
	}

	Logger::err("IO") << K << ": Unknown load extension"  << std::endl;
	return false;
    }

    bool mesh_save(
	const Mesh& M, const std::filesystem::path& filename, bool verbose
    ) {
	if(verbose) {
	    Logger::out("IO") << "Saving " << filename << std::endl;
	}

	std::string K = String::tolower(filename.extension().string());
	auto it = savers_.find(K);
	if(it != savers_.end()) {
	    return it->second(M, filename);
	}

	Logger::err("IO") << K << ": Unknown write extension" << std::endl;
	return false;
    }
}

namespace {
    class CSGMeshIOInit {
    public:
	CSGMeshIOInit() {
	    register_loader(mesh_load_OBJ, ".obj");
	    register_loader(mesh_load_STL, ".stl");
	    register_loader(mesh_load_OFF, ".off");
	    register_saver(mesh_save_OBJ, ".obj");
	    register_saver(mesh_save_STL, ".stl");
	    register_saver(mesh_save_OFF, ".off");
	}
    } csg_mesh_io_init;
}
