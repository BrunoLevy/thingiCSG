#include <CSG/builder.h>
#include <CSG/mesh_io.h>

namespace CSG {

    Builder::Builder() {
        reset_defaults();
        reset_file_path();
        verbose_ = false;
	warnings_ = false;
    }

    std::shared_ptr<Mesh> Builder::square(vec2 size, bool center) {
	std::shared_ptr<Mesh> M = std::make_shared<Mesh>();

        double x1 = 0.0;
        double y1 = 0.0;
        double x2 = size.x;
        double y2 = size.y;

        if(center) {
            x1 -= size.x/2.0;
            x2 -= size.x/2.0;
            y1 -= size.y/2.0;
            y2 -= size.y/2.0;
        }

        M->set_dimension(2);

        if(size.x <= 0.0 || size.y <= 0.0) {
	    if(warnings_) {
		Logger::warn("CSG")
		    << "square with negative size (returning empty shape)"
		    << std::endl;
	    }
            return M;
        }

        M->create_vertex(vec2(x1,y1));
        M->create_vertex(vec2(x2,y1));
        M->create_vertex(vec2(x1,y2));
        M->create_vertex(vec2(x2,y2));

        M->create_triangle(0,3,1);
        M->create_triangle(0,2,3);

	M->create_edge(0,1);
	M->create_edge(2,3);
	M->create_edge(0,2);
	M->create_edge(1,3);

        M->update();

	return M;
    }

    std::shared_ptr<Mesh> Builder::circle(double r) {
	std::shared_ptr<Mesh> M = std::make_shared<Mesh>();

        index_t nu = get_fragments_from_r(r);
        M->set_dimension(2);

        if(r <= 0.0) {
	    if(warnings_) {
		Logger::warn("CSG")
		    << "circle with negative radius (returning empty shape)"
		    << std::endl;
	    }
            return M;
        }

        for(index_t u=0; u<nu; ++u) {
            double theta = double(u)*2.0*M_PI/double(nu);
            double ctheta = cos(theta);
            double stheta = sin(theta);
            double x = ctheta*r;
            double y = stheta*r;
            M->create_vertex(vec2(x,y));
        }

        for(index_t u=1; u+1<nu; ++u) {
            M->create_triangle(0,u,u+1);
        }

        for(index_t u=0; u<nu; ++u) {
	    M->create_edge(u, (u+1)%nu);
	}

        M->update();

	return M;
    }

    std::shared_ptr<Mesh> Builder::cube(vec3 size, bool center) {
	std::shared_ptr<Mesh> M = std::make_shared<Mesh>();

        double x1 = 0.0;
        double y1 = 0.0;
        double z1 = 0.0;
        double x2 = size.x;
        double y2 = size.y;
        double z2 = size.z;

        if(center) {
            x1 -= size.x/2.0;
            x2 -= size.x/2.0;
            y1 -= size.y/2.0;
            y2 -= size.y/2.0;
            z1 -= size.z/2.0;
            z2 -= size.z/2.0;
        }

        if(size.x <= 0.0 || size.y <= 0.0 || size.z <= 0.0) {
	    if(warnings_) {
		Logger::warn("CSG")
		    << "cube with negative size (returning empty shape)"
		    << std::endl;
	    }
            return M;
        }

        M->create_vertex(vec3(x1,y1,z1));
        M->create_vertex(vec3(x2,y1,z1));
        M->create_vertex(vec3(x1,y2,z1));
        M->create_vertex(vec3(x2,y2,z1));
        M->create_vertex(vec3(x1,y1,z2));
        M->create_vertex(vec3(x2,y1,z2));
        M->create_vertex(vec3(x1,y2,z2));
        M->create_vertex(vec3(x2,y2,z2));

        M->create_triangle(7,3,6);
        M->create_triangle(6,3,2);
        M->create_triangle(7,5,3);
        M->create_triangle(3,5,1);
        M->create_triangle(3,1,2);
        M->create_triangle(2,1,0);
        M->create_triangle(1,5,0);
        M->create_triangle(0,5,4);
        M->create_triangle(2,0,6);
        M->create_triangle(6,0,4);
        M->create_triangle(6,4,7);
        M->create_triangle(7,4,5);

	M->update();

	return M;
    }

