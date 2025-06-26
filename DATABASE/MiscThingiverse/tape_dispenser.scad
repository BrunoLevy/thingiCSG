include </Users/jag/Dropbox/scad/Thread_Library.scad>

roll_diameter=58;	// diameter of the whole roll of tape
hole_diameter=25;  // diameter of center hole of roll
tape_width=19;     // width of the tape & roll
center_hole=10;	// diameter of hole in center of axle
outer_wall_thickness=2.5;	//thickness of the wall outside the roll
side_wall_thickness=2;	//thickness of the walls on either side of the roll
clearance=0.75;

blade_thickness=outer_wall_thickness*1.5;
blade_height=6;
blade_width=tape_width+side_wall_thickness+clearance*2;
blade_stickout=blade_thickness;
blade_teeth=10;	//ignored if blade_slot=true
blade_slot=false;	// put a slot for a metal blade
blade_slot_width=20;
blade_slot_thickness=1;
blade_slot_depth=4;
blade_slot_wall=2;  //distance of slot from outside edge of dispenser
nut_thickness=8;
nut_pitch=3;
nut_size=hole_diameter+8;

extra=1;

circle_sides=50;

/*translate([0,0,tape_width+side_wall_thickness+clearance*2])
	nut();
*/
holder();
translate([hole_diameter-3,hole_diameter+3,0])
		nut();

//blade(width=blade_width,teeth=blade_teeth,height=blade_height,thickness=blade_thickness);

module holder() {
	difference() {
		union() {
			difference() {
				cylinder(r=roll_diameter/2+clearance+outer_wall_thickness, h=tape_width+clearance*2+side_wall_thickness, $fn=circle_sides);
				translate([0,0,side_wall_thickness])
					cylinder(r=roll_diameter/2+clearance, h=tape_width+clearance*2+extra,$fn=circle_sides);
				translate([0,hole_diameter/4,-extra/2])
					cube([roll_diameter,roll_diameter,tape_width+clearance*2+side_wall_thickness+extra]);
			}
			
			cylinder(r=hole_diameter/2-clearance, h=tape_width+clearance*2+side_wall_thickness, $fn=circle_sides);
			

			scale([1.5,1,1])
				difference() {
					cylinder(r=roll_diameter/2+clearance+outer_wall_thickness,h=tape_width+clearance*2+side_wall_thickness, $fn=circle_sides);
					translate([0,0,-extra/2])
						cylinder(r=roll_diameter/2+clearance, h=tape_width+clearance*2+side_wall_thickness+extra,$fn=circle_sides);
					translate([-(roll_diameter+clearance*2+outer_wall_thickness*2),-(roll_diameter+clearance*2+outer_wall_thickness*2)/2,-extra/2])
						cube([roll_diameter+clearance*2+outer_wall_thickness*2,roll_diameter+clearance*2+outer_wall_thickness*2,tape_width+clearance*2+side_wall_thickness+extra]);
					translate([0,hole_diameter/4,-extra/2])
						cube([roll_diameter,roll_diameter,tape_width+clearance*2+outer_wall_thickness+extra]);

				}
				
	
			intersection() {
				translate([(roll_diameter/2+clearance+outer_wall_thickness)*1.25-outer_wall_thickness/2,hole_diameter/4,0])
					difference () {
						cylinder(r=(roll_diameter/2+clearance+outer_wall_thickness)/4+outer_wall_thickness/2,h=tape_width+clearance*2+side_wall_thickness, $fn=circle_sides);
						translate([-((roll_diameter/2+clearance+outer_wall_thickness)/2+outer_wall_thickness)/2,0,-extra/2])
							cube([(roll_diameter/2+clearance+outer_wall_thickness)/2+outer_wall_thickness,(roll_diameter/2+clearance+outer_wall_thickness)/2+outer_wall_thickness/2,tape_width+clearance*2+side_wall_thickness+extra]);
							cylinder(r=(roll_diameter/2+clearance+outer_wall_thickness)/4+outer_wall_thickness/2-outer_wall_thickness,h=tape_width+clearance*2+side_wall_thickness+extra, $fn=circle_sides);
					}
	
				scale([1.5,1.5,1])
					cylinder(r=roll_diameter/2+clearance+outer_wall_thickness,h=tape_width+clearance*2+side_wall_thickness, $fn=circle_sides);
			}
			
			
			
		
			translate([0,0,tape_width+clearance*2+side_wall_thickness-extra])
				trapezoidThread(length=nut_thickness+extra, pitch=3, pitchRadius=hole_diameter*3/8);
		}
	
		translate([0,0,-extra/2])
				cylinder(r=center_hole/2, h=tape_width+clearance*2+side_wall_thickness+extra+nut_thickness, $fn=circle_sides);

		if (blade_slot==true)
			translate([roll_diameter*3/4+outer_wall_thickness*1.5-blade_slot_wall,hole_diameter/4-blade_slot_depth+0.01,((tape_width+side_wall_thickness+clearance*2)-blade_slot_width)/2])
			cube([blade_slot_thickness, blade_slot_depth, blade_slot_width]);
		else
			translate([(roll_diameter/2+outer_wall_thickness+clearance)*1.5-blade_thickness,hole_diameter/4-blade_height+blade_stickout,0])
				cube([blade_thickness+extra,blade_height,blade_width]);
	}
	if (blade_slot==false)
				translate([(roll_diameter/2+outer_wall_thickness+clearance)*1.5-blade_thickness,hole_diameter/4-blade_height+blade_stickout,0])
					blade(width=blade_width,teeth=blade_teeth,height=blade_height,thickness=blade_thickness);
}

module blade(width=19, teeth=10, height=4, thickness=1)
{
	translate([0,0,width]) rotate([0,90,0])
		intersection()
		{
			union() {
				translate([0,height-(width/teeth)/2,0])
					for (t=[1:teeth])
					{
						translate([width*(t-1)/teeth,0,0])
							linear_extrude(height=thickness)
								scale(width/teeth)
									tooth();	
					}
				cube([width,height-(width/teeth)/2+0.01,thickness]);
			}
			union() {
				translate([0,height,thickness-(width/teeth)/2])
					rotate([90,0,0])
						for (t=[1:teeth])
						{
							translate([width*(t-1)/teeth,0,0])
								linear_extrude(height=height)
									scale(width/teeth)
										tooth();	
						}
				cube([width,height,thickness-(width/teeth)/2+0.01]);
			}
			translate([0,0,thickness]) rotate([0,90,0])
				linear_extrude(height=width)
					polygon([[0,0], [0,height], [thickness,height-thickness], [thickness,0]]);
		}
}

module tooth()
{
	polygon([[0,0],[0.5,0.5],[1,0]]);
}

module knurled_cylinder(r=10,h=10,knurl_r=0.5, repeat=24)
{
	difference()
	{
		cylinder(r=r, h=h, $fs=0.1);
		for (a=[1:repeat])
		{
			rotate([0,0,a*360/repeat]) translate([r,0,-0.5])
				cylinder(r=knurl_r, h=h+1, $fn=8);
		}
	}	
		
}


module nut()
{
	difference() {
		knurled_cylinder(r=nut_size/2, h=nut_thickness, knurl_r=1, repeat=36);
		translate([0,0,0])
			trapezoidThreadNegativeSpace(length=nut_thickness, pitch=nut_pitch, pitchRadius=hole_diameter*3/8, countersunk=0.25);
	}
}