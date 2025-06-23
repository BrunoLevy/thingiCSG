#include <CSG/builder.h>
#include <CSG/compiler.h>
#include <CSG/mesh_io.h>

int main(int argc, char** argv) {
    try {
	if(argc != 2) {
	    CSG::Logger::err("CSGCompiler") << "usage: CSGCompiler source"
					    << std::endl;
	}
	CSG::Compiler compiler;
	compiler.set_verbose(true);
	std::shared_ptr<CSG::Mesh> result = compiler.compile_file(argv[1]);
	if(result != nullptr) {
	    mesh_save(*result, std::filesystem::path("out.stl"));
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
