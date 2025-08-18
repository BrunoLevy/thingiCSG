//translate([-5,0,10]) import_stl(filename="madcat_top.stl");

module lrm20(){
union(){

difference(){
	translate([0,0,0]) cube([12,12,12],center=true);
	translate([0,6,-11]) rotate([45,0,0]) cube([13,12,12],center=true);
}
difference(){
	translate([4,-10.5,0]) cube([4,9,12],center=true);
	translate([4,-15,-8]) rotate([45,0,0]) cube([5,9,12],center=true);
	translate([4,-6,10]) rotate([45,0,0]) cube([5,9,12],center=true);
}

for(x=[0:3]){
	for(y=[0:3]){
		translate([-4.5+x*3,-4.5+y*3,6]) cylinder(r=1,h=2,center=true, $fn=20);
		translate([-4.5+x*3,-4.5+y*3,7]) scale([1,1,2]) sphere(r=1,center=true, $fn=20);
	}
}
}
}

module little_gun(){
union(){
translate([9,-4.5,17]) cylinder(r=1,h=12.5,center=true, $fn=20);
translate([9,-4.5,23.25])  sphere(r=1,center=true, $fn=20);
translate([9,-4.5,10.75])  sphere(r=1,center=true, $fn=20);
translate([9,-4.5,23.25]) cylinder(r=0.5,h=4,center=true, $fn=20);
}
}

module body(){
translate([0,4.5,0]) cube([20,14.5,17],center=true);
translate([0,-2.5,1.5]) cylinder(r=10,h=20,center=true, $fn=20);

difference(){
	translate([0,-2.5,5.25]) cylinder(r=10,h=27.5,center=true, $fn=20);
	translate([0,2.5,5.25]) cube([25,15,50],center=true);
}

difference(){
	translate([0,-14,5.25]) cube([12,5,27.5],center=true);
	translate([0,-16.5,19]) rotate([-30,0,0]) cube([13,5,27.5],center=true);
}

translate([0,-2.5,11.5]) scale([1,1,2]) sphere(r=10,center=true, $fn=20);

little_gun();
mirror([1,0,0]) little_gun();
}

union(){
translate([-15.99,11,6]) lrm20();
translate([15.99,11,6]) mirror([1,0,0]) lrm20();

translate([0,0,8.5]) body();
}