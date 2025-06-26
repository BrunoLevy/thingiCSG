module link() {
	rotate([90,0,90]) scale([0.5,1.8,1]) 
	linear_extrude(height = 160, center = false, convexity = 10, twist = 810, $fn = 20)
	translate([9, 0, 0])
	circle(r = 5, $fn = 12);
}
module side() {
	for ( i = [0:11] ) {
		rotate( [i*30, 0, 0]) 	translate( [0, 60, 0] ) link();
		rotate( [i*30+15, 0, 0]) 	translate( [0, 60, 0] ) rotate([180,0,0])  link();
	}
}
module pencilCup() {
	rotate([0,-90,0]) side();
	translate([0,0,-5])cylinder(5,68,68, $fn = 72);

	rotate_extrude(convexity = 10, $fn = 72)
	translate([62.5, 160, 0])
	circle(r = 3.5, $fn = 36);
}

scale([0.6,0.6,0.6]) translate([0,0,5]) pencilCup();
