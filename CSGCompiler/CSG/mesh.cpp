#include <CSG/mesh.h>
#include <limits>

namespace CSG {

    Mesh::Mesh() : dimension_(3) {
    }

    void Mesh::set_dimension(index_t dimension) {
	csg_debug_assert(dimension == 2 || dimension == 3);
	if(dimension_ != dimension) {
	    vector<double> new_points(dimension*nb_vertices(),0.0);
	    for(index_t v=0; v<nb_vertices(); ++v) {
		for(index_t c=0; c<2; ++c) {
		    new_points[v*dimension+c] = points_[v*dimension_+c];
		}
	    }
	    dimension_ = dimension;
	    points_.swap(new_points);
	}
    }

    void Mesh::update() {
	// Update BBox here if need be
    }

    void Mesh::append_mesh(Mesh& M, index_t operand) {
	index_t v_ofs = nb_vertices();
	points_.reserve((nb_vertices() + M.nb_vertices())*dimension_);
	edges_.reserve((nb_edges() + M.nb_edges())*2);
	triangles_.reserve((nb_triangles() + M.nb_triangles())*3);
	edges_operands_.reserve(nb_edges() + M.nb_edges());
	triangles_operands_.reserve(nb_triangles() + M.nb_triangles());

	for(index_t v=0; v<M.nb_vertices(); ++v) {
	    vec3 p = M.point(v);
	    if(dimension() == 2) {
		create_vertex(vec2(p.x, p.y));
	    } else {
		create_vertex(p);
	    }
	}

	for(index_t e=0; e<M.nb_edges(); ++e) {
	    index_t v1 = M.edge_vertex(e,0);
	    index_t v2 = M.edge_vertex(e,1);
	    index_t ne = create_edge(v1 + v_ofs, v2 + v_ofs);
	    edges_operands_[ne] = operand;
	}

	for(index_t t=0; t<M.nb_triangles(); ++t) {
	    index_t v1 = M.triangle_vertex(t,0);
	    index_t v2 = M.triangle_vertex(t,1);
	    index_t v3 = M.triangle_vertex(t,2);
	    index_t nt = create_triangle(v1 + v_ofs, v2 + v_ofs, v3 + v_ofs);
	    triangles_operands_[nt] = operand;
	}
    }


    void Mesh::clear() {
	points_.clear();
	edges_.clear();
	triangles_.clear();
	edges_operands_.clear();
	triangles_operands_.clear();
    }

    void Mesh::get_bbox(vec3& minp, vec3& maxp) const {
	minp = vec3(
	    std::numeric_limits<double>::max(),
	    std::numeric_limits<double>::max(),
	    std::numeric_limits<double>::max()
	);
	maxp = -minp;
	for(index_t v=0; v<nb_vertices(); ++v) {
	    vec3 p = point(v);
	    minp = min(minp,p);
	    maxp = max(maxp,p);
	}
    }

    void Mesh::create_polygon(vector<index_t> vertices) {
	// TODO: better triangulation
	csg_assert(vertices.size() >= 3);
	index_t first_t = create_triangles(vertices.size() - 2);
	for(index_t i=1; i+1<vertices.size(); ++i) {
	    set_triangle(first_t+i-1, vertices[0], vertices[i], vertices[i+1]);
	}
    }

    void Mesh::remove_isolated_vertices() {
	// TODO
    }

}
