#ifndef CSG_MESH
#define CSG_MESH

#include <CSG/common.h>

namespace CSG {

    class CSG_API Mesh {
    public:
    void load(const std::string& filename);
    void save(const std::string& filename) const;

    vector<vec3> point;
    vector<ivec3> triangle;
    };
}

#endif
