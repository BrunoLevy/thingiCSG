#include <CSG/builder.h>
#include <CSG/mesh_io.h>
#include <geogram.psm.Delaunay/Delaunay_psm.h>

namespace CSG {

    Builder::Builder() {
        reset_defaults();
        reset_file_path();
        verbose_ = false;
	warnings_ = false;
	max_arity_ = 32;
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

        update_caches(M);

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

        update_caches(M);

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

	update_caches(M);

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

        update_caches(M);

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

	update_caches(M);

	return M;
    }

    std::shared_ptr<Mesh> Builder::import(
        const std::filesystem::path& filename, const std::string& layer,
        index_t timestamp, vec2 origin, vec2 scale
    ) {
	std::shared_ptr<Mesh> result;
        std::filesystem::path full_filename = filename;
        if(!find_file(full_filename)) {
            Logger::err("CSG") << filename << ": file not found"
                               << std::endl;
            return result;
        }

        if(
	    full_filename.extension() == ".dxf" ||
	    full_filename.extension() == ".DXF"
	) {
            result = import_with_openSCAD(full_filename, layer, timestamp);
        } else {
	    result = std::make_shared<Mesh>();
            mesh_load(*result,full_filename);
        }

        // Apply origin and scale
	if(result->dimension() == 2) {
	    for(index_t v=0; v<result->nb_vertices(); ++v) {
		vec2 p = result->point_2d(v);
		result->point_2d(v) = (p - origin) * scale;
	    }
	}

        update_caches(result);
        return result;
    }

    std::shared_ptr<Mesh> Builder::surface_with_OpenSCAD(
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
	update_caches(result);
	return result;
    }

    std::shared_ptr<Mesh> Builder::union_instr(const Scope& scope) {

	if(scope.size() == 1) {
	    return scope[0];
	}

        // Boolean operations can handle no more than max_arity_ operands.
        // For a union with more than max_arity_ operands, split it into two.
	if(scope.size() > max_arity_) {
            Scope scope1;
            Scope scope2;
            index_t n1 = index_t(scope.size()/2);
            for(index_t i=0; i<scope.size(); ++i) {
                if(i < n1) {
                    scope1.push_back(scope[i]);
                } else {
                    scope2.push_back(scope[i]);
                }
            }
            Scope scope3;
            scope3.push_back(union_instr(scope1));
            scope3.push_back(union_instr(scope2));
            return union_instr(scope3);
	}

	std::shared_ptr<Mesh> result = append(scope);
	do_CSG(result, "union");
	return result;
    }

    std::shared_ptr<Mesh> Builder::intersection(const Scope& scope) {
        if(scope.size() == 1) {
            return scope[0];
        }

        // Boolean operations can handle no more than max_arity_ operands.
        // For a intersection with more than max_arity_ operands,
        // split it into two.
        if(scope.size() > max_arity_) {
            Scope scope1;
            Scope scope2;
            index_t n1 = index_t(scope.size()/2);
            for(index_t i=0; i<scope.size(); ++i) {
                if(i < n1) {
                    scope1.push_back(scope[i]);
                } else {
                    scope2.push_back(scope[i]);
                }
            }

            Scope scope3;
            scope3.push_back(union_instr(scope1));
            scope3.push_back(union_instr(scope2));
            return intersection(scope3);
        }

	std::shared_ptr<Mesh> result = append(scope);
	do_CSG(result, "intersection");
        return result;
    }

    std::shared_ptr<Mesh> Builder::difference(const Scope& scope) {
        if(scope.size() == 1) {
            return scope[0];
        }

        // Boolean operations can handle no more than max_arity_ operands.
        // For a difference with more than max_arity_ operands, split it
        // (by calling union_instr() that in turn splits the list if need be).
        if(scope.size() > max_arity_) {
            Scope scope2;
            for(index_t i=1; i<scope.size(); ++i) {
                scope2.push_back(scope[i]);
            }
            Scope scope3;
            scope3.push_back(scope[0]);
            scope3.push_back(union_instr(scope2));
            return difference(scope3);
        }

	std::shared_ptr<Mesh> result = append(scope);
        // construct the expression x0-x1-x2...-xn
        std::string expr = "x0";
        for(index_t i=1; i<scope.size(); ++i) {
            expr += "-x" + String::to_string(i);
        }

	do_CSG(result, expr);
        return result;
    }

    std::shared_ptr<Mesh> Builder::group(const Scope& scope) {
        return union_instr(scope);
    }

    std::shared_ptr<Mesh> Builder::color(vec4 color, const Scope& scope) {
	return append(scope);
    }

