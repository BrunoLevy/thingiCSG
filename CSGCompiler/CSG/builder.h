#ifndef CSG_BUILDER
#define CSG_BUILDER

#include <CSG/common.h>
#include <CSG/mesh.h>
#include <memory>
#include <filesystem>

namespace CSG {

    /**
     * \brief A Scope corresponds to a set of primitive between curly braces
     *  in OpenSCAD, arguments of an operation. It is implemented as a vector
     *  of meshes.
     */
    typedef vector<std::shared_ptr<Mesh>> Scope;

    /**
     * \brief Implements CSG objects and instructions.
     * \details Can be used to construct volumes in C++ with a syntax
     *  very similar to OpenSCAD .csg files.
     */
    class CSG_API Builder {
    public:
    /** \see set_fa() */
    static constexpr double DEFAULT_FA = 12.0;

    /** \see set_fs() */
    static constexpr double DEFAULT_FS = 2.0;

    /** \see set_fn() */
    static constexpr double DEFAULT_FN = 0.0;

    Builder();

    /****** Objects **********/

    virtual std::shared_ptr<Mesh> square(
	vec2 size = vec2(1.0,1.0), bool center=true
    );

    /**
     * \param[in] nu number of fragments. If left unspecified, then it
     *   is deduced from radius and/or $fn variable.
     */
    virtual std::shared_ptr<Mesh> circle(double r=1.0, index_t nu=0);

    virtual std::shared_ptr<Mesh> cube(
	vec3 size = vec3(1.0, 1.0, 1.0), bool center=true
    );

    virtual std::shared_ptr<Mesh> sphere(double r=1.0);

    virtual std::shared_ptr<Mesh> cylinder(
        double h=1.0, double r1=1.0, double r2=1.0, bool center=true
    );

    virtual std::shared_ptr<Mesh> import(
        const std::filesystem::path& filename, const std::string& layer="",
        index_t timestamp=0,
        vec2 origin = vec2(0.0, 0.0), vec2 scale = vec2(1.0,1.0)
    );

    virtual std::shared_ptr<Mesh> surface_with_OpenSCAD(
        const std::string& filename, bool center, bool invert
    );

    virtual std::shared_ptr<Mesh> text_with_OpenSCAD(
	const std::string& text,
	double size = 10.0,
	const std::string& font = "",
	const std::string& halign = "left",
	const std::string& valign = "baseline",
	double spacing = 1.0,
	const std::string& direction = "ltr",
	const std::string& language = "en",
	const std::string& script = "latin"
    );


    /****** Instructions ****/

    /**
     * \brief Groups several meshes into a single one and transforms
     *   them.
     * \param[in] M the transformation matrix. It follows the same
     *   convention as OpenSCAD, that is, not the OpenGL convention.
     *   For instance, a translation matrix has the translation vector
     *   as its third column.
     * \param[in] scope one or several meshes to be merged.
     */
    virtual std::shared_ptr<Mesh> multmatrix(
	const mat4& M, const Scope& scope
    );

    /**
     * \brief Computes the union of two or more meshes.
     * \param[in] scope the meshes
     */
    virtual std::shared_ptr<Mesh> union_instr(const Scope& scope);

    /**
     * \brief Computes the intersection between two or more meshes.
     * \param[in] scope the meshes
     */
    virtual std::shared_ptr<Mesh> intersection(const Scope& scope);

    /**
     * \brief Computes the intersection between two meshes.
     * \details If \p scope contains more than two meshes, it computes
     *   the difference between the first mesh and the union of the rest.
     * \param[in] scope the meshes
     */
    virtual std::shared_ptr<Mesh> difference(const Scope& scope);

    /**
     * \brief synonym for union.
     * \details Maybe there's something I did not understand in
     *  OpenSCAD, but I do not see the difference between group
     *  and union.
     */
    virtual std::shared_ptr<Mesh> group(const Scope& scope);

    /**
     * \brief Groups several meshes into a single one and sets their
     *   color.
     * \param[in] color the color, as r,g,b,a.
     * \details ignored for now, just behaves as group().
     */
    virtual std::shared_ptr<Mesh> color(vec4 color, const Scope& scope);

    /**
     * \brief Computes the convex hull of several meshes.
     * \param[in] scope the meshes
     */
    virtual std::shared_ptr<Mesh> hull(const Scope& scope);

