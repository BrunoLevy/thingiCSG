holder_length = 85;
holder_width = 13;
holder_height = 13;

gear_distance = 38;
gear_tab_diameter = 15;

brace_width = 7.5;
brace_height = 7;

crank_size = 8;
crank_length = 20;

//translate([0, 0, holder_height/2]) bottom();
translate([0, 0, holder_height/2]) top();
//translate([0, 0, crank_size/2]) crank();
//gear();

module gear() {
	difference() {
		union() {
			import_stl("gears.stl", convexity = 20);
			translate([0, 0, 3.75]) cube([30, 30, 7.5], center = true);
		}
		translate([0, 0, -1]) cylinder(5+1, gear_tab_diameter/2, gear_tab_diameter/2);
		translate([0, 0, 10]) cube([crank_size, crank_size, 20], center = true);
	}
}

module crank() {
	union() {
		cube([crank_length, crank_size, crank_size], center = true);
		translate([crank_length/2+crank_size/2, -crank_length*2/2+crank_size/2, 0]) {
			cube([crank_size, crank_length*2, crank_size], center = true);
			rotate([0, 90, 0]) {
				translate([0, -crank_length+crank_size/2, crank_length/2/2/2+crank_size/2]) {
					cylinder(crank_length, crank_size/2, crank_size/2, center = true, $fn=20);
				}
			}
		}
	}
}

module top() {
	difference() {
		bottom();
		translate([+gear_distance/2, 0, 0])
			cylinder(holder_height*2, gear_tab_diameter/2, gear_tab_diameter/2, center = true);
		translate([+gear_distance/2, 0, 5])
			cylinder(holder_height, gear_tab_diameter+0.5, gear_tab_diameter+0.5, center = true);
	}
}

module bottom() {
	difference() {
		union() {
			cube([holder_length, holder_width, holder_height], center= true);

			translate([-gear_distance/2, 0, 0])
				cylinder(holder_height, gear_tab_diameter, gear_tab_diameter, center = true);

			translate([+gear_distance/2, 0, 0]) {
				cylinder(holder_height, gear_tab_diameter, gear_tab_diameter, center = true);
				translate([0, 0, +3]) {
					cylinder(holder_height, gear_tab_diameter/2, gear_tab_diameter/2, center = true);
				}
			}
		}

		translate([-gear_distance/2, 0, 0])
			cylinder(holder_height+2, gear_tab_diameter/2, gear_tab_diameter/2, center = true);

		translate([-holder_length/2-5.5+10, 0, 0])
			cube([11, brace_width, brace_height], center = true);

		translate([+holder_length/2+5.5-10, 0, 0])
			cube([11, brace_width, brace_height], center = true);
	}
}