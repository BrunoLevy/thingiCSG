/*

use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>
*/
// include <../utils/build_plate.scad>
// build_plate_selector = 1; //[0:Replicator 2,1: Replicator,2:Thingomatic]
// build_plate(build_plate_selector,build_plate_manual_x,build_plate_manual_y);

$fn =90;
PHI= 3.1415926535897932384626433832795028841971;
Clearance=0.4;
Abstand_M3 = 31;
Gap	=3;
dM3 = 3 + Clearance;
LayerHeight= 0.0; // for Bridge


jHeadD1= 16;
jHeadH1=5.4;
jHeadD2= 12;

dSrewHead= 6.0 + Clearance;
// http://www.schrauben-lexikon.de/norm/DIN_934.asp
dHexM3	= 6.08 + Clearance; //SW 5.5 eck:6mm

//CUSTOMIZER VARIABLES END

module oval(w,h, height, center = false) {
  scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}

module Ring(r1, r2, hoehe) {
// 		Ring(20,10,5);
	difference() {
		cylinder(h=hoehe,r=r1);
		translate(v = [0, 0, -1])
		cylinder(h=hoehe+2,r=r2);
		}
	}

module Kegel(r1, r2, r3,r4, hoehe) {
	difference() {
		cylinder(h=hoehe,r1=r1,r2=r2);
		translate(v = [0, 0, -1])	
		cylinder(h=hoehe+2, r1=r3, r2=r4);
		}
	}

module Schrauben(){
	%cylinder(r=1,h=1, center=true);
	
//	rotate(a=[0,90,0])
	translate([37.5/2,0,5])
	cylinder(r=dM3/2,h=15, center=true);
}


difference(){
	union() {	
		Ring(44/2,jHeadD1/2,8);

		translate([0,0,])
		Ring(18/2,jHeadD2/2, jHeadH1);
		// Bridge for Printing 
		translate([0,0,-1+jHeadH1])
		cylinder(r=16/2,h=LayerHeight, center=true);	

	} // Ende Union Alles ab hier wird abgezogen



//	for (i = [0 : 360/6: 360]) {
//		echo("Magnet auf Winkel", i);
//		rotate(a=[0,0,i])
//		Schrauben();
//		}

		hull(){
			rotate(a=[0,0,60])
			Schrauben();
			translate([37.5/2*cos(60), 37.5/2*sin(60)-3, 5])
			cylinder(r=dM3/2,h=15, center=true);
		}

		hull(){
			rotate(a=[0,0,120])
			Schrauben();
			translate([37.5/2*cos(120), 37.5/2*sin(120)-3, 5])
			cylinder(r=dM3/2,h=15, center=true);
		}
		hull(){
			rotate(a=[0,0,240])
			Schrauben();
			translate([37.5/2*cos(240), 37.5/2*sin(240)+3, 5])
			cylinder(r=dM3/2,h=15, center=true);
		}
		hull(){
			rotate(a=[0,0,300])
			Schrauben();
			translate([37.5/2*cos(300), 37.5/2*sin(300)+3, 5])
			cylinder(r=dM3/2,h=15, center=true);
		}

/*
x=r*cos(phi)
y=r*sin(phi)
Umrechnung von Polarkoordinaten in kartesische Koordinaten
Wenn man ein kartesisches Koordinatensystem mit gleichem Ursprung wie das Polarkoordinatensystem, dabei die x-Achse in der Richtung der Polarachse, und schließlich die positive y-Achse in Richtung des positiven Drehsinnes wählt – wie in der Abbildung oben rechts dargestellt –, so ergibt sich für die kartesischen Koordinaten x und y eines Punktes.
*/
	translate([15,0,4])
	cube([22-8,Gap,10],center=true);
	translate([-15,0,4])
	cube([22-8,Gap,10],center=true);

	translate([0,0,2+5.5-1+LayerHeight])
	cube([44,Gap,4],center=true);
	
	translate([0,0,5.5/2-1-LayerHeight])
	cube([44,Gap,5.5],center=true);


	translate([ Abstand_M3/2,0,4])		rotate(a=[90,0,0])	 cylinder(r=dM3/2,h=100, center=true);
	translate([-Abstand_M3/2,0,4])		rotate(a=[90,0,0]) cylinder(r=dM3/2,h=100, center=true);

	translate([ Abstand_M3/2,-14,4]) 	rotate(a=[90,0,0]) cylinder(r=dSrewHead/2,h=10, center=true);
	translate([-Abstand_M3/2,-14,4]) 	rotate(a=[90,0,0]) cylinder(r=dSrewHead/2,h=10, center=true);

	translate([ Abstand_M3/2,14,4])  	rotate(a=[90,90,0]) cylinder(r=dHexM3/2,h=10, center=true, $fn=6);
	translate([-Abstand_M3/2,14,4])  	rotate(a=[90,90,0]) cylinder(r=dHexM3/2,h=10, center=true, $fn=6);


}