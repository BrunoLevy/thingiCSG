#include <CSG/builder.h>
#include <CSG/builder_exe.h>
#include <CSG/compiler.h>
#include <CSG/mesh_io.h>
#include <CSG/statistics.h>
#include <geogram.psm.Delaunay/Delaunay_psm.h>

namespace {
    using namespace CSG;

    std::shared_ptr<Mesh> run_internal(const std::string& inputfile) {
	if(GEO::CmdLine::get_arg_bool("clear_cache")) {
	    CSG::OpenSCAD_cache_invalidate();
	}
	if(GEO::CmdLine::get_arg_bool("ignore_cache_time")) {
	    CSG::OpenSCAD_cache_ignore_time();
	}
	CSG::Compiler compiler(GEO::CmdLine::get_arg("builder"));
	compiler.set_verbose(GEO::CmdLine::get_arg_bool("verbose"));
	return compiler.compile_file(inputfile);
    }

    std::shared_ptr<Mesh> run_wrapped(const std::filesystem::path& inputfile) {
	bool verbose = GEO::CmdLine::get_arg_bool("verbose");

	std::filesystem::path tmpout =
	    std::filesystem::temp_directory_path() / "tmp.stl";

	std::string command = String::format(
	    GEO::CmdLine::get_arg("wrap_command").c_str(),
	    inputfile.string().c_str(), tmpout.string().c_str()
	);

	if(verbose) {
	    Logger::out("CSG") << "Running external:" << command << std::endl;
	} else {
#ifdef _WIN32_
	    command += " >nul 2>nul";
#else
	    command += " >/dev/null 2>/dev/null";
#endif
	}

	if(system(command.c_str())) {
	    throw(
		std::logic_error(
		    "error while executing command:" + command
		)
	    );
	}

	std::shared_ptr<Mesh> result = std::make_shared<Mesh>();
	if(!mesh_load(*result, tmpout)) {
	    throw(
		std::logic_error(
		    "error while reading:" + tmpout.string()
		)
	    );
	}
	result->merge_duplicated_points();
	return result;
    }
}

int main(int argc, char** argv) {

    GEO::initialize(GEO::GEOGRAM_INSTALL_ALL);
    GEO::CmdLine::import_arg_group("standard");
    GEO::CmdLine::import_arg_group("algo");

    GEO::CmdLine::declare_arg("verbose", false, "log CSG tree parsing");
    GEO::CmdLine::declare_arg(
	"clear_cache", false,
	"systematically regenerate files converted with OpenSCAD"
    );
    GEO::CmdLine::declare_arg(
	"ignore_cache_time", false,
	"ignore file modification time for deciding to use cache"
    );

    GEO::CmdLine::declare_arg(
	"wrap_command", "", "wrap command, measure timing and read output"
    );

    GEO::CmdLine::declare_arg(
	"builder", "dummy", "one of " + CSG::Builder::list_builders()
    );

    CSG::BuilderExe::declare_command_line_args();

    std::vector<std::string> filenames;
    if(
	!GEO::CmdLine::parse(
	    argc, argv, filenames, "csgfilename <outputfile|none>"
	)
    ) {
	return 1;
    }
    if(filenames.size() == 1) {
	filenames.push_back("out.obj");
    }
    try {
        CSG::Statistics stats;
	std::shared_ptr<Mesh> result;
	if(GEO::CmdLine::get_arg("wrap_command") != "") {
	    result = run_wrapped(filenames[0]);
	} else {
	    result = run_internal(filenames[0]);
	}
	if(result != nullptr && result->nb_vertices() != 0) {
	    mesh_save(*result, std::filesystem::path(filenames[1]));
	    if(result->dimension() == 3) {
	        stats.measure(*result);
		stats.show();
	    }
	} else {
	    CSG::Logger::err("CSGCompiler") << "Result is empty" << std::endl;
	}
    } catch(const std::exception& e) {
	std::cerr << "Received an exception: " << e.what() << std::endl;
        return 1;
    }

    CSG::Logger::out("CSGCompiler")
	<< "Everything OK, Returning status 0" << std::endl;

    return 0;
}
