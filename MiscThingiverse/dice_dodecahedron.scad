/*
makes a dodecahedral dice
from a rounded dodecahedron
                         PCM

 radius = radius of spheres and cylinders
          used to round
 sc     = overall scale factor
*/


 radius = 4;
 sc     = 6;

lsc = sc +radius;
gr =  (1 + sqrt(5))/2;
rgr = 1/gr;

include <ArchitectsDaughter.scad>



 rotate([(acos(-1/sqrt(5)))/2,0,0])
difference()
{


rounded_dodeca(sc,radius);

translate( [lsc*(2+2*gr+rgr)/5,lsc*(2+gr)/5,0])           // 0 16 17 1 12
  rotate([90,0,-(acos(-1/sqrt(5)))/2])
   scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
 ArchitectsDaughter("1",steps=2,center=true,height=20);


  translate( [lsc*(2+gr)/5,0,lsc*(2+2*gr+rgr)/5])           // 0 8 10 2 16
   rotate([0,90-(acos(-1/sqrt(5)))/2,0])
   scale(0.15)
  translate(v=[-5,-15,-10])
 ArchitectsDaughter("2",steps=2,center=true,height=20);


  translate( [0,lsc*(2+2*gr+rgr)/5,lsc*(2+gr)/5])           // 0 12 14 4 8
  rotate([-(acos(-1/sqrt(5)))/2,0,0])
  scale(0.15)
  translate(v=[-5,-15,-10])
 ArchitectsDaughter("3",steps=2,center=true,height=20);


  translate( [0,lsc*(2+2*gr+rgr)/5,lsc*-(2+gr)/5])          // 1 9 5 14 12
  rotate([(acos(-1/sqrt(5)))/2,0,0])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
 ArchitectsDaughter("4",steps=2,center=true,height=20);

  translate( [lsc*(2+gr)/5,0,lsc*-(2+2*gr+rgr)/5])          // 1 17 3 11 9
  rotate([0,90+(acos(-1/sqrt(5)))/2,0])
   scale(0.15)
  translate(v=[-5,-15,-10])
 ArchitectsDaughter("5",steps=2,center=true,height=20);

  translate([lsc*(2+2*gr+rgr)/5,lsc*-(2+gr)/5,0])           // 2 16 17 3 13
   rotate([90,0,(acos(-1/sqrt(5)))/2])
   scale(0.15)
  translate(v=[5,-15,-10])
 ArchitectsDaughter("^6^",steps=2,center=true,height=20);

 translate( [0,lsc*-(2+2*gr+rgr)/5,lsc*(2+gr)/5])           // 2 10 6 15 13
  rotate([(acos(-1/sqrt(5)))/2,0,0])
   scale(0.15)
  translate(v=[-5,-15,-10])
 ArchitectsDaughter("7",steps=2,center=true,height=20);

  translate([0,lsc*-(2+2*gr+rgr)/5,lsc*-(2+gr)/5])         // 3 13 15 7 11
  rotate([-(acos(-1/sqrt(5)))/2,0,0])
 scale(0.15)
  translate(v=[-5,-15,10])
 rotate([0,180,0])
 ArchitectsDaughter("8",steps=2,center=true,height=20);

  translate([lsc*-(2+gr)/5,0,lsc*(2+2*gr+rgr)/5])           // 4 18 6 10 8
  rotate([0,90+(acos(-1/sqrt(5)))/2,0])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
 ArchitectsDaughter("^9^",steps=2,center=true,height=20);

  translate([lsc*-(2+2*gr+rgr)/5,lsc*(2+gr)/5,0])           // 4 14 5 19 18
   rotate([90,0,(acos(-1/sqrt(5)))/2])
  scale(0.15)
  translate(v=[-5,-15,10])
rotate([0,180,0])
 ArchitectsDaughter("10",steps=2,center=true,height=20);

  translate([lsc*-(2+gr)/5,0,lsc*-(2+2*gr+rgr)/5])          // 5 9 11 7 19
   rotate([0,90-(acos(-1/sqrt(5)))/2,0])
  scale(0.15)
  translate(v=[-5,-15,10])
 rotate([0,180,0])
 ArchitectsDaughter("1 1",steps=2,center=true,height=20);

  translate([lsc*-(2+2*gr+rgr)/5,lsc*-(2+gr)/5,0])         // 6 18 19 7 15
   rotate([90,0,-(acos(-1/sqrt(5)))/2])
   scale(0.15)
  translate(v=[-5,-15,-10])
 ArchitectsDaughter("12",steps=2,center=true,height=20);






}










 module rounded_dodeca(sc,radius)
{
/*
from Wikipedia

The following Cartesian coordinates define the vertices
 of a dodecahedron centered at the origin and suitably scaled and oriented:[1]

(±1, ±1, ±1)
(0, ±1/gr, ±gr)
(±1/gr, ±gr, 0)
(±gr, 0, ±1/gr)
where gr = (1 + sqrt(5)) / 2 is the golden ratio (also written tau). The edge length
 is 2/gr = sqrt(5) - 1. The containing sphere has a radius of sqrt(3)

sc = overall scale
radius = radius of spheres and cylinders used to round

*/




gr =  (1 + sqrt(5))/2;
rgr = 1/gr;
norm = 1/sqrt((2+2*gr+rgr)*(2+2*gr+rgr)/25 + (2 + gr)*(2+gr)/25);
ft = radius*norm;

union()
{


