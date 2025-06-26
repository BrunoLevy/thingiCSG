/*

A toroidal polyhedra from McCooey's "Visual Polyhedra" site - http://dmccooey.com/polyhedra/ 

This example is a heptagonal iris

-----
http://dmccooey.com/polyhedra/HeptagonalIrisToroid.html

Vertices:
14  (14[5])
Faces:
21  (7 squares + 14 obtuse triangles)
Edges:
35  (21 short + 7 medium + 7 long)
Symmetry:
7-fold Dihedral  (D7)
-----
PCM April, 201
*/





translate([0,0,25.96])
scale(25)
rotate([90,0,0])
polyhedron (iris_cords,Faces);

/*
Heptagonal Iris Toroid

C0 = square-root of a root of the polynomial:  448*(x^3) - 224*(x^2) + 28*x - 1
C1 = square-root of a root of the polynomial:  448*(x^3) - 336*(x^2) + 56*x - 1
C2 = root of the polynomial:  8*(x^3) - 4*(x^2) - 4*x + 1
C3 = square-root of a root of the polynomial:  448*(x^3) - 560*(x^2) + 84*x - 1
C4 = root of the polynomial:  8*(x^3) - 8*(x^2) - 2*x + 1
C5 = square-root of a root of the polynomial:  7*(x^3) - 14*(x^2) + 7*x - 1
*/

pi = 180.;

C0 = 1 / (4 * cos(pi/14));
C1 = (1 + cos(pi/7)) * sqrt(7) / 7;
C2 = cos(pi/7);
C3 = 1/tan(pi/7) / 2;
C4 = 1 / (4 * sin(pi/14));
C5 = 1 / (2 * sin(pi/7));

   iris_cords = [
      [  C4, -C0,  0.5],
      [  C4, -C0, -0.5],
      [ -C4, -C0,  0.5],
      [ -C4, -C0, -0.5],
      [  C2,  C1,  0.5],
      [  C2,  C1, -0.5],
      [ -C2,  C1,  0.5],
      [ -C2,  C1, -0.5],
      [ 0.5, -C3,  0.5],
      [ 0.5, -C3, -0.5],
      [-0.5, -C3,  0.5],
      [-0.5, -C3, -0.5],
      [ 0.0,  C5,  0.5],
      [ 0.0,  C5, -0.5],
      ];

Faces = [
[  0,  4,  5,  1 ],
[  4, 12, 13,  5 ],
[ 12,  6,  7, 13 ],
[  6,  2,  3,  7 ],
[  2, 10, 11,  3 ],
[ 10,  8,  9, 11 ],
[  8,  0,  1,  9 ],
[ 11,  0,  3 ],
[  3,  0,  8 ],
[ 13,  2,  5 ],
[  5,  2,  6 ],
[  9,  4, 11 ],
[ 11,  4,  0 ],
[  5,  6,  1 ],
[  1,  6, 12 ],
[  3,  8,  7 ],
[  7,  8, 10 ],
[  7, 10, 13 ],
[ 13, 10,  2 ],
[  1, 12,  9 ],
[  9, 12,  4 ],
    ];

