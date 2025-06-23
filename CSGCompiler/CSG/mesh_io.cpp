#include <CSG/mesh_io.h>
#include <CSG/mesh.h>
#include <CSG/line_stream.h>
#include <fstream>

namespace {
    using namespace CSG;

    void mesh_save_STL_ascii(
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
    }


    void mesh_load_STL_ascii(Mesh& M, const std::filesystem::path& filename) {
	LineInput in(filename);
	if(!in.OK()) {
	    return;
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
		    return;
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
		    return;
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
	    return;
	}

	if(M.nb_triangles() == 0) {
	    Logger::err("I/O")
		<< "STL file does not contain any facet"
		<< std::endl;
	    return;
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

	// TODO: merge vertices
	// TODO: compute borders
    }


}

namespace CSG {

    void mesh_load(Mesh& M, const std::filesystem::path& filename) {
	if(filename.extension() == ".stl" || filename.extension() == ".STL") {
	    mesh_load_STL_ascii(M, filename);
	    return;
	}
    }

    void mesh_save(const Mesh& M, const std::filesystem::path& filename) {
	if(filename.extension() == ".stl" || filename.extension() == ".STL") {
	    mesh_save_STL_ascii(M, filename);
	    return;
	}
    }

}
