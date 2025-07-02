#include <CSG/builder.h>
#include <CSG/mesh_io.h>
#include <CSG/utils.h>
#include <geogram.psm.Delaunay/Delaunay_psm.h>

namespace CSG {

    Builder::Builder() {
        reset_defaults();
        reset_file_path();
        verbose_ = false;
	warnings_ = false;
	max_arity_ = 32; // maximum number of arguments in CSG operation
	fused_union_difference_ = true; // use A-(B+C+D+...) in single op
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

        M->create_triangle(0,1,3);
        M->create_triangle(0,3,2);

	M->create_edge(0,1);
	M->create_edge(1,3);
	M->create_edge(3,2);
	M->create_edge(2,0);

        finalize_mesh(M);

	return M;
    }

    std::shared_ptr<Mesh> Builder::circle(double r, index_t nu) {
	std::shared_ptr<Mesh> M = std::make_shared<Mesh>();

	if(nu == 0) {
	    nu = index_t(get_fragments_from_r(r, fn_, fs_, fa_));
	}
	nu = std::max(nu, index_t(3));
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

	// zigzag triangulation
	{
	    index_t low = 0;
	    index_t high = nu-1;
	    for(;;) {
		if(low+1==high) {
		    break;
		}
		M->create_triangle(low, low+1, high);
		++low;
		if(high-1==low) {
		    break;
		}
		M->create_triangle(low, high-1, high);
		--high;
	    }
	}

        for(index_t u=0; u<nu; ++u) {
	    M->create_edge(u, (u+1)%nu);
	}

        finalize_mesh(M);

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

	finalize_mesh(M);

	return M;
    }

    std::shared_ptr<Mesh> Builder::sphere(double r) {
        index_t nu = index_t(get_fragments_from_r(r,fn_,fs_,fa_));
        index_t nv = nu / 2;
	if(nu >= 5 && (nu & 1) != 0) {
	    ++nv;
	}

	nu = std::max(nu, index_t(3));
	nv = std::max(nv, index_t(2));

	std::shared_ptr<Mesh> result;

        if(r <= 0.0) {
	    if(warnings_) {
		Logger::warn("CSG")
		    << "sphere with negative radius (returning empty shape)"
		    << std::endl;
	    }
            return result;
        }

	result = circle(1.0, nu);

	sweep(
	    result, nv,
	    [&](index_t u, index_t v)->vec3 {
		double phi = (double(v) + 0.5)*M_PI/double(nv) - M_PI/2.0;
		double cphi = cos(phi);
		double sphi = sin(phi);
                double ctheta = result->point_3d(u).x;
                double stheta = result->point_3d(u).y;
		return vec3(
		    r*ctheta*cphi,
		    r*stheta*cphi,
		    r*sphi
		);
	    }
	);

	finalize_mesh(result);
	return result;
    }

