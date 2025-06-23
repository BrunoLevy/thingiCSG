#include <CSG/common.h>
#include <cstdlib>
#include <stdarg.h>

namespace CSG {

    void assertion_failed(
        const std::string& condition_string,
        const std::string& file, int line
    ) {
	std::cerr << "Assertion failed: " << condition_string << std::endl;
	std::cerr << file << ":" << line << std::endl;
	abort();
    }

    namespace String {
        std::string format(const char* format, ...) {
            size_t length = 0;

            // Determine required length
            va_list arg_ptr;
            va_start(arg_ptr, format);
            length = size_t(vsnprintf(nullptr, 0, format, arg_ptr));
            va_end(arg_ptr);

            // Create the string of required length and sprintf() into it
            std::string result(length,'*');
            va_start(arg_ptr, format);
            vsnprintf(
		const_cast<char*>(result.c_str()), length+1, format, arg_ptr
	    );
            va_end(arg_ptr);

            return result;
        }
    }

}