                   atom(radius,   sc,   sc,   sc);
                   atom(radius,   sc,   sc,  -sc);
                   atom(radius,   sc,  -sc,   sc);
                   atom(radius,   sc,  -sc,  -sc);
                   atom(radius,  -sc,   sc,   sc);
                   atom(radius,  -sc,   sc,  -sc);
                   atom(radius,  -sc,  -sc,   sc);
                   atom(radius,  -sc,  -sc,  -sc);
                   atom(radius,   0.0,   rgr*sc    ,   gr*sc  );
                   atom(radius,   0.0,   rgr*sc    ,  -gr*sc  );
                   atom(radius,   0.0,  -rgr*sc    ,   gr*sc  );
                   atom(radius,   0.0,  -rgr*sc    ,  -gr*sc  );
                   atom(radius,   rgr*sc    ,   gr*sc  ,   0.0);
                   atom(radius,   rgr*sc    ,  -gr*sc  ,   0.0);
                   atom(radius,  -rgr*sc    ,   gr*sc  ,   0.0);
                   atom(radius,  -rgr*sc    ,  -gr*sc  ,   0.0);
                   atom(radius,   gr*sc  ,   0.0,   rgr*sc    );
                   atom(radius,   gr*sc  ,   0.0,  -rgr*sc    );
                   atom(radius,  -gr*sc  ,   0.0,   rgr*sc    );
                   atom(radius,  -gr*sc  ,   0.0,  -rgr*sc    );





bond(  sc,  sc,  sc,  0.0,  rgr*sc,  gr*sc,radius);  //  1 -   9
bond(  sc,  sc,  sc,  rgr*sc,  gr*sc,  0.0,radius);  //  1 -  13
bond(  sc,  sc,  sc,  gr*sc,  0.0,  rgr*sc,radius);  //  1 -  17
bond(  sc,  sc, -sc,  0.0,  rgr*sc, -gr*sc,radius);  //  2 -  10
bond(  sc,  sc, -sc,  rgr*sc,  gr*sc,  0.0,radius);  //  2 -  13
bond(  sc,  sc, -sc,  gr*sc,  0.0, -rgr*sc,radius);  //  2 -  18
bond(  sc, -sc,  sc,  0.0, -rgr*sc,  gr*sc,radius);  //  3 -  11
bond(  sc, -sc,  sc,  rgr*sc, -gr*sc,  0.0,radius);  //  3 -  14
bond(  sc, -sc,  sc,  gr*sc,  0.0,  rgr*sc,radius);  //  3 -  17
bond(  sc, -sc, -sc,  0.0, -rgr*sc, -gr*sc,radius);  //  4 -  12
bond(  sc, -sc, -sc,  rgr*sc, -gr*sc,  0.0,radius);  //  4 -  14
bond(  sc, -sc, -sc,  gr*sc,  0.0, -rgr*sc,radius);  //  4 -  18
bond( -sc,  sc,  sc,  0.0,  rgr*sc,  gr*sc,radius);  //  5 -   9
bond( -sc,  sc,  sc, -rgr*sc,  gr*sc,  0.0,radius);  //  5 -  15
bond( -sc,  sc,  sc, -gr*sc,  0.0,  rgr*sc,radius);  //  5 -  19
bond( -sc,  sc, -sc,  0.0,  rgr*sc, -gr*sc,radius);  //  6 -  10
bond( -sc,  sc, -sc, -rgr*sc,  gr*sc,  0.0,radius);  //  6 -  15
bond( -sc,  sc, -sc, -gr*sc,  0.0, -rgr*sc,radius);  //  6 -  20
bond( -sc, -sc,  sc,  0.0, -rgr*sc,  gr*sc,radius);  //  7 -  11
bond( -sc, -sc,  sc, -rgr*sc, -gr*sc,  0.0,radius);  //  7 -  16
bond( -sc, -sc,  sc, -gr*sc,  0.0,  rgr*sc,radius);  //  7 -  19
bond( -sc, -sc, -sc,  0.0, -rgr*sc, -gr*sc,radius);  //  8 -  12
bond( -sc, -sc, -sc, -rgr*sc, -gr*sc,  0.0,radius);  //  8 -  16
bond( -sc, -sc, -sc, -gr*sc,  0.0, -rgr*sc,radius);  //  8 -  20
bond(  0.0,  rgr*sc,  gr*sc,  0.0, -rgr*sc,  gr*sc,radius);  //  9 -  11
bond(  0.0,  rgr*sc, -gr*sc,  0.0, -rgr*sc, -gr*sc,radius);  // 10 -  12
bond(  rgr*sc,  gr*sc,  0.0, -rgr*sc,  gr*sc,  0.0,radius);  // 13 -  15
bond(  rgr*sc, -gr*sc,  0.0, -rgr*sc, -gr*sc,  0.0,radius);  // 14 -  16
bond(  gr*sc,  0.0,  rgr*sc,  gr*sc,  0.0, -rgr*sc,radius);  // 17 -  18
bond( -gr*sc,  0.0,  rgr*sc, -gr*sc,  0.0, -rgr*sc,radius);  // 19 -  20


for (i = [ [ft*(2+2*gr+rgr)/5,ft*(2+gr)/5,0],           // 0 16 17 1 12
           [ft*(2+gr)/5,0,ft*(2+2*gr+rgr)/5],           // 0 8 10 2 16
           [0,ft*(2+2*gr+rgr)/5,ft*(2+gr)/5],           // 0 12 14 4 8
           [0,ft*(2+2*gr+rgr)/5,ft*-(2+gr)/5],          // 1 9 5 14 12
           [ft*(2+gr)/5,0,ft*-(2+2*gr+rgr)/5],          // 1 17 3 11 9
           [ft*(2+2*gr+rgr)/5,ft*-(2+gr)/5,0],           // 2 16 17 3 13
           [0,ft*-(2+2*gr+rgr)/5,ft*(2+gr)/5],           // 2 10 6 15 13
           [0,ft*-(2+2*gr+rgr)/5,ft*-(2+gr)/5],          // 3 13 15 7 11
           [ft*-(2+gr)/5,0,ft*(2+2*gr+rgr)/5],           // 4 18 6 10 8
           [ft*-(2+2*gr+rgr)/5,ft*(2+gr)/5,0],           // 4 14 5 19 18
           [ft*-(2+gr)/5,0,ft*-(2+2*gr+rgr)/5],          // 5 9 11 7 19
           [ft*-(2+2*gr+rgr)/5,ft*-(2+gr)/5,0],          // 6 18 19 7 15

                                      ])

{
          translate(i)
          scale (sc)
          dodecahedron();
 }




}




module dodecahedron()
{

/*



*/
polyhedron
       (points = [
                 [   1.00000,   1.00000,   1.00000],
                 [   1.00000,   1.00000,  -1.00000],
                 [   1.00000,  -1.00000,   1.00000],
                 [   1.00000,  -1.00000,  -1.00000],
                 [  -1.00000,   1.00000,   1.00000],
                 [  -1.00000,   1.00000,  -1.00000],
                 [  -1.00000,  -1.00000,   1.00000],
                 [  -1.00000,  -1.00000,  -1.00000],
                 [   0.00000,   rgr    ,   gr     ],
                 [   0.00000,   rgr    ,  -gr     ],
                 [   0.00000,  -rgr    ,   gr     ],
                 [   0.00000,  -rgr    ,  -gr     ],
                 [   rgr    ,   gr     ,   0.00000],
                 [   rgr    ,  -gr     ,   0.00000],
                 [  -rgr    ,   gr     ,   0.00000],
                 [  -rgr    ,  -gr     ,   0.00000],
                 [   gr     ,   0.00000,   rgr    ],
                 [   gr     ,   0.00000,  -rgr    ],
                 [  -gr     ,   0.00000,   rgr    ],
                 [  -gr     ,   0.00000,  -rgr    ],
],
           triangles = [
                 [   16,    0,   12],[    1,   16,   12],
                 [   16,    1,   17],[    8,    0,   16],
                 [    2,    8,   16],[    8,    2,   10],
                 [   12,    0,    8],[    4,   12,    8],
                 [   12,    4,   14],[    9,    1,   12],
                 [   14,    9,   12],[    9,   14,    5],
                 [   17,    1,    9],[   11,   17,    9],
                 [   17,   11,    3],[    2,   16,   13],
                 [   16,    3,   13],[    3,   16,   17],
                 [   10,    2,   13],[   15,   10,   13],
                 [   10,   15,    6],[   13,    3,   11],
                 [    7,   13,   11],[   13,    7,   15],
                 [   18,    4,    8],[   10,   18,    8],
                 [   18,   10,    6],[   14,    4,   18],
                 [   19,   14,   18],[   14,   19,    5],
                 [    9,    5,   19],[    7,    9,   19],
                 [    9,    7,   11],[   18,    6,   15],
                 [    7,   18,   15],[   18,    7,   19],
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



