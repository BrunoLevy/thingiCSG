/*

Bowl from a mesh

Gian Pablo Villamil
July 2011

*/

mesh_thickness = 0.707;
mesh_spacing = 10;

mesh_cells = 16;
mesh_dim = mesh_cells * mesh_spacing;

bowl_radius = 50;
bowl_thickness = 5;
bowl_slice = 10;
bottom_slice = 40;

module ShowPegGrid(Size) {
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
}



module mesh() {
	union () {
		for (i=[0:mesh_cells-1]) {
			translate([i*mesh_spacing-mesh_dim*.75+mesh_spacing/2,-mesh_dim/2,0])
			rotate([0,45,0])
			cube([mesh_thickness, mesh_dim, mesh_dim]);
		}
		for (i=[0:mesh_cells-1]) {
			translate([i*mesh_spacing-mesh_dim*.25+mesh_spacing/2,-mesh_dim/2,0])
			rotate([0,-45,0])
			cube([mesh_thickness, mesh_dim, mesh_dim]);
		}
	}
}

module bowl() {
	translate([0,0,bowl_radius])
	difference() {
		// outer bowl
		difference() {
			sphere(r = bowl_radius);
			translate([-bowl_radius,-bowl_radius,-(bowl_radius+bottom_slice)])
				cube([bowl_radius*2,bowl_radius*2,bowl_radius]);
		}
		// inner bowl
		difference() {
			sphere(r = bowl_radius-bowl_thickness);
			translate([-bowl_radius,-bowl_radius,-(bowl_radius+bottom_slice)+bowl_thickness])
				cube([bowl_radius*2,bowl_radius*2,bowl_radius]);
		}
		translate([-bowl_radius,-bowl_radius,bowl_slice]) 
			cube([bowl_radius*2,bowl_radius*2,bowl_radius-bowl_slice]);

	}	
}

module assembly() {

	intersection () {
		bowl();
		union() {
			mesh();
			rotate([0,0,90]) mesh();
		}
	}
}

assembly();
// bowl ();
// ShowPegGrid(1.0);