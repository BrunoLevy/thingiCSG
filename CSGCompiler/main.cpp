#include <CSG/builder.h>
#include <CSG/compiler.h>
#include <CSG/mesh_io.h>
#include <geogram.psm.Delaunay/Delaunay_psm.h>

int main(int argc, char** argv) {
    GEO::initialize(GEO::GEOGRAM_INSTALL_ALL);
    GEO::CmdLine::import_arg_group("standard");
    GEO::CmdLine::import_arg_group("algo");
    std::vector<std::string> filenames;

    GEO::CmdLine::declare_arg("verbose", false, "log CSG tree parsing");
    GEO::CmdLine::declare_arg(
	"clear_cache", false,
	"systematically regenerate files converted with OpenSCAD"
    );
    GEO::CmdLine::declare_arg(
	"ignore_cache_time", false,
	"ignore file modification time for deciding to use cache"
    );

    if(
	!GEO::CmdLine::parse(
	    argc, argv, filenames, "csgfilename <outputfile|none>"
	)
    ) {
	return 1;
    }

    try {
	if(GEO::CmdLine::get_arg_bool("clear_cache")) {
	    CSG::OpenSCAD_cache_invalidate();
	}
	if(GEO::CmdLine::get_arg_bool("ignore_cache_time")) {
	    CSG::OpenSCAD_cache_ignore_time();
	}
	CSG::Compiler compiler;
	compiler.set_verbose(GEO::CmdLine::get_arg_bool("verbose"));
	std::shared_ptr<CSG::Mesh> result = compiler.compile_file(filenames[0]);
	if(result != nullptr) {
	    std::string outputfile = "out.obj";
	    if(filenames.size() == 2) {
		outputfile = filenames[1];
	    }
	    mesh_save(*result, std::filesystem::path(outputfile));
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
