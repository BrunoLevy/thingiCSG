/*
program to make an
icosahedral dice -
uses rounded icosahedron
                         PCM


radius   = radius of spheres and cylinders
           used to round icosahedron
sc       = overall scale factor
gr       is the golden ratio

thanks to DJM
*/



sc = 8;
radius = 3;
ft = sc + radius;
gr =  (1 + sqrt(5))/2;

include <ArchitectsDaughter.scad>

rotate([69.1,0,0])
difference()
{
 rounded_icosahedron(sc,radius);

// triangle 0 4 8

translate([ft*((1+gr)/3),ft*((1+gr)/3),ft*((1+gr)/3)])
rotate([-asin(1/sqrt(3)),45,0])
rotate([0,0,225])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("1",steps=2,center=true,height=20);

//triangle 0 5 4


translate([0,ft*((1+2*gr)/3),ft*gr/3])
rotate([(acos(sqrt(5)/3))/2,0,0])
rotate([0,90,90])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("2",steps=2,center=true,height=20);

// triangle 2 4 5


translate([0,ft*((1+2*gr)/3),-ft*gr/3])
rotate([-(acos(sqrt(5)/3))/2,0,0])
rotate([0,90,90])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("3",steps=2,center=true,height=20);

// triangle 2 9 4


translate([ft*((1+gr)/3),ft*((1+gr)/3),ft*-((1+gr)/3)])

rotate([asin(1/sqrt(3)),-45,0])
rotate([0,0,45])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("4",steps=2,center=true,height=20);


// triangle 4 9 8


translate([ft*((1+2*gr)/3),ft*gr/3,0])
rotate([0,90,(acos(sqrt(5)/3))/2])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("5",steps=2,center=true,height=20);

// triangle 10 1 7


translate([ft*-((1+gr)/3),ft*-((1+gr)/3),ft*((1+gr)/3)])
rotate([asin(1/sqrt(3)),-45,0])
  scale(0.15)
  translate(v=[5,-25,-10])
  ArchitectsDaughter("^6^",steps=2,center=true,height=20);

// triangle 1 6 7


translate([0,ft*-((1+2*gr)/3),ft*gr/3])
rotate([-(acos(sqrt(5)/3))/2,0,0])
rotate([0,90,90])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("7",steps=2,center=true,height=20);

// triangle 3 7 6


translate([0,ft*-((1+2*gr)/3),-ft*gr/3])
rotate([(acos(sqrt(5)/3))/2,0,0])
rotate([0,90,90])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("8",steps=2,center=true,height=20);

//triangle 3 11 7


translate([ft*-((1+gr)/3),ft*-((1+gr)/3),ft*-((1+gr)/3)])
 rotate([-asin(1/sqrt(3)),45,0])
rotate([0,0,225])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("^9^",steps=2,center=true,height=20);


// triangle 7 11 10


translate([ft*-((1+2*gr)/3),ft*-gr/3,0])
rotate([0,90,(acos(sqrt(5)/3))/2])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("10",steps=2,center=true,height=20);

//triangle 5 10 11


translate([ft*-((1+2*gr)/3),ft*gr/3,0])
rotate([0,90,-(acos(sqrt(5)/3))/2])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("1 1",steps=2,center=true,height=20);

// triangle 2 11 3


translate([ft*-gr/3,0,ft*-((1+2*gr)/3)])
rotate([0,(acos(sqrt(5)/3))/2,0])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("12",steps=2,center=true,height=20);

// triangle 2 3 9


translate([ft*gr/3,0,ft*-((1+2*gr)/3)])
rotate([0,-(acos(sqrt(5)/3))/2,0])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("13",steps=2,center=true,height=20);

// triangle 3 6 9


translate([ft*((1+gr)/3),ft*-((1+gr)/3),ft*-((1+gr)/3)])
rotate([-asin(1/sqrt(3)),-45,0])
rotate([0,0,135])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("14",steps=2,center=true,height=20);


// triangle 6 8 9


translate([ft*((1+2*gr)/3),ft*-gr/3,0])
rotate([0,90,-(acos(sqrt(5)/3))/2])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("15",steps=2,center=true,height=20);

// triangle 1 8 6

translate([ft*((1+gr)/3),ft*-((1+gr)/3),ft*((1+gr)/3)])
rotate([asin(1/sqrt(3)),45,0])
rotate([0,0,315])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("16",steps=2,center=true,height=20);

// triangle 0 8 1


translate([ft*gr/3,0,ft*((1+2*gr)/3)])
rotate([0,(acos(sqrt(5)/3))/2,0])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("17",steps=2,center=true,height=20);

// triangle 0 1 10


translate([ft*-gr/3,0,ft*((1+2*gr)/3)])
rotate([0,-(acos(sqrt(5)/3))/2,0])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("18",steps=2,center=true,height=20);

// triangle 0 10 5

translate([ft*-((1+gr)/3),ft*((1+gr)/3),ft*((1+gr)/3)])
rotate([-asin(1/sqrt(3)),-45,0])
rotate([0,0,135])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("19",steps=2,center=true,height=20);

// triangle 2 5 11

translate([ft*-((1+gr)/3),ft*((1+gr)/3),ft*-((1+gr)/3)])
rotate([asin(1/sqrt(3)),45,0])
rotate([0,0,315])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
  ArchitectsDaughter("20",steps=2,center=true,height=20);



}





