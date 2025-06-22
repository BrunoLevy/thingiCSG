use <lib/threads-library-by-cuiso-v1.scad>

//a list of examples of use for library threads-library-by-cuiso-v1.scad


//EXAMPLE, a simple SCREW with hexagonal head:
thread_for_screw(diameter=10, length=20); 
cylinder(d=18, h=4, $fn=6);

//EXAMPLE, a simple hexagonal NUT:
translate([20,0,0])
difference(){
cylinder(d=18, h=6, $fn = 6); 
thread_for_nut(diameter=10, length=6); 
}

//EXAMPLE, a nut with 0.1 extra clearance:
translate([20,20,0])
difference(){
cylinder(d=18, h=6, $fn = 6); 
thread_for_nut(diameter=10, length=6, usrclearance=0.1); 
}

//EXAMPLE, a cube with two treads:
translate([-20,0,0])
difference(){

translate([0,0,15/2]) cube([15,15,15], center=true);

thread_for_nut(diameter=6, length=15); 

translate([0,15/2,15/2]) rotate([90,0,0]) 
thread_for_nut(diameter=6, length=15); 

}

//EXAMPLE, a rod with no standard pitch:
translate([0,20,0])
thread_for_screw_fullparm(diameter=20, length=30, pitch=6); 

//EXAMPLE, a rod with no standard diameter:
translate([0,-20,0])
thread_for_screw(diameter=6.5, length=10); ; 