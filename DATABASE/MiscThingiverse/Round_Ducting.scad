/*Round Duct/Pipework fittings Library - Parametric
By the DoomMeister

//Released under the terms of the GNU GPL v3.0
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

**
WARNING - No warrenty is given regarding the fitness of these parts to convey pressurised 
media if they are fabricated by any means. The user takes all risk in terms of saftey and material choice. 
**

Shapes

Straight
Elbow/Tee (any angle, n ways)
Nozel
Reducer
Manifold

Solvent
Clamp
O-Ring Push Fit

*/

duct_OD = 35;//15,22,28,35,42,54,65,80,100,150
duct_OD2 = 28;
duct_wall = 1.8;
duct_length = 40;
quality = 100;
clearance = 0.2;
o_ring_section = 3;
bolt_OD = round(duct_OD/8);
reduction_angle = 30;
end_type = "clamp"; //solvent, clamp, none


duct_OR = duct_OD/2;
duct_OR2 = duct_OD2/2;
duct_IR = (duct_OD-(2*duct_wall))/2;
duct_IR2 = (duct_OD2-(2*duct_wall))/2;
reduction_length = (duct_OR - duct_OR2)/sin(reduction_angle);
clamp_IR = duct_OR + clearance;
clamp_OR = clamp_IR + (2*duct_wall);
clamp_reduction_length = (clamp_OR - duct_OR)/sin(reduction_angle);




//draw

translate([0,0,0])middle_straight();
translate([1*1.5*duct_OD,0*1.5*duct_OD,0])pipe();
connector(end=end_type);
translate([2*1.5*duct_OD,0*1.5*duct_OD,0])elbow(end=end_type);
translate([2*1.5*duct_OD,2*1.5*duct_OD,0])equal_tee(end=end_type);
translate([2*1.5*duct_OD,3*1.5*duct_OD,0])4_way_tee(end=end_type);
translate([0*1.5*duct_OD,3*1.5*duct_OD,0])middle_reducer(end=end_type);
translate([0*1.5*duct_OD,1.5*1.5*duct_OD,0])straight(end=end_type);
translate([0*1.5*duct_OD,4*1.5*duct_OD,0])blank_cap(end=end_type);
/*
middle_tee_n(ways = 3, end=end_type, angle = 120 ,center = true, $fn=quality);
middle_tee_n(ways = 2, end=end_type, angle = 135 ,center = true, $fn=quality);
*/

translate([0*1.5*duct_OD,5*1.5*duct_OD,0])manifold_n(ways = 6, end=end_type,center = true, $fn=quality);

//alaises
module elbow(end="solvent", angle = 90,center = true, $fn=quality)
{
	middle_tee_n(end=end,ways=2, angle = angle); 	
}

module equal_tee(end="solvent",angle = 90,center = true, $fn=quality)
{
	middle_tee_n(end=end,ways=3, angle = 90); 	
}

module 4_way_tee(end="solvent",angle = 90,center = true, $fn=quality)
{
	middle_tee_n(end=end,ways=4, angle = 90); 	
}


//modules

module pipe(length=duct_length)
{
	middle_straight(length=length);
}


module straight(end = "solvent",length=duct_length)
{

offset1 =(3*bolt_OD) + clamp_reduction_length;

	union()
	{



	middle_straight(length=length-(offset1));
	translate([0,0,length])rotate([180,0,0])end(end_form=end);
	}
}

module blank_cap(end = "solvent",length=duct_length,$fn=quality)
{

offset1 =(3*bolt_OD) + clamp_reduction_length;

	union()
	{


	translate([0,0,-duct_wall])cylinder(r=duct_OR, h = duct_wall);
	middle_straight(length=length-(offset1));
	translate([0,0,length])rotate([180,0,0])end(end_form=end);
	}
}


module end(end_form = "solvent")
{
if(end_form == "clamp")
{
	end_clamp();
}
if(end_form == "solvent")
{
	end_solvent();
}
}

module connector(end="solvent", length=2*duct_OD)
{
offset_length = 3*bolt_OD+clamp_reduction_length;

union()
{
	middle_straight(length=length-(2*offset_length));
	translate([0,0,length-offset_length])rotate([180,0,0])end(end_form=end);
	translate([0,0,-offset_length])rotate([0,0,0])end(end_form=end);
}
}




//middle_modules

module middle_straight(length = 40, center = true, $fn=quality)
{
	difference()
	{
		cylinder(r = duct_OR, h = length);
		translate([0,0,-1])cylinder(r = duct_IR, h = length+2);
	}
}




module middle_tee_n(ways = 1, end="solvent", angle = 130 ,center = true, $fn=quality)
{
	difference()
	{
		union()
		{
			sphere(r=duct_OD/2);
			for( i = [0:ways-1])
			{
				rotate([0,i*angle,0])straight(end=end,length=duct_OD*1.5);//cylinder(r = duct_OR, h = duct_length);
			}
		}
		union()
		{
			sphere(r=duct_IR);
			for( i = [0:ways-1])
			{
				rotate([0,i*angle,0])cylinder(r = duct_IR, h = duct_length+1);
			}
		}
	}

}

