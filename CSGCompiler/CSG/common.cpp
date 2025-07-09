#include <CSG/common.h>
#include <cstdlib>
#include <stdarg.h>
#include <geogram.psm.Delaunay/Delaunay_psm.h>

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

	std::string format_time(double seconds) {
	    std::string result;
	    if(true || seconds >= 60.0) {
		int S = int(seconds);
		int H = S / 3600;
		S = S % 3600;
		int M = S / 60;
		double s = seconds - double(H) * 3600.0 - double(M) * 60.0;
		result += String::format("%2d:%02d:%02.2f",H,M,s);
	    } else {
		result = String::to_string(seconds);
	    }

	    return result;
	}

	std::string tolower(const std::string& s) {
	    std::string result = s;
	    std::transform(
		result.begin(), result.end(), result.begin(),
		[](unsigned char c){ return std::tolower(c); }
	    );
	    return result;
	}

    }

    /***************************************************************/

    Stopwatch::Stopwatch(const std::string& task_name, bool verbose) :
        start_(std::chrono::system_clock::now()),
        task_name_(task_name),
        verbose_(verbose)
    {
	if(verbose_) {
	    Logger::out(task_name_) << "Start..." << std::endl;
	}
    }

    Stopwatch::Stopwatch() : verbose_(false) {
       reset();
    }

    void Stopwatch::reset() {
       start_ = std::chrono::system_clock::now();
    }

    double Stopwatch::elapsed_time() const {
	// OMG, such nonsense ...
	// ... but well, lets me get time with reasonable resolution
	// in a portable way.
        auto now(std::chrono::system_clock::now());
        auto elapsed = now-start_;
        auto elapsed_milliseconds =
	    std::chrono::duration_cast<std::chrono::milliseconds>(elapsed);
        return 0.001 * double(elapsed_milliseconds.count());
    }

    double Stopwatch::now() {
        auto now(std::chrono::system_clock::now());
        auto elapsed = now.time_since_epoch();
        auto elapsed_milliseconds =
	    std::chrono::duration_cast<std::chrono::milliseconds>(elapsed);
        return 0.001 * double(elapsed_milliseconds.count());
    }

    Stopwatch::~Stopwatch() {
        if(verbose_) {
	    print_elapsed_time();
	}
    }

    void Stopwatch::print_elapsed_time() {
	Logger::out(task_name_)
	    << "Elapsed: " << String::format_time(elapsed_time())
	    << std::endl;
    }

    /***************************************************************/

    namespace Logger {
	std::ostream& out(const std::string& cat) {
	    return GEO::Logger::out(cat);
	}

	std::ostream& err(const std::string& cat) {
	    return GEO::Logger::err(cat);
	}

	std::ostream& warn(const std::string& cat) {
	    return GEO::Logger::warn(cat);
	}
    }

}
