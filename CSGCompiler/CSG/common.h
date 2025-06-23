#ifndef CSG_COMMON
#define CSG_COMMON

#include <glm/vec3.hpp>

#include <vector>
#include <string>
#include <iostream>

#include <cstdint>

#define CSG_API

#define csg_assert(x) {                                     \
        if(!(x)) {                                          \
            CSG::assertion_failed(#x, __FILE__, __LINE__);  \
        }                                                   \
    }

#ifdef NDEBUG
#define csg_debug_assert(x)
#else
#define csg_debug_assert(x) csg_assert(x)
#endif

#define csg_argused(x) (void)(x)

namespace CSG {
    [[noreturn]] void CSG_API assertion_failed(
        const std::string& condition_string,
        const std::string& file, int line
    );

    typedef uint32_t index_t;

    typedef glm::dvec3 vec3;
    typedef glm::ivec3 ivec3;

    /**
     * \brief vector with index_t indices and bounds checking in debug mode.
     */
    template <class T> class vector : public ::std::vector<T> {
        typedef ::std::vector<T> baseclass;
    public:

        vector() : baseclass() {
        }

        explicit vector(index_t size) : baseclass(size) {
        }

        explicit vector(index_t size, const T& val) : baseclass(size, val) {
        }

        index_t size() const {
            return index_t(baseclass::size());
        }

        T& operator[] (index_t i) {
            geo_debug_assert(i < size());
            return baseclass::operator[] (i);
        }

        const T& operator[] (index_t i) const {
            geo_debug_assert(i < size());
            return baseclass::operator[] (i);
        }
    };

}


#endif
