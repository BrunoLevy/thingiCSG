#ifndef CSG_MESH_IO
#define CSG_MESH_IO

#include <CSG/common.h>
#include <filesystem>

namespace CSG {
    class Mesh;

    /**
     * \brief Loads a mesh
     * \details In STL files, duplicated points are NOT merged automatically,
     *   to do so one needs to call M.merge_duplicated_points() after.
     *   With STL again, 2D meshes are NOT automatically detected,
     *   one needs to check Z coordinates of all vertices and call
     *   M.set_dimension(2) it they are all zero. (Design choice: load what's
     *   in the file, no more than that, and let the caller do the job to
     *   interpret it).
     * \param[out] M a reference to the mesh, overwritten by file content
     * \param[in] filename the file to be loaded
     * \param[in] verbose if set, displays a message for each loaded file
     * \retval true on success
     * \retval false otherwise
     * \see register_loader()
     */
    bool CSG_API mesh_load(
	Mesh& M, const std::filesystem::path& filename, bool verbose=false
    );

    /**
     * \brief Saves a mesh
     * \param[in] M the mesh
     * \param[in] filename the file where to store the mesh
     * \param[in] verbose if set, displays a message for each saved file.
     * \see register_saver()
     */
    bool CSG_API mesh_save(
	const Mesh& M, const std::filesystem::path& filename, bool verbose=false
    );

    /** \brief Function type for register_loader() */
    typedef std::function<bool(Mesh&, const std::filesystem::path&)> Loader;

    /** \brief Function type for register_saver() */
    typedef std::function<bool(const Mesh&, const std::filesystem::path&)> Saver;

    /**
     * \brief registers a loader for a given mesh file format.
     * \param[in] Loader the loader function, with the following signature:
     *   bool loader(Mesh& M, const std::filesystem::path& filepath);
     *   and that returns true on success and false otherwise
     * \param[in] extension lowercase, with the '.'
     * \see mesh_load()
     */
    void CSG_API register_loader(Loader L, const std::string extension);

    /**
     * \brief registers a saver for a given mesh file format.
     * \param[in] Saver the saver function, with the following signature:
     *   bool saver(const Mesh& M, const std::filesystem::path& filepath);
     *   and that returns true on success and false otherwise
     * \param[in] extension lowercase, with the '.'
     * \see mesh_save()
     */
    void CSG_API register_saver(Saver S, const std::string extension);
}

#endif
