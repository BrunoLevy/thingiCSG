/*

A toroidal polyhedra from McCooey's "Visual Polyhedra" site - http://dmccooey.com/polyhedra/ 

It is described as: Regular Map {4,6}_10 (Schulte & Wills)

------------------
http://dmccooey.com/polyhedra/Regular_4_6_10.html



Vertices:
20  (4[6] + 4[6] + 12[6])
Faces:
30  ({12 + 6} rectangles + 12 isosceles trapezoids)
Edges:
60  (5 different lengths)
Symmetry:
Full Tetrahedral  (Td)
Dual Toroid:
Regular Map {6,4}10



References:
[1]
Egon Schulte and Jorg M. Wills, On Coxeter's regular skew
polyhedra, Discrete Mathematics 60 (1986), 253-262.
------------------


PCM April 2018
*/


difference()
{


translate([0,0,25.5])
scale(3)

// cut 1.5 mm off bottom - reduce raft to model
// spacing to 0.25 mm
  //rotate([acos(1/sqrt(3)),180,0])
  rotate([0,0,135])

polyhedron(R_4_6_10_cords,R_4_6_10_faces);
translate([0,0,-50])
cube([100,100,100],center=true);
}


//Regular Map {4,6}_10 (Schulte & Wills)

   R_4_6_10_cords = [
      [ 9.0, -9.0,  9.0],
      [ 9.0,  9.0, -9.0],
      [-9.0,  9.0,  9.0],
      [-9.0, -9.0, -9.0],
      [ 6.0, -4.0,  6.0],
      [ 6.0,  4.0, -6.0],
      [-6.0,  4.0,  6.0],
      [-6.0, -4.0, -6.0],
      [ 6.0, -6.0,  4.0],
      [ 6.0,  6.0, -4.0],
      [-6.0,  6.0,  4.0],
      [-6.0, -6.0, -4.0],
      [ 4.0, -6.0,  6.0],
      [ 4.0,  6.0, -6.0],
      [-4.0,  6.0,  6.0],
      [-4.0, -6.0, -6.0],
      [ 1.0,  1.0,  1.0],
      [ 1.0, -1.0, -1.0],
      [-1.0, -1.0,  1.0],
      [-1.0,  1.0, -1.0],
    ];


   R_4_6_10_faces = [
     [  0,  2, 14,  4],
     [  1,  3, 15,  5],
     [  2,  0, 12,  6],
     [  3,  1, 13,  7],
     [  0,  1,  5,  8],
     [  1,  0,  4,  9],
     [  2,  3,  7, 10],
     [  3,  2,  6, 11],
     [  0,  3, 11, 12],
     [  1,  2, 10, 13],
     [  2,  1,  9, 14],
     [  3,  0,  8, 15],
     [ 16, 17,  8,  4],
     [ 17, 16,  9,  5],
     [ 18, 19, 10,  6],
     [ 19, 18, 11,  7],
     [ 17, 18, 12,  8],
     [ 16, 19, 13,  9],
     [ 19, 16, 14, 10],
     [ 18, 17, 15, 11],
     [ 18, 16,  4, 12],
     [ 19, 17,  5, 13],
     [ 16, 18,  6, 14],
     [ 17, 19,  7, 15],
     [ 14,  6, 12,  4],
     [ 15,  7, 13,  5],
     [ 12, 11, 15,  8],
     [ 13, 10, 14,  9],
     [  8,  5,  9,  4],
     [ 10,  7, 11,  6],
      ];
