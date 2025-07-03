#include <CSG/statistics.h>
#include <CSG/mesh.h>
#include <stack>
#include <fstream>

namespace CSG {

    Statistics::Statistics(const Mesh& mesh) {

	// Geometry
	area = 0.0;
	volume = 0.0;
	for(index_t t=0; t<mesh.nb_triangles(); ++t) {
	    vec3 p1 = mesh.point_3d(mesh.triangle_vertex(t,0));
	    vec3 p2 = mesh.point_3d(mesh.triangle_vertex(t,1));
	    vec3 p3 = mesh.point_3d(mesh.triangle_vertex(t,2));
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

	closed_and_manifold = true;
	nb_edges = 0;
	nb_vertices = mesh.nb_vertices();
	nb_triangles = mesh.nb_triangles();

	auto b = edges.begin();
	while(b != edges.end()) {
	    auto e = b+1;
	    while(e != edges.end() && *e == *b) {
		++e;
	    }
	    closed_and_manifold = closed_and_manifold && (e-b == 2);
	    ++nb_edges;
	    b = e;
	}
	if(closed_and_manifold) {
	    Xi = int(nb_vertices) - int(nb_edges) + int(nb_triangles);
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
	    Xi = 0;
	    nb_components = 0;
	}

	// Mesh quality
	vector<double> all_angles;
	all_angles.reserve(3*nb_triangles);
	vector<index_t> histo(360,0);

	for(index_t t=0; t<mesh.nb_triangles(); ++t) {
	    vec3 p[3] = {
		mesh.point_3d(mesh.triangle_vertex(t,0)),
		mesh.point_3d(mesh.triangle_vertex(t,1)),
		mesh.point_3d(mesh.triangle_vertex(t,2))
	    };
	    for(index_t e=0; e<3; ++e) {
		vec3 p1 = p[e];
		vec3 p2 = p[(e+1)%3];
		vec3 p3 = p[(e+2)%3];

		vec3 a = p2-p1;
		vec3 b = p3-p1;
		double lab = ::sqrt(length2(a)*length2(b));
		double cosangle = (lab > 1e-50) ? (dot(a, b) / lab) : 1.0;
		// Numerical precision problem may occur, and generate
		// normalized dot products that are outside the valid
		// range of acos.
		cosangle = std::max(cosangle,-1.0);
		cosangle = std::min(cosangle, 1.0);
		double angle = ::acos(cosangle) * 180.0 / M_PI;
		all_angles.push_back(angle);
		histo[index_t(angle)]++;
	    }
	}
	std::sort(all_angles.begin(), all_angles.end());
	min_angle = *all_angles.begin();
	max_angle = *all_angles.rbegin();
	med_angle = *(all_angles.begin() + all_angles.size()/2);
	avg_angle = 0;
	for(double a: all_angles) {
	    avg_angle += a;
	}
	avg_angle /= double(all_angles.size());
	std::ofstream out("angles.dat");
	for(index_t i=0; i<histo.size(); ++i) {
	    out << i << " " << histo[i] << std::endl;
	}
    }

    void Statistics::show() {
	Logger::out("Stats") << "  Geometry:"
			     << " area=" << area
			     << " volume=" << volume
			     << std::endl;
	if(closed_and_manifold) {
	    Logger::out("Stats") << "  Topology:"
				 << " Xi=" << Xi
				 << " #comp=" << nb_components
				 << std::endl;
	} else {
	    Logger::out("Stats") << "Topology: non-manifold/non-closed"
				 << std::endl;
	}
	Logger::out("Stats") << "Complexity:"
			     << " nv=" << nb_vertices
			     << " ne=" << nb_edges
			     << " nf=" << nb_triangles
			     << std::endl;
	Logger::out("Stats") << "   Quality:"
			     << " mina=" << min_angle
			     << " avga=" << avg_angle
			     << " meda=" << med_angle
			     << " maxa=" << max_angle
			     << std::endl;
    }
}
