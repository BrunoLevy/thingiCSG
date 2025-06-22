r=21;
size=80;
gap=0.25;
half_gap=gap/2;

flat=1;
assembled=2;

part_layout=flat;

//your_shape_here();

//part(1);
part(2);
//part(3);
//part(4);

module your_shape_here()
{
	rotate(7)
	rotate([5,0,0])
	rotate([0,-10,0])
	translate([0,0,-6])
	scale([0.55,0.65,0.55])
	import("heart.stl");

//	translate([3,3,0])
//	sphere(r=r,$fn=80);

//	cube(r*2,center=true);
}

module part(part_number=1)
{
//	translate([((part_number==2)&&(part_layout==flat))?r*2.7:0,0,0])
//	translate(((part_number==3)&&(part_layout==flat))?[r*2.7,r*2,0]:[0,0,0])
//	translate(((part_number==4)&&(part_layout==flat))?[0,r*2,0]:[0,0,0])

	rotate([0,((part_number==2)&&(part_layout==flat))?180:0,0])

	rotate([0,((part_number==3)&&(part_layout==flat))?-90:0,0])

	rotate([0,((part_number==4)&&(part_layout==flat))?90:0,0])
	
	difference()
	{
		your_shape_here();

		if (part_number==1)
			part_negative();
		else if (part_number==2)
 			rotate([0,180,0])
			part_negative();
		else if (part_number==3)
			rotate([0,90,0])
			rotate(180)
			mirror([1,0,0])
			part_negative();
		else if (part_number==4)
			rotate([0,90,0])
			rotate(180)
			mirror([1,0,0])
			rotate([0,180,0])
			part_negative();
	}
}

module part_negative()
{
	render()
	union()
	{			
	translate([-r/2-half_gap,-size+half_gap,-1])
	cube([size,size,size]);
	
	translate([0,0,-size/2+half_gap])
	cube([size,size,size],true);
	

	translate([-r/2,0,0])
	rotate([0,-45,0])
	translate([-half_gap,-r/2-gap+half_gap,-1])
	cube([size,r/2+gap,size]);
	
	translate([0,r/2-half_gap,r/2-half_gap])
	cube([size,size,size]);
	
	render ()
	intersection()
	{
		translate([-half_gap,-2,r/2-half_gap])
		cube([size,size,size]);
		
		translate([0,0,r/2])
		rotate([0,-45,0])
		translate([-1,-1,-half_gap])
		cube([size,size,size]);
	}
	}
}

module assembled()
{
	part();
	rotate([0,180,0])
	part();
	
	rotate([0,90,0])
	rotate(180)
	mirror([1,0,0])
	{
		part();
		rotate([0,180,0])
		part();
	}
}