module manifold_n(ways = 3, end="solvent", offset=1.5,center = true, $fn=quality)
{
	
	difference()
	{
		union()
		{
			//sphere(r=duct_OD/2);
			rotate([0,270,0])straight(end=end,length=duct_OD*1.5);
			rotate([0,90,0])cylinder(r=duct_OR, h = ways*duct_OD*offset);
			for( i = [0:ways-1])
			{
				translate([i*duct_OD*offset,0,0,])rotate([0,180,90])straight(end=end,length=duct_OD*1.5);
			}
		}
		union()
		{
			#sphere(r=duct_IR);
			translate([-1,0,0,])rotate([0,90,0])cylinder(r=duct_IR, h = ways*duct_OD*offset+2);
			for( i = [0:ways-1])
			{
				translate([i*duct_OD*offset,0,0,])rotate([0,180,90])cylinder(r = duct_IR, h = duct_length+1);
			}
		}
	}

}

module middle_reducer(end="solvent",center = true, $fn=quality)
{
	length1 = (duct_length - reduction_length)/2;
	offset_length = 3*bolt_OD+clamp_reduction_length;
	union()
	{
		difference()
		{
			cylinder(r = duct_OR, h = length1);
			translate([0,0,-1])cylinder(r = duct_IR, h = length1+1);
		}
		translate([0,0,length1])
		difference()
		{
			cylinder(r1 = duct_OR,r2 = duct_OR2, h = reduction_length);
			translate([0,0,0])cylinder(r1 = duct_IR,r2 = duct_IR2, h = reduction_length);
		}
		translate([0,0,length1+reduction_length])
		difference()
		{
			cylinder(r = duct_OR2, h = length1);
			translate([0,0,-1])cylinder(r = duct_IR2, h = length1+2);
		}
	
		translate([0,0,-offset_length])rotate([0,0,0])end(end_form=end);

	}


}


module middle_nozel()
{

}

module end_clamp(center = true, $fn=quality)
{
	union()
	{
	difference()
	{
		union()
		{
			cylinder(r = clamp_OR, h = bolt_OD*3);
			translate([clamp_OR-bolt_OD*3,-bolt_OD*2.5,0])cube([bolt_OD*4,bolt_OD*5,bolt_OD*3]);
			translate([clamp_OR+bolt_OD,bolt_OD*1.5,0])rotate([0,0,0])cylinder(r=bolt_OD, h = bolt_OD*3);
			translate([clamp_OR+bolt_OD,-bolt_OD*1.5,0])rotate([0,0,0])cylinder(r=bolt_OD, h = bolt_OD*3);
		}
		#translate([0,0,-1])cylinder(r = clamp_IR, h = (bolt_OD*3)+2);
		translate([clamp_OR-bolt_OD*2,-bolt_OD*0.5,0])cube([bolt_OD*5,bolt_OD,bolt_OD*3]);
		translate([clamp_OR+(bolt_OD*0.75),bolt_OD*3,bolt_OD*1.5])rotate([90,0,0])cylinder(r=bolt_OD/2, h = bolt_OD*6);
		translate([clamp_IR-bolt_OD,0,bolt_OD*3])rotate([0,90,0])cylinder(r=bolt_OD, h = bolt_OD*6);
		translate([clamp_OR-bolt_OD,0,0])rotate([0,0,0])cylinder(r=bolt_OD, h = bolt_OD*3);

	}
		translate([0,0,bolt_OD*3])
		difference()
		{
			cylinder(r1 = clamp_OR,r2 = duct_OR, h = clamp_reduction_length);
			cylinder(r = clamp_IR, h = clamp_reduction_length*0.4);
			translate([0,0,0])cylinder(r1 = clamp_IR,r2 = duct_IR, h = clamp_reduction_length);
			//#translate([clamp_IR-bolt_OD,0,0])rotate([0,90,0])cylinder(r=bolt_OD, h = bolt_OD*6);
		}
	}

}

module end_solvent(center = true, $fn=quality)
{
	union()
	{
	difference()
	{
		union()
		{
			cylinder(r = clamp_OR, h = duct_OD*0.66);
		}
		translate([0,0,-1])cylinder(r = clamp_IR, h = (duct_OD*0.66)+2);
	}
		translate([0,0,duct_OD*0.66])
		difference()
		{
			cylinder(r1 = clamp_OR,r2 = duct_OR, h = clamp_reduction_length);
			cylinder(r = clamp_IR, h = clamp_reduction_length*0.4);
			translate([0,0,0])cylinder(r1 = clamp_IR,r2 = duct_IR, h = clamp_reduction_length);
			}
	}

}

echo(reduction_length,bolt_OD);