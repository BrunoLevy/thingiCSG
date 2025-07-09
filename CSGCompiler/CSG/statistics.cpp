#include <CSG/statistics.h>
#include <CSG/mesh.h>
#include <CSG/line_stream.h>
#include <stack>
#include <fstream>
#include <map>
#include <geogram.psm.Delaunay/Delaunay_psm.h>

namespace CSG {

    Statistics::Statistics() : W("Stats",false) {
	area = 0.0;
	volume = 0.0;
	closed = false;
	manifold = false;
	Xi = std::numeric_limits<int>::min();
	nb_components = 0;
	nb_vertices = 0;
	nb_edges = 0;
	nb_triangles = 0;
        elapsed_time = 0.0;
	validated = false;
    }


    void Statistics::measure(const Mesh& mesh) {
	validated = false;
        elapsed_time = W.elapsed_time();

	// Geometry
	area = 0.0;
	volume = 0.0;
	for(index_t t=0; t<mesh.nb_triangles(); ++t) {
	    vec3 p1 = mesh.point(mesh.triangle_vertex(t,0));
	    vec3 p2 = mesh.point(mesh.triangle_vertex(t,1));
	    vec3 p3 = mesh.point(mesh.triangle_vertex(t,2));
	    area += 0.5 * length(cross(p2-p1,p3-p1));
	    volume += dot(p1, cross(p2, p3)) / 6.0;
	}
	volume = ::fabs(volume);

	// Topology and mesh complexity
	struct Hedge {
	    index_t v1;
	    index_t v2;
	    index_t t;
	    bool operator<(const Hedge& rhs) const {
		if(v1 < rhs.v1) { return true; }
		if(v1 > rhs.v1) { return false; }
		return (v2 < rhs.v2);
	    }
	    bool operator==(const Hedge& rhs) const {
		return (v1 == rhs.v1) && (v2 == rhs.v2);
	    }
	};

	std::vector<Hedge> edges;
	edges.reserve(mesh.nb_triangles()*3);
	for(index_t t=0; t<mesh.nb_triangles(); ++t) {
	    index_t v1 = mesh.triangle_vertex(t,0);
	    index_t v2 = mesh.triangle_vertex(t,1);
	    index_t v3 = mesh.triangle_vertex(t,2);
	    edges.push_back({std::min(v1,v2), std::max(v1,v2), t});
	    edges.push_back({std::min(v2,v3), std::max(v3,v2), t});
	    edges.push_back({std::min(v3,v1), std::max(v1,v3), t});
	}
	std::sort(edges.begin(), edges.end());

	closed = true;
	manifold = true;
	nb_edges = 0;
	nb_vertices = mesh.nb_vertices();
	nb_triangles = mesh.nb_triangles();

	auto b = edges.begin();
	while(b != edges.end()) {
	    auto e = b+1;
	    while(e != edges.end() && *e == *b) {
		++e;
	    }
	    closed = closed && (e-b > 1);
	    manifold = manifold && (e-b <= 2);
	    ++nb_edges;
	    b = e;
	}
	Xi = int(nb_vertices) - int(nb_edges) + int(nb_triangles);
	if(closed && manifold) {
	    // compute facet adjacency graph. Facet f's neighboring
	    // facets are f_adj[3*f], f_adj[3*f+1], f_adj[3*f+2]
	    vector<index_t> f_adj(3*mesh.nb_triangles(),NO_INDEX);
	    for(auto it = edges.begin(); it != edges.end(); it+=2) {
		csg_debug_assert(*it == *(it+1));
		index_t t1 = it->t;
		index_t t2 = (it+1)->t;
		for(index_t e=0; e<3; ++e) {
		    if(f_adj[3*t1+e] == NO_INDEX) {
			f_adj[3*t1+e] = t2;
			break;
		    }
		}
		for(index_t e=0; e<3; ++e) {
		    if(f_adj[3*t2+e] == NO_INDEX) {
			f_adj[3*t2+e] = t1;
			break;
		    }
		}
	    }
	    vector<index_t> f_comp(mesh.nb_triangles(), NO_INDEX);
	    std::stack<index_t> S;
	    nb_components = 0;
	    for(index_t f=0; f<mesh.nb_triangles(); ++f) {
		if(f_comp[f] == NO_INDEX) {
		    S.push(f);
		    f_comp[f] = nb_components;
		    while(!S.empty()) {
			index_t g = S.top();
			S.pop();
			for(index_t e=0; e<3; ++e) {
			    index_t h = f_adj[3*g+e];
			    if(f_comp[h] == NO_INDEX) {
				f_comp[h] = nb_components;
				S.push(h);
			    }
			}
		    }
		    ++nb_components;
		}
	    }
	} else {
	    nb_components = 0;
	}

        W.reset();
    }

    void Statistics::show() {
	Logger::out("Stats") << "      File: "
			     << filename
			     << std::endl;
       Logger::out("Stats")  << "      Time: "
	                     << String::format_time(elapsed_time)
	                     << std::endl;
	Logger::out("Stats") << "     Sizes:"
			     << " nv=" << nb_vertices
			     << " ne=" << nb_edges
			     << " nf=" << nb_triangles
			     << std::endl;
	Logger::out("Stats") << "  Geometry:"
			     << " area=" << area
			     << " volume=" << volume
			     << std::endl;
	Logger::out("Stats") << "  Topology:"
			     << " closed=" << closed
			     << " manif=" << manifold
			     << " Xi=" << Xi
			     << " #comp=" << nb_components
			     << std::endl;
    }


