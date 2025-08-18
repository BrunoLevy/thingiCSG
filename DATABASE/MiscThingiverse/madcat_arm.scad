//translate([-11,0,-35]) import_stl(filename="madcat_arm.stl");

module barrel(){
	union(){
		translate([0,8.5,6.5])cube([6,33,5],center=true);
		translate([0,8.5,9]) scale([1,1,0.5]) rotate([0,45,0]) cube([4.2,33,4.2],center=true);
		translate([0,8.5,4]) scale([1,1,0.5]) rotate([0,45,0]) cube([4.2,33,4.2],center=true);
	}
}

module ppg(){
union(){
	difference(){
		barrel();
		translate([0,-9.5,0.6]) scale([0.9,0.1,0.9]) barrel();

		translate([0,20,0.5]) scale([1,1,0.5]) rotate([54,0,0]) cube([10,50,10],center=true);

		translate([0,-6,7.75]) rotate([90,0,0]) cylinder(r=1,h=5,center=true,$fn=40);
		translate([0,-6,4.75]) rotate([90,0,0]) cylinder(r=1,h=5,center=true,$fn=40);
	}

	translate([0,23.7,9]) rotate([0,90,0]) cylinder(r=2,h=6,center=true,$fn=40);
	translate([0,20.7,9]) rotate([0,90,0]) cylinder(r=2,h=6,center=true,$fn=40);
	translate([0,22.2,9]) cube([6,3,4], center=true);

	translate([-0.25,9.2,6.25]) cube([6.5,16,6.5], center=true);
	difference(){
		translate([0,9.2,1]) cube([6.5,15,4.5], center=true);
		translate([5.25,9.2,-2]) rotate([0,45,0])  cube([6.5,12,4.5], center=true);
		translate([-3.75,9.2,-2]) rotate([0,45,0])  cube([6.5,12,4.5], center=true);
		translate([0,2.2,-2]) rotate([-45,0,0]) cube([7.5,12,6.5], center=true);
		translate([0,15.2,-2]) rotate([45,0,0]) cube([7.5,12,6.5], center=true);
	}

	difference(){
		translate([0,-5.5,7.75]) rotate([90,0,0]) cylinder(r=1.25,h=5,center=true,$fn=40);
		translate([0,-6,7.75]) rotate([90,0,0]) cylinder(r=1,h=7,center=true,$fn=40);
	}
	difference(){
		translate([0,-5.5,4.75]) rotate([90,0,0]) cylinder(r=1,h=5,center=true,$fn=40);
		translate([0,-5.5,4.75]) rotate([90,0,0]) cylinder(r=0.75,h=7,center=true,$fn=40);
	}
	}
}

translate([0,7,3]) rotate([0,90,0]) ppg();

translate([25,7,3]) rotate([0,-90,0]) mirror([1,0,0]) ppg();