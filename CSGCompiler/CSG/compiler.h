#ifndef CSG_COMPILER
#define CSG_COMPILER

#include <CSG/common.h>
#include <CSG/builder.h>

#include <filesystem>
#include <map>

namespace CSG {

    /**
     * \brief Creates meshes from OpenSCAD .csg files.
     * \details Understands a subset of OpenSCAD .csg format.
     */
    class CSG_API Compiler {
    public:

    Compiler();

    std::shared_ptr<Mesh> compile_file(
	const std::filesystem::path& input_filename
    );
    std::shared_ptr<Mesh> compile_string(const std::string& source);

    /**
     * \brief Displays (lots of) additional information
     * \param[in] x whether additional information should be displayed.
     *  Default is off
     */
    void set_verbose(bool x) {
        builder_->set_verbose(x);
    }

    /**
     * \brief Gets the CSGbuilder
     * \return a reference to the CSGBuilder
     */
    Builder& builder() {
        return *builder_;
    }

    protected:

    /****** Value, Arglist **********************************/

    /**
     * \brief A parsed value in a .csg file
     * \details Can be a number, a boolean, a 1d array or a 2d array
     */
    struct Value {
        enum Type {NONE, NUMBER, BOOLEAN, ARRAY1D, ARRAY2D, STRING};

        Value();
        Value(double x);
        Value(int x);
        Value(bool x);
        Value(const std::string& x);
        std::string to_string() const;

        Type type;
        bool boolean_val;
        double number_val;
        vector<vector<double> > array_val;
        std::string string_val;
    };

    /**
     * \brief A parsed argument list in a .csg file.
     * \details Stores name-value pairs.
     */
    class ArgList {
    public:
        typedef std::pair<std::string, Value> Arg;

        index_t size() const {
            return args_.size();
        }

        const std::string& ith_arg_name(index_t i) const {
            csg_assert(i < size());
            return args_[i].first;
        }

        const Value& ith_arg_val(index_t i) const {
            csg_assert(i < size());
            return args_[i].second;
        }

        void add_arg(const std::string& name, const Value& value);
        bool has_arg(const std::string& name) const;
        const Value& get_arg(const std::string& name) const;
        double get_arg(const std::string& name,double default_value) const;
        int get_arg(const std::string& name, int default_value) const;
        bool get_arg(const std::string& name, bool default_value) const;
        vec2 get_arg(const std::string& name, vec2 default_value) const;
        vec3 get_arg(const std::string& name, vec3 default_value) const;
        vec4 get_arg(const std::string& name, vec4 default_value) const;
        mat4 get_arg(
            const std::string& name, const mat4& default_value
        ) const;
        std::string get_arg(
            const std::string& name, const std::string& default_value
        ) const;
        std::string get_arg(
            const std::string& name, const char* default_value
        ) const {
	    return get_arg(name, std::string(default_value));
	}

    private:
        vector<Arg> args_;
    };


    /****** Objects *****************************************/

    std::shared_ptr<Mesh> square(const ArgList& args);
    std::shared_ptr<Mesh> circle(const ArgList& args);
    std::shared_ptr<Mesh> cube(const ArgList& args);
    std::shared_ptr<Mesh> sphere(const ArgList& args);
    std::shared_ptr<Mesh> cylinder(const ArgList& args);
    std::shared_ptr<Mesh> polyhedron(const ArgList& args);
    std::shared_ptr<Mesh> polygon(const ArgList& args);
    std::shared_ptr<Mesh> import(const ArgList& args);
    std::shared_ptr<Mesh> surface(const ArgList& args);
    std::shared_ptr<Mesh> text(const ArgList& args);

    /****** Instructions ************************************/

    std::shared_ptr<Mesh> multmatrix(
	const ArgList& args, const Scope& scope
    );

    std::shared_ptr<Mesh> resize(
	const ArgList& args, const Scope& scope
    );

    std::shared_ptr<Mesh> union_instr(
	const ArgList& args, const Scope& scope
    );

    std::shared_ptr<Mesh> intersection(
	const ArgList& args, const Scope& scope
    );

    std::shared_ptr<Mesh> difference(const ArgList& args, const Scope& scope);
    std::shared_ptr<Mesh> group(const ArgList& args, const Scope& scope);
    std::shared_ptr<Mesh> color(const ArgList& args, const Scope& scope);
    std::shared_ptr<Mesh> hull(const ArgList& args, const Scope& scope);

    std::shared_ptr<Mesh> linear_extrude(
	const ArgList& args, const Scope& scope
    );

    std::shared_ptr<Mesh> rotate_extrude(
	const ArgList& args, const Scope& scope
    );

    std::shared_ptr<Mesh> projection(
	const ArgList& args, const Scope& scope
    );

    /***** Parser *******************************************/

    std::shared_ptr<Mesh> parse_instruction_or_object();
    std::shared_ptr<Mesh> parse_object();
    std::shared_ptr<Mesh> parse_instruction();
    ArgList     parse_arg_list();
    Value       parse_value();
    Value       parse_array();
    bool        is_object(const std::string& id) const;
    bool        is_instruction(const std::string& id) const;

    /**
     * \brief Checks if a token corresponds to an instruction or
     *  object modifier
     * \details A modifier is one of '%','#','!','*', where '%' and '*'
     *  discard the subtree, '#' does not change anything and '!' replaces
     *  the result with the subtree (re-root).
     *  Note: in OpenSCAD, '%' and '#' display the subtree as a transparent
     *  object.
     */
    bool is_modifier(int toktype) const;

    /***** Parser internals ********************************/

    struct Token {
        Token();
        std::string to_string() const;
        int type;
        std::string str_val;
        int int_val;
        double double_val;
        bool boolean_val;
    };

    /**
     * \brief Checks that the next token is a given character
     * \details If the next token is something else than the given character,
     *   then parsing stops with an error message.
     * \param[in] c the character
     */
    void next_token_check(char c);

    /**
     * \brief Gets the next token.
     * \details Parsing proceeds to the next token.
     */
    Token next_token();

    /**
     * \brief Gets the next token without any side effect.
     * \details Parsing position remains at the same token.
     */
    Token lookahead_token();

    /**
     * \brief Function to actually get the next token from the stream.
     * \details next_token() and lookahead_token() use a 1-token
     *  buffer to pretend that one can look at a token in advance
     *  without consuming it.
     */
    Token next_token_internal();

    /**
     * \brief Gets the total number of lines of the currently parsed source.
     */
    int lines() const;

    /**
     * \brief Gets the currently parsed line source.
     */
    int line() const;


    /**
     * \brief Throws an exception with an error message.
     * \param[in] msg the error message to be displayed
     */
    [[noreturn]] void syntax_error(const char* msg);

    /**
     * \brief Throws an exception with an error message.
     * \param[in] msg the error message to be displayed
     * \param[in] tok the currently parsed token, will be
     *   appended to the error message
     */
    [[noreturn]] void syntax_error(const char* msg, const Token& tok);

    private:
    std::filesystem::path filename_;
    void* lex_;
    Token lookahead_token_;

    typedef std::shared_ptr<Mesh> (Compiler::*object_funptr)(
	const ArgList& args
    );

    typedef std::shared_ptr<Mesh> (Compiler::*instruction_funptr)(
        const ArgList& args, const Scope& scope
    );

    std::map<std::string, object_funptr> object_funcs_;
    std::map<std::string, instruction_funptr> instruction_funcs_;
    index_t lines_;
    std::shared_ptr<Builder> builder_;
    };

}

#endif
