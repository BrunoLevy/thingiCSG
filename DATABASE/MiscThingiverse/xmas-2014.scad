// Xmas tree ornament
// by Mike Koss (c) 2014

PART = "ball"; // [tree, ball]

HEIGHT=75;
RADIUS=30;
THICKNESS=2;
E = 0.1;

$fa=3;
$fs=1;


// A simple parallelepiped connected a width-square
// at point from[x, y, z] to point to[x, y, z].
module piped(from, to, width=1) {
  translate(from)
  multmatrix(m=[
    [1, 0, to[0] - from[0], 0],
    [0, 1, to[1] - from[1], 0],
    [0, 0, to[2] - from[2], 0],
    [0, 0, 0, 1],
  ])
    translate([0, 0, 0.5])
      cube([width, width, 1], center=true);
}

function unit2(dir) = [cos(dir), sin(dir)];
function unit3(dir, elev) = [cos(elev) * cos(dir), cos(elev) * sin(dir), sin(elev)];
function combine(f, x0, x1) = x0 * (1 - f) + x1 * f;
function dist(pos) = sqrt(pos[0]*pos[0] + pos[1]*pos[1]);

// Draw a spiral starting with max radius at z=0 and
// spirals around the z axis turns times, reaching the
// intersection with z-axis at height units.
module spiralCone(height, radius, turns=1, sides=32, width=THICKNESS) {
  for (i = [0 : turns * sides - 1]) {
    assign(
      p1 = radius * (1 - i / (turns * sides)) * unit2(360 * i / sides),
      p2 = radius * (1 - (i + 1) / (turns * sides)) * unit2(360 * (i + 1) / sides),
      z1 = height * i / (turns * sides),
      z2 = height * (i + 1) / (turns * sides)
    ) {
        piped([p1[0], p1[1], z1], [p2[0], p2[1], z2], width=width);
     }
   }
}

function spiralPoint(radius, i, turns=1, sides=32) =
    radius * unit3(360 * i / sides, 180 * i / (turns * sides) - 90);

// Draw a spiral along the surface of a sphere of radius.
// Spirals around the z axis turns times, reaching the
// intersection with z-axis at height units.
module spiralSphere(radius, start=0, finish=1, turns=1, sides=32, width=THICKNESS) {
  begin = ceil(start * turns * sides);
  end = ceil(finish * turns * sides);
  for (i = [begin : end - 1]) {
    piped(spiralPoint(radius, i,     turns, sides),
          spiralPoint(radius, i + 1, turns, sides),
          width=width);
   }
}

// Repeats a child element steps times, rotating
// 360/steps degrees about the z axis each time.
module multiRotate(steps=8) {
  for (i = [0: steps - 1]) {
    rotate(a=360 * i / steps, v=[0, 0, 1])
      child();
  }
}

// Ring with OD, r, around origin (at z=0)
module ring(r, thickness=THICKNESS, height=THICKNESS) {
  difference() {
    cylinder(h=height, r=r, center=true);
    cylinder(h=height + 2 * E, r=r - thickness, center=true);
  }
}

// Both clockwise and counterclockwise  multiRotate.
module rotateRevert(steps=8) {
  multiRotate(steps)
    child();
  mirror([0, 1, 0])
    multiRotate(steps)
      child();
}

module hanger() {
  translate([0, 0, HEIGHT + 4])
    rotate(a=90, v=[1, 0, 0])
      ring(5);
}

module treeOrnament() {
  rotateRevert()
    spiralCone(HEIGHT, RADIUS, width=THICKNESS);

  translate([0, 0, THICKNESS/2])
    ring(RADIUS+THICKNESS/2);

  hanger();
}

module sphereOrnament() {
  start = 0.2;
  finish = 0.8;
  turns = 1;
  sides = 32;
  radius = HEIGHT / 2;
  bottom = spiralPoint(radius, ceil(start * turns * sides), turns, sides);
  top = spiralPoint(radius, ceil(finish * turns * sides), turns, sides);

  translate([0, 0, -bottom[2]])
    rotateRevert(12)
      spiralSphere(radius, start=start, finish=finish, turns=turns, sides=sides, width=THICKNESS);

  translate([0, 0, top[2] - bottom[2]])
    union () {
      ring(dist(top) + THICKNESS/2);
      rotateRevert(6)
        spiralCone(HEIGHT - (top[2] - bottom[2]), dist(top), turns=0.25, width=THICKNESS);
    }

  translate([0, 0, THICKNESS/2])
    ring(dist(bottom) + THICKNESS/2);

  translate([0, 0, HEIGHT + 4])
    rotate(a=90, v=[1, 0, 0])
      ring(5);
}

if (PART == "tree") treeOrnament();
if (PART == "ball") sphereOrnament(RADIUS, width=2);
