/*
A toroidal polyhedra from McCooey's "Visual Polyhedra" site - http://dmccooey.com/polyhedra/ 

It is described as:
 A Regular Triangular Toroid with 18 faces (type A) (octahedral form)
   
--------------------
http://dmccooey.com/polyhedra/RegularTriangularToroid18A2.html


Vertices:
9  (9[6])
Faces:
18  (6 equilateral triangles + {6 * 2} obtuse triangles)
Edges:
27  (4 different lengths)
Symmetry:
3-fold Dihedral  (D3)
-------------


PCM April 2018
*/



translate([0,0,23.09])
scale(10)

rotate([0,(acos(-1/3))/2,0])
rotate([0,0,135])
polyhedron(tto_cords,Faces);




//Regular Triangular Toroid with 18 faces (type A) (octahedral form)



tto_cords = [
     [ 4,  0,  0],
     [-4,  0,  0],
     [ 0,  0,  4],
     [ 0,  0, -4],
     [ 0,  4,  0],
     [ 0, -4,  0],
     [ 1,  0,  1],
     [ 0,  1, -1],
     [-1, -1,  0],
    ];

Faces = [
[ 2, 0, 5 ],
[ 5, 0, 6 ],
[ 6, 0, 7 ],
[ 7, 0, 3 ],
[ 3, 0, 4 ],
[ 4, 0, 2 ],
[ 4, 2, 6 ],
[ 6, 2, 8 ],
[ 8, 2, 1 ],
[ 1, 2, 5 ],
[ 1, 5, 3 ],
[ 3, 5, 8 ],
[ 8, 5, 6 ],
[ 4, 6, 7 ],
[ 4, 7, 1 ],
[ 1, 7, 8 ],
[ 8, 7, 3 ],
[ 1, 3, 4 ],
   ];
