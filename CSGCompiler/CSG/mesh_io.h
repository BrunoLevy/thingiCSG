#ifndef CSG_MESH_IO
#define CSG_MESH_IO

#include <CSG/common.h>
#include <filesystem>

namespace CSG {
    class Mesh;

    void CSG_API mesh_load(Mesh& M, const std::filesystem::path& filename);
    void CSG_API mesh_save(const Mesh& M, const std::filesystem::path& filename);
}

#endif