    std::shared_ptr<Mesh> Builder::cylinder(
	double h, double r1, double r2, bool center
    ) {
        index_t nu = index_t(
	    get_fragments_from_r(
		std::max(r1,r2),fn_,fs_,fa_
	    )
	);

	double r[2] = { r1, r2 };

        double z[2] = {
	    center ? -h/2.0 : 0.0,
	    center ?  h/2.0 : h
	};

	std::shared_ptr<Mesh> result;

        if(r1 < 0.0 || r2 < 0.0) {
	    if(warnings_) {
		Logger::warn("CSG")
		    << "cylinder with negative radius (returning empty shape)"
		    << std::endl;
	    }
            return result;
        }

	// If first side's capping is a pole, then flip sides
	// (sweep() supposes that the pole is always on the second side).
        if(r[0] == 0.0) {
            std::swap(r[0],r[1]);
            std::swap(z[0],z[1]);
        }

	result = circle(1.0, nu);
	sweep(
	    result, 2,
	    [&](index_t u, index_t v)->vec3 {
		vec3 p = result->point_3d(u);
		return vec3(
		    r[v]*p.x, r[v]*p.y, z[v]
		);
	    },
	    (r[1] == 0.0) ? SWEEP_POLE : SWEEP_CAP
	);

	finalize_mesh(result);
	return result;
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

        if(
	    full_filename.extension() == ".stl" ||
	    full_filename.extension() == ".STL"
	) {
	    result->merge_duplicated_points();
	}


	if(result->dimension() == 3) {
	    bool z_all_zero = true;
	    for(index_t v = 0; v<result->nb_vertices(); ++v) {
		if(result->point_3d(v).z != 0.0) {
		    z_all_zero = false;
		    break;
		}
	    }
	    if(z_all_zero) {
		result->set_dimension(2);
	    }
	}



        // Apply origin and scale, triangulate
	// (note: mesh_load() already sets dimension to 2 if all z's are zero)
	if(result->dimension() == 2) {
	    for(index_t v=0; v<result->nb_vertices(); ++v) {
		vec2 p = result->point_2d(v);
		result->point_2d(v) = (p - origin) * scale;
	    }
	    result->compute_borders();
	    triangulate(result);
	}

        finalize_mesh(result);
        return result;
    }

    std::shared_ptr<Mesh> Builder::surface_with_OpenSCAD(
        const std::filesystem::path& filename, bool center, bool invert
    ) {
	std::shared_ptr<Mesh> result;
        std::filesystem::path full_filename = filename;
        if(!find_file(full_filename)) {
            Logger::err("CSG") << filename << ": file not found"
                               << std::endl;
	    result = std::make_shared<Mesh>();
            return result;
        }
	ArgList args;
	args.add_arg("file", full_filename);
	args.add_arg("center", center);
	args.add_arg("invert", invert);
	result = call_OpenSCAD(current_path(), "surface", args);
	finalize_mesh(result);
        return result;
    }

    std::shared_ptr<Mesh> Builder::text_with_OpenSCAD(
	const std::string& text, double size, const std::string& font,
	const std::string& halign, const std::string& valign,
	double spacing, const std::string& direction,
	const std::string& language, const std::string& script
    ) {
	ArgList args;
	args.add_arg("text", text);
	args.add_arg("size", size);
	args.add_arg("font", font);
	args.add_arg("halign", halign);
	args.add_arg("valign", valign);
	args.add_arg("spacing", spacing);
	args.add_arg("direction", direction);
	args.add_arg("language", language);
	args.add_arg("script", script);
	bool TWO_D=true;
	std::shared_ptr<Mesh> result = call_OpenSCAD(
	    current_path(), "text", args, TWO_D
	);
	finalize_mesh(result);
	return result;
    }

    std::shared_ptr<Mesh> Builder::import_with_openSCAD(
        const std::filesystem::path& filepath, const std::string& layer,
        index_t timestamp
    ) {
	ArgList args;
	args.add_arg("file", filepath);
	args.add_arg("layer", layer);
	args.add_arg("timestamp", int(timestamp));
	bool TWO_D = true;
	std::shared_ptr<Mesh> result = call_OpenSCAD(
	    current_path(), "import", args, TWO_D
	);
	finalize_mesh(result);
        return result;
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
	// Preserve normals orientations if transform is left-handed
	if(determinant(M) < 0.0) {
	    result->flip();
	}
	finalize_mesh(result);
	return result;
    }

