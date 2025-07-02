#include <CSG/builder_exe.h>
#include <CSG/mesh_io.h>

namespace CSG {

    BuilderExe::BuilderExe() {
	max_arity_ = 2;
	fused_union_difference_ = false;
    }

    std::shared_ptr<Mesh> BuilderExe::union_instr(const Scope& scope) {

	if(scope.size() != 0 && scope[0]->dimension() == 2) {
	    max_arity_ = 32;
	    fused_union_difference_ = true;
	    std::shared_ptr<Mesh> result = Builder::union_instr(scope);
	    max_arity_ = 2;
	    fused_union_difference_ = false;
	    return result;
	}

	if(scope.size() > 2) {
	    return Builder::union_instr(scope);
	}

	return external_boolean_op(scope, union_options_);
    }

    std::shared_ptr<Mesh> BuilderExe::intersection(const Scope& scope) {

	if(scope.size() != 0 && scope[0]->dimension() == 2) {
	    max_arity_ = 32;
	    fused_union_difference_ = true;
	    std::shared_ptr<Mesh> result = Builder::intersection(scope);
	    max_arity_ = 2;
	    fused_union_difference_ = false;
	    return result;
	}

	if(scope.size() > 2) {
	    return Builder::intersection(scope);
	}
	return external_boolean_op(scope, intersection_options_);
    }

    std::shared_ptr<Mesh> BuilderExe::difference(const Scope& scope) {

	if(scope.size() != 0 && scope[0]->dimension() == 2) {
	    max_arity_ = 32;
	    fused_union_difference_ = true;
	    std::shared_ptr<Mesh> result = Builder::difference(scope);
	    max_arity_ = 2;
	    fused_union_difference_ = false;
	    return result;
	}

	if(scope.size() > 2) {
	    return Builder::difference(scope);
	}
	return external_boolean_op(scope, difference_options_);
    }

    std::shared_ptr<Mesh> BuilderExe::external_boolean_op(
	const Scope& scope, const std::string& options
    ) {
	csg_assert(scope.size() <= 2);
	if(scope.size() == 0) {
	    return std::make_shared<Mesh>();
	}
	if(scope.size() == 1) {
	    return scope[0];
	}

	std::filesystem::path path = std::filesystem::temp_directory_path();
	std::filesystem::path op1 =
	    path / std::filesystem::path("op1" + extension_);

	std::filesystem::path op2 =
	    path / std::filesystem::path("op2" + extension_);

	std::filesystem::path res =
	    path / std::filesystem::path("result" + extension_);

	mesh_save(*scope[0], op1.string());
	mesh_save(*scope[1], op2.string());

	std::string command = executable_ + "  " + String::format(
	    options.c_str(),
	    op1.string().c_str(),
	    op2.string().c_str(),
	    res.string().c_str()
	);

	Logger::out("CSG") << "Running command" << std::endl;
	if(system(command.c_str())) {
	    Logger::warn("CSG") << "Error while running external boolean op"
				<< std::endl;
	    Logger::warn("CSG") << "(command: " << command <<") "
				<< std::endl;
	}
	Logger::out("CSG") << "Done command" << std::endl;

	std::shared_ptr<Mesh> result = std::make_shared<Mesh>();
	mesh_load(*result, res.string());

	return result;
    }


    /************************************************************/

    BuilderGeogram0::BuilderGeogram0() {
	executable_ = "boolean_op";
	union_options_ = "operation=union %s %s %s";
	intersection_options_ = "operation=intersection %s %s %s";
	difference_options_ = "operation=difference %s %s %s";
	extension_ = ".obj";
    }

    /************************************************************/

    BuilderZhou::BuilderZhou() {
	executable_ = "libigl_609_Boolean";
	union_options_ = "union %s %s %s";
	intersection_options_ = "intersection %s %s %s";
	difference_options_ = "difference %s %s %s";
	extension_ = ".off";
    }

    /************************************************************/

    BuilderCherchi::BuilderCherchi() {
	executable_ = "mesh_booleans";
	union_options_ = "union %s %s %s";
	intersection_options_ = "intersection %s %s %s";
	difference_options_ = "subtraction %s %s %s";
	extension_ = ".obj";
    }

    /************************************************************/

}
