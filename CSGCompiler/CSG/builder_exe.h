#ifndef CSG_BUILDER_EXE
#define CSG_BUILDER_EXE

#include <CSG/builder.h>

namespace CSG {

    class CSG_API BuilderExe : public Builder {
    public:
	BuilderExe();
	std::shared_ptr<Mesh> union_instr(const Scope& scope) override;
	std::shared_ptr<Mesh> intersection(const Scope& scope) override;
	std::shared_ptr<Mesh> difference(const Scope& scope) override;
	virtual std::shared_ptr<Mesh> external_boolean_op(
	    const Scope& scope, const std::string& options
	);
    protected:
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
