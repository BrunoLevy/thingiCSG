include <OpenScadFont.scad>

dragonhead_trophy();

module dragonhead_trophy() {
	union() {
		rotate([0,0,180]) import_stl("dragonhead.stl", convexity = 5);
		base_plate();
	}
}

module base_plate() {
	difference() {
		union() {
			scale([1.2,1,1]) base_shape();
			scale([1.2+0.3,1-0.3,1.5]) base_shape();
		}
		translate([-11.5,-32.5,-1]) rotate([0,0,-90]) scale([1,1.9,1])
			fnt_str(["P","U","F","F"], 4, 10,10);

		// mounting holes

		translate([0,33,-1]) cylinder(r=2, h=10);

		translate([30,0,-1]) cylinder(r=2, h=10);
		translate([-30,0,-1]) cylinder(r=2, h=10);

		//translate([-15,30,-1]) cylinder(r=2, h=10);
		//translate([15,30,-1]) cylinder(r=2, h=10);

		//translate([-20,-20,-1]) cylinder(r=2, h=10);
		//translate([20,-20,-1]) cylinder(r=2, h=10);
	}
}

module base_shape() {
	translate([0,-20,0]) {
		intersection() {
			union() {
				difference() {
					scale([1.5/2,3/2,1]) cylinder(r=40, h=5);

					translate([-10,-15,-1]) cylinder(r=25, h=7);
					translate([10,-15,-1]) cylinder(r=25, h=7);		
				}

				difference() {
					translate([0,30,0]) scale([1,4,1]) cylinder(r=40/2, h=5);
					translate([0,100,-1]) cylinder(r=45, h=7);
				}
			}

			translate([0,30,0]) cylinder(r=50, h=5);
		}
	}
}