    /**
     * \brief Computes a 3D extrusion from a 2D shape
     * \param[in] scope one or more 2D shapes
     * \param[in] height total height of the extrusion
     * \param[in] center if set, z will go from -height/2 to height/2,
     *   else from 0 to height
     * \param[in] scale scaling factor to be applied to x and y coordinates
     *   when reaching \p height
     * \param[in] slices number of slices along the z axis
     * \param[in] twist rotation to be applied when sweeping, in degrees
     */
    virtual std::shared_ptr<Mesh> linear_extrude(
        const Scope& scope,
        double height = 1.0,
        bool center = false,
        vec2 scale = vec2(1.0,1.0),
        index_t slices = 0,
        double twist = 0.0
    );

    /**
     * \brief Computes a 3D extrusion from a 2D shape
     * \param[in] scope one or more 2D shapes. Everything should be on the
     *   same side of the Y axis, preferably the positive side.
     * \param[in] angle optional angle
     */
    virtual std::shared_ptr<Mesh> rotate_extrude(
	const Scope& scope, double angle = 360.0
    );

    /**
     * \brief Creates a 2D mesh from 3D mesh.
     * \param[in] cut if set, computes the boundary of the intersection
     *   between the object and the X,Y plane, else computes the boundary
     *   of the projection.
     */
    virtual std::shared_ptr<Mesh> projection(const Scope& scope, bool cut);

    /**
     * \brief Appends all meshes in scope into a unique mesh,
     *  without testing for intersections.
     */
    virtual std::shared_ptr<Mesh> append(const Scope& scope);

    /****** Parameters ******/

    /**
     * \brief Resets defaults value for fn, fs, fa
     * \see set_fn(), set_fs(), set_fa()
     */
    void reset_defaults();

    /**
     * \brief Sets the number of fragments.
     * \details This corresponds to the number of edges in a polygonal
     *  approximation of a circle. If left to 0, it is automatically
     *  computed from fs and fa
     * \param[in] fn the number of fragments.
     * \see set_fs(), set_fa()
     */
    void set_fn(double fn) {
        fn_ = std::max(fn, 0.0);
    }

    /**
     * \brief Sets the minimum size for a fragment.
     * \param[in] fs minimum size for a fragment.
     * \details This determines the number of edges in a polygonal
     *  approximation of a circle.
     */
    void set_fs(double fs) {
        fs_ = std::max(fs,0.01);
    }

    /**
     * \brief Sets the minimum angle for a fragment.
     * \param[in] fa minimum angle for a fragment, in degrees.
     * \details This determines the number of edges in a polygonal
     *  approximation of a circle.
     */
    void set_fa(double fa) {
        fa_ = std::max(fa,0.01);
    }

    /**
     * \brief Displays (lots of) additional information
     * \param[in] x whether additional information should be displayed.
     *  Default is off
     */
    void set_verbose(bool x) {
        verbose_ = x;
	if(verbose_) {
	    warnings_ = true;
	}
    }

    /**
     * \brief Tests wheter verbose mode is set.
     * \retval true if additional information will be displayed.
     * \retval false otherwise.
     */
    bool verbose() const {
        return verbose_;
    }

    /**
     * \brief Adds a path to the file path
     * \details The file path is where import() searches files. The default
     *  file path contains the current directory "."
     * \param[in] path the file path to be added, without trailing '/'
     */
    void add_file_path(const std::filesystem::path& path) {
        file_path_.push_back(path);
    }

    /**
     * \brief Resets the file path to its default value, with only the
     *  current directory "."
     */
    void reset_file_path() {
        file_path_.clear();
        file_path_.push_back(std::filesystem::current_path());
    }

    /**
     * \brief Adds a path to the file path
     * \details The file path is where import() searches files. The default
     *  file path contains the current directory "."
     * \param[in] path the file path to be added, without trailing '/'
     */
    void push_file_path(const std::filesystem::path& path) {
	file_path_.push_back(path);
    }

    /**
     * \brief Removes the latest pushed file path
     */
    void pop_file_path() {
	csg_assert(file_path_.size() != 0);
	file_path_.pop_back();
    }

    /**** misc ****/

    protected:

    /**
     * \brief Finds a file in the path
     * \param[in,out] filename the file to be found. On exit, the complete
     *   path to the file if found
     * \retval true if the file could be found
     * \retval false otherwise
     */
    bool find_file(std::filesystem::path& filename);

