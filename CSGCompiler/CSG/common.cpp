#include <CSG/common.h>
#include <cstdlib>

namespace CSG {

    void assertion_failed(
        const std::string& condition_string,
        const std::string& file, int line
    ) {
	std::cerr << "Assertion failed: " << condition_string << std::endl;
	std::cerr << file << ":" << line << std::endl;
	abort();
    }

}
