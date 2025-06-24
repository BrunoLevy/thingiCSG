#include <CSG/mesh.h>
#include <limits>
#include <cstring>

namespace {
    using namespace CSG;


    /**
     * \brief Compresses an array, by
     *  applying an index mapping that fills-in the gaps.
     * \details This is equivalent to:
     * \code
     * for(i=0; i<size(); i++) {
     *    if(old2new[i] != index_t(-1)) {
     *       data2[old2new[i]] = data[i];
     *    }
     * }
     * data = data2 ;
     * \endcode
     * \param[in] old2new the index mapping to be applied.
     * \pre old2new[i] <= i || old2new[i] == NO_INDEX
     * \note This function uses memcpy()
     */
    void compress(
	void* data, const vector<index_t>& old2new, size_t item_size
    ) {
	char* basemem = reinterpret_cast<char*>(data);
        for(index_t i=0; i<old2new.size(); ++i) {
            index_t j = old2new[i];
            if(j == NO_INDEX || j == i) {
                continue;
            }
            csg_debug_assert(j <= i);
	    memcpy(
		basemem + size_t(j) * item_size,
		basemem + size_t(i) * item_size,
		item_size
	    );
        }
    }

    /**
     * \brief Tests whether a vector of indices has all its elements set to 0
     * \param[in] V the vector to be tested
     * \retval true if \p V has all its elements set to 0
     * \retval false otherwise
     */
    bool all_zero(const vector<index_t>& V) {
	for(index_t i: V) {
	    if(i != 0) {
		return false;
	    }
	}
	return true;
    }

}

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

    void Mesh::remove_vertices(vector<index_t>& to_remove) {
	csg_debug_assert(to_remove.size() == nb_vertices());
	if(all_zero(to_remove)) {
	    return;
	}

	// compute re-indexing in same space as to_remove
	vector<index_t>& old2new = to_remove;
	index_t nb=0;
	for(index_t& i : old2new) {
	    if(i == 0) {
		i = nb;
		++nb;
	    } else {
		i = NO_INDEX;
	    }
	}

	compress(points_.data(), old2new, sizeof(double) * dimension());
	points_.resize(nb * dimension());

	for(index_t& i: edges_) {
	    i = old2new[i];
	}

	for(index_t& i: triangles_) {
	    i = old2new[i];
	}
    }


    void Mesh::remove_edges(vector<index_t>& to_remove) {
	csg_debug_assert(to_remove.size() == nb_edges());
	if(all_zero(to_remove)) {
	    return;
	}

	// compute re-indexing in same space as to_remove
	vector<index_t>& old2new = to_remove;
	index_t nb=0;
	for(index_t& i : old2new) {
	    if(i == 0) {
		i = nb;
		++nb;
	    } else {
		i = NO_INDEX;
	    }
	}

	compress(edges_.data(), old2new, sizeof(index_t)*2);
	compress(edges_operands_.data(), old2new, sizeof(index_t));

	edges_.resize(2*nb);
	edges_operands_.resize(nb);
    }

    void Mesh::remove_triangles(vector<index_t>& to_remove) {
	csg_debug_assert(to_remove.size() == nb_triangles());
	if(all_zero(to_remove)) {
	    return;
	}

	// compute re-indexing in same space as to_remove
	vector<index_t>& old2new = to_remove;
	index_t nb=0;
	for(index_t& i : old2new) {
	    if(i == 0) {
		i = nb;
		++nb;
	    } else {
		i = NO_INDEX;
	    }
	}

	compress(triangles_.data(), old2new, sizeof(index_t)*3);
	compress(triangles_operands_.data(), old2new, sizeof(index_t));

	triangles_.resize(3*nb);
	triangles_operands_.resize(nb);
    }

    void Mesh::remove_isolated_vertices() {
	vector<index_t> to_remove(nb_vertices(), 1);
	for(index_t e=0; e<nb_edges(); ++e) {
	    to_remove[edge_vertex(e,0)] = 0;
	    to_remove[edge_vertex(e,1)] = 0;
	}
	for(index_t t=0; t<nb_triangles(); ++t) {
	    to_remove[triangle_vertex(t,0)] = 0;
	    to_remove[triangle_vertex(t,1)] = 0;
	    to_remove[triangle_vertex(t,2)] = 0;
	}
	remove_vertices(to_remove);
    }

    void Mesh::remove_all_edges() {
	edges_.clear();
	edges_operands_.clear();
    }

    void Mesh::remove_all_triangles() {
	triangles_.clear();
	triangles_operands_.clear();
    }

}
