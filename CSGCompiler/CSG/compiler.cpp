#include <CSG/compiler.h>

// Silence some warnings in stb_c_lexer.h

#ifdef GEO_COMPILER_MSVC
#pragma warning (push)
#pragma warning (disable: 4505) // stb__strchr unreferenced function
#endif

#ifdef GEO_COMPILER_GCC_FAMILY
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-function"
#endif

#ifdef GEO_COMPILER_CLANG
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#pragma clang diagnostic ignored "-Wzero-as-null-pointer-constant"
#pragma clang diagnostic ignored "-Wself-assign"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wunused-member-function"
#pragma clang diagnostic ignored "-Wcast-qual"
#pragma clang diagnostic ignored "-Wunused-macros"
#pragma clang diagnostic ignored "-Wimplicit-fallthrough"
#endif

// We need to change stb-c-lexer configuration
// because we need to undefined STB_C_LEX_DISCARD_PREPROCESSOR
// (we need to parse '#', it is an instruction/object 'modifier')
// Begin stb-c-lexer configuration (see geogram/third_party/stb_c_lexer.h)
#if defined(Y) || defined(N)
#error "'Y' or 'N' already defined, cannot use stb-c-lexer"
#endif

#define STB_C_LEX_C_DECIMAL_INTS          Y
#define STB_C_LEX_C_HEX_INTS              Y
#define STB_C_LEX_C_OCTAL_INTS            Y
#define STB_C_LEX_C_DECIMAL_FLOATS        Y
#define STB_C_LEX_C99_HEX_FLOATS          N
#define STB_C_LEX_C_IDENTIFIERS           Y
#define STB_C_LEX_C_DQ_STRINGS            Y
#define STB_C_LEX_C_SQ_STRINGS            N
#define STB_C_LEX_C_CHARS                 Y
#define STB_C_LEX_C_COMMENTS              Y
#define STB_C_LEX_CPP_COMMENTS            Y
#define STB_C_LEX_C_COMPARISONS           Y
#define STB_C_LEX_C_LOGICAL               Y
#define STB_C_LEX_C_SHIFTS                Y
#define STB_C_LEX_C_INCREMENTS            Y
#define STB_C_LEX_C_ARROW                 Y
#define STB_C_LEX_EQUAL_ARROW             N
#define STB_C_LEX_C_BITWISEEQ             Y
#define STB_C_LEX_C_ARITHEQ               Y
#define STB_C_LEX_PARSE_SUFFIXES          N
#define STB_C_LEX_DECIMAL_SUFFIXES        ""
#define STB_C_LEX_HEX_SUFFIXES            ""
#define STB_C_LEX_OCTAL_SUFFIXES          ""
#define STB_C_LEX_FLOAT_SUFFIXES          ""
#define STB_C_LEX_0_IS_EOF                N
#define STB_C_LEX_INTEGERS_AS_DOUBLES     N
#define STB_C_LEX_MULTILINE_DSTRINGS      N
#define STB_C_LEX_MULTILINE_SSTRINGS      N
#define STB_C_LEX_USE_STDLIB              Y
#define STB_C_LEX_DOLLAR_IDENTIFIER       Y
#define STB_C_LEX_FLOAT_NO_DECIMAL        Y
#define STB_C_LEX_DEFINE_ALL_TOKEN_NAMES  N
#define STB_C_LEX_DISCARD_PREPROCESSOR    N // we just changed this one
#define STB_C_LEXER_DEFINITIONS
// end stb-c-lexer configuration

#define STB_C_LEXER_IMPLEMENTATION
#include <STB/stb_c_lexer.h>

#ifdef GEO_COMPILER_GCC_FAMILY
#pragma GCC diagnostic pop
#endif

#ifdef GEO_COMPILER_MSVC
#pragma warning (pop)
#endif


namespace {
    using namespace CSG;
    static constexpr int CLEX_booleanlit = CLEX_first_unused_token;
    stb_lexer& getlex(void* lex_) {
        return *reinterpret_cast<stb_lexer*>(lex_);
    }
}

/******************************************************************************/

