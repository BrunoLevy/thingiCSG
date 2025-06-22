/*
	This is a OpenSCAD Library for generating u-joints

	Usage:
		Where R is the radius of the ujoint, the ujoint will have a length of R*1.40
			
		The NOZZLE_SIZE is used to calculate the clearence for the cross bars. 
		
		ujoint(R=10);

	License: Creative Commons
	Link: http://www.thingiverse.com/celer/designs
   Version: 0.2

	Tested and verified working 15mm-40mm/w 0.35mm nozzle and 2mm support distance

	

*/ 

module mount(R=10,NOZZLE_SIZE=0.35){
	difference(){
		union(){
			cylinder(r=R/2,h=R*0.20,center=true,$fn=20);

			intersection(){
	   			difference(){
					cylinder(r=R/2,h=R*1.90,$fn=20);
	   				cylinder(r=R/2*0.70,h=R*.90,$fn=20);
	   			}
	   			union(){
					translate([0,0,R*.30]) cube([R,R*0.46,R*0.60],center=true,$fn=20);
	   				translate([0,0,R*0.60]) rotate([0,90,]) cylinder(r=R*0.23,h=R,center=true,$fn=20);
				}
			}
		}
		translate([0,0,R*0.60]) rotate([0,90,0]) cylinder(r=(R*0.09)+NOZZLE_SIZE*1.5,h=R*1.10,center=true,$fn=20);
	}
}



module ujoint(R=10){
	translate([0,0,R*-0.60]){
		translate([0,0,R*0.60]) rotate([0,90,]) cylinder(r=R*0.09,h=R,center=true,$fn=20);
		translate([0,0,R*0.60]) rotate([0,90,90]) cylinder(r=R*0.09,h=R,center=true,$fn=20);
		translate([0,0,R*0.60]) sphere(r=R/2*0.65,$fn=20);
		mount(R);
		translate([0,0,R*1.20]) rotate([180,0,90]) mount(R);
	}
}


ujoint(R=30);