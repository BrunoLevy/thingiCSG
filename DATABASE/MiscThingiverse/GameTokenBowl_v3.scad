/*
All code by Patrick Gaston, June 2021. Use at your own risk. Credit where due.
*/

/* [Outer Shape] */
// Number of cups around the center
count_sides = 6;  // [2:1:10]

// Height of bowls
height_wall = 30; // [10:1:60]

// Vertical resolution of curve from bottom to top of bowls
count_height_subdivisions = 3; // [1:1:16]

// How much walls curve outward from base. 0 = vertical walls.
amplitude_height_divisions = .7; // [0:0.1:1.5]

// Radius of base inner vertices. Defines overall diameter of model.
radius_outer = 50; // [10:1:100]

thickness_wall = 2*1; //Approximate. Fiddle with it to get what you want.

// How far each cup curves outward
amplitude_petals = 1; // [0:0.1:2]

// Resolution of curved side of cup
count_petal_subdivisions = 2; // [1:1:24]

/* [Center Cup] */
// Radius of central cup. Set to 0 for no cup.
radius_cup = 34;  // [0:2:80]

// Number of sides of central cup. Looks best if matches number of outer cups.
count_sides_cup = 6; // [3:1:24]

// Size of outer curved base of central cup.
radius_bevel_cup_outer = 4; // [0:2:30]

// Size of inner curved base of central cup
radius_bevel_cup_inner = 4; // [0:2:30]

// Smoothness of central cup base curves.
count_bevel_divisions = 16;  // [1:1:24]

theta = 360/count_sides;
A = radius_outer * cos(theta/2);
B = radius_outer * sin(theta/2);
C = thickness_wall;
D = C / tan(theta/2); //How far to inset the center point of main dish hollow.
epsilon = 0.01 * 1;

color(Random_Color())
difference()
    {
     union()
        {
         base();
         main_dish();
         center_cup_positive();
        }
     center_cup_negative();
    }
module base()
{
 for (j = [0:count_sides - 1])
    {
     rotate([0,0,j*360/count_sides])
        {
         coords0 = [[0,0], for (i = [0:count_petal_subdivisions]) [(A + B * amplitude_petals * cos(270+(i*180/count_petal_subdivisions))), (B * sin(270+(i*180/count_petal_subdivisions)))]];
         linear_extrude(height = thickness_wall)
            polygon(coords0);
       }
    }
}
module main_dish()
{
 difference()
    {
     for (j = [0:count_sides - 1])
        {
         rotate([0,0,j*360/count_sides])
         for (k = [0:count_height_subdivisions - 1])
            {
             coords0 = [[0,0],
               for (i = [0:count_petal_subdivisions])
                   [(A + B * amplitude_petals * cos(270+(i*180/count_petal_subdivisions))) * (1 + amplitude_height_divisions * (cos(270 + ((k) * 90/count_height_subdivisions)))),
                    (B * sin(270+(i*180/count_petal_subdivisions))) * (1 + amplitude_height_divisions * (cos(270 + ((k) * 90/count_height_subdivisions))))]];
             coords1 = [[0,0],
               for (i = [0:count_petal_subdivisions])
                   [(A + B * amplitude_petals * cos(270+(i*180/count_petal_subdivisions))) * (1 + amplitude_height_divisions * (cos(270 + ((k+1) * 90/count_height_subdivisions)))),
                    (B * sin(270+(i*180/count_petal_subdivisions))) * (1 + amplitude_height_divisions * (cos(270 + ((k+1) * 90/count_height_subdivisions))))]];
             hull()
                {
                 translate([0,0, k*height_wall/count_height_subdivisions])
                 linear_extrude(height = thickness_wall)
                    polygon(coords0);
                 translate([0,0, (k+1)*height_wall/count_height_subdivisions])                
                 linear_extrude(height = 1)
                    polygon(coords1);
                }
            }
        }
     //Negative spaces
     translate([0,0,epsilon])   
     for (j = [0:count_sides - 1])
        {
         rotate([0,0,j*360/count_sides])
         for (k = [0:count_height_subdivisions - 1])
            {
             //Bottom of current hull   
             coords0 = [[D,0],
               for (i = [0:count_petal_subdivisions])
                   [(A + (B-thickness_wall) * amplitude_petals * cos(270+(i*180/count_petal_subdivisions))) * (1 + amplitude_height_divisions * (cos(270 + ((k) * 90/count_height_subdivisions)))),
                    ((B-thickness_wall) * sin(270+(i*180/count_petal_subdivisions))) * (1 + amplitude_height_divisions * (cos(270 + ((k) * 90/count_height_subdivisions))))]];
             //Top of current hull
             coords1 = [[D,0],
               for (i = [0:count_petal_subdivisions])
                   [(A + (B-thickness_wall) * amplitude_petals * cos(270+(i*180/count_petal_subdivisions))) * (1 + amplitude_height_divisions * (cos(270 + ((k+1) * 90/count_height_subdivisions)))),
                    ((B-thickness_wall) * sin(270+(i*180/count_petal_subdivisions))) * (1 + amplitude_height_divisions * (cos(270 + ((k+1) * 90/count_height_subdivisions))))]];
             hull()
                {
                 translate([0,0, k*height_wall/count_height_subdivisions])
                 linear_extrude(height = 1)
                    polygon(coords0);
                 translate([0,0, (k+1)*height_wall/count_height_subdivisions])                
                 linear_extrude(height = 1)
                    polygon(coords1);
                }
            }
        }
    }
}
module center_cup_positive()
{
 rotate([0,0,180/count_sides_cup]) //REM this line to align cup differently
 //translate([0,0,thickness_wall])
 rotate_extrude($fn = count_sides_cup)
     {
     square([radius_cup + thickness_wall,height_wall + 1]);
     difference()
        {
         translate([radius_cup + thickness_wall,0,0])
            square([radius_bevel_cup_outer,radius_bevel_cup_outer]);
         translate([radius_cup + thickness_wall + radius_bevel_cup_outer,radius_bevel_cup_outer,0])
            circle(r = radius_bevel_cup_outer, $fn = count_bevel_divisions);
        }
    }
}
module center_cup_negative()
{
 rotate([0,0,180/count_sides_cup])   //REM this line to align cup differently 
 translate([0,0,thickness_wall])
 rotate_extrude($fn = count_sides_cup)
    {
     difference()
        {
         square([radius_cup,height_wall]);
         difference()
            {
             translate([radius_cup-radius_bevel_cup_inner,0,0])
                square([radius_bevel_cup_inner,radius_bevel_cup_inner]);
             translate([radius_cup-radius_bevel_cup_inner,radius_bevel_cup_inner,0])
                circle(r = radius_bevel_cup_inner, $fn = count_bevel_divisions);
            }
        }    
    }
}
function Random_Color() = [rands(0.5,1,1)[0], rands(0.5,1,1)[0], rands(0.5,1,1)[0]];