    std::shared_ptr<Mesh> Builder::sphere(double r) {
        index_t nu = get_fragments_from_r(r);
        index_t nv = nu / 2;
	if(nu >= 5 && (nu & 1) != 0) {
	    ++nv;
	}

	nu = std::max(nu, index_t(3));
	nv = std::max(nv, index_t(2));

	std::shared_ptr<Mesh> M = std::make_shared<Mesh>();
	M->set_dimension(3);

        if(r <= 0.0) {
	    if(warnings_) {
		Logger::warn("CSG")
		    << "sphere with negative radius (returning empty shape)"
		    << std::endl;
	    }
            return M;
        }

        for(index_t v=0; v<nv; ++v) {
            double phi = (double(v) + 0.5)*M_PI/double(nv) - M_PI/2.0;

            double cphi = cos(phi);
            double sphi = sin(phi);
            for(index_t u=0; u<nu; ++u) {
                double theta = double(u)*2.0*M_PI/double(nu);
                double ctheta = cos(theta);
                double stheta = sin(theta);
                double x = r*ctheta*cphi;
                double y = r*stheta*cphi;
                double z = r*sphi;
                M->create_vertex(vec3(x,y,z));
            }
        }

        // Maps param coordinates to mesh index
        auto vindex = [nu](index_t u, index_t v)->index_t {
            return v*nu+(u%nu); // make u wraparound
        };

        for(index_t v=0; v<nv-1; ++v) {
            for(index_t u=0; u<nu; ++u) {
                index_t v00 = vindex(u  ,v  );
                index_t v10 = vindex(u+1,v  );
                index_t v01 = vindex(u  ,v+1);
                index_t v11 = vindex(u+1,v+1);
		M->create_triangle(v00, v10, v01);
		M->create_triangle(v10, v11, v01);
            }
        }

	// Cappings with zigzag triangulation
	{
	    index_t offset = nu*(nv-1);
	    index_t low=0;
	    index_t high=nu-1;
	    for(;;) {
		if(low+1==high) {
		    break;
		}
		M->create_triangle(low+1, low, high);
		M->create_triangle(
		    offset+low, offset+low+1, offset+high
		);
		++low;
		if(high-1==low) {
		    break;
		}
		M->create_triangle(low, high, high-1);
		M->create_triangle(
		    offset+low, offset+high-1, offset+high
		);
		--high;
	    }
	}

        M->update();

	return M;
    }

    std::shared_ptr<Mesh> Builder::cylinder(
	double h, double r1, double r2, bool center
    ) {
        index_t nu = get_fragments_from_r(std::max(r1,r2));

        double z1 = center ? -h/2.0 : 0.0;
        double z2 = center ?  h/2.0 : h;

	std::shared_ptr<Mesh> M = std::make_shared<Mesh>();

	M->set_dimension(3);

        if(r1 < 0.0 || r2 < 0.0) {
	    if(warnings_) {
		Logger::warn("CSG")
		    << "cylinder with negative radius (returning empty shape)"
		    << std::endl;
	    }
            return M;
        }

        if(r1 == 0.0) {
            std::swap(r1,r2);
            std::swap(z1,z2);
        }

        for(index_t u=0; u<nu; ++u) {
            double theta = double(u)*2.0*M_PI/double(nu);
            double ctheta = cos(theta);
            double stheta = sin(theta);
            double x = ctheta*r1;
            double y = stheta*r1;
            M->create_vertex(vec3(x,y,z1));
        }

        if(r2 == 0.0) {
            M->create_vertex(vec3(0.0, 0.0, z2));
        } else {
            for(index_t u=0; u<nu; ++u) {
                double theta = double(u)*2.0*M_PI/double(nu);
                double ctheta = cos(theta);
                double stheta = sin(theta);
                double x = ctheta*r2;
                double y = stheta*r2;
                M->create_vertex(vec3(x,y,z2));
            }
        }

        // Capping
        for(index_t u=1; u+1<nu; ++u) {
            M->create_triangle(0,u+1,u);
            if(r2 != 0.0) {
                M->create_triangle(nu,nu+u,nu+u+1);
            }
        }

        // Wall
        for(index_t u=0; u<nu; ++u) {
            if(r2 != 0.0) {
                index_t v00 = u;
                index_t v01 = v00 + nu;
                index_t v10 = (u+1)%nu;
                index_t v11 = v10 + nu;
                M->create_triangle(v00, v11, v01);
                M->create_triangle(v00, v10, v11);
            } else {
                M->create_triangle(u, (u+1)%nu, nu);
            }
        }

	M->update();

	return M;
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
	std::shared_ptr<Mesh> result = group(scope);
	for(index_t v=0; v<result->nb_vertices(); ++v) {
	    vec4 p =
		result->dimension() == 3 ?
		vec4(result->point_3d(v), 1.0) :
		vec4(result->point_2d(v), 0.0, 1.0);
	    p = p*M;
	    if(result->dimension() == 3) {
		result->point_3d(v) = (1.0 / p.w) * vec3(p.x, p.y, p.z);
	    } else {
		result->point_2d(v) = (1.0 / p.w) * vec2(p.x, p.y);
	    }
	}
	result->update();
	return result;
    }

    std::shared_ptr<Mesh> Builder::union_instr(const Scope& scope) {
	return append(scope); // replace with actual union computation
    }

    std::shared_ptr<Mesh> Builder::intersection(const Scope& scope) {
	return append(scope); // replace with actual intersection
    }

    std::shared_ptr<Mesh> Builder::difference(const Scope& scope) {
	return append(scope); // replace with actual difference
    }

    std::shared_ptr<Mesh> Builder::group(const Scope& scope) {
        return union_instr(scope);
    }

    std::shared_ptr<Mesh> Builder::color(vec4 color, const Scope& scope) {
	return append(scope);
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
        if(scope.size() == 1) {
            return scope[0];
        }
	std::shared_ptr<Mesh> result = std::make_shared<Mesh>();

	index_t dim = 2;
        for(index_t i=0; i<scope.size(); ++i) {
	    dim = std::max(dim, scope[i]->dimension());
	}
        result->set_dimension(dim);

        for(index_t i=0; i<scope.size(); ++i) {
	    if(scope[i]->nb_vertices() > 0) {
		result->append_mesh(*scope[i], i);
	    }
        }

	return result;
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
