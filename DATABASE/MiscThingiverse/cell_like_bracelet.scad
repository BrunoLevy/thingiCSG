$fn=20;

// this model is a bit too complex for openscad to render
// as in preview mode.  You have to use F6 / 
// Design Compile & Render to see the finished model
//
//
// Creates a bracelet similar to the cell like bracelets
// also found on thingiverse.com


// measure your wrist in millimeters
bracelet_diameter = 40;

// how many holes per row?
hole_count = 22;

// how wide is the plastic between the holes
// also the bracelet width
separation_width = 2;

// how many rows
bracelet_rows = 4;

//=============================================
//=============================================
//=============================================

// calculated values
circ = bracelet_diameter * 3.141592654;

centerhole_radius_big = (bracelet_diameter+separation_width)/2;
centerhole_radius_lil = (bracelet_diameter-separation_width)/2;

angle = 360 / hole_count;
arcw = circ / hole_count;



sidehole_radius = arcw/2 * 2;
sidehole_radius_big = arcw/2 + separation_width /2;
sidehole_radius_lil = arcw/2 - separation_width /2;



module ring_o_balls()
{
	for (zc = [ 1 : hole_count ] )
	{
		translate([20 * cos(angle * (zc-1)), 20 * sin(angle * (zc-1)), 0])
				sphere(r=sidehole_radius_lil );
	}
}

module ring_o_big_balls()
{
	for (zc = [ 1 : hole_count ] )
	{
		translate([20 * cos(angle * (zc-1)), 20 * sin(angle * (zc-1)), 0])
				sphere(r=sidehole_radius_big );
	}
}


module center_cylinder()
{
	difference()
	{
		cylinder(
			r1=centerhole_radius_big,
			r2=centerhole_radius_big,
			h = sidehole_radius_big * bracelet_rows * 2
		);
		translate([0,0,-1])
		cylinder(
			r1=centerhole_radius_lil,
			r2=centerhole_radius_lil,
			h = sidehole_radius_big * bracelet_rows * 2 +2
		);
	}
}

module outside_balls()
{
		for(z=[1:bracelet_rows])
		{
			translate([0,0,z * sidehole_radius * 0.866025404])
				rotate([0,0,angle/2 * z ])
					ring_o_big_balls();
		}
}
module inside_balls()
{
		for(z=[1:bracelet_rows])
		{
			translate([0,0,z * sidehole_radius * 0.866025404])
				rotate([0,0,angle/2 * z ])
					ring_o_balls();
		}
}

module hollow_balls()
{
	difference()
	{
		outside_balls();
		inside_balls();
	}
}

intersection()
{
%	center_cylinder();
	hollow_balls();
}
