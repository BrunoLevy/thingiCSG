#ifndef CSG_MESH
#define CSG_MESH

#include <CSG/common.h>
#include <memory>

namespace CSG {

    /**
     * \brief Base class for user-defined cached information
     *  associated with a Mesh.
     */
    class CSG_API MeshCachedInformation {
    public:
	virtual ~MeshCachedInformation();
    };

    class CSG_API Mesh {
    public:

    Mesh();

    index_t dimension() const {
	return dimension_;
    }

    void set_dimension(index_t dimension);

    void clear();

    /***************************/

    index_t nb_vertices() const {
	return (points_.size() / dimension_);
    }

    const vec2& point_2d(index_t v) const {
	csg_debug_assert(v < nb_vertices());
	csg_debug_assert(dimension_ == 2);
	return *reinterpret_cast<const vec2*>(
	    points_.data() + dimension_ * v
	);
    }

    vec2& point_2d(index_t v) {
	csg_debug_assert(v < nb_vertices());
	csg_debug_assert(dimension_ == 2);
	return *reinterpret_cast<vec2*>(
	    points_.data() + dimension_ * v
	);
    }

    const vec3& point_3d(index_t v) const {
	csg_debug_assert(v < nb_vertices());
	csg_debug_assert(dimension_ == 3);
	return *reinterpret_cast<const vec3*>(
	    points_.data() + dimension_ * v
	);
    }

    vec3& point_3d(index_t v) {
	csg_debug_assert(v < nb_vertices());
	csg_debug_assert(dimension_ == 3);
	return *reinterpret_cast<vec3*>(
	    points_.data() + dimension_ * v
	);
    }

    vec3 point(index_t v) const {
	return (dimension() == 3) ? point_3d(v) : vec3(point_2d(v),0.0);
    }

    index_t create_vertices(index_t nb) {
	index_t result = nb_vertices();
	points_.resize(points_.size() + nb * dimension_);
	return result;
    }

    index_t create_vertex() {
	return create_vertices(1);
    }

    index_t create_vertex(vec2 p) {
	csg_debug_assert(dimension_ == 2);
	index_t result = create_vertex();
	point_2d(result) = p;
	return result;
    }

    index_t create_vertex(vec3 p) {
	csg_debug_assert(dimension_ == 3);
	index_t result = create_vertex();
	point_3d(result) = p;
	return result;
    }

    double* point_data() {
	return points_.data();
    }

    const double* point_data() const {
	return points_.data();
    }

    /***************************/

    index_t nb_triangles() const {
	return triangles_.size() / 3;
    }

    index_t create_triangles(index_t nb) {
	index_t result = nb_triangles();
	triangles_.resize(triangles_.size()+3*nb,NO_INDEX);
	triangles_operands_bits_.resize(
	    triangles_operands_bits_.size()+nb,NO_INDEX
	);
	return result;
    }

    index_t create_triangle() {
	return create_triangles(1);
    }

    index_t create_triangle(index_t v1, index_t v2, index_t v3) {
	csg_debug_assert(v1 < nb_vertices());
	csg_debug_assert(v2 < nb_vertices());
	csg_debug_assert(v3 < nb_vertices());
	index_t result = create_triangle();
	set_triangle(result, v1, v2, v3);
	return result;
    }

    index_t triangle_vertex(index_t t, index_t lv) const {
	csg_debug_assert(t < nb_triangles());
	csg_debug_assert(lv < 3);
	return triangles_[3*t+lv];
    }

    void set_triangle_vertex(index_t t, index_t lv, index_t v) {
	csg_debug_assert(t < nb_triangles());
	csg_debug_assert(lv < 3);
	triangles_[3*t+lv] = v;
    }

    void set_triangle(index_t t, index_t v1, index_t v2, index_t v3) {
	csg_debug_assert(t < nb_triangles());
	triangles_[3*t] = v1;
	triangles_[3*t+1] = v2;
	triangles_[3*t+2] = v3;
    }

