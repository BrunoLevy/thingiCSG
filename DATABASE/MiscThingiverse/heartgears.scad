// Heart gears 2

use <MCAD/involute_gears.scad>

//gear1();// render each gear (1 to 8)
//rotate(a=[theta+90,0,0])center();// render central block
//twogears();// check two-gear meshing
complete();// render total assembly (slow)

// get heart.stl from emmett's Thing:6190
hs=80;// heart size (width)
hz=-10;// heart z-position (motion relative to 100mm original height)
rf1=0.6*hs;// distance from center of cube to cut corner faces
cp=0.25;// percentage of rf1 for the center block
td=2.5;// tapping diameter
cd=3.3;// clearance hole diameter
hd=6;// screw head clearance diameter
Ls=19;// length of screw
//$fs=td/6;// adjust number of faces in holes

n1=18;// number of teeth on gear1
n2=9;// number of teeth on gear2
// Run gearopt.m (from Thing:6073) with inputs of n1 and n2 above, copy outputs r1 and r2 below.
r1=0.7493;
r2=0.3746;

// -------------- Don't edit below here unless you know what you're doing.
dc=rf1/sqrt(1-pow(r1,2));
theta=asin(1/sqrt(3));
pitch=360*r1*dc/n1;
rf2=sqrt(pow(dc,2)-pow(r2*dc,2));

// nophead's Thing:6118
module polyhole(h, d) {
    n = max(round(2 * d),3);
    rotate([0,0,180])
        cylinder(h = h, r = (d / 2) / cos (180 / n), $fn = n);
}

module box(){
difference(){
	translate([0,0,(rf1-rf2)*cp/2])cube(size=[dc,dc,(rf1+rf2)*cp],center=true);
	translate([0,0,-dc/2])polyhole(h=dc,d=td);
	//cylinder(h=dc,r=td/2,center=true);
}}

module center(){
rotate(a=[180,0,0])
intersection(){
	rotate(a=[-90-theta,0,0])box();
	rotate(a=[-90-theta,0,180])box();
	rotate(a=[90-theta,0,90])box();
	rotate(a=[90-theta,0,-90])box();
}}

module gearA(){
	rotate(a=[180,0,0])translate([0,0,-rf1])
	difference(){
		bevel_gear (number_of_teeth=n1,
			outside_circular_pitch=pitch,
			cone_distance=dc,
			face_width=dc*(1-cp),
			bore_diameter=0,
			finish=0);
		polyhole(h=dc,d=cd);
		polyhole(h=rf1-Ls-td,d=hd);
		//cylinder(h=rf1-Ls-td,r=hd/2);
	}
}

module gearB(){
	rotate(a=[180,0,0])translate([0,0,-rf2])
	difference(){
		bevel_gear (number_of_teeth=n2,
			outside_circular_pitch=pitch,
			cone_distance=dc,
			face_width=dc*(1-cp),
			bore_diameter=0);
		polyhole(h=dc,d=cd);
		polyhole(h=rf2-Ls-td,d=hd);
		//cylinder(h=rf2-Ls-td,r=hd/2);
	}
}

module twogears(){
	rotate(a=[90-theta,0,0])gearA();
	rotate(a=[0,90-theta,0])gearB();
}

module complete(){
intersection(){
scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
rotate(a=[0,theta-90,0])union(){
	center();
	twogears();
	rotate(a=[0,0,180])twogears();
	rotate(a=[0,180,90])twogears();
	rotate(a=[0,180,-90])twogears();
}}}

module gear1(){
rotate(a=-[0,90-theta,0])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,90-theta,0])gearB();
}}

module gear2(){
rotate(a=-[90-theta,0,0])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[90-theta,0,0])gearA();
}}

module gear3(){
rotate(a=-[0,90-theta,0])rotate(a=[0,0,180])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,0,180])rotate(a=[0,90-theta,0])gearB();
}}

module gear4(){
rotate(a=-[90-theta,0,0])rotate(a=[0,0,180])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,0,180])rotate(a=[90-theta,0,0])gearA();
}}

module gear5(){
rotate(a=-[0,90-theta,0])rotate(a=[0,180,90])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,180,90])rotate(a=[0,90-theta,0])gearB();
}}

module gear6(){
rotate(a=-[90-theta,0,0])rotate(a=[0,180,90])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,180,90])rotate(a=[90-theta,0,0])gearA();
}}

module gear7(){
rotate(a=-[0,90-theta,0])rotate(a=[0,180,-90])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,180,-90])rotate(a=[0,90-theta,0])gearB();
}}

module gear8(){
rotate(a=-[90-theta,0,0])rotate(a=[0,180,-90])rotate(a=-[0,theta-90,0])
intersection(){
	scale(hs/100)translate([0,0,hz])import_stl("heart.stl", convexity=2);
	rotate(a=[0,theta-90,0])rotate(a=[0,180,-90])rotate(a=[90-theta,0,0])gearA();
}}

module complete1(){
	rotate(a=[0,theta-90,0])center();
	rotate(a=[0,theta-90,0])rotate(a=[0,90-theta,0])gear1();
	rotate(a=[0,theta-90,0])rotate(a=[90-theta,0,0])gear2();
	rotate(a=[0,theta-90,0])rotate(a=[0,0,180])rotate(a=[0,90-theta,0])gear3();
	rotate(a=[0,theta-90,0])rotate(a=[0,0,180])rotate(a=[90-theta,0,0])gear4();
	rotate(a=[0,theta-90,0])rotate(a=[0,180,90])rotate(a=[0,90-theta,0])gear5();
	rotate(a=[0,theta-90,0])rotate(a=[0,180,90])rotate(a=[90-theta,0,0])gear6();
	rotate(a=[0,theta-90,0])rotate(a=[0,180,-90])rotate(a=[0,90-theta,0])gear7();
	rotate(a=[0,theta-90,0])rotate(a=[0,180,-90])rotate(a=[90-theta,0,0])gear8();
}