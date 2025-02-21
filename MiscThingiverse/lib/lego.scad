// edited 2/24/11 3:29 PM

// Standard lego block height, from bottom to top, not counting the circular knobs on top
block_height=9.5;

// Exterior thickness
wall_thickness=1.45;
roof_thickness=1.05;

// Knobs are the circles on top of blocks
knob_diameter=4.8;
knob_height=2;
knob_spacing=8.0;

// Pins are small cylinders inside blocks with width or length of 1 (visible from the bottom)
pin_diameter=3;

// Posts are the tubes inside blocks with width and length > 1 (visible from the bottom)
post_diameter=6.4;
reinforcing_width=1.25;

// Axles are cross-shaped holes taken out of lego blocks
axle_spline_width=2.0;
axle_diameter=5;

// Cylinder precision affects both posts and pins
cylinder_precision=0.3;

// The "reinforcement" is the inner wall that goes from post to post, or post to outer wall
module reinforcement(height) {
	translate([0,0,height*block_height/2]) {
		union() {
			cube([reinforcing_width,knob_spacing+knob_diameter+wall_thickness/2,height*block_height],center=true);
			rotate(v=[0,0,1],a=90)
				cube([reinforcing_width,knob_spacing+knob_diameter+wall_thickness/2,height*block_height], center=true);
		}
	}
}

// An "axle" is an optional cross-shaped hole that cuts through the lego block
module axle(height) {
	translate([0,0,height*block_height/2]) union() {
		cube([axle_diameter,axle_spline_width,height*block_height],center=true);
		cube([axle_spline_width,axle_diameter,height*block_height],center=true);
	}
}

// The 'positive space' of a lego block
module lego_positive(width, length, height, reinforcement=true, centerx=0, centery=0, centerz=0) {
	overall_length=(length-1)*knob_spacing+knob_diameter+wall_thickness*2;
	overall_width=(width-1)*knob_spacing+knob_diameter+wall_thickness*2;
	translate([-overall_length/2*centerx, -overall_width/2*centery, -(block_height+knob_height)/2]) {
		union() {
			cube([overall_length,overall_width,height*block_height]);
			translate([knob_diameter/2+wall_thickness,knob_diameter/2+wall_thickness,0]) 
				for (ycount=[0:width-1])
					for (xcount=[0:length-1]) {
						translate([xcount*knob_spacing,ycount*knob_spacing,block_height*height])
							cylinder(r=knob_diameter/2,h=knob_height,$fs=cylinder_precision);
				}
		}
	}
}

// The 'negative space' of a lego block
module lego_negative(width, length, height, axle_hole=false, reinforcement=true, centerx=0, centery=0, centerz=0) {
	overall_length=(length-1)*knob_spacing+knob_diameter+wall_thickness*2;
	overall_width=(width-1)*knob_spacing+knob_diameter+wall_thickness*2;
	translate([-overall_length/2*centerx, -overall_width/2*centery, -(block_height+knob_height)/2]) {
		union() {
			if (axle_hole==true && width>1 && length>1)
				for (ycount=[0:width-1])
					for (xcount=[0:length-1])
						translate([xcount*knob_spacing,ycount*knob_spacing,0])
							axle(height);
			difference() {
				// Hollow out the block by creating an inner block up to the walls and roof of the brick
				translate([wall_thickness,wall_thickness,0])
					cube([overall_length-wall_thickness*2,overall_width-wall_thickness*2,block_height*height-roof_thickness]);
				if (reinforcement==true && width>1 && length>1)
					difference() {
						for (ycount=[1:width-1])
							for (xcount=[1:length-1])
								translate([xcount*knob_spacing,ycount*knob_spacing,0])
									reinforcement(height);
						for (ycount=[1:width-1])
							for (xcount=[1:length-1])
								translate([xcount*knob_spacing,ycount*knob_spacing,0])
									cylinder(r=knob_diameter/2, h=height*block_height, $fs=cylinder_precision);
					}
				// Remove center cylinder for post
				if (width>1 && length>1)
					for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([xcount*knob_spacing,ycount*knob_spacing,0])
								cylinder(r=post_diameter/2, h=height*block_height,$fs=cylinder_precision);
				if (width==1 && length!=1)
					for (xcount=[1:length-1])
						translate([xcount*knob_spacing,overall_width/2,0])
							cylinder(r=pin_diameter/2,h=block_height*height,$fs=cylinder_precision);
				if (length==1 && width!=1)
					for (ycount=[1:width-1])
						translate([overall_length/2,ycount*knob_spacing,0])
							cylinder(r=pin_diameter/2,h=block_height*height,$fs=cylinder_precision);
			}

			// Add inner cylinder for post back
			if (width>1 && length>1)
				for (ycount=[1:width-1])
					for (xcount=[1:length-1])
						translate([xcount*knob_spacing,ycount*knob_spacing,0])
							cylinder(r=knob_diameter/2, h=height*block_height-roof_thickness,$fs=cylinder_precision);
		}
	}
}

module lego(width, length, height, axle_hole=false, reinforcement=true, centerx=0, centery=0, centerz=0) {
	difference() {
		lego_positive(width, length, height, reinforcement, centerx, centery, centerz);
		lego_negative(width, length, height, axle_hole, reinforcement, centerx, centery, centerz);
	}
}

