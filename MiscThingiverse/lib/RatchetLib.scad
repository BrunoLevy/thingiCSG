/* 
Parametric ratchet mechanism library
License: CC BY-NC-SA
Version: 0.2
Date: 2010-05-23
By: rustedrobot

Changelog:
2012-02-05 - rustedrobot - added support for slant parameter which slants the ratchet teeth and arm faces to provide a basic interloc
*/


// =======================================================================
module inner_ratchet_ring(ratchet_direction, ring1_diameter, ring1_height, ring1_thickness, ring2_diameter, ring2_height, ring2_thickness, arms, arm_type, arm_head_width, arm_head_length, arm_height, teeth_multiple, tolerance, slant, facets) {
	teeth = arms*teeth_multiple;
	difference() {
	//union() {
		translate([0,0,ring1_height/2]) {
			cylinder(r=ring1_diameter/2, h=ring1_height, center=true, $fn=facets);
		}
		translate([0,0,ring1_height/2]) {
			cylinder(r=ring1_diameter/2-ring1_thickness, h=ring1_height*2, center=true, $fn=facets);
		}
		translate([0,0,0]) {
		//translate([0,0,ring1_height]/2) {
			for(i=[1:teeth]) {
				rotate([0,0,360/teeth*i]) {
					if (arm_type == "straight") {
						if (ratchet_direction == "clockwise") {
							straight_arm_cutout(arm_head_width, arm_head_length, arm_height, ring1_diameter, ring1_thickness, ring1_height, ring2_diameter, ring2_thickness, ring2_height, tolerance, slant, facets);
						}
						if (ratchet_direction == "counter-clockwise") {
							mirror() {
								straight_arm_cutout(arm_head_width, arm_head_length, arm_height, ring1_diameter, ring1_thickness, ring1_height, ring2_diameter, ring2_thickness, ring2_height, tolerance, slant, facets);
							}
						}
					}
					if (arm_type == "curved") {
						echo("Curved arms not yet implemented");
					}
				}
			}
		}
	}
}

module outer_ratchet_ring(ratchet_direction, ring1_diameter, ring1_height, ring1_thickness, ring2_diameter, ring2_height, ring2_thickness, arms, arm_type, arm_head_width, arm_head_length, arm_shaft_width, arm_height, tolerance, slant, facets) {
	union() {
		translate([0,0,ring2_height/2]) {
			difference() {
				cylinder(r=ring2_diameter/2, h=ring2_height, center=true, $fn=facets);
				cylinder(r=ring2_diameter/2-ring2_thickness, h=ring2_height+1, center=true, $fn=facets);
			}
		}

		translate([0,0,arm_height/2]) {
			arms(ratchet_direction, arms, arm_type, arm_head_width, arm_head_length, arm_shaft_width, arm_height, ring1_diameter, ring2_diameter, ring2_height, ring2_thickness, slant, facets);
		}
	}
}

module arms(ratchet_direction, arms, arm_type, arm_head_width, arm_head_length, arm_shaft_width, arm_height, ring1_diameter, ring2_diameter, ring2_height, ring2_thickness, slant, facets) {
	for(i=[1:arms]) {
		rotate([0,0,360/arms*i]) {
			if (arm_type == "straight") {
				if (ratchet_direction == "clockwise") {
					straight_arm(arm_head_width, arm_head_length, arm_shaft_width, arm_height, ring1_diameter, ring2_diameter,ring2_height, ring2_thickness, slant, facets);
				}
				if (ratchet_direction == "counter-clockwise") { 
					mirror() {
						straight_arm(arm_head_width, arm_head_length, arm_shaft_width, arm_height, ring1_diameter, ring2_diameter,ring2_height, ring2_thickness, slant, facets);
					}
				}
			}
			if (arm_type == "curved") {
				echo("Curved arms not yet implemented");
			}
		}
	}
}

module straight_arm(arm_head_width, arm_head_length, arm_shaft_width, arm_height, ring1_diameter, ring2_diameter, ring2_height, ring2_thickness, slant, facets) {
	sidec = ring2_diameter/2-ring2_thickness+arm_head_width/2;
	sideb = ring1_diameter/2;
	sidea = sqrt(abs(pow(sidec, 2) - pow(sideb, 2)));

	slant_move = tan(slant) * arm_height/2;

	difference() {
		translate([0,ring1_diameter/2-arm_head_width,-arm_height/2]) {
			//union() {
			difference() {
				union() {
					cube([sidea,arm_head_width,arm_height]);
					if (slant != 0) {
						translate([0,-arm_head_width+0.001,0]) {
							cube([arm_head_length,arm_head_width,arm_height]);
						}
					}
				}
				translate([0,-slant_move,-0.01]) {
					rotate([90-slant,0,0]) {
						cube([sidea,arm_head_width*10,arm_height*2]);
					}
				}
				translate([0,-arm_head_width*2-slant_move,0]) {
					cube([sidea*2,arm_head_width*2,arm_height*2]);
				}

				translate([arm_head_length+arm_head_width-arm_shaft_width,-0.1,-0.2]) {
					cube([sidea-(arm_head_length+arm_head_width-arm_shaft_width)+0.1,arm_head_width-arm_shaft_width+0.1,arm_height+0.5]);
				}
				translate([arm_head_length+arm_head_width-arm_shaft_width,0,-0.2]) {
					cylinder(r=arm_head_width-arm_shaft_width, h=arm_height+0.5, $fn=facets);
				}
			}
		}
		difference() {
			cylinder(r=ring2_diameter, h=ring2_height+0.1, center=true, $fn=facets);
			cylinder(r=ring2_diameter/2, h=ring2_height*2, center=true, $fn=facets);
		}
	}
}

module straight_arm_cutout(arm_head_width, arm_head_length, arm_height, ring1_diameter, ring1_thickness, ring1_height, ring2_diameter, ring2_thickness, ring2_height, tolerance, slant, facets) {
	sidec = ring2_diameter/2-ring2_thickness+arm_head_width/2;
	sideb = ring1_diameter/2;
	sidea = sqrt(abs(pow(sidec, 2) - pow(sideb, 2)));
	slant_move = tan(slant) * arm_height/2;
	slant_tolerance = tolerance/cos(abs(slant));

	translate([0,ring1_diameter/2-arm_head_width-slant_move-slant_tolerance,-0.01]) {
		rotate([-slant,0,0]) {
			cube([sidea,arm_head_width*2,arm_height*5]);
		}
	}
}
