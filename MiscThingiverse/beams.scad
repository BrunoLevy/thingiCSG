$fn=100;

//-------------------------------------------------------------
// Constants for default setup 
//-------------------------------------------------------------

// How many holes in the beam.
HOLES = 8;

// Dimensions of the beam body. Adjust these if
// the overall beam size doesn't match a real beam
// size. Measured values are 7.35 and 7.8 respectively.
BEAM_DIAMETER = 7.2;
BEAM_DEPTH = 7.7;

// Main inner hole diameter. Make larger if a connector
// or axle are too tight. Make smaller if connector comes 
// out too easily or axle is too wobbly. Measured value
// is 4.8.
INNER_HOLE_DIAMETER = 5;

// Diameter and depth of the outer chamfer for a hole. If
// connectors fit fine but don't push all the way in, one of 
// these is likely too small - normally the outer diameter. 
OUTER_HOLE_DIAMETER = 6.3;
HOLE_CHAMFER = 0.8;

// Spacing between holes. This shouldn't be changed unless
// deliberately attempting to create none-standard bricks. 
SPACING = 8;

//-------------------------------------------------------------
// Create the default beam
//-------------------------------------------------------------

beam(
    num_holes=HOLES,
    beam_diameter=BEAM_DIAMETER,
    beam_depth=BEAM_DEPTH,
    spacing=SPACING,
    inner_hole_diameter=INNER_HOLE_DIAMETER,
    outer_hole_diameter=OUTER_HOLE_DIAMETER,
    hole_chamfer=HOLE_CHAMFER
);

//-------------------------------------------------------------
// Internal functions 
//-------------------------------------------------------------

// The holes to cut for a given segment.
module hole_shape(inner_diameter, outer_diameter, depth, chamfer) {
    rotate([90,0,0])
    union(){
        
        // Main inner hole.
        cylinder(h=depth, d=inner_diameter, center=true);
        
        // Outer chamfer at top and bottom.
        translate([0,0,depth*0.5])
            cylinder(h=chamfer*2, d=outer_diameter, center=true);
        translate([0,0,-depth*0.5])
            cylinder(h=chamfer*2, d=outer_diameter, center=true);
        
        // The 4 cuts that make up the additional cavity
        // between the holes.
        difference() {
            cw = 1.5;
            epsilon = 0.01;
            spacing = 8;
            diam = 7.2;
            translate([-spacing*0.5+cw*0.5,0,-depth*0.75])
            cube([cw+epsilon, outer_diameter, depth], center=true);
            cylinder(h=depth*2, d=spacing*0.9, center=true);
        }         
        scale([-1,1,1])
        difference() {
            cw = 1.5;
            epsilon = 0.01;
            spacing = 8;
            diam = 7.2;
            translate([-spacing*0.5+cw*0.5,0,-depth*0.75])
            cube([cw+epsilon, outer_diameter, depth], center=true);
            cylinder(h=depth*2, d=spacing*0.9, center=true);
        }          
        difference() {
            cw = 1.5;
            epsilon = 0.01;
            spacing = 8;
            diam = 7.2;
            translate([-spacing*0.5+cw*0.5,0,depth*0.75])
            cube([cw+epsilon, outer_diameter, depth], center=true);
            cylinder(h=depth*2, d=spacing*0.9, center=true);
        }           
        scale([-1,1,1])
        difference() {
            cw = 1.5;
            epsilon = 0.01;
            spacing = 8;
            diam = 7.2;
            translate([-spacing*0.5+cw*0.5,0,depth*0.75])
            cube([cw+epsilon, outer_diameter, depth], center=true);
            cylinder(h=depth*2, d=spacing*0.9, center=true);
        }          
    }
}

// Main body of the beam.
module beam_body(spacing, diameter, holes, depth) {
    bw = spacing * (holes - 1);
    union() {
        cube([bw, depth, diameter], center=true);

        translate([-bw*0.5,0,0])
        rotate([90,0,0])
        cylinder(h=depth, d=diameter, center=true);

        translate([bw*0.5,0,0])
        rotate([90,0,0])
        cylinder(h=depth, d=diameter, center=true);
    }
    
}

// Construct a single beam.
module beam(num_holes, beam_diameter, beam_depth, spacing, inner_hole_diameter, outer_hole_diameter, hole_chamfer, face="up") {
   
    face_up = face=="up";
    r = face_up ? 90 : 0;

    rotate([r,0,0])        
    difference() {
        difference() {
            beam_body(
                spacing = spacing, 
                diameter = beam_diameter, 
                holes = num_holes, 
                depth = beam_depth);

            
            for(i=[0:num_holes]) {
                translate([-spacing*(num_holes-1)/2+i*spacing,0,0])
                hole_shape(
                    inner_diameter = inner_hole_diameter,
                    outer_diameter = outer_hole_diameter,
                    depth = beam_depth,
                    chamfer = hole_chamfer);
            }
        }         
    }


} 