    index_t triangle_operand_bits(index_t t) {
	csg_debug_assert(t < nb_triangles());
	return triangles_operands_bits_[t];
    }

    void set_triangle_operand_bits(index_t t, index_t operand_bits) {
	csg_debug_assert(t < nb_triangles());
	triangles_operands_bits_[t] = operand_bits;
    }

    void create_polygon(vector<index_t> vertices);

    /***************************/

    index_t nb_edges() const {
	return edges_.size() / 2;
    }

    index_t create_edges(index_t nb) {
	index_t result = nb_edges();
	edges_.resize(edges_.size()+2*nb,NO_INDEX);
	edges_operands_bits_.resize(edges_operands_bits_.size()+nb,NO_INDEX);
	return result;
    }

    index_t create_edge() {
	return create_edges(1);
    }

    index_t create_edge(index_t v1, index_t v2) {
	csg_debug_assert(v1 < nb_vertices());
	csg_debug_assert(v2 < nb_vertices());
	index_t result = create_edge();
	set_edge(result, v1, v2);
	return result;
    }

    index_t edge_vertex(index_t e, index_t lv) const {
	csg_debug_assert(e < nb_edges());
	csg_debug_assert(lv < 2);
	return edges_[2*e+lv];
    }

    void set_edge_vertex(index_t e, index_t lv, index_t v) {
	csg_debug_assert(e < nb_edges());
	csg_debug_assert(lv < 2);
	edges_[2*e+lv] = v;
    }

    void set_edge(index_t e, index_t v1, index_t v2) {
	csg_debug_assert(e < nb_edges());
	edges_[2*e] = v1;
	edges_[2*e+1] = v2;
    }

    index_t edge_operand_bits(index_t e) {
	csg_debug_assert(t < nb_edges());
	return edges_operands_bits_[e];
    }

    void set_edge_operand_bits(index_t e, index_t operand_bits) {
	csg_debug_assert(t < nb_edges());
	edges_operands_bits_[e] = operand_bits;
    }

    /***************************/

    void append_mesh(Mesh& M, index_t operand);
    void get_bbox(vec3& min, vec3& max) const;

    /**
     * \brief Removes some vertices, re-compresses storage
     * \param[in] to_remove a vector of size nb_vertices(), i-th entry
     *  is set to non-zero if vertex i should be deleted. The vector
     *  is modified by the function.
     */
    void remove_vertices(vector<index_t>& to_remove);

    /**
     * \brief Removes some edges, re-compresses storage
     * \param[in] to_remove a vector of size nb_edges(), i-th entry
     *  is set to non-zero if edge i should be deleted. The vector
     *  is modified by the function.
     */
    void remove_edges(vector<index_t>& to_remove);

    /**
     * \brief Removes some triangles, re-compresses storage
     * \param[in] to_remove a vector of size nb_triangles(), i-th entry
     *  is set to non-zero if edge i should be deleted. The vector
     *  is modified by the function.
     */
    void remove_triangles(vector<index_t>& to_remove);

    /**
     * \brief Removes vertices referenced by no edge and no triangle
     */
    void remove_isolated_vertices();

    void remove_all_edges();

    void remove_all_triangles();


    /**
     * \brief Merges points that have exactly the same coordinates
     */
    void merge_duplicated_points();


    /**
     * \brief Replaces all edges with border edges
     */
    void compute_borders();

    /***************************/

    void set_cached_information(MeshCachedInformation* cached) {
	cached_ = std::unique_ptr<MeshCachedInformation>(cached);
    }

    MeshCachedInformation* get_cached_information() const {
	return cached_.get();
    }

    /***************************/

    private:
    vector<double> points_;
    vector<index_t> edges_;
    vector<index_t> triangles_;
    vector<index_t> edges_operands_bits_;
    vector<index_t> triangles_operands_bits_;
    index_t dimension_;
    std::unique_ptr<MeshCachedInformation> cached_;
    };
}

#endif
