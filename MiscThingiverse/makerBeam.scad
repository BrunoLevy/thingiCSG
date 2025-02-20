$fn=50;

module makerBeam(length)
{
	difference(){
		union(){
			// body
			cube([8,8,length], center=true);
			// corners
			for (i=[0:3]){
				rotate([0, 0, i*90]){corner(length);}
			}
		}
		// center hole
		cylinder(h=length, r=2.5, center=true);
	};
}

module corner(length){
	difference(){
		union(){
			// arm
			rotate([0, 0, 45]){
				translate([0,5,0]){cube([1.4, 15, length], center=true);}
			}

			translate([-9, 7, 0]){cube([2, 6, length], center=true);}
			translate([-7, 9, 0]){cube([6, 2, length], center=true);}
			translate([-7, 7, 0]){cube([3, 3, length], center=true);}
		}

		translate([-4, 10, 0]){cylinder(h=length, r=0.5, center=true);}
		translate([-10, 4, 0]){cylinder(h=length, r=0.5, center=true);}

		// round external shape
		difference(){
			translate([-9.5, 9.5, 0]){cube([1, 1, length], center=true);}
			translate([-9, 9, 0]){cylinder(h=length, r=1, center=true);}
		}
	}
}


makerBeam(50);