namespace CSG {
    Compiler::Compiler() : lex_(nullptr), lines_(0) {

#define DECLARE_OBJECT(obj) object_funcs_[#obj] = &Compiler::obj;
        DECLARE_OBJECT(square);
        DECLARE_OBJECT(circle);
        DECLARE_OBJECT(cube);
        DECLARE_OBJECT(sphere);
        DECLARE_OBJECT(cylinder);
        DECLARE_OBJECT(polyhedron);
        DECLARE_OBJECT(polygon);
        DECLARE_OBJECT(import);
        DECLARE_OBJECT(surface);
        DECLARE_OBJECT(text);

#define DECLARE_INSTRUCTION(instr)                              \
        instruction_funcs_[#instr] = &Compiler::instr;
        DECLARE_INSTRUCTION(multmatrix);
        DECLARE_INSTRUCTION(resize);
        DECLARE_INSTRUCTION(intersection);
        DECLARE_INSTRUCTION(difference);
        DECLARE_INSTRUCTION(group);
        DECLARE_INSTRUCTION(color);
        DECLARE_INSTRUCTION(hull);
        DECLARE_INSTRUCTION(linear_extrude);
        DECLARE_INSTRUCTION(rotate_extrude);
        DECLARE_INSTRUCTION(projection);
        instruction_funcs_["union"]  = &Compiler::union_instr;
        instruction_funcs_["render"] = &Compiler::group;

	builder_ = std::make_shared<Builder>();
    }

    std::shared_ptr<Mesh> Compiler::compile_file(
	const std::filesystem::path& input_filename
    ) {
        // Add the directory that contains the file to the builder's file path,
        // so that import() instructions are able to find files in the same
        // directory.
        builder_->add_file_path(input_filename.parent_path());

        if(
            input_filename.extension() == ".scad" ||
            input_filename.extension() == ".SCAD"
        ) {
            std::shared_ptr<Mesh> result;

            Logger::out("CSG") << "Converting scad file using openscad"
                               << std::endl;

	    std::string tmpscad =
		std::filesystem::current_path() / "tmpscad.csg";

            // Ask openscad for help for parsing .scad files !
	    std::string command =
		std::string("openscad ") + input_filename.c_str() +
		" -o " + tmpscad.c_str();

            if(system(command.c_str())) {
                Logger::err("CSG") << "Error while running openscad "
                                   << std::endl;
                Logger::err("CSG") << "(used to parse " << input_filename << ")"
                                   << std::endl;
                return result;
            }

            result = compile_file(tmpscad);
	    std::filesystem::remove(tmpscad);
	    builder_->reset_file_path();
            return result;
        }

        filename_ = input_filename;
        if(
            filename_.extension() != ".csg" &&
            filename_.extension() != ".CSG"
        ) {
            throw std::logic_error(
                std::string(filename_.c_str()) +
		": wrong extension (should be .csg or .CSG)"
            );
        }

	std::string source;
	if(std::filesystem::is_regular_file(filename_)) {
	    size_t length = std::filesystem::file_size(filename_);
	    source.resize(length);
	    FILE* f = fopen(filename_.c_str(),"rb");
	    if(f != nullptr) {
		size_t read_length = fread(source.data(), 1, length, f);
		if(read_length != length) {
		    Logger::err("FileSystem")
			<< "Problem occured when reading "
			<< filename_
			<< std::endl;
		}
		fclose(f);
	    }
	}

        if(source.length() == 0) {
            throw std::logic_error(
                std::string(filename_.c_str()) + ": could not open file"
            );
        }

        std::shared_ptr<Mesh> result = compile_string(source);

        if(result != nullptr && result->dimension() == 2) {
            result->set_dimension(3);
        }

        builder_->reset_file_path();
        return result;
    }

    std::shared_ptr<Mesh> Compiler::compile_string(const std::string& source) {
        std::shared_ptr<Mesh> result;

        static constexpr size_t BUFFER_SIZE = 0x10000;
        char* buffer = new char[BUFFER_SIZE];
        stb_lexer lex;
        lex_ = &lex;
        try {
            stb_c_lexer_init(
                &lex,
                source.c_str(),
                source.c_str()+source.length(),
                buffer, BUFFER_SIZE
            );
            lines_ = index_t(lines());
            Scope scope;
            while(lookahead_token().type != CLEX_eof) {
                std::shared_ptr<Mesh> current = parse_instruction_or_object();
                // can be null if commented-out with modifier
                if(current != nullptr) {
                    scope.push_back(current);
                }
            }
            ArgList args;
            result = group(args, scope);
        } catch(std::shared_ptr<Mesh> reroot) {
            Logger::out("CSG") << "Re-rooted (!) from line " << line()
                               << std::endl;
            result = reroot;
        } catch(const std::logic_error& e) {
            Logger::err("CSG") << "Error while parsing file:"
                               << e.what()
                               << std::endl;
        }
        delete[] buffer;
        lex_ = nullptr;
        lines_ = 0;
        return result;
    }


    /********* Objects *******************************************************/

    std::shared_ptr<Mesh> Compiler::square(const ArgList& args) {
        vec2 size = args.get_arg("size", vec2(1.0, 1.0));
        bool center = args.get_arg("center", true);
        return builder_->square(size,center);
    }

    std::shared_ptr<Mesh> Compiler::circle(const ArgList& args) {
        double r;
        if(
            args.has_arg("r") &&
            args.get_arg("r").type == Value::NUMBER
        ) {
            r = args.get_arg("r").number_val;
        } else if(
            args.has_arg("d") &&
            args.get_arg("d").type == Value::NUMBER
        ) {
            r = args.get_arg("d").number_val / 2.0;
        } else if(
            args.size() >= 1 &&
            args.ith_arg_name(0) == "arg_0" &&
            args.ith_arg_val(0).type == Value::NUMBER
        ) {
            r = args.ith_arg_val(0).number_val;
        } else {
            r = 1.0;
        }
        return builder_->circle(r);
    }

    std::shared_ptr<Mesh> Compiler::cube(const ArgList& args) {
        vec3 size = args.get_arg("size", vec3(1.0, 1.0, 1.0));
        bool center = args.get_arg("center", true);
        return builder_->cube(size,center);
    }

    std::shared_ptr<Mesh> Compiler::sphere(const ArgList& args) {
        double r = args.get_arg("r", 1.0);
        return builder_->sphere(r);
    }

    std::shared_ptr<Mesh> Compiler::cylinder(const ArgList& args) {
        double h    = args.get_arg("h", 1.0);
        double r1   = args.get_arg("r1", 1.0);
        double r2   = args.get_arg("r2", 1.0);
        bool center = args.get_arg("center", true);
        return builder_->cylinder(h,r1,r2,center);
    }

    std::shared_ptr<Mesh> Compiler::polyhedron(const ArgList& args) {
        std::shared_ptr<Mesh> M = std::make_shared<Mesh>();
        if(!args.has_arg("points") || !args.has_arg("faces")) {
            syntax_error("polyhedron: missing points or facets");
        }
        const Value& points = args.get_arg("points");
        const Value& faces = args.get_arg("faces");

        if(points.type != Value::ARRAY2D || faces.type != Value::ARRAY2D) {
            syntax_error("polyhedron: wrong type (expected array)");
        }

	csg_assert_not_reached;

	/*
        M->vertices.set_dimension(3);
        M->vertices.create_vertices(points.array_val.size());
        for(index_t v=0; v<points.array_val.size(); ++v) {
            if(points.array_val[v].size() != 3) {
                syntax_error("polyhedron: wrong vertex size (expected 3d)");
            }
	    M->vertices.point(v) = {
		points.array_val[v][0],
		points.array_val[v][1],
		points.array_val[v][2]
	    };
        }

        for(index_t f=0; f<faces.array_val.size(); ++f) {
            index_t new_f = M->facets.create_polygon(
                faces.array_val[f].size()
            );
            for(index_t lv=0; lv < faces.array_val[f].size(); ++lv) {
                double v = faces.array_val[f][lv];
                if(v < 0.0 || v >= double(M->vertices.nb())) {
                    syntax_error(
                        String::format(
                            "polyhedron: invalid vertex index %d (max is %d)",
                            int(v), int(M->vertices.nb())-1
                        ).c_str()
                    );
                }
                M->facets.set_vertex(new_f, lv, index_t(v));
            }
        }

        tessellate_facets(*M,3);

        M->facets.connect();
        M->update_bbox();
	*/

        return M;
    }


    std::shared_ptr<Mesh> Compiler::polygon(const ArgList& args) {
        std::shared_ptr<Mesh> M = std::make_shared<Mesh>();
	M->set_dimension(2);

        if(!args.has_arg("points") || !args.has_arg("paths")) {
            syntax_error("polygon: missing points or paths");
        }

        const Value& points = args.get_arg("points");

	if(points.type == Value::ARRAY1D && points.array_val.size() == 0) {
	    // Special case, empty array, happens with BOSL2 scripts
	    return M;
	}

        if(points.type != Value::ARRAY2D) {
            syntax_error("polygon: wrong points type (expected array)");
        }

        M->create_vertices(points.array_val.size());
        for(index_t v=0; v<points.array_val.size(); ++v) {
            if(points.array_val[v].size() != 2) {
                syntax_error("polyhedron: wrong vertex size (expected 2d)");
            }
            M->point_2d(v) = {
		points.array_val[v][0],
		points.array_val[v][1]
	    };
        }

        const Value& paths = args.get_arg("paths");

        if(paths.type == Value::ARRAY2D ) {
            for(const auto& P : paths.array_val) {
                for(double v: P) {
                    if(v < 0.0 || v >= double(M->nb_vertices())) {
                        syntax_error(
                            String::format(
                                "polygon: invalid vertex index %d (max is %d)",
                                int(v), int(M->nb_vertices())-1
                            ).c_str()
                        );
                    }
                }
                for(index_t lv1=0; lv1 < P.size(); ++lv1) {
                    index_t lv2 = (lv1+1)%P.size();
                    index_t v1 = index_t(P[lv1]);
                    index_t v2 = index_t(P[lv2]);
                    // some files do [0,1,2], some others [0,1,2,0], so we need
                    // to test here for null edges.
                    if(v1 != v2) {
                        M->create_edge(v1,v2);
                    }
                }
            }
        } else if(paths.type == Value::NONE) {
            for(index_t v1=0; v1 < points.array_val.size(); ++v1) {
                index_t v2 = (v1+1)%points.array_val.size();
                M->create_edge(v1,v2);
            }
        } else {
            syntax_error(
                "polygon: wrong path type (expected array or undef)"
            );
        }

        M->update();

        return M;
    }

    std::shared_ptr<Mesh> Compiler::import(const ArgList& args) {
        std::string filename  = args.get_arg("file", std::string(""));
        std::string layer     = args.get_arg("layer", std::string(""));
        index_t     timestamp = index_t(args.get_arg("timestamp", 0));
        vec2        origin    = args.get_arg("origin", vec2(0.0, 0.0));
        vec2        scale     = args.get_arg("scale", vec2(1.0, 1.0));
        std::shared_ptr<Mesh> M = builder_->import(
	    filename,layer,timestamp,origin,scale
	);
        if(M == nullptr) {
            syntax_error((filename + ": could not load").c_str());
        }
        return M;
    }

    std::shared_ptr<Mesh> Compiler::surface(const ArgList& args) {
        std::string filename  = args.get_arg("file", std::string(""));
        bool center = args.get_arg("center", false);
        bool invert = args.get_arg("invert", false);
        return builder_->surface_with_OpenSCAD(filename, center, invert);
    }


    std::shared_ptr<Mesh> Compiler::text(const ArgList& args) {
	std::string text = args.get_arg("text", "");
	if(text == "") {
	    text = args.get_arg("arg_0", "");
	}
	double size = args.get_arg("size", 10.0);
	std::string font = args.get_arg("font", "");
	std::string halign = args.get_arg("halign", "left");
	std::string valign = args.get_arg("valign", "baseline");
	double spacing = args.get_arg("spacing", 1.0);
	std::string direction = args.get_arg("direction", "ltr");
	std::string language = args.get_arg("language", "en");
	std::string script = args.get_arg("script", "latin");
	return builder_->text_with_OpenSCAD(
	    text, size, font, halign, valign,
	    spacing, direction, language, script
	);
    }

    /********* Instructions **************************************************/

    std::shared_ptr<Mesh> Compiler::multmatrix(
        const ArgList& args, const Scope& scope
    ) {
        mat4 xform(1.0); // identity
        xform = args.get_arg("arg_0",xform);
        return builder_->multmatrix(xform, scope);
    }

    std::shared_ptr<Mesh> Compiler::resize(
	const ArgList& args, const Scope& scope
    ) {
        vec3 newsize(1.0, 1.0, 1.0);
        vec3 autosize(0.0, 0.0, 0.0);
        newsize = args.get_arg("newsize",newsize);
        autosize = args.get_arg("autosize",autosize);

        std::shared_ptr<Mesh> result = builder_->union_instr(scope);

        vec3 scaling(1.0, 1.0, 1.0);
        double default_scaling = 1.0;
        for(index_t coord=0; coord<3; ++coord) {
            if(newsize[coord] != 0) {
		vec3 minp, maxp;
		result->get_bbox(minp, maxp);
		scaling = newsize / (maxp - minp);
                default_scaling = scaling[coord];
            }
        }
        for(index_t coord=0; coord<3; ++coord) {
            if(newsize[coord] == 0.0) {
                if(autosize[coord] == 1.0) {
                    scaling[coord] = default_scaling;
                }
            }
        }
	for(index_t v=0; v<result->nb_vertices(); ++v) {
	    if(result->dimension() == 3) {
		result->point_3d(v) *= scaling;
	    } else {
		result->point_2d(v) *= vec2(scaling.x, scaling.y);
	    }
	}
        return result;
    }

    std::shared_ptr<Mesh> Compiler::union_instr(
        const ArgList& args, const Scope& scope
    ) {
        csg_argused(args);
        return builder_->union_instr(scope);
    }

    std::shared_ptr<Mesh> Compiler::intersection(
        const ArgList& args, const Scope& scope
    ) {
        csg_argused(args);
        return builder_->intersection(scope);
    }

    std::shared_ptr<Mesh> Compiler::difference(
        const ArgList& args, const Scope& scope
    ) {
        csg_argused(args);
        return builder_->difference(scope);
    }

    std::shared_ptr<Mesh> Compiler::group(
	const ArgList& args, const Scope& scope
    ) {
        csg_argused(args);
        return builder_->group(scope);
    }

    std::shared_ptr<Mesh> Compiler::color(
	const ArgList& args, const Scope& scope
    ) {
        vec4 C(1.0, 1.0, 1.0, 1.0);
        C = args.get_arg("arg_0",C);
        return builder_->color(C,scope);
    }

    std::shared_ptr<Mesh> Compiler::hull(
	const ArgList& args, const Scope& scope
    ) {
        csg_argused(args);
        return builder_->hull(scope);
    }

    std::shared_ptr<Mesh> Compiler::linear_extrude(
        const ArgList& args, const Scope& scope
    ) {
        double height = args.get_arg("height", 1.0);
        bool center = args.get_arg("center", true);
        vec2 scale = args.get_arg("scale", vec2(1.0, 1.0));
        index_t slices = index_t(args.get_arg("slices",0));
        double twist = args.get_arg("twist",0.0);
        return builder_->linear_extrude(
            scope, height, center, scale, slices, twist
        );
    }

    std::shared_ptr<Mesh> Compiler::rotate_extrude(
        const ArgList& args, const Scope& scope
    ) {
        double angle = args.get_arg("angle", 360.0);
        return builder_->rotate_extrude(scope,angle);
    }


    std::shared_ptr<Mesh> Compiler::projection(
        const ArgList& args, const Scope& scope
    ) {
        bool cut = args.get_arg("cut", false);
        return builder_->projection(scope,cut);
    }

    /********* Parser ********************************************************/

    std::shared_ptr<Mesh> Compiler::parse_instruction_or_object() {
        Token lookahead = lookahead_token();

        // get modifier, one of:
        // '%', '*': ignore subtree (in OpenSCAD, '%' means transparent display)
        // '#'     : does not change anything (in OpenSCAD, transparent display)
        // '!'     : replace root with subtree

        char modifier = ' ';
        if(is_modifier(lookahead.type)) {
            modifier = char(next_token().type);
            lookahead = lookahead_token();
        }

        if(lookahead.type != CLEX_id) {
            syntax_error("expected id (object or instruction)", lookahead);
        }

        std::shared_ptr<Mesh> result;
        std::string instr_or_object_name = lookahead.str_val;
        if(is_object(instr_or_object_name)) {
            result = parse_object();
        } else if(is_instruction(instr_or_object_name)) {
            result = parse_instruction();
        } else {
            syntax_error("id is no known object or instruction", lookahead);
        }

        // '%': no effect on CSG tree, transparent rendering
        // '*': no effect on CSG tree
        if(modifier == '%' || modifier == '*') {
            // Callers ignore instructions and objects that return a
            // null CSGMesh.
            result.reset();
        }

        // '!': replace root
        if(modifier == '!') {
            // It is caught right after the main parsing loop.
            throw(result);
        }

        if(builder_->verbose()) {
            index_t cur_line = index_t(line());
            Logger::out("CSG") << "Executed " << instr_or_object_name
                               << " at line " << cur_line << "/" << lines_
                               << "  (" << index_t(cur_line*100) /
		                     std::max(lines_,1u) << "%)"
                               << std::endl;
        }

        return result;
    }

    std::shared_ptr<Mesh> Compiler::parse_object() {
        Token tok = next_token();
        if(tok.type != CLEX_id || !is_object(tok.str_val)) {
            syntax_error("expected object");
        }
        std::string object_name = tok.str_val;

        index_t object_line = index_t(line());

        ArgList args = parse_arg_list();
        next_token_check(';');

        auto it = object_funcs_.find(object_name);
        csg_assert(it != object_funcs_.end());

        builder_->set_fa(args.get_arg("$fa",Builder::DEFAULT_FA));
        builder_->set_fs(args.get_arg("$fs",Builder::DEFAULT_FS));
        builder_->set_fn(args.get_arg("$fn",Builder::DEFAULT_FN));

        if(builder_->verbose()) {
            Logger::out("CSG") << object_name << " at line: "
                               << object_line << std::endl;
        }

        std::shared_ptr<Mesh> result =  (this->*(it->second))(args);

        builder_->reset_defaults();

        return result;
    }

    std::shared_ptr<Mesh> Compiler::parse_instruction() {
        Token tok = next_token();
        if(tok.type != CLEX_id || !is_instruction(tok.str_val)) {
            syntax_error("expected instruction",tok);
        }
        std::string instr_name = tok.str_val;

        index_t instruction_line = index_t(line());

        ArgList args = parse_arg_list();

        // In .csg files produced by OpenSCAD it often happens that
        // there are empty instructions without any context. I'm ignoring
        // them by returning a null CSGMesh.
        if(lookahead_token().type == ';') {
            next_token_check(';');
            std::shared_ptr<Mesh> dummy_result;
            return dummy_result;
        }

        Scope scope;
        next_token_check('{');
        for(;;) {
            if(lookahead_token().type == '}') {
                break;
            }
            std::shared_ptr<Mesh> current = parse_instruction_or_object();
            // Can be null if commented-out with modifier
            if(current != nullptr) {
                scope.push_back(current);
            }
        }
        next_token_check('}');

        if(builder_->verbose()) {
            Logger::out("CSG") << instr_name << " at line: "
                               << instruction_line << std::endl;
        }

        auto it = instruction_funcs_.find(instr_name);
        csg_assert(it != instruction_funcs_.end());

        builder_->set_fa(args.get_arg("$fa",Builder::DEFAULT_FA));
        builder_->set_fs(args.get_arg("$fs",Builder::DEFAULT_FS));
        builder_->set_fn(args.get_arg("$fn",Builder::DEFAULT_FN));

        std::shared_ptr<Mesh> result = (this->*(it->second))(args,scope);

        builder_->reset_defaults();

        return result;
    }

    Compiler::ArgList Compiler::parse_arg_list() {
        ArgList result;
        next_token_check('(');
        for(;;) {
            if(lookahead_token().type == ')') {
                break;
            }
            std::string arg_name =
                "arg_" + String::to_string(result.size());
            if(lookahead_token().type == CLEX_id) {
                arg_name = next_token().str_val;
                next_token_check('=');
            }
            result.add_arg(arg_name, parse_value());
            if(lookahead_token().type == ')') {
                break;
            }
            next_token_check(',');
        }
        next_token_check(')');
        return result;
    }

    Compiler::Value Compiler::parse_value() {
        if(lookahead_token().type == '[') {
            return parse_array();
        }
        Token tok = next_token();
        if(tok.type == '-') {
            tok = next_token();
            if(tok.type == CLEX_intlit) {
                return Value(-tok.int_val);
            } else if(tok.type == CLEX_floatlit) {
                return Value(-tok.double_val);
            } else {
                syntax_error("Expected number", tok);
            }
        }

        if(tok.type == CLEX_intlit) {
            return Value(tok.int_val);
        }

        if(tok.type == CLEX_floatlit) {
            return Value(tok.double_val);
        }

        if(tok.type == CLEX_booleanlit) {
            return Value(tok.boolean_val);
        }

        if(tok.type == CLEX_dqstring) {
            return Value(tok.str_val);
        }

        if(tok.type == CLEX_id && tok.str_val == "undef") {
            return Value();
        }

        syntax_error("Expected value", tok);
    }

    Compiler::Value Compiler::parse_array() {
        Value result;
        result.type = Value::ARRAY1D;

        next_token_check('[');
        for(;;) {
            if(lookahead_token().type == ']') {
                break;
            }
            Value item = parse_value();

            if(item.type == Value::NUMBER) {
                result.array_val.resize(1);
                result.array_val[0].push_back(item.number_val);
            } else if(item.type == Value::BOOLEAN) {
                result.array_val.resize(1);
                result.array_val[0].push_back(double(item.boolean_val));
            } else if(item.type == Value::ARRAY1D) {
                result.type = Value::ARRAY2D;
                if(item.array_val.size() == 0) {
                    result.array_val.push_back(vector<double>());
                } else {
                    result.array_val.push_back(item.array_val[0]);
                }
            }

            if(lookahead_token().type == ']') {
                break;
            }
            next_token_check(',');
        }
        next_token_check(']');

        return result;
    }

    bool Compiler::is_object(const std::string& id) const {
        return (object_funcs_.find(id) != object_funcs_.end());
    }

    bool Compiler::is_instruction(const std::string& id) const {
        return (instruction_funcs_.find(id) != instruction_funcs_.end());
    }

    bool Compiler::is_modifier(int toktype) const {
        return
            (toktype == int('%')) ||
            (toktype == int('#')) ||
            (toktype == int('!')) ||
            (toktype == int('*')) ;
    }

    /********* Parser utilities **********************************************/

    void Compiler::next_token_check(char c) {
        Token tok = next_token();
        if(tok.type != int(c)) {
            syntax_error(
                String::format(
                    "Expected %c, got \"%s\"", c, tok.to_string().c_str()
                ).c_str()
            );
        }
    }

    Compiler::Token Compiler::next_token() {
        if(lookahead_token_.type != -1) {
            Token result = lookahead_token_;
            lookahead_token_.type = -1;
            return result;
        }
        return next_token_internal();
    }

    Compiler::Token Compiler::lookahead_token() {
        if(lookahead_token_.type == -1) {
            lookahead_token_ = next_token_internal();
        }
        return lookahead_token_;
    }

    Compiler::Token Compiler::next_token_internal() {
        Token result;
        if(stb_c_lexer_get_token(&getlex(lex_))) {
            result.type = int(getlex(lex_).token);
            if(getlex(lex_).token == CLEX_id) {
                result.str_val = getlex(lex_).string;
                if(result.str_val == "true") {
                    result.type = CLEX_booleanlit;
                    result.boolean_val = true;
                } else if(result.str_val == "false") {
                    result.type = CLEX_booleanlit;
                    result.boolean_val = false;
                }
            }
            if(getlex(lex_).token == CLEX_dqstring) {
                result.str_val = getlex(lex_).string;
            }
            result.int_val = int(getlex(lex_).int_number);
            result.double_val = getlex(lex_).real_number;
        } else {
            result.type = CLEX_eof;
        }
        if(getlex(lex_).token == CLEX_parse_error) {
            syntax_error("lexical error");
        }
        return result;
    }

    int Compiler::lines() const {
        int result=0;
        for(
            const char* p = getlex(lex_).input_stream;
            p != getlex(lex_).eof; ++p
        ) {
            if(*p == '\n') {
                ++result;
            }
        }
        return result;
    }

    int Compiler::line() const {
        int result=1;
        for(
            const char* p = getlex(lex_).input_stream;
            p != getlex(lex_).parse_point && p != getlex(lex_).eof;
            ++p
        ) {
            if(*p == '\n') {
                ++result;
            }
        }
        return result;
    }

    [[noreturn]] void Compiler::syntax_error(const char* msg) {
        throw(
            std::logic_error(
                String::format(
                    "%s:%d %s",
                    filename_.c_str(), line(), msg
                )
            )
        );
    }

    [[noreturn]] void Compiler::syntax_error(
        const char* msg, const Token& tok
    ) {
        throw(
            std::logic_error(
                String::format(
                    "%s:%d %s (got \"%s\")",
                    filename_.c_str(), line(), msg,
                    tok.to_string().c_str()
                )
            )
        );
    }

    /********* Value and ArgList *********************************************/

    Compiler::Value::Value() : type(NONE) {
    }

    Compiler::Value::Value(const std::string& x) :
        type(STRING),
        string_val(x) {
    }

    Compiler::Value::Value(double x) :
        type(NUMBER),
        number_val(x) {
    }

    Compiler::Value::Value(int x) :
        type(NUMBER),
        number_val(double(x)) {
    }

    Compiler::Value::Value(bool x) :
        type(BOOLEAN),
        boolean_val(x) {
    }

    std::string Compiler::Value::to_string() const {
        switch(type) {
        case NONE:
            return "<none>";
        case NUMBER:
            return String::to_string(number_val);
        case BOOLEAN:
            return String::to_string(boolean_val);
        case ARRAY1D: {
            std::string result = "[";
            if(array_val.size() != 0) {
                for(double v: array_val[0]) {
                    result += String::to_string(v);
                    result += " ";
                }
            }
            result += "]";
            return result;
        }
        case ARRAY2D: {
            std::string result = "[";
            for(const vector<double>& row : array_val) {
                result += "[";
                for(double v: row) {
                    result += String::to_string(v);
                    result += " ";
                }
                result += "]";
            }
            result += "]";
            return result;
        }
        case STRING: {
            return "\"" + string_val + "\"";
        }
        }
        return "<unknown>";
    }

    void Compiler::ArgList::add_arg(
        const std::string& name, const Value& value
    ) {
        if(has_arg(name)) {
            throw(std::logic_error("Duplicated arg:" + name));
        }
        args_.push_back(std::make_pair(name,value));
    }

    bool Compiler::ArgList::has_arg(const std::string& name) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                return true;
            }
        }
        return false;
    }

    const Compiler::Value& Compiler::ArgList::get_arg(
        const std::string& name
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                return arg.second;
            }
        }
        csg_assert_not_reached;
    }

    double Compiler::ArgList::get_arg(
        const std::string& name,double default_value
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                if(arg.second.type != Value::NUMBER) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                return arg.second.number_val;
            }
        }
        return default_value;
    }

    int Compiler::ArgList::get_arg(
	const std::string& name, int default_value
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                if(arg.second.type != Value::NUMBER) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                if(CSG::round(arg.second.number_val) !=
                   arg.second.number_val) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                return int(arg.second.number_val);
            }
        }
        return default_value;
    }

    bool Compiler::ArgList::get_arg(
        const std::string& name, bool default_value
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                if(arg.second.type != Value::BOOLEAN) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                return arg.second.boolean_val;
            }
        }
        return default_value;
    }

    vec2 Compiler::ArgList::get_arg(
        const std::string& name, vec2 default_value
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                if(arg.second.type == Value::NUMBER) {
                    return vec2(
                        arg.second.number_val,
                        arg.second.number_val
                    );
                } else if(arg.second.type != Value::ARRAY1D) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                if(
                    arg.second.array_val.size() != 1 ||
                    arg.second.array_val[0].size() != 2
                ) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong dimension"
                          ));
                }
                return vec2(
                    arg.second.array_val[0][0],
                    arg.second.array_val[0][1]
                );
            }
        }
        return default_value;
    }

    vec3 Compiler::ArgList::get_arg(
        const std::string& name, vec3 default_value
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                if(arg.second.type != Value::ARRAY1D) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                if(
                    arg.second.array_val.size() != 1 ||
                    arg.second.array_val[0].size() != 3
                ) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong dimension"
                          ));
                }
                return vec3(
                    arg.second.array_val[0][0],
                    arg.second.array_val[0][1],
                    arg.second.array_val[0][2]
                );
            }
        }
        return default_value;
    }

    vec4 Compiler::ArgList::get_arg(
        const std::string& name, vec4 default_value
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                if(arg.second.type != Value::ARRAY1D) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                if(
                    arg.second.array_val.size() != 1 ||
                    arg.second.array_val[0].size() != 4
                ) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong dimension"
                          ));
                }
                return vec4(
                    arg.second.array_val[0][0],
                    arg.second.array_val[0][1],
                    arg.second.array_val[0][2],
                    arg.second.array_val[0][3]
                );
            }
        }
        return default_value;
    }

    mat4 Compiler::ArgList::get_arg(
        const std::string& name, const mat4& default_value
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                if(arg.second.type != Value::ARRAY2D) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                auto Mvv = arg.second.array_val;
                if(
                    Mvv.size() != 4 ||
                    Mvv[0].size() != 4 ||
                    Mvv[1].size() != 4 ||
                    Mvv[2].size() != 4 ||
                    Mvv[3].size() != 4
                ) {
                    throw(std::logic_error(
                              "Matrix arg has wrong dimension"
                          ));
                }
                mat4 result;
                for(index_t i=0; i<4; ++i) {
                    for(index_t j=0; j<4; ++j) {
                        result[i][j] = Mvv[i][j];
                    }
                }
                return result;
            }
        }
        return default_value;
    }

    std::string Compiler::ArgList::get_arg(
        const std::string& name, const std::string& default_value
    ) const {
        for(const Arg& arg : args_) {
            if(arg.first == name) {
                if(arg.second.type != Value::STRING) {
                    throw(std::logic_error(
                              "Arg " + name + " has wrong type"
                          ));
                }
                return arg.second.string_val;
            }
        }
        return default_value;
    }


    /***** Token **********************************************************/

    Compiler::Token::Token() :
        type(-1),
        int_val(0),
        double_val(0.0),
        boolean_val(false) {
    }

    std::string Compiler::Token::to_string() const {
        if(type < 256) {
            return String::format("\'%c\'",type);
        }
        if(type == CLEX_intlit) {
            return String::to_string(int_val);
        }
        if(type == CLEX_floatlit) {
            return String::to_string(double_val);
        }
        if(type == CLEX_booleanlit) {
            return String::to_string(boolean_val);
        }
        if(type == CLEX_id) {
            return str_val;
        }
        return "<unknown token>";
    }

}
