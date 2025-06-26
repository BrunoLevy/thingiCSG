// Cube gears 2

use <MCAD/involute_gears.scad>

//gear1();
//gear2();
//gear3();
//gear4();
//gear5();
//gear6();
//gear7();
//gear8();
//rotate(a=[0,theta-90,0])center();
//twogears();// render sub-assembly
eightgears();// render full assembly
//%baseshape();// render original shape (transparent, OpenCSG only)

cs=50;// cube size (side length)
rf1=2*cs;// distance from center of cube to cut corner faces
cp=1/10;// percentage of rf1 for the center block
td=3;// tapping diameter
cd=4;// clearance hole diameter
hd=7;// screw head clearance diameter
Ls=20;// length of screw
ps=10;// penetration of screw into center block
$fs=td/6;// adjust number of faces in holes

n1=18;// number of teeth on gear1
n2=9;// number of teeth on gear2
// Run gearopt.m with inputs of n1 and n2 above, copy outputs r1 and r2 below.
r1=0.7493;
r2=0.3746;

module baseshape() {
	translate([6, 0, -4]) sphere(cs / 2 * 1.4, center=true);
}

// -------------- Don't edit below here unless you know what you're doing.
dc=rf1/sqrt(1-pow(r1,2));
theta=asin(1/sqrt(3));
pitch=360*r1*dc/n1;
rf2=sqrt(pow(dc,2)-pow(r2*dc,2));
phi1=90/n1 * 0;
phi2=90/n2 * 0 + 60;

module twogears(){
	center();
	rotate(a=[0,90-theta,0])gear2();
	rotate(a=[0,90-theta,90])gear1();
}

module eightgears() rotate([0, 0, 45]) {
	center();
	color([0.5, 0.5, 0.5]) rotate(a=[0,90-theta,90]) rotate([0, 0, 360 * $t]) gear1();
	color([0.5, 0.5, 0.5]) rotate(a=[0,90-theta,0]) rotate([0, 0, -720 * $t]) gear2();
	color([1, 0, 0]) rotate(a=[0,90+theta,0]) rotate([0, 0, 360 * $t])gear3();
	color([1, 0, 0]) rotate(a=[0,90+theta,90]) rotate([0, 0, -720 * $t]) gear4();
	color([0, 1, 0]) rotate(a=[0,90+theta,180]) rotate([0, 0, 360 * $t])gear5();
	color([0, 1, 0]) rotate(a=[0,90+theta,-90]) rotate([0, 0, -720 * $t]) gear6();
	color([0, 0, 1]) rotate(a=[0,90-theta,-90]) rotate([0, 0, 360 * $t])gear7();
	color([0, 0, 1]) rotate(a=[0,90-theta,180]) rotate([0, 0, -720 * $t]) gear8();
}

module gear1() render() biggear() rotate([0, 0, 180]) baseshape();
module gear2() render() smallgear() rotate([0, 0, -90]) baseshape();
module gear3() render() rotate([0, 0, 180]) biggear() rotate([0, 180, 180]) baseshape();
module gear4() render() rotate([0, 0, 180]) smallgear() rotate([0, 180, -90]) baseshape();
module gear5() render() rotate([0, 0, 180]) biggear() rotate([0, 180, 0]) baseshape();
module gear6() render() rotate([0, 0, 180]) smallgear() rotate([0, 180, 90]) baseshape();
module gear7() render() biggear() rotate([0, 0, 0]) baseshape();
module gear8() render() smallgear() rotate([0, 0, 90]) baseshape();


module center(){
intersection(){
	rotate(a=[-90-theta,0,0])box();
	rotate(a=[-90-theta,0,180])box();
	rotate(a=[90-theta,0,90])box();
	rotate(a=[90-theta,0,-90])box();
}}

module box(){
difference(){
	translate([0,0,(rf2-rf1)*cp/2])cube(size=[dc,dc,(rf1+rf2)*cp],center=true);
	cylinder(h=dc,r=td/2,center=true);
}}

module biggear(){
intersection(){
	rotate(a=[0,theta-90,0])rotate([0,0,45])child(0);
	rotate(a=[180,0,phi1])translate([0,0,-rf1])
	render() difference(){
		bevel_gear (number_of_teeth=n1,
			outside_circular_pitch=pitch,
			cone_distance=dc,
			face_width=dc*(1-cp),
			bore_diameter=cd,
			finish=0);
		cylinder(h=rf1*(1-cp)-Ls+ps,r=hd/2);
	}
}}

module smallgear(){
intersection(){
	rotate(a=[0,theta-90,0])rotate([0,0,45])child(0);
	cube(size=2*rf1, center=true);
	rotate(a=[180,0,phi2])translate([0,0,-rf2])
	render() difference(){
		bevel_gear (number_of_teeth=n2,
			outside_circular_pitch=pitch,
			cone_distance=dc,
			face_width=dc*(1-cp),
			bore_diameter=cd);
		cylinder(h=rf2*(1-cp)-Ls+ps,r=hd/2);
	}
}}