module rounded_icosahedron(sc,radius)
{


/*
from Wilipedia:

The following Cartesian coordinates define the vertices of an icosahedron
with edge-length 2, centered at the origin:[1]

(0, ±1, ±gr)
(±1, ±gr, 0)
(±gr, 0, ±1)

where gr = (1 + sqrt(5)) / 2 is the golden ratio (also written tau).
Note that these vertices form five sets of three concentric,
 mutually orthogonal golden rectangles, whose edges form Borromean rings.

sc =        over all scale
radius =  radius of spheres and cylinders used to round
*/

gr =  (1 + sqrt(5))/2;
norm = 1/sqrt(((1+gr)*(1+gr))/3);
ft = radius*norm;


union()
{

atom(radius,0, sc, sc*gr);                        //   0
atom(radius,0, -sc,sc*gr);                       //    1
atom(radius,0, sc, -sc*gr);                       //   2
atom(radius,0, -sc, -sc*gr);                     //   3
atom(radius, sc, sc*gr, 0);                       //   4
atom(radius,-sc, sc*gr, 0);                       //   5
atom(radius,sc, -sc*gr, 0);                      //    6
atom(radius,-sc,-sc*gr,0);                       //   7
atom(radius,sc*gr, 0, sc);                        //   8
atom(radius,sc*gr, 0, -sc);                       //   9
atom(radius,-sc*gr, 0, sc);                      //   10
atom(radius,-sc*gr, 0, -sc);                     //   11



bond(0, sc, sc*gr, sc, sc*gr, 0,radius);       // 0  4
bond(0, sc, sc*gr, sc*gr, 0, sc,radius);       // 0  8
bond(sc, sc*gr, 0, sc*gr, 0, sc,radius);       // 4  8
bond(0, sc, sc*gr,,-sc, sc*gr, 0,radius);      // 0  8
bond ( sc, sc*gr, 0,-sc,  sc*gr, 0,radius);    // 4  5
bond(0, sc, -sc*gr,sc, sc*gr, 0,radius);       // 2  4
bond(0, sc, -sc*gr,-sc, sc*gr,  0,radius);     // 2  5
bond (0, sc, -sc*gr,sc*gr, 0, -sc,radius);      // 2  9
bond ( sc, sc*gr, 0,sc*gr, 0, -sc,radius);      // 4  9
bond(,sc*gr, 0, sc,sc*gr, 0, -sc,radius);        // 8  9
bond(-sc*gr, 0, sc,0, -sc,sc*gr,radius);        // 10  1
bond(-sc*gr,0,sc,-sc,-sc*gr,0,radius);          // 10  7
bond(,0, -sc,sc*gr,-sc,-sc*gr,0,radius);        //  1  7
bond(0, -sc,sc*gr,sc, -sc*gr, 0,radius);         // 1  6
bond(sc, -sc*gr, 0,-sc,-sc*gr,0,radius);         // 6  7
bond(0, -sc, -sc*gr,-sc,-sc*gr,0,radius);        // 3  7
bond(0, -sc, -sc*gr,sc, -sc*gr, 0,radius);       // 3  6
bond(0, -sc, -sc*gr,-sc*gr, 0, -sc,radius);      // 3  11
bond(-sc,-sc*gr,0,-sc*gr, 0, -sc,radius);        // 7  11
bond(-sc*gr, 0, sc,-sc*gr, 0, -sc,radius);       // 10  11
bond(-sc, sc*gr, 0,-sc*gr, 0, sc,radius);        // 5  10
bond(-sc, sc*gr, 0,-sc*gr, 0, -sc,radius);       // 5  11
bond(0, sc, -sc*gr,0, -sc, -sc*gr,radius);        // 2  3
bond(0, sc, -sc*gr,-sc*gr, 0, -sc,radius);        // 2  11
bond(0, -sc, -sc*gr,sc*gr, 0, -sc,radius);        // 3  9
bond (sc, -sc*gr, 0,sc*gr, 0, -sc,radius);        // 6  9
bond(sc, -sc*gr, 0,sc*gr, 0, sc,radius);          // 6  8
bond(0, -sc,sc*gr,sc*gr, 0, sc,radius);           // 1  8
bond (0, sc, sc*gr,0, -sc,sc*gr,radius);          // 0  1
bond (0, sc, sc*gr,-sc*gr, 0, sc,radius);         // 0  10


