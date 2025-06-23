#include <CSG/mesh.h>

namespace CSG {

    Mesh::Mesh() : dimension_(0) {
    }

    void Mesh::load(const std::string& filename) {
	csg_argused(filename);
    }

    void Mesh::save(const std::string& filename) const {
	csg_argused(filename);
    }

    void Mesh::set_dimension(index_t dimension) {
	dimension_ = dimension;
    }

}
