module braceletTube() {
	rotate_extrude(convexity = 10, $fn = 36)
	translate([35, 0, 0])
	scale([0.3,1,1]) circle(r = 15, $fn = 15);
}

module hollowBraceletTube() {
	difference() {
		braceletTube();
		scale([0.94,0.94,0.9])braceletTube();
	}
}
difference() {
	difference() {
		hollowBraceletTube();
		translate([0,0,-20])cylinder(40,33.7,33.7,$fn=36);
	}
	for (i=[0:19]) {
		rotate([60,0,i*18])translate([-1,0,0])rotate([0,90,0])scale([0.5,2,2])cylinder(25,3,3,$fn=24);
		rotate([60,0,i*18+11])translate([-1,0,12])rotate([0,90,0])scale([0.5,2,2])cylinder(25,3,3,$fn=24);
		rotate([60,0,i*18-11])translate([-1,0,-12])rotate([0,90,0])scale([0.5,2,2])cylinder(25,3,3,$fn=24);
		rotate([60,0,i*18+5.5])translate([-1,0,-18])rotate([0,90,0])scale([0.4,0.75,0.75])cylinder(70,3,3,$fn=24);
		rotate([60,0,i*18-5.5])translate([-1,0,18])rotate([0,90,0])scale([0.4,0.75,0.75])cylinder(70,3,3,$fn=24);
	}
	//translate([0,0,-30])cylinder(40,31.2,31.2);
	//translate([0,0,-30])cube([40,40,60]);
}