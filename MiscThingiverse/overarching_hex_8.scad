/*
A toroidal polyhedra from McCooey's "Visual Polyhedra" site - http://dmccooey.com/polyhedra/ 

This example is called a Hexagonal Toroid with 8 overarching faces 


----------------
http://dmccooey.com/polyhedra/OverarchingHexagonalToroid8.html

Vertices:
16  (4[3] + 4[3] + 4[3] + 4[3])
Faces:
8  ({4 * 2} mirror-symmetric nonconvex hexagons)
Edges:
24  (4 different lengths)
Symmetry:
2-fold Antiprismatic  (D2v)

References:
[1]
J. Schw�rbel, Die kombinatorisch regul�ren Tori.
Thesis, Siegen University, 1988.

[2]
Lajos Szilassi, personal communication
-----------------


PCM April 2018
*/
  translate([0,0,16.17])
   scale(7)
  rotate([acos(1/sqrt(3)),180,0])
  rotate([0,0,45])
  polyhedron (hex_8_cords,Faces);


//Hexagonal Toroid with 8 overarching faces



 hex_8_cords = [
      [ 4, -4,  4],
      [ 4,  4, -4],
      [-4,  4,  4],
      [-4, -4, -4],
      [ 3, -3,  4],
      [ 3,  3, -4],
      [-3,  3,  4],
      [-3, -3, -4],
      [ 3, -3,  2],
      [ 3,  3, -2],
      [-3,  3,  2],
      [-3, -3, -2],
      [ 2, -2,  2],
      [ 2,  2, -2],
      [-2,  2,  2],
      [-2, -2, -2],
   ];


Faces = [
     [  4,  9,  6,  2,  1,  0],
     [  3,  2,  6, 11,  4,  0],
     [  1,  5,  8,  7,  3,  0],
     [ 14, 13, 12,  8,  5, 10],
     [  7,  8, 12, 15, 14, 10],
     [  5,  1,  2,  3,  7, 10],
     [ 13, 14, 15, 11,  6,  9],
     [  4, 11, 15, 12, 13,  9],
    ];
