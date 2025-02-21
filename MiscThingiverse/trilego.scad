include <lib/lego.scad>

module trilego(width, length, height) {
	xmove=-1.54;
	difference() {
		union() {
			rotate([0,0,0])
				translate([xmove, 0, 0])
					lego_positive(width, length, height, centery=1);

			rotate([0,0,120])
				translate([xmove, 0, 0])
					lego_positive(width, length, height, centery=1);

			rotate([0,0,240])
				translate([xmove, 0, 0])
					lego_positive(width, length, height, centery=1);
		}
		union() {
			rotate([0,0,0])
				translate([xmove, 0, 0])
					lego_negative(width, length, height, centery=1);

			rotate([0,0,120])
				translate([xmove, 0, 0])
					lego_negative(width, length, height, centery=1);

			rotate([0,0,240])
				translate([xmove, 0, 0])
					lego_negative(width, length, height, centery=1);
		}	
	}
}


width=2;
length=5;
height=1/3;

trilego(width, length, height);