    /**
     * \brief For the file formats that are not supported by geogram,
     *  get help from OpenSCAD to convert them.
     * \details Converts STEP files.
     */
    std::shared_ptr<Mesh> import_with_openSCAD(
        const std::filesystem::path& filename, const std::string& layer="",
        index_t timestamp=0
    );

    /**
     * \brief Derived classes may override this function and compute
     *  some cached information, e.g. bounding boxes, stored in the
     *  mesh.
     * \see Mesh::set_cached_information(), Mesh::get_cached_information()
     */
    virtual void finalize_mesh(std::shared_ptr<Mesh>& mesh);

    /**
     * \brief Symbolic constants for sweep()
     */
    enum SweepCapping {
	SWEEP_CAP,
	SWEEP_POLE,
	SWEEP_PERIODIC
    };

    /**
     * \brief The generalized sweeping operation
     * \details Used to implement sphere(), cylinder(), linear_extrude() and
     *  rotate_extrude()
     * \param[in,out] mesh on entry, a 2D mesh. On exit, a 3D mesh. The triangles
     *  present in the mesh are used to generate the caps. They are copied to
     *  generate the second cap if \p capping is set to SWEEP_CAP (default).
     * \param[in] nv number of sweeping steps. Minimum is 2.
     * \param[in] sweep_path a function that maps u,v indices to 3D
     *  points, where u is the index of a initial 2D vertex and v
     *  in [0..nv-1] the sweeping step. One can use the point at vertex
     *  u to evaluate the path (it will not be overwritten before calling
     *  sweep_path()). Note that u vertices are not necessarily ordered.
     * \param[in] capping one of:
     *   - SWEEP_CAP standard sweeping, generate second capping by
     *     copying first one
     *   - SWEEP_POLE if last sweeping step degenerates to a
     *     single point
     *   - SWEEP_PERIODIC if no cappings should be generated and last
     *     sweeping step corresponds to first one
     */
    virtual void sweep(
	std::shared_ptr<Mesh>& mesh,
	index_t nv,
	std::function<vec3(index_t, index_t)> sweep_path,
	SweepCapping capping = SWEEP_CAP
    );

    /**
     * \brief Apply a CSG operation to a mesh
     * \details Default implementation works in 2D (based on triangulate())
     *   and does nothing in 3D (to be overriden by user).
     *  Each triangle has an "operand bit" indicating to which input operand
     *  it belongs to, set to (1u << operand_id).
     * \param[in,out] the mesh
     * \param[in] boolean_expr the operation to be applied
     *   - "union"
     *   - "intersection"
     *   - a general boolean expression, where:
     *      - variables are x0 ... x31 (they correspond to input operands)
     *      - operators are +,-,*
     *      - there can be parentheses
     */
    virtual void do_CSG(
	std::shared_ptr<Mesh>& mesh, const std::string& boolean_expr
    );

    /**
     * \brief Triangulates a 2D mesh.
     * \details Computes a constrained Delaunay triangulation from the edges
     *  of the mesh, then classifies the triangles using a boolean expression.
     *  Each edge has an "operand bit" indicating to which input operand
     *  it belongs to, set to (1u << operand_id). Used to implement
     *  CSG operations in 2D.
     * \param[in,out] mesh the input is a set of vertices and edges.
     *   The output has a set of triangles inside the polygons defined by
     *   the edges.
     * \param[in] boolean_expr the operation to be applied, can be one of
     *   - "union"
     *   - "intersection"
     *   - a general boolean expression, where:
     *      - variables are x0 ... x31 (they correspond to input operands)
     *      - operators are +,-,*
     *      - there can be parentheses
     *   - "union_cnstr_operand_bits_is_operand_id", same as "union"
     *     but edges operand bits are set to
     *     operand_id (instead of 1u << operand_id). This allows for an
     *     unlimited number of operands (as opposed to operand bits where
     *     it is limited to 32). It is used to implement projection(cut=false).
     */
    virtual void triangulate(
        std::shared_ptr<Mesh>& mesh, const std::string& boolean_expr
    );

    /**
     * \brief keep only triangles and vertices embedded in the z=0 plane, and
     *  make the mesh 2D.
     * \param[in,out] M a shared pointer to the mesh
     */
    void keep_z0_only(std::shared_ptr<Mesh>& M);

    protected:
    index_t max_arity_;
    bool fused_union_difference_;
    double fn_;
    double fs_;
    double fa_;
    bool verbose_;
    bool warnings_;
    std::vector<std::filesystem::path> file_path_;

    friend class Compiler;
    };

}

#endif
