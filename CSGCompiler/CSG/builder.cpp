#include <CSG/builder.h>

namespace CSG {

    Builder::Builder() {
        reset_defaults();
        reset_file_path();
        verbose_ = false;
    }

    std::shared_ptr<Mesh> Builder::square(vec2 size, bool center) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::circle(double r) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::cube(vec3 size, bool center) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::sphere(double r) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::cylinder(
	double h, double r1, double r2, bool center
    ) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::import(
        const std::string& filename, const std::string& layer,
        index_t timestamp, vec2 origin, vec2 scale
    ) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::surface(
        const std::string& filename, bool center, bool invert
    ) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::text_with_OpenSCAD(
	const std::string& text,
	double size,
	const std::string& font,
	const std::string& halign,
	const std::string& valign,
	double spacing,
	const std::string& direction,
	const std::string& language,
	const std::string& script
    ) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::multmatrix(
	const mat4& M, const Scope& scope
    ) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::union_instr(const Scope& scope) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::intersection(const Scope& scope) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::difference(const Scope& scope) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::group(const Scope& scope) {
        return union_instr(scope);
    }

    std::shared_ptr<Mesh> Builder::color(vec4 color, const Scope& scope) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::hull(const Scope& scope) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::linear_extrude(
        const Scope& scope, double height, bool center, vec2 scale,
        index_t slices, double twist
    ) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::rotate_extrude(
	const Scope& scope, double angle
    ) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::projection(
	const Scope& scope, bool cut
    ) {
	return std::make_shared<Mesh>();
    }

    std::shared_ptr<Mesh> Builder::append(const Scope& scope) {
	return std::make_shared<Mesh>();
    }

    void Builder::reset_defaults() {
        fa_ = DEFAULT_FA;
        fs_ = DEFAULT_FS;
        fn_ = DEFAULT_FN;
    }

    bool Builder::find_file(std::string& filename) {
	return false;
    }

    std::shared_ptr<Mesh> Builder::import_with_openSCAD(
        const std::string& filename, const std::string& layer,
        index_t timestamp
    ) {
	return std::make_shared<Mesh>();
    }

    index_t Builder::get_fragments_from_r(double r, double twist) {
        if (fn_ > 0.0) {
            return index_t(fn_ >= 3 ? fn_ : 3);
        }
        return index_t(ceil(fmax(fmin(twist / fa_, r*2*M_PI / fs_), 5)));
    }
}
