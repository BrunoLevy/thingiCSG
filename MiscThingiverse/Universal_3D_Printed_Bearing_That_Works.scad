// Universal 3D Printed Bearing That Works.scad
//
// Original:
//   "Universal 3D Printed Bearing That Works"
//   By Thingiverse user: ThinkingandTinkering (Robert Murray-Smith)
//   Date: January 03, 2025
//   License: CC BY-SA
//   https://www.thingiverse.com/thing:6898888
//   Designed in Tinkercad
//
// Remix:
//   Version: Remix 1
//   Date: January 4, 2024
//   By: Stone Age Sculptor
//   License: CC BY-SA
//   Goal: 
//     An identical shape with OpenSCAD.
//   Tip:
//     Open the "Customizer" in OpenSCAD.

view_mode = 0; // [0:For Printing, 1:Design Roller, 2:Design Bottom Housing, 3:Design Top Housing]

// The diameter of a roller.
roller_diameter = 10.00; // [9.00:0.01:11.00]

// The height of a roller.
roller_height = 10.00; // [9.00:0.01:11.00]

// The size of the beveled edge of a roller.
roller_bevel = 0.5; // [0.0:0.1:2.0]

// The outside diameter of the housing.
housing_diameter = 25; // [23.6:0.1:30]

// The height of a single housing part.
housing_height = 8.50; // [7.50:0.01:9.50]

// The width of the slot (gap) for the click fit.
slot_width = 3.2; // [1.0:0.1:5.0]

// The diameter of the edge of the click fit.
diameter_click_fit_edge = 1.90; // [1.70:0.01:2.20]

// The diameter of the indent for the click fit.
diameter_click_fit_indent = 3.90; // [3.60:0.01:4.20]

// The accuracy for the preview.
accuracy_preview = 50; // [20:100]

// The accuracy for the final render.
accuracy_render = 250; // [100:300]

/* [Hidden] */

// Overall accuracy.
$fn = $preview ? accuracy_preview : accuracy_render;

if(view_mode==0)
{
  // --------------------------------
  // For Printing
  // --------------------------------
  // By exporting the render as a 3mf file,
  // the parts are already separated, and
  // they can be arranged on the build plate
  // if needed.

  // Make 10 rollers.
  for(i=[0:4])
    for(j=[0:1])
      translate([6+12*i,66+j*12,0])
        Roller();

  // Show the bottom housing.
  translate([30,30,0])
    BottomHousing();

  // Show the top housing.
  translate([91,30,0])
    TopHousing();
}
else if(view_mode==1)
{
  // --------------------------------
  // Design Roller
  // --------------------------------
  Roller();

  // Show cross section
  translate([0,0,15])
  {
    difference()
    {
      Roller();

      color("Red")
        translate([-10,-20,-1])
          cube(20);    
    }
  }
}
else if(view_mode==2)
{
  // --------------------------------
  // Design Bottom Housing
  // --------------------------------
  BottomHousing();

  // Show cross section
  translate([0,0,20])
  {
    difference()
    {
      BottomHousing();

      color("Red")
        translate([-50,-100,-1])
          cube(100);    
    }
  }
}
else if(view_mode==3)
{
  // --------------------------------
  // Design Top Housing
  // --------------------------------
  TopHousing();

  // Show cross section
  translate([0,0,25])
  {
    difference()
    {
      TopHousing();

      color("Red")
        translate([-50,-100,-1])
          cube(100);    
    }
  }
}

module Roller()
{
  // Make the cylinder out of three parts.
  // Adjust with 0.001 to be sure that
  // the parts connect.
  // Otherwise the parts might not connect
  // due to rounding errors.

  // Bottom beveled edge.
  if(roller_bevel > 0)
    color("PaleTurquoise")
      cylinder(h=roller_bevel, d1=roller_diameter-2*roller_bevel,d2=roller_diameter);
  
  // Middle straight part.
  color("LightSteelBlue")
    translate([0,0,roller_bevel-0.001])
      cylinder(h=roller_height-2*roller_bevel+0.002,d=roller_diameter);
  
  // Top beveled edge.
  if(roller_bevel > 0)
    color("DarkSeaGreen")
      translate([0,0,roller_height-roller_bevel])
        cylinder(h=roller_bevel,d1=roller_diameter,d2=roller_diameter-2*roller_bevel);

  // The original shape.
  // Move it to (0,0,0) on the xy-plane.
  // translate([-127,-50,0])
  //   import("Roller_x_10.stl");
}

module BottomHousing()
{
  // The 2D profile is created first.
  rotate_extrude(convexity=3)
  {
    difference()
    {
      HousingProfile2D(x_start = 8.3);

      // Remove a circle.
      // The will become the indented torus
      // for the click fit.
      translate([7.2,1.36])
        circle(d=diameter_click_fit_indent);
    }
  }

  // The original shape.
  // Move it to (0,0,0) on the xy-plane.
  // translate([53,45,0])
  //   import("Base.stl");
}

module TopHousing()
{
  difference()
  {
    rotate_extrude(convexity=4)
    {
      HousingProfile2D(x_start=8);

      // Add a rectangle that will become
      // the cylinder in the middle.
      translate([5.0,0])
        square([3,18.25]);

      // The next circle will become the torus
      // for the click-fit.
      // Avoid that it sticks out of the top,
      // by flattening the top of the circle.
      translate([7.55,17.37])
      {
        intersection()
        {
          circle(d=diameter_click_fit_edge);
          square([10,1.7],center=true);
        }
      }
    }

    // Remove the slot to separate the
    // both sides of the click fit.
    translate([0,0,11.7])
    {
      rotate([90,0,0])
      {
        translate([-slot_width/2,0,-50])
          cube([slot_width,100,100]);
        cylinder(h=100,d=slot_width,center=true);
      }
    } 
  }

  // The original shape.
  // Move it to (0,0,0) on the xy-plane.
  // translate([-24,+33,0])
  //   import("Cap.stl");
}

// A common profile for both the
// bottom and top housing.
// It can be created with a list of
// coordinates for a polygon, or with 
// 2D building blocks.
// This is with 2D building blocks.
module HousingProfile2D(x_start)
{
  difference()
  {
    translate([x_start,0])
      square([housing_diameter-x_start,housing_height]);

    // Remove a rotated rectangle.
    // The edges will be a little more than 45 degrees.
    // I tried 45 degrees first, but they didn't roll well.
    // Then I noticed that the original design has a slightly
    // larger angle.
    translate([17.1,2.0])
      scale([1,0.97]) // wider angle
        rotate(45)
          square(20);
  }
}
