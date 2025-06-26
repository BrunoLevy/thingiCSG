cage_r = 7;
molding_r = 1;
wall_t = 1;
base_h = 5;
straight_bar_h = 10;
n_bars = 18; // should be even
bar_r = 0.5;
floor_t = 1;
stand_h = base_h + -1;
stand_leg_off = 1;
stand_w = (stand_leg_off + bar_r + bar_r*2) * 2;

ring_major_r = 2;
ring_minor_r = 0.7;

module inner_cylinder(){
	translate([0,0,-0.5])
	cylinder(r=cage_r-wall_t, h=base_h+straight_bar_h);
	translate([0,0,-molding_r])
	cylinder(r1=cage_r,r2=cage_r-wall_t,h=molding_r*2);
}

$fs = 0.4;
$fa = 10;

module torus(rad_major,rad_minor) {
	rotate_extrude(convexity = 10)
	translate([rad_major, 0, 0])
	circle(r = rad_minor);
}

module birdcage() {
	// floor
	cylinder(r=cage_r,h=floor_t);
	
	// base molding
	translate([0,0,molding_r])
	torus(cage_r,molding_r);
	
	// base wall
	difference() {
		cylinder(r=cage_r+wall_t/2,h=base_h);
		translate([0,0,-1])
		cylinder(r=cage_r-wall_t/2, h=base_h+2);
	}
	
	// base top molding
	translate([0,0,base_h])
	torus(cage_r,molding_r);
	
	// ring of straight bars
	for(i=[0:n_bars]){
		rotate(a=i*360/n_bars, v=[0,0,1])
		translate([cage_r,0,base_h])
		cylinder(r=bar_r, h=straight_bar_h);
	}
	
	// upper molding
	translate([0,0,base_h+straight_bar_h])
	torus(cage_r,molding_r);
	
	// top arch bars
	difference() {
		union() {
			for (i = [0:n_bars/2]) {
				translate([0,0,base_h+straight_bar_h])
				rotate(a=i*360/n_bars, v=[0,0,1])
				rotate(a=90, v=[0,1,0])
				torus(cage_r,bar_r);
			}
		}
		cylinder(r=cage_r+bar_r*2,h=base_h+straight_bar_h);
	}

	// top ring
	translate([0,0,base_h+straight_bar_h+cage_r+ring_major_r])
	rotate(a=90,v=[1,0,0])
	rotate_extrude(convexity = 10)
	translate([ring_major_r, 0, 0])
	circle(r = ring_minor_r);
}

module bird(){
	translate([0,0.4,4+stand_h])
	rotate(a=100, v=[1,0,0])
	scale(2)
	import("bird.stl");
}

module bird_stand (){
	translate([stand_leg_off,0,0])
	cylinder(r=bar_r,h=stand_h);
	translate([-stand_leg_off,0,0])
	cylinder(r=bar_r,h=stand_h);

	translate([0,0,stand_h])
	rotate(a=90, v=[0,1,0])
	cylinder(r=bar_r,h=stand_w, center=true);
}

// For single extrusion

bird();
bird_stand();
birdcage();


/* Printer Settings:
PLA, extra f
Extruder @ 215C
Glass Bed @ 60-70C
Extra Shells 0 (1 shell)
Fill @ 30
Layer Height 0.1
*/

//////////////////////////////////////////////
// Everything below this line is experimental.
//////////////////////////////////////////////

// For dual extrusion 1
/*
difference(){
	bird();
	bird_stand();
}
*/

// For dual extrusion 2
/*
bird_stand();
birdcage();
*/
// MARK 2

// For two color A
/*
translate([(cage_r+2),0,0])
//rotate(a=90,v=[0,0,1])
union() {
	bird();
	bird_stand();
	intersection() {
		cylinder(r=cage_r,h=floor_t);
		inner_cylinder();
	}
	// cool pillar
	//translate([-(cage_r+3),0,0])
	//cylinder(r=1.5,h=base_h+straight_bar_h); 
}

// For two color B
translate([-(cage_r+2),0,0])
difference(){
	birdcage();
	inner_cylinder();
}

*/

/* Printer Settings for split print
PLA, extra f
Extruder @ 200C
Glass Bed @ 60C
Extra Shells 0 (1 shell)
Fill @ 30
Layer Height 0.1
Extrude Speed 80
*/