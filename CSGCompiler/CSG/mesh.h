#ifndef CSG_MESH
#define CSG_MESH

#include <CSG/common.h>

namespace CSG {

    class CSG_API Mesh {
    public:

    Mesh();

    index_t dimension() const {
	return dimension_;
    }

    void set_dimension(index_t dimension);

    void load(const std::string& filename);
    void save(const std::string& filename) const;

    vector<vec2> point2d;
    vector<vec3> point3d;

    vector<ivec2> segment;
    vector<ivec3> triangle;

    private:
    index_t dimension_;
    };
}

#endif