 for (i = [ [ft*((1+gr)/3),ft*((1+gr)/3),ft*((1+gr)/3)],         // 0 4 8
          [0,ft*((1+2*gr)/3),ft*gr/3],                           // 0 5 4
          [0,ft*((1+2*gr)/3),-ft*gr/3],                         // 2 4 5
          [ft*((1+gr)/3),ft*((1+gr)/3),ft*-((1+gr)/3)],           // 2 9 4
          [ft*((1+2*gr)/3),ft*gr/3,0],                           // 4 9 8
          [ft*-((1+gr)/3),ft*-((1+gr)/3),ft*((1+gr)/3)],          // 10 1 7
          [0,ft*-((1+2*gr)/3),ft*gr/3],                          // 1 6 7
          [0,ft*-((1+2*gr)/3),-ft*gr/3],                        // 3 7 6
           [ft*-((1+gr)/3),ft*-((1+gr)/3),ft*-((1+gr)/3)],       // 3 11 7
          [ft*-((1+2*gr)/3),ft*-gr/3,0],                        // 7 11 10
           [ft*-((1+2*gr)/3),ft*gr/3,0],                        // 5 10 11
            [ft*-gr/3,0,ft*-((1+2*gr)/3)],                      // 2 11 3
           [ft*gr/3,0,ft*-((1+2*gr)/3)],                         // 2 3 9
            [ft*((1+gr)/3),ft*-((1+gr)/3),ft*-((1+gr)/3)],         // 3 6 9
           [ft*((1+2*gr)/3),ft*-gr/3,0],                         // 6 8 9
           [ft*((1+gr)/3),ft*-((1+gr)/3),ft*((1+gr)/3)],         // 1 8 6
           [ft*gr/3,0,ft*((1+2*gr)/3)],                           // 0 8 1
           [ft*-gr/3,0,ft*((1+2*gr)/3)],                          // 0 1 10
           [ft*-((1+gr)/3),ft*((1+gr)/3),ft*((1+gr)/3)],          // 0 10 5
           [ft*-((1+gr)/3),ft*((1+gr)/3),ft*-((1+gr)/3)],         // 2 5 11

                                      ])

{
          translate(i)
          scale (sc)
          icosahedron();
 }

}





module icosahedron()
{


polyhedron
       (points = [
                 [  0, 1, gr],[0, -1, gr],
                 [  0, 1, -gr], [0, -1, -gr],
                 [  1, gr, 0], [-1, gr, 0],
                 [ 1, -gr, 0],[-1,-gr,0],
                 [gr, 0, 1], [gr, 0, -1],
                  [-gr, 0, 1], [-gr, 0, -1],
                ],
                  triangles = [
                 [0,4,8],[0,5,4],
                 [2,4,5],[2,9,4],
                 [4,9,8],[10,1,7],
                 [1,6,7],[3,7,6],
                 [3,11,7],[7,11,10],
                 [5,10,11],[2,11,3],
                 [2,3,9],[3,6,9],
                 [6,8,9],[1,8,6],
                 [0,8,1],[0,1,10],
                 [0,10,5],[2,5,11],
                               ]
                               );

}


module atom(rx,x0,y0,z0)
{
  translate(v=[x0,y0,z0])
  sphere(r=rx,$fn=32);
}


module bond(x2,y2,z2,x1,y1,z1,radius)

{
tx = (x2 + x1)/2;
ty = (y2 + y1)/2;
tz = (z2 + z1)/2;
ax = x2 - x1 ;
ay = y2 - y1;
az = z2 - z1;

translate(v=[tx,ty,tz])
rotate(a = [-acos(az/sqrt(ax*ax+ay*ay+az*az)), 0, -atan2(ax, ay)])
cylinder(r=radius,h=sqrt(ax*ax+ay*ay+az*az),center=true,$fn=32);
}

}
