include <madcat_arm.scad>
//translate([-11,0,-45]) import_stl(filename="madcat_arm.stl");

module arm_thing(){
rotate([90,0,0])
union(){
translate([0,0,3]) cube([3,6,7]);
translate([0.6,0,8.0]) rotate([0,-40,0]) cube([3,6,10]);
translate([-5.9,0,15.5]) cube([3,6,3]);
}
}

arm_thing();
translate([10,0,0]) arm_thing();