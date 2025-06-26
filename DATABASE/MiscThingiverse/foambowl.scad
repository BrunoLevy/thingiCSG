/*

Bowl from a foam

Gian Pablo Villamil
July 2011

*/

$fn = 18;

bubble_radius = 6;
bubble_margin = 2;
bubble_spacing = (bubble_radius + bubble_margin) * 2;

num_bubbles = 7;
foam_dim = num_bubbles * bubble_spacing;

bowl_radius = 50;
bowl_thickness = 5;
bowl_slice = 21;
bottom_slice = 41;

module ShowPegGrid(Size) {
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
}



module foam() {
	translate([-foam_dim/2+bubble_spacing/2,-foam_dim/2+bubble_spacing/2,0])
	for (x=[0:num_bubbles-1]) {
		for (y=[0:num_bubbles-1]) {
			for (z=[0:4]){
				translate([x*bubble_spacing,y*bubble_spacing,z*bubble_spacing])
					sphere(r=bubble_radius);
			}
		}
	}
	translate([-(foam_dim/2-bubble_spacing),-(foam_dim/2-bubble_spacing),bubble_spacing/2])
	for (x=[0:num_bubbles-2]) {
		for (y=[0:num_bubbles-2]) {
			for (z=[0:3]){
				translate([x*bubble_spacing,y*bubble_spacing,z*bubble_spacing])
					sphere(r=bubble_radius);
			}
		}
	}


}

module bowl() {
	translate([0,0,bowl_radius])
	difference() {
		// outer bowl
		difference() {
			sphere(r = bowl_radius, $fn= 64);
			translate([-bowl_radius,-bowl_radius,-(bowl_radius+bottom_slice)])
				cube([bowl_radius*2,bowl_radius*2,bowl_radius]);
		}
		// inner bowl
		difference() {
			sphere(r = bowl_radius-bowl_thickness, $fn = 64);
			translate([-bowl_radius,-bowl_radius,-(bowl_radius+bottom_slice)+bowl_thickness])
				cube([bowl_radius*2,bowl_radius*2,bowl_radius]);
		}
		translate([-bowl_radius,-bowl_radius,bowl_slice]) 
			cube([bowl_radius*2,bowl_radius*2,bowl_radius-bowl_slice]);

	}	
}

module assembly() {
	difference () {
		bowl();
		foam();
		}
	}

assembly();
//foam();
//bowl();
//ShowPegGrid(1.0);