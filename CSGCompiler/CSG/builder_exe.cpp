#include <CSG/builder_exe.h>
#include <CSG/mesh_io.h>
#include <geogram.psm.Delaunay/Delaunay_psm.h>

namespace CSG {

    BuilderExe::BuilderExe() {
	max_arity_ = 2;
	fused_union_difference_ = false;
	executable_ = GEO::CmdLine::get_arg("generic:executable");
	union_options_ = GEO::CmdLine::get_arg("generic:union_options");
	intersection_options_ = GEO::CmdLine::get_arg(
	    "generic:intersection_options"
	);
	difference_options_ = GEO::CmdLine::get_arg(
	    "generic:difference_options"
	);
	extension_ = GEO::CmdLine::get_arg("generic:extension");
    }

    void BuilderExe::declare_command_line_args() {
	GEO::CmdLine::declare_arg_group("generic","options for generic builder");
	GEO::CmdLine::declare_arg(
	    "generic:executable", "compute_my_CSG_please",
	    "external command to execute"
	);
	GEO::CmdLine::declare_arg(
	    "generic:union_options","-union %s %s -o %s",
	    "options to be passed for union, with placeholders for args"
	);
	GEO::CmdLine::declare_arg(
	    "generic:intersection_options","-intersection %s %s -o %s",
	    "options to be passed for intersection, with placeholders for args"
	);
	GEO::CmdLine::declare_arg(
	    "generic:difference_options","-difference %s %s -o %s",
	    "options to be passed for difference, with placeholders for args"
	);
	GEO::CmdLine::declare_arg(
	    "generic:extension",".obj",
	    "file extension used by external command, appended to all arguments"
	);
    }

    std::shared_ptr<Mesh> BuilderExe::union_of_two_operands(
	    const std::shared_ptr<Mesh>& op1,
	    const std::shared_ptr<Mesh>& op2
    ) {
	return external_boolean_op(op1, op2, union_options_);
    }

    std::shared_ptr<Mesh> BuilderExe::intersection_of_two_operands(
	const std::shared_ptr<Mesh>& op1,
	const std::shared_ptr<Mesh>& op2
    ) {
	return external_boolean_op(op1, op2, intersection_options_);
    }

    std::shared_ptr<Mesh> BuilderExe::difference_of_two_operands(
	const std::shared_ptr<Mesh>& op1,
	const std::shared_ptr<Mesh>& op2
    ) {
	return external_boolean_op(op1, op2, difference_options_);
    }

    std::shared_ptr<Mesh> BuilderExe::external_boolean_op(
	const std::shared_ptr<Mesh>& op1_mesh,
	const std::shared_ptr<Mesh>& op2_mesh,
	const std::string& options
    ) {
	std::filesystem::path path = std::filesystem::temp_directory_path();
	std::filesystem::path op1 =
	    path / std::filesystem::path("op1" + extension_);

	std::filesystem::path op2 =
	    path / std::filesystem::path("op2" + extension_);

	std::filesystem::path res =
	    path / std::filesystem::path("result" + extension_);

	mesh_save(*op1_mesh, op1.string(), verbose_);
	mesh_save(*op2_mesh, op2.string(), verbose_);

	std::string command = executable_ + "  " + String::format(
	    options.c_str(),
	    op1.string().c_str(),
	    op2.string().c_str(),
	    res.string().c_str()
	);

	if(!verbose_) {
#ifdef _WIN32_
	    command += " >nul 2>nul";
#else
	    command += " >/dev/null 2>/dev/null";
#endif
	}


	std::shared_ptr<Mesh> result = std::make_shared<Mesh>();
	if(run_external_command(command)) {
	    mesh_load(*result, res.string(), verbose_);
	}

	if(std::filesystem::is_regular_file(res)) {
	    std::filesystem::remove(res);
	}

	if(result->nb_vertices() == 0) {
	    throw(
		std::logic_error(
		    "There is no vertex in the output,"
		    "something horrible probably happened..."
		)
	    );
	}

	return result;
    }


    /************************************************************/

    BuilderGeogram0::BuilderGeogram0() {
	executable_ = "boolean_op";
	union_options_        = "operation=union %s %s %s";
	intersection_options_ = "operation=intersection %s %s %s";
	difference_options_   = "operation=difference %s %s %s";
	extension_ = ".obj";
    }

    /************************************************************/

    BuilderZhou::BuilderZhou() {
	executable_ = "libigl_609_Boolean";
	union_options_        = "union %s %s %s";
	intersection_options_ = "intersection %s %s %s";
	difference_options_   = "difference %s %s %s";
	extension_ = ".off";
    }

    /************************************************************/

    BuilderCherchi::BuilderCherchi() {
	executable_ = "mesh_booleans";
	union_options_        = "union %s %s %s";
	intersection_options_ = "intersection %s %s %s";
	difference_options_   = "subtraction %s %s %s";
	extension_ = ".obj";
    }

    /************************************************************/

}
