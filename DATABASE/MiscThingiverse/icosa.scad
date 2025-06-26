/*
 * icosahedron fractal
 *
 * (c) 2015. 10. 30 by SASAKI, Taroh
 */


fdepth = 2;
sfactor = .385;
//sfactor = .5;
half = 0;
// half = 1 to make (2) upper half only (and glue
// physically afterwards), for fdepth >= 2.

// angle of slant edge from ceiling:
//   see pentagon from above:
//   let r = projection to (x, y)-plane of the edge:
//     r = (1 / 2) / cos(54 deg)
//   see roof from y axis:
//   slant edge (length 1) by theta degree is projected as
//   length r:
//      theta = acos(r) ~= 31.7174744 degree
fang = acos((1 / 2) / cos(54));

// note: plane angle is xx.xxxxx degree;
//   rotate (around y axis) afterwards.

// radius of icosahedron with edge_length == 1:
//   rectangle by opposite parrarell edge is 
//   (1 : (1 + sqrt(5)) / 2)
// (radius / edge_length) ratio of icosahedron
//   2 radiusr = sqrt(1 ^2 + ((1 + sqrt(5)) / 2) ^2)
//   radiusr ~= 0.95105651629
radiusr = sqrt(1 + pow((1 + sqrt(5)) / 2, 2)) / 2;

// here we need radius == 1 icosahedron. 
edgelen = 1 / radiusr;

vert0 = [0, 0, 1];  // coods of top vertex
vlhz = 1 - edgelen * sin(fang);
       // height (z) of level 2/3 vertex
vlhang = acos(vlhz / 1);
         // angle of level 2/3 vertex from z axis
vlhr = edgelen * cos(fang);
       // radius (around z axis) of level 2/3 vertex
vert11 = [0, 0, -1];    // coords of bottom vertex
 
icosa(0);


module
icosa(depth)
{
    if (depth < fdepth) {
        translate([0, 0, 1 - sfactor]) {
            scale(sfactor) {
                icosa(depth + 1);
            }
        }
      if (half == 0) {
        rotate([0, 180, 0]) {
        translate([0, 0, 1 - sfactor]) {
            scale(sfactor) {
                icosa(depth + 1);
            }
        }
      }
    }

    }
    for (i = [0:4]) {
        if (depth < fdepth) {
            rotate([0, 0, 72 * i]) {
              rotate([0, vlhang, 0]) {
                translate([0, 0, 1 - sfactor]) {
                  rotate([0, 0, 180]) {
                    scale(sfactor) {
                        icosa(depth + 1);
                    }
                  }
                }
              }
            }
    if (half == 0 ||
        (half == 1 && 1 <= depth)) {
            rotate([0, 180, 0]) {
            rotate([0, 0, 72 * i]) {
              rotate([0, vlhang, 0]) {
                translate([0, 0, 1 - sfactor]) {
                  rotate([0, 0, 180]) {
                    scale(sfactor) {
                        icosa(depth + 1);
                    }
                  }
                }
              }
            }
            }
    }
            } else {
            verth1 = [vlhr * cos(72 * i), 
                      vlhr * sin(72 * i), vlhz];
            verth2 = [vlhr * cos(72 * ((i + 1) % 5)),
                      vlhr * sin(72 * ((i + 1) % 5)), vlhz];
            vertl1 = [vlhr * cos(72 * (i + .5)),
                      vlhr * sin(72 * (i + .5)), -vlhz];
            vertl2 = [vlhr * cos(72 * ((i + 1.5) % 5)),
                      vlhr * sin(72 * ((i + 1.5) % 5)),
                      -vlhz];
            polyhedron(
                points = [vert0, verth1, verth2],
                faces = [[0, 1, 2]]);
            polyhedron(
                points = [verth1, verth2, vertl1],
                faces = [[0, 2, 1]]);
            polyhedron(
                points = [verth2, vertl1, vertl2],
                faces = [[0, 1, 2]]);
            polyhedron(
                points = [vert11, vertl1, vertl2],
                faces = [[0, 2, 1]]);
        }
    }
}