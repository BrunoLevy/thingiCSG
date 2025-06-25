#include <CSG/mesh_io.h>
#include <CSG/mesh.h>
#include <CSG/line_stream.h>
#include <CSG/b_stream.h>
#include <fstream>

namespace {
    using namespace CSG;

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
	Logger::out("IO") << "Saving " << filename << std::endl;
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


	bool z_all_zero = true;
	for(index_t v = 0; v<M.nb_vertices(); ++v) {
	    if(M.point_3d(v).z != 0.0) {
		z_all_zero = false;
		break;
	    }
	}
	if(z_all_zero) {
	    M.set_dimension(2);
	}

	M.merge_duplicated_points();
	M.compute_borders();

	return true;
    }

    bool mesh_load_STL_binary(
	Mesh& M, const std::filesystem::path& filename
    ) {
	M.clear();
	M.set_dimension(3);

	BinaryInputStream in(filename, BinaryStream::CSG_LITTLE_ENDIAN);
	char header[80];
	in.read_opaque_data(header, 80);
	if(!in.OK()) {
	    Logger::err("IO") <<  "failed to read header" << std::endl;
	    return false;
	}

	uint32_t nb_triangles;
	in >> nb_triangles;
	if(!in.OK()) {
	    Logger::err("IO") << "failed to read number of triangles"
			      << std::endl;
	    return false;
	}

	M.create_vertices(nb_triangles*3);
	M.create_triangles(nb_triangles);

	for(index_t t = 0; t < nb_triangles; t++) {
	    float N[3];
            float XYZ[9];
	    in >> N[0] >> N[1] >> N[2];
	    for(index_t i = 0; i < 9; i++) {
		in >> XYZ[i];
	    }
	    if(!in.OK()) {
		Logger::err("IO") << "failed to read triangle" << std::endl;
		return false;
	    }

	    uint16_t attrib;
	    in >> attrib;

	    M.point_3d(3*t)   = vec3(XYZ[0], XYZ[1], XYZ[2]);
	    M.point_3d(3*t+1) = vec3(XYZ[3], XYZ[4], XYZ[5]);
	    M.point_3d(3*t+2) = vec3(XYZ[6], XYZ[7], XYZ[8]);
	    M.set_triangle(t, 3*t, 3*t+1, 3*t+2);
	}
	return true;
    }

    bool mesh_load_STL(
	Mesh& M, const std::filesystem::path& filename
    ) {
	FILE* F = fopen(filename.c_str(), "rb");
	if(F == nullptr) {
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
	Logger::out("IO") << "Saving " << filename << std::endl;

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
}

namespace CSG {

    bool mesh_load(Mesh& M, const std::filesystem::path& filename) {
	if(filename.extension() == ".stl" || filename.extension() == ".STL") {
	    return mesh_load_STL(M, filename);
	}
	Logger::err("IO") << filename.extension() << ": Unknown load extension"
			  << std::endl;
	return false;
    }

    bool mesh_save(const Mesh& M, const std::filesystem::path& filename) {
	if(filename.extension() == ".stl" || filename.extension() == ".STL") {
	    return mesh_save_STL_ascii(M, filename);
	}
	if(filename.extension() == ".obj" || filename.extension() == ".OBJ") {
	    return mesh_save_OBJ(M, filename);
	}
	Logger::err("IO") << filename.extension() << ": Unknown write extension"
			  << std::endl;
	return false;
    }

}