    std::shared_ptr<Mesh> Builder::hull(const Scope& scope) {
	std::shared_ptr<Mesh> result = append(scope);
	result->remove_all_edges();
	result->remove_all_triangles();

	// Particular case: no vertex in scope (yes, this happens !)
	if(result->nb_vertices() == 0) {
	    return result;
	}

	// Use Delaunay_PSM to compute Delaunay triangulation, then
	// extract convex hull as triangulation's boundary.

        if(result->dimension() == 3) {
	    GEO::CmdLine::set_arg("algo:delaunay", "PDEL");
        } else {
	    GEO::CmdLine::set_arg("algo:delaunay", "BDEL2d");
        }

	GEO::Delaunay_var delaunay = GEO::Delaunay::create(
	    GEO::coord_index_t(result->dimension())
	);

	delaunay->set_keeps_infinite(true);
        delaunay->set_vertices(result->nb_vertices(), result->point_data());


        if(result->dimension() == 3) {
            // This iterates on the infinite cells
            for(
                index_t t = delaunay->nb_finite_cells();
		t < delaunay->nb_cells(); ++t
            ) {
		index_t v0 = delaunay->cell_vertex(t,0);
		index_t v1 = delaunay->cell_vertex(t,1);
		index_t v2 = delaunay->cell_vertex(t,2);
		index_t v3 = delaunay->cell_vertex(t,3);
		if(v0 == NO_INDEX) {
		    result->create_triangle(v1,v2,v3);
		} else if(v1 == NO_INDEX) {
		    result->create_triangle(v3,v2,v0);
		} else if(v2 == NO_INDEX) {
		    result->create_triangle(v1,v3,v0);
		} else if(v3 == NO_INDEX) {
		    result->create_triangle(v2,v1,v0);
		}
	    }
        } else {
            for(index_t t = delaunay->nb_finite_cells();
                t < delaunay->nb_cells(); ++t
               ) {
                index_t v1= NO_INDEX, v2=NO_INDEX;
                for(index_t lv=0; lv<3; ++lv) {
                    if(delaunay->cell_vertex(t,lv) == NO_INDEX) {
                        v1 = delaunay->cell_vertex(t,(lv+1)%3);
                        v2 = delaunay->cell_vertex(t,(lv+2)%3);
                    }
                }
                geo_assert(v1 != NO_INDEX && v2 != NO_INDEX);
                result->create_edge(v1,v2);
            }
        }
	result->remove_isolated_vertices();
        update_caches(result);
        return result;
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
		result->append_mesh(*scope[i], (1u << i));
	    }
        }

	return result;
    }

    void Builder::reset_defaults() {
        fa_ = DEFAULT_FA;
        fs_ = DEFAULT_FS;
        fn_ = DEFAULT_FN;
    }

    bool Builder::find_file(std::filesystem::path& filename) {
	for(const std::filesystem::path& path: file_path_) {
	    std::filesystem::path current_path = path / filename;
	    std::cerr << " Trying " << current_path << std::endl;
	    if(std::filesystem::is_regular_file(current_path)) {
		filename = current_path;
		return true;
	    }
	}
	return false;
    }

    std::shared_ptr<Mesh> Builder::import_with_openSCAD(
        const std::filesystem::path& filepath, const std::string& layer,
        index_t timestamp
    ) {

	std::shared_ptr<Mesh> result;

        std::filesystem::path path = filepath;
	path.remove_filename();

	std::filesystem::path base = filepath.filename();
	base.replace_extension("");

	std::string extension = filepath.extension().string().substr(1);

	std::filesystem::path geogram_filepath =
	    path / std::filesystem::path(
		std::string("geogram_") + base.c_str() + "_" + extension + "_"
		+ layer + "_" +  String::to_string(timestamp) + ".stl"
	    );

	if(std::filesystem::is_regular_file(geogram_filepath)) {
	    result = import(geogram_filepath);
	    result->set_dimension(2);
	    return result;
	}

        Logger::out("CSG") << "Did not find " << geogram_filepath << std::endl;
        Logger::out("CSG") << "Trying to create it with OpenSCAD" << std::endl;

        // Generate a simple linear extrusion, so that we can convert to STL
        // (without it OpenSCAD refuses to create a STL with 2D content)
        std::ofstream tmp("tmpscad.scad");
        tmp << "group() {" << std::endl;
        tmp << "   linear_extrude(height=1.0) {" << std::endl;
        tmp << "      import(" << std::endl;
        tmp << "          file = \"" << filepath.c_str() << "\"," << std::endl;
        tmp << "          layer = \"" << layer << "\"," << std::endl;
        tmp << "          timestamp = " << timestamp << std::endl;
        tmp << "      );" << std::endl;
        tmp << "   }" << std::endl;
        tmp << "}" << std::endl;

        // Start OpenSCAD and generate output as STL
        if(system("openscad tmpscad.scad -o tmpscad.stl")) {
            Logger::warn("CSG") << "Error while running openscad " << std::endl;
            Logger::warn("CSG") << "(used to import " << filepath << ")"
                                << std::endl;
        }

        // Load STL using our own loader
        result = import("tmpscad.stl");

        std::filesystem::remove("tmpscad.scad");
	std::filesystem::remove("tmpscad.stl");

        // Delete the facets that are coming from the linear extrusion
        vector<index_t> delete_f(result->nb_triangles(), 0);
        for(index_t t=0; t<result->nb_triangles(); ++t) {
            for(index_t lv=0; lv<3; ++lv) {
                index_t v = result->triangle_vertex(t,lv);
                if(result->point(v).z != 0.0) {
                    delete_f[t] = 1;
                }
            }
        }
        result->remove_triangles(delete_f);
        mesh_save(*result, geogram_filepath);
        result->set_dimension(2);
	result->compute_borders();

        return result;
    }

    index_t Builder::get_fragments_from_r(double r, double twist) {
        if (fn_ > 0.0) {
            return index_t(fn_ >= 3 ? fn_ : 3);
        }
        return index_t(ceil(fmax(fmin(twist / fa_, r*2*M_PI / fs_), 5)));
    }

    void Builder::do_CSG(
	std::shared_ptr<Mesh> mesh, const std::string& boolean_expr
    ) {
	if(mesh->dimension() == 2) {
	    triangulate(mesh, boolean_expr);
	    mesh->remove_all_triangles();
	    mesh->remove_isolated_vertices();
	    update_caches(mesh);
	} else {
	    // Insert your own mesh boolean operation code here !
	}
	update_caches(mesh);
    }

    void Builder::triangulate(
        std::shared_ptr<Mesh> mesh, const std::string& boolean_expr
    ) {
	csg_assert(mesh->dimension() == 2);

	// Keep edges only
	mesh->remove_all_triangles();
	mesh->remove_isolated_vertices();

	bool has_operand_bit = true;
	for(index_t e=0; e<mesh->nb_edges(); ++e) {
	    if(mesh->edge_operand_bits(e) == NO_INDEX) {
		has_operand_bit = false;
		break;
	    }
	}

	if(!has_operand_bit) {
	    for(index_t e=0; e<mesh->nb_edges(); ++e) {
		mesh->set_edge_operand_bits(e, 1u);
	    }
	}

	vec3 pmin, pmax;
	mesh->get_bbox(pmin, pmax);
	double umin = pmin.x;
	double vmin = pmin.y;
	double umax = pmax.x;
	double vmax = pmax.y;
        double d = std::max(umax-umin, vmax-vmin);
        d *= 10.0;
        d = std::max(d, 1.0);
        umin-=d;
        vmin-=d;
        umax+=d;
        vmax+=d;
	GEO::ExactCDT2d CDT;
        CDT.create_enclosing_rectangle(umin, vmin, umax, vmax);

        // In case there are duplicated vertices, keep track of indexing
        vector<index_t> vertex_id(mesh->nb_vertices());
        for(index_t v = 0; v < mesh->nb_vertices(); ++v) {
            vec2 p = mesh->point_2d(v);
            vertex_id[v] = CDT.insert(
		GEO::ExactCDT2d::ExactPoint(p.x, p.y, 1.0), v
	    );
        }

        // Memorize current number of vertices to detect vertices
        // coming from constraint intersections
        index_t nv0 = CDT.nv();

        // Insert constraints
        {
            for(index_t e=0; e<mesh->nb_edges(); ++e) {
                index_t v1 = mesh->edge_vertex(e,0);
                index_t v2 = mesh->edge_vertex(e,1);
                CDT.insert_constraint(
                    vertex_id[v1], vertex_id[v2], mesh->edge_operand_bits(e)
                );
            }
        }

	CDT.classify_triangles(boolean_expr);

        // Create vertices coming from constraint intersections
        for(index_t v=nv0; v<CDT.nv(); ++v) {
	    GEO::vec2 p = GEO::PCK::approximate(CDT.point(v));
            CDT.set_vertex_id(
                v,
                mesh->create_vertex(vec2(p.x, p.y))
            );
        }

        // Create triangles in target mesh
        for(index_t t=0; t<CDT.nT(); ++t) {
            mesh->create_triangle(
                CDT.vertex_id(CDT.Tv(t,0)),
                CDT.vertex_id(CDT.Tv(t,1)),
                CDT.vertex_id(CDT.Tv(t,2))
            );
        }

	mesh->compute_borders();
	for(index_t e=0; e<mesh->nb_edges(); ++e) {
	    mesh->set_edge_operand_bits(e,1u);
	}

	update_caches(mesh);
    }

    void Builder::update_caches(std::shared_ptr<Mesh> M) {
	csg_argused(M);
    }
}
