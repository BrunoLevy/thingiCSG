#ifndef CSG_COMMON
#define CSG_COMMON

#include <CSG/defs.h>

#include <glm/vec2.hpp>
#include <glm/vec3.hpp>
#include <glm/vec4.hpp>
#include <glm/mat4x4.hpp>

#include <vector>
#include <string>
#include <iostream>
#include <sstream>
#include <iomanip>

#include <cstdint>

/**************************************************************************/

#define CSG_API

/**************************************************************************/

#define csg_assert(x) {                                     \
        if(!(x)) {                                          \
            CSG::assertion_failed(#x, __FILE__, __LINE__);  \
        }                                                   \
    }

#define csg_assert_not_reached \
    CSG::assertion_failed("Should not have reached", __FILE__, __LINE__)

#ifdef NDEBUG
#define csg_debug_assert(x)
#else
#define csg_debug_assert(x) csg_assert(x)
#endif

#define csg_argused(x) (void)(x)

/**************************************************************************/

namespace CSG {
    [[noreturn]] void CSG_API assertion_failed(
        const std::string& condition_string,
        const std::string& file, int line
    );

    typedef uint32_t index_t;
    static constexpr index_t NO_INDEX = index_t(-1);

    typedef glm::dvec2 vec2;
    typedef glm::dvec3 vec3;
    typedef glm::dvec4 vec4;
    typedef glm::dmat4 mat4;

    typedef glm::ivec2 ivec2;
    typedef glm::ivec3 ivec3;

    using glm::length;
    using glm::normalize;
    using glm::cross;
    using glm::dot;
    using glm::min;
    using glm::max;
    using glm::determinant;

    inline std::ostream& operator<<(std::ostream& out, vec2 v) {
	return (out << v.x << ' ' << v.y);
    }

    inline std::ostream& operator<<(std::ostream& out, vec3 v) {
	return (out << v.x << ' ' << v.y << ' ' << v.z);
    }

    inline std::ostream& operator<<(std::ostream& out, vec4 v) {
	return (out << v.x << ' ' << v.y << ' ' << v.z << ' ' << v.w);
    }

    inline double round(double x) {
        return ((x - floor(x)) > 0.5 ? ceil(x) : floor(x));
    }


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
            csg_debug_assert(i < size());
            return baseclass::operator[] (i);
        }

        const T& operator[] (index_t i) const {
            csg_debug_assert(i < size());
            return baseclass::operator[] (i);
        }
    };
}

/**************************************************************************/

namespace CSG {

    namespace String {

        /**
         * \brief Converts a typed value to a string
         * \param[in] value the typed value to convert
         * \return a string that contain the stringified form of the value
         */
        template <class T> inline std::string to_string(const T& value) {
	   return std::to_string(value);
        }

        /**
         * \brief Converts a boolean value to a string
         * \param[in] value the boolean value to convert
         * \return string \c "true" if the boolean value is true
         * or \c "false" if the boolean value is false
         */
        template <> inline std::string to_string(const bool& value) {
            return value ? "true" : "false";
        }

        /**
         * \brief Converts a C string to a typed value
         * \details This is a generic version that uses a std::istringstream
         * to extract the value from the string.
         * \param[in] s the source string
         * \param[out] value the typed value
         * \retval true if the conversion was successful
         * \retval false otherwise
         */
        template <class T>
        inline bool from_string(const char* s, T& value) {
            std::istringstream in(s);
            return (in >> value) && (in.eof() || ((in >> std::ws) && in.eof()));
        }

        /**
         * \brief Converts a std::string to a typed value
         * \details This is a generic version that uses a std::istringstream
         * to extract the value from the string.
         * \param[in] s the source string
         * \param[out] value the typed value
         * \retval true if the conversion was successful
         * \retval false otherwise
         */
        template <class T>
        inline bool from_string(const std::string& s, T& value) {
            return from_string(s.c_str(), value);
        }


        /**
         * \brief Creates a string from a format string and additional
         *  arguments. Works like sprintf()
         * \param[in] format the format string
         */
        std::string CSG_API format(const char* format, ...)
#ifndef GOMGEN
#ifdef GEO_COMPILER_GCC_FAMILY
        // Tells the compiler that format is a printf-like format
        // string, so that it can check that the arguments match
        // the format string and bark at you if it is not the case.
            __attribute__ ((__format__(printf, 1, 2)))
#endif
#endif
        ;
    }

    namespace Logger {
	inline std::ostream& out(const std::string& cat) {
	    return std::cout << "[" << cat << "] ";
	}

	inline std::ostream& err(const std::string& cat) {
	    return std::cerr << "[E]-[" << cat << "] ";
	}

	inline std::ostream& warn(const std::string& cat) {
	    return std::cerr << "[W]-[" << cat << "] ";
	}

    }
}

/**************************************************************************/

#endif
