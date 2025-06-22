/* makes a dice from a rounded
   octahedron             PCM

 radius = radius of spheres and
    cylinders used to round
    sc  =  overall scale factor
*/


radius = 3;
sc = 12;
lsc = sc + 2 * radius;

  include <ArchitectsDaughter.scad>


rotate([0,(acos(-1/3))/2,0])
rotate([0,0,45])
difference()
{


rounded_octa(sc,radius);


  translate([lsc*1/3,lsc*1/3,lsc*-1/3])           // 0 5 2
  rotate([(acos(-1/3))/2,0,315])
  scale(0.15)
  translate(v=[-5,-15,10])
 rotate([0,180,0])
   ArchitectsDaughter("1",steps=2,center=true,height=15);


  translate([lsc*1/3,lsc*1/3,lsc*1/3])             // 0 2 4
  rotate([(acos(-1/3))/2,0,135])
   scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("3",steps=2,center=true,height=15);

  translate([lsc*-1/3,lsc*1/3,lsc*1/3])             // 1 4 2
  rotate([(acos(-1/3))/2,0,225])
   scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("2",steps=2,center=true,height=15);

  translate([lsc*-1/3,lsc*1/3,lsc*-1/3])            // 1 2 5
  rotate([(acos(-1/3))/2,0,45])
   scale(0.15)
  translate(v=[-5,-15,10])
 rotate([0,180,0])
  ArchitectsDaughter("8",steps=2,center=true,height=15);

  translate([lsc*1/3,lsc*-1/3,lsc*1/3] )             // 0 4 3
  rotate([(acos(-1/3))/2,0,45])
   scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("7",steps=2,center=true,height=15);

  translate([lsc*1/3,lsc*-1/3,lsc*-1/3])           // 0 3 5
  rotate([(acos(-1/3))/2,0,225])
 scale(0.15)
  translate(v=[-5,-15,10])
  rotate([0,180,0])
  ArchitectsDaughter("6",steps=2,center=true,height=15);

  translate([lsc*-1/3,lsc*-1/3,lsc*-1/3])          // 1 5 3
  rotate([(acos(-1/3))/2,0,135])
   scale(0.15)
  translate(v=[-5,-15,10])
 rotate([0,180,0])
  ArchitectsDaughter("4",steps=2,center=true,height=15);

  translate([lsc*-1/3,lsc*-1/3,lsc*1/3])            // 1 3 4
  rotate([(acos(-1/3))/2,0,315])
  scale(0.15)
  translate(v=[-5,-15,-10])
  ArchitectsDaughter("5",steps=2,center=true,height=15);







}

module rounded_octa(sc,radius)
{
/*
from Wikipedia
An octahedron with edge length sqrt(2) can be placed
with its center at the origin and its vertices on the
coordinate axes; the Cartesian coordinates of the vertices
are then:

( ±1, 0, 0 );
( 0, ±1, 0 );
( 0, 0, ±1 ).

sc = overall scale
radius = radius of spheres and cylinders used to round

*/

norm = 1/sqrt(1/3);
ft = radius*norm;



union()
{

atom(radius,sc,0,0);
atom(radius,-sc,0,0);
atom(radius,0,sc,0);
atom(radius,0,-sc,0);
atom(radius,0,0,sc);
atom(radius,0,0,-sc);

bond(sc,0,0,0,0,-sc,radius);     // 0 5
bond(sc,0,0,0,sc,0,radius);      // 0 2
bond(0,sc,0,0,0,-sc,radius);     // 2 5
bond(sc,0,0,0,0,sc,radius);      // 0 4
bond(0,sc,0,0,0,sc,radius);      // 2 4
bond(-sc,0,0,0,sc,0,radius);     // 1 2
bond(-sc,0,0,0,0,-sc,radius);    // 1 5
bond(sc,0,0,0,-sc,0,radius);     // 0 3
bond(0,-sc,0,0,0,-sc,radius);    // 3 5
bond(-sc,0,0,0,-sc,0,radius);    // 1 3
bond(0,-sc,0,0,0,sc,radius);     // 3 4
bond(-sc,0,0,0,0,sc,radius);     // 1 4


for (i = [ [ft*1/3,ft*1/3,ft*-1/3],           // 0 5 2
               [ft*1/3,ft*1/3,ft*1/3],             // 0 2 4
               [ft*-1/3,ft*1/3,ft*1/3] ,            // 1 4 2
               [ft*-1/3,ft*1/3,ft*-1/3],            // 1 2 5
               [ft*1/3,ft*-1/3,ft*1/3] ,             // 0 4 3
               [ft*1/3,ft*-1/3,ft*-1/3],           // 0 3 5
               [ft*-1/3,ft*-1/3,ft*-1/3],          // 1 5 3
               [ft*-1/3,ft*-1/3,ft*1/3],            // 1 3 4

                                      ])

{
          translate(i)
          scale (sc)
          octahedron();
 }







}

module octahedron()
{

polyhedron
       (points = [
                 [  1,0,0],[-1,0,0],[0,1,0],
                  [0,-1,0],[0,0,1],[0,0,-1],
],
           triangles = [
                  [5,0,2],[2,0,4],[2,4,1],[2,1,5],
                 [ 4,0,3],[3,0,5],[5,1,3],[3,1,4],
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


