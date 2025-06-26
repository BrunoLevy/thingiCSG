module tube(major,minor,length) {
	difference() {
		cylinder(length,major,major,center=true);		
		cylinder(length+0.2,minor,minor,center=true);
	}
}
steps=20;
radius=35;
tubeRadius=37.5;
tubeThickness=2.5;
matHeight=5;
numbMats=6;

module onespiro(import=false) {
	if (import) {
		import_stl("SpiroMat.stl",convexity=15);
	} else {
		for (i=[0:steps-1]) {
			rotate([0,0,i*360/steps]) 
				translate([radius,0,0]) tube(tubeRadius,tubeRadius-tubeThickness,matHeight);
		}
	}
}


module spirostack() {
	for (i=[0:numbMats-1]) {
		translate([0,0,5.5*i])onespiro();	
	}
}
module spiroHolder() {
	difference() {
		cylinder((matHeight+1)*(numbMats+1),radius+tubeRadius+5,radius+tubeRadius+5);
		translate([0,0,matHeight])cylinder((matHeight+1)*(numbMats+1),1+radius+tubeRadius,1+radius+tubeRadius);
		translate([30,0-(radius+tubeRadius+10),matHeight])
			cube([radius+tubeRadius+10,(radius+tubeRadius+10)*2,(matHeight+1)*(numbMats+1)]);
		
		rotate([0,0,180])translate([30,0-(radius+tubeRadius+10),matHeight])
			cube([radius+tubeRadius+10,(radius+tubeRadius+10)*2,(matHeight+1)*(numbMats+1)]);
	}
}


spiroHolder();
translate([0,0,8]) spirostack();
//onespiro();
