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


    bool lexico_compare(const vec2& p, const vec2& q) {
	if(p.x < q.x) {
	    return true;
	}
	if(p.x > q.x) {
	    return false;
	}
	return (p.y < q.y);
    }


    bool lexico_compare(const vec3& p, const vec3& q) {
	if(p.x < q.x) {
	    return true;
	}
	if(p.x > q.x) {
	    return false;
	}
	if(p.y < q.y) {
	    return true;
	}
	if(p.y > q.y) {
	    return false;
	}
	return (p.z < q.z);
    }

}

namespace CSG {

    MeshCachedInformation::~MeshCachedInformation() {
    }

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

    void Mesh::append_mesh(Mesh& M, index_t operand_bits) {
	index_t v_ofs = nb_vertices();
	points_.reserve((nb_vertices() + M.nb_vertices())*dimension_);
	edges_.reserve((nb_edges() + M.nb_edges())*2);
	triangles_.reserve((nb_triangles() + M.nb_triangles())*3);
	edges_operands_bits_.reserve(nb_edges() + M.nb_edges());
	triangles_operands_bits_.reserve(nb_triangles() + M.nb_triangles());

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
	    edges_operands_bits_[ne] = operand_bits;
	}

	for(index_t t=0; t<M.nb_triangles(); ++t) {
	    index_t v1 = M.triangle_vertex(t,0);
	    index_t v2 = M.triangle_vertex(t,1);
	    index_t v3 = M.triangle_vertex(t,2);
	    index_t nt = create_triangle(v1 + v_ofs, v2 + v_ofs, v3 + v_ofs);
	    triangles_operands_bits_[nt] = operand_bits;
	}
    }

    void Mesh::clear() {
	points_.clear();
	edges_.clear();
	triangles_.clear();
	edges_operands_bits_.clear();
	triangles_operands_bits_.clear();
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
	compress(edges_operands_bits_.data(), old2new, sizeof(index_t));

	edges_.resize(2*nb);
	edges_operands_bits_.resize(nb);
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
	compress(triangles_operands_bits_.data(), old2new, sizeof(index_t));

	triangles_.resize(3*nb);
	triangles_operands_bits_.resize(nb);
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
	edges_operands_bits_.clear();
    }

    void Mesh::remove_all_triangles() {
	triangles_.clear();
	triangles_operands_bits_.clear();
    }

    void Mesh::merge_duplicated_points() {
	vector<index_t> sorted(nb_vertices());
	for(index_t i=0; i<nb_vertices(); ++i) {
	    sorted[i] = i;
	}
	std::sort(
	    sorted.begin(), sorted.end(),
	    [this](index_t i, index_t j)->bool{
		return lexico_compare(point(i), point(j));
	    }
	);

	// compute remapping from sorted indices
	vector<index_t> old2new(nb_vertices());
	auto b = sorted.begin();
	while(b != sorted.end()) {
	    auto e = b+1;
	    while(e != sorted.end() && point(*e) == point(*b)) {
		++e;
	    }
	    for(auto i=b; i!=e; ++i) {
		old2new[*i] = *b;
	    }
	    b = e;
	}

	// remap edges and triangles indices
	for(index_t& i: edges_) {
	    i = old2new[i];
	}

	for(index_t& i: triangles_) {
	    i = old2new[i];
	}

	// remove duplicated vertices
	vector<index_t>& to_remove = old2new;
	for(index_t i=0; i<to_remove.size(); ++i) {
	    to_remove[i] = (to_remove[i] == i) ? 0 : 1;
	}

	remove_vertices(to_remove);
    }


    void Mesh::compute_borders() {

	typedef std::pair<index_t, index_t> Edge;
	auto normalized = [](const Edge& E)->Edge {
	    return std::make_pair(
		std::min(E.first, E.second),
		std::max(E.first, E.second)
	    );
	};

	remove_all_edges();

	vector<std::pair<index_t, index_t>> edges;
	edges.reserve(nb_triangles()*3);
	for(index_t t=0; t<nb_triangles(); ++t) {
	    for(index_t le=0; le<3; ++le) {
		index_t v1 = triangle_vertex(t, le);
		index_t v2 = triangle_vertex(t, (le+1)%3);
		edges.emplace_back(v1,v2);
	    }
	}

	std::sort(
	    edges.begin(), edges.end(),
	    [normalized](const Edge& E1, const Edge& E2)->bool {
		return(normalized(E1) < normalized(E2));
	    }
	);

	auto b = edges.begin();
	while(b != edges.end()) {
	    auto e = b+1;
	    while(e != edges.end() && normalized(*e) == normalized(*b)) {
		++e;
	    }
	    if(e-b != 2) {
		create_edge(b->first, b->second);
	    }
	    b = e;
	}

    }

}