    void Statistics::append_stats_to_file(const std::filesystem::path& file) {
	bool existed = std::filesystem::is_regular_file(file);
	bool with_validation = (
	    GEO::CmdLine::get_arg("validate:reference_stats_file") != ""
	);
	std::ofstream out(file, std::ios::app);
	if(!existed) {
	    out << "filename, area, volume, closed, manifold, "
		<< "Xi, nb_components, "
		<< "nb_vertices, nb_edges, nb_triangles, "
		<< "time";
	    if(with_validation) {
		out << ", validated";
	    }
	    out << std::endl;
	}
	out << filename.filename().string() << ", "
	    << area << ", " << volume << ", "
	    << closed << ", " << manifold << ", "
	    << Xi << ", " << nb_components << ", "
	    << nb_vertices << ", " << nb_edges << ", " << nb_triangles << ", "
	    << String::format_time(elapsed_time);
	if(with_validation) {
	    out << ", " << validated;
	}
	out << std::endl;
    }

    void Statistics::load(
	const std::filesystem::path& stats_file,
	const std::filesystem::path& mesh_file
    ) {
	std::map<std::string, index_t> header;
	LineInput in(stats_file.string());

	auto find_field = [&](const std::string& name)->index_t {
	    auto it = header.find(name);
	    if(it == header.end()) {
		throw(std::logic_error((name + ": no such field").c_str()));
	    }
	    return it->second;
	};

	if(!in.OK()) {
	    throw(
		std::logic_error(
		    "Could not open: " + stats_file.string()
		)
	    );
	}
	in.get_line();
	in.get_fields(", \t\r\n");
	for(index_t i=0; i<in.nb_fields(); ++i) {
	    header[in.field(i)] = i;
	}

	index_t filename_field = find_field("filename");
	index_t area_field = find_field("area");
	index_t volume_field = find_field("volume");
	index_t closed_field = find_field("closed");
	index_t manifold_field = find_field("manifold");
	index_t Xi_field = find_field("Xi");
	index_t nb_components_field = find_field("nb_components");
	index_t nb_vertices_field = find_field("nb_vertices");
	index_t nb_edges_field = find_field("nb_edges");
	index_t nb_triangles_field = find_field("nb_triangles");

	while(!in.eof()) {
	    in.get_line();
	    in.get_fields(", \t\r\n");
	    if(in.nb_fields() == 0) {
		break;
	    }
	    if(in.field(filename_field) == mesh_file) {
		filename = mesh_file;
		area = in.field_as_double(area_field);
		volume = in.field_as_double(volume_field);
		closed = in.field_as_int(closed_field);
		manifold = in.field_as_int(manifold_field);
		Xi = in.field_as_int(Xi_field);
		nb_components = in.field_as_uint(nb_components_field);
		nb_vertices = in.field_as_uint(nb_vertices_field);
		nb_edges = in.field_as_uint(nb_edges_field);
		nb_triangles = in.field_as_uint(nb_triangles_field);
		elapsed_time = 0.0; // Todo: parse time
		return;
	    }
	}

	throw(
	    std::logic_error(
		(
		    mesh_file.string() + ": no such mesh file in " +
		    stats_file.string()
		).c_str()
	    )
	);
    }

    bool Statistics::matches(const Statistics& reference) const {


	Logger::out("Validate") << "    File: " << filename << std::endl;
	Logger::out("Validate") << "    Time: "
				<< String::format_time(elapsed_time)
				<< std::endl;
	Logger::out("Validate") << "   Sizes:"
				<< " nv=" << nb_vertices
				<< " ne=" << nb_edges
				<< " nf=" << nb_triangles
				<< std::endl;

	bool geometry_OK = true;

	double volume_threshold =
	    reference.volume * 0.01 *
	    GEO::CmdLine::get_arg_double("validate:volume_tolerance");

	bool volume_OK = ::fabs(volume - reference.volume) < volume_threshold;

	Logger::out("Validate") << "Geometry:"
				<< " " << (volume_OK ? "OK" : "KO") << " "
				<< "volume " << volume << " " << reference.volume
				<< std::endl;

	geometry_OK = geometry_OK && volume_OK;

	double area_threshold =
	    reference.area * 0.01 *
	    GEO::CmdLine::get_arg_double("validate:area_tolerance");

	bool area_OK = ::fabs(area - reference.area) < area_threshold;

	Logger::out("Validate") << "Geometry:"
				<< " " << (area_OK ? "OK" : "KO")
				<< " area " << area << " " << reference.area
				<< std::endl;

	geometry_OK = geometry_OK && area_OK;

	Logger::out("Validate") << "Topology:"
				<< " " << ((closed && manifold) ? "OK" : "KO")
				<< " closed " << closed
				<< " manifold " << manifold
				<< std::endl;

	bool topology_OK = closed && manifold;

	Logger::out("Validate") << "Topology:"
				<< " " << ((Xi == reference.Xi) ? "OK" : "KO")
				<< " Xi " << Xi << " " << reference.Xi
				<< std::endl;

	topology_OK = topology_OK && (Xi == reference.Xi);

	Logger::out("Validate")
	    << "Topology:"
	    << " " << ((nb_components == reference.nb_components) ? "OK" : "KO")
	    << " #comp " << nb_components
	    << " " << reference.nb_components
	    << std::endl;

	topology_OK = topology_OK && (nb_components == reference.nb_components);

	bool OK = geometry_OK && topology_OK;

	Logger::out("Validate") << "Combined: " << (OK ? "OK" : "KO")
				<< std::endl;

	return OK;
    }

}
