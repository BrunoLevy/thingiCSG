#ifndef CSG_BUILDER_EXE
#define CSG_BUILDER_EXE

#include <CSG/builder.h>

namespace CSG {

    class CSG_API BuilderExe : public BuilderWithTwoOperandsBooleanOps {
    public:
	BuilderExe();
	static void declare_command_line_args();

    protected:
	std::shared_ptr<Mesh> union_of_two_operands(
	    const std::shared_ptr<Mesh>& op1,
	    const std::shared_ptr<Mesh>& op2
	) override;

	std::shared_ptr<Mesh> intersection_of_two_operands(
	    const std::shared_ptr<Mesh>& op1,
	    const std::shared_ptr<Mesh>& op2
	) override;

	std::shared_ptr<Mesh> difference_of_two_operands(
	    const std::shared_ptr<Mesh>& op1,
	    const std::shared_ptr<Mesh>& op2
	) override;

	virtual std::shared_ptr<Mesh> external_boolean_op(
	    const std::shared_ptr<Mesh>& op1,
	    const std::shared_ptr<Mesh>& op2,
	    const std::string& options
	);

	std::string executable_;
	std::string union_options_;
	std::string intersection_options_;
	std::string difference_options_;
	std::string extension_;
    };

    class CSG_API BuilderGeogram0 : public BuilderExe {
    public:
	BuilderGeogram0();
    };

    class CSG_API BuilderZhou : public BuilderExe {
    public:
	BuilderZhou();
    };

    class CSG_API BuilderCherchi : public BuilderExe {
    public:
	BuilderCherchi();
    };

}

#endif
