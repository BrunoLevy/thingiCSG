#ifndef CSG_COMMON
#define CSG_COMMON

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

    typedef glm::dvec2 vec2;
    typedef glm::dvec3 vec3;
    typedef glm::dvec4 vec4;
    typedef glm::dmat4 mat4;

    typedef glm::ivec2 ivec2;
    typedef glm::ivec3 ivec3;


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
         * \brief Creates a one char string
         * \param[in] c the character to convert to a string
         * \return a string that contains characater \p c
         */
        inline std::string char_to_string(char c) {
            char s[2];
            s[0] = c;
            s[1] = '\0';
            return std::string(s);
        }


        /**
         * \brief Converts a typed value to a string
         * \param[in] value the typed value to convert
         * \return a string that contain the stringified form of the value
         */
        template <class T> inline std::string to_string(const T& value) {
            std::ostringstream out;
            // Makes sure that double-precision number are displayed
            // with a sufficient number of digits. This is important
            // to avoid losing precision when using ASCII files.
            out << std::setprecision(17);
            out << value;
            return out.str();
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
	    return std::cerr << "[" << cat << "] ";
	}
    }
}

/**************************************************************************/

#endif