    std::shared_ptr<Mesh> Builder::union_instr(const Scope& scope) {

	if(scope.size() == 0) {
	    return std::make_shared<Mesh>();
	}

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
                    scope1.emplace_back(scope[i]);
                } else {
                    scope2.emplace_back(scope[i]);
                }
            }
            Scope scope3;
            scope3.emplace_back(union_instr(scope1));
            scope3.emplace_back(union_instr(scope2));
            return union_instr(scope3);
	}

	std::shared_ptr<Mesh> result = append(scope);
	do_CSG(result, "union");
	finalize_mesh(result);
	return result;
    }

    std::shared_ptr<Mesh> Builder::intersection(const Scope& scope) {

	if(scope.size() == 0) {
	    return std::make_shared<Mesh>();
	}

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
                    scope1.emplace_back(scope[i]);
                } else {
                    scope2.emplace_back(scope[i]);
                }
            }

            Scope scope3;
            scope3.emplace_back(intersection(scope1));
            scope3.emplace_back(intersection(scope2));
            return intersection(scope3);
        }

	std::shared_ptr<Mesh> result = append(scope);
	do_CSG(result, "intersection");
	finalize_mesh(result);
        return result;
    }

    std::shared_ptr<Mesh> Builder::difference(const Scope& scope) {
	if(scope.size() == 0) {
	    return std::make_shared<Mesh>();
	}

        if(scope.size() == 1) {
            return scope[0];
        }

        // Boolean operations can handle no more than max_arity_ operands.
        // For a difference with more than max_arity_ operands, split it
        // (by calling union_instr() that in turn splits the list if need be).
        if(!fused_union_difference_ || scope.size() > max_arity_) {
            Scope scope2;
            for(index_t i=1; i<scope.size(); ++i) {
                scope2.emplace_back(scope[i]);
            }
            Scope scope3;
            scope3.emplace_back(scope[0]);
            scope3.emplace_back(union_instr(scope2));
            return difference(scope3);
        }

	std::shared_ptr<Mesh> result = append(scope);
        // construct the expression x0-x1-x2...-xn
        std::string expr = "x0";
        for(index_t i=1; i<scope.size(); ++i) {
            expr += "-x" + String::to_string(i);
        }

	do_CSG(result, expr);
	finalize_mesh(result);
        return result;
    }

    std::shared_ptr<Mesh> Builder::group(const Scope& scope) {
        return union_instr(scope);
    }

    std::shared_ptr<Mesh> Builder::color(vec4 color, const Scope& scope) {
	std::shared_ptr<Mesh> result = append(scope);
	finalize_mesh(result);
	return result;
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
        finalize_mesh(result);
        return result;
    }

    std::shared_ptr<Mesh> Builder::linear_extrude(
        const Scope& scope, double height, bool center, vec2 scale,
        index_t slices, double twist
    ) {
	std::shared_ptr<Mesh> result = union_instr(scope);

        double z1 = center ? -height/2.0 : 0.0;
        double z2 = center ?  height/2.0 : height;

        if(slices == 0) {
	    slices = index_t(
		get_linear_extrusion_slices(
		    result, height, scale, twist, fn_, fs_, fa_
		)
	    );
	}

	index_t nv = slices+1;

	sweep(
	    result, nv, [&](index_t u, index_t v)->vec3 {
		vec2 ref(result->point_3d(u).x, result->point_3d(u).y);
		double t = double(v) / double(nv-1);

		double s = 1.0 - t;
		double z = s*z1 + t*z2;
		vec2   sz = s*vec2(1.0, 1.0) + t*scale;

		double x = ref.x * sz.x;
		double y = ref.y * sz.y;

		if(twist != 0.0) {
		    double alpha = twist*t*M_PI/180.0;
		    double ca = cos(alpha);
		    double sa = sin(alpha);
		    double x2 =  ca*x+sa*y;
		    double y2 = -sa*x+ca*y;
		    x = x2;
		    y = y2;
		}

		return vec3(x,y,z);
	    },
	    (scale == vec2(0.0,0.0)) ? SWEEP_POLE : SWEEP_CAP
	);

	finalize_mesh(result);
	return result;
    }

    std::shared_ptr<Mesh> Builder::rotate_extrude(
	const Scope& scope, double angle
    ) {
	std::shared_ptr<Mesh> result = union_instr(scope);
	result->set_dimension(2);

        if(angle == 360.0) {
            result->remove_all_triangles();
            result->remove_isolated_vertices();
        }

	// Remove edges that are co-linear with rotation axis.
	// (as well as vertices dangling on rotation axis).
	{
	    index_t nb_edges_to_remove=0;
	    vector<index_t> remove_edges(result->nb_edges(),0);
	    for(index_t e=0; e<result->nb_edges(); ++e) {
                index_t v1 = result->edge_vertex(e,0);
                index_t v2 = result->edge_vertex(e,1);
		if(
		    (result->point_2d(v1).x == 0.0) &&
		    (result->point_2d(v2).x == 0.0)
		) {
		    remove_edges[e] = 1;
		    ++nb_edges_to_remove;
		}
	    }
	    result->remove_edges(remove_edges);
	    if(nb_edges_to_remove != 0) {
		result->remove_isolated_vertices();
	    }
	}


        double R = 0.0;
        for(index_t v=0; v<result->nb_vertices(); ++v) {
            R = std::max(R, result->point_2d(v).x);
        }
        index_t slices = index_t(
	    get_fragments_from_r_and_twist(R,angle,fn_,fs_,fa_)
	);
	index_t nv = slices+1;

	sweep(
	    result, nv, [&](index_t u, index_t v)->vec3 {
		vec2 ref(result->point_3d(u).x, result->point_3d(u).y);
		double t = double(v) / double(nv-1);
		double alpha = t * 2.0 * M_PI * angle / 360.0;
		return vec3(
		    ref.x * cos(alpha),
		    ref.x * sin(alpha),
		    ref.y
		);
	    },
	    (angle == 360.0) ? SWEEP_PERIODIC : SWEEP_CAP
	);

	// there may be duplicated points around the poles
	result->merge_duplicated_points();

	// Note: we flip when angle is *positive* because X,Y,rotate dir
	// is not a direct basis.
	if(angle > 0) {
	    result->flip();
	}

	finalize_mesh(result);
	return result;
    }

    std::shared_ptr<Mesh> Builder::projection(const Scope& scope, bool cut) {
	std::shared_ptr<Mesh> result = append(scope);
        if(result->dimension() != 3) {
            Logger::err("CSG") << "projection(): input mesh is not of dimenion 3"
                               << std::endl;
	    result->clear();
            return result;
        }
        if(cut) {
	    // Cut mode: intersection between object and z=0 plane.
            // We reuse the intersection() function as follows:
	    // Compute intersection with (enlarged) half bbox and
	    // keep z=0 facets only.
	    vec3 pmin,pmax;
	    result->get_bbox(pmin,pmax);
	    std::shared_ptr<Mesh> C = cube(3.0*(pmax-pmin), false);
            for(index_t v=0; v<C->nb_vertices(); ++v) {
		C->point_3d(v) += vec3(
		    pmin.x - (pmax.x - pmin.x),
		    pmin.y - (pmax.y - pmin.y),
		    0.0
		);
            }
            Scope scope2;
            scope2.push_back(result);
            scope2.push_back(C);
            result = difference(scope2);
	    keep_z0_only(result);
	    result->compute_borders();
	    triangulate(result);
        } else {
	    // Union of all triangles projected in 2D. We project only
	    // half of them (since we have a closed shape). We select
	    // the orientation with the smallest number of triangles.
	    result->remove_all_edges();
	    vector<GEO::Sign> sign(result->nb_triangles());
	    index_t nb_negative = 0;
	    index_t nb_positive = 0;
	    for(index_t t=0; t<result->nb_triangles(); ++t) {
		index_t v1 = result->triangle_vertex(t,0);
		index_t v2 = result->triangle_vertex(t,1);
		index_t v3 = result->triangle_vertex(t,2);
		vec3 p1 = result->point_3d(v1);
		vec3 p2 = result->point_3d(v2);
		vec3 p3 = result->point_3d(v3);
		sign[t] = GEO::PCK::orient_2d(&p1.x, &p2.x, &p3.x);
		nb_negative += (sign[t] == GEO::NEGATIVE);
		nb_positive += (sign[t] == GEO::POSITIVE);
	    }
	    GEO::Sign keep_sign =
		(nb_positive > nb_negative) ? GEO::NEGATIVE : GEO::POSITIVE;

	    for(index_t t=0; t<result->nb_triangles(); ++t) {
		if(sign[t] == keep_sign) {
		    index_t v1 = result->triangle_vertex(t,0);
		    index_t v2 = result->triangle_vertex(t,1);
		    index_t v3 = result->triangle_vertex(t,2);
		    index_t e1 = result->create_edge(v1,v2);
		    index_t e2 = result->create_edge(v2,v3);
		    index_t e3 = result->create_edge(v3,v1);
		    // We are using the "cnstr_operand_bits_is_operand_id"
		    // of the "union" operation in CDT2d. It makes it
		    // possible to compute a union operation with more than
		    // 32 operands (and here we got one operand per input
		    // triangle !).
		    result->set_edge_operand_bits(e1,t);
		    result->set_edge_operand_bits(e2,t);
		    result->set_edge_operand_bits(e3,t);
		}
	    }
	    result->set_dimension(2);
	    triangulate(result,"union_cnstr_operand_bits_is_operand_id");
	    result->compute_borders();
	    triangulate(result);
        }
	finalize_mesh(result);
        return result;
    }

    std::shared_ptr<Mesh> Builder::append(const Scope& scope) {
	if(scope.size() == 0) {
	    return std::make_shared<Mesh>();
	}
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
	    if(std::filesystem::is_regular_file(current_path)) {
		filename = current_path;
		return true;
	    }
	}
	return false;
    }

    void Builder::do_CSG(
	std::shared_ptr<Mesh>& mesh, const std::string& boolean_expr
    ) {
	if(mesh->dimension() == 2) {
	    triangulate(mesh, boolean_expr);  // has all intersections inside
	    mesh->remove_all_triangles();     // now keep edge borders only
	    mesh->remove_isolated_vertices(); // then remove internal vertices
	    triangulate(mesh);                // re-triangulate border edges
	} else {
	    // Insert your own mesh boolean operation code here !
	}
    }

    void Builder::triangulate(
        std::shared_ptr<Mesh>& mesh, const std::string& boolean_expr
    ) {
	csg_assert(mesh->dimension() == 2);

	// Keep edges only
	mesh->remove_all_triangles();
	mesh->remove_isolated_vertices();

	// Make sure edge operand bits are properly initialized
#ifndef NDEBUG
	for(index_t e=0; e<mesh->nb_edges(); ++e) {
	    csg_debug_assert(mesh->edge_operand_bits(e) != NO_INDEX);
	}
#endif

	vec3 pmin, pmax;
	mesh->get_bbox(pmin, pmax);
	vec3 D = pmax - pmin;
	double d = std::max(std::max(D.x,D.y)*10.0, 1.0);
	D = vec3(d,d,0.0);
	pmin -= D;
	pmax += D;

	GEO::ExactCDT2d CDT;
        CDT.create_enclosing_rectangle(pmin.x, pmin.y, pmax.x, pmax.y);

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
	for(index_t e=0; e<mesh->nb_edges(); ++e) {
	    index_t v1 = mesh->edge_vertex(e,0);
	    index_t v2 = mesh->edge_vertex(e,1);
	    CDT.insert_constraint(
		vertex_id[v1], vertex_id[v2], mesh->edge_operand_bits(e)
	    );
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
    }

    void Builder::triangulate(std::shared_ptr<Mesh>& mesh) {
	for(index_t e=0; e<mesh->nb_edges(); ++e) {
	    mesh->set_edge_operand_bits(e,index_t(1));
	}
	triangulate(mesh, "union");
    }

    void Builder::finalize_mesh(std::shared_ptr<Mesh>& M) {
	csg_argused(M);
    }
}
