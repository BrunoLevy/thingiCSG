/*

program to create tetragonal
dice from rounded tetrahedron

radius   = radius of spheres and
           cylinders used for rounding
side     = overall scale
                      PCM
*/


 radius =7;
 side = 12;
 lsc = side+2*radius;


include <ArchitectsDaughter.scad>

rotate([180,0,0])
rotate([0,atan(sqrt(2)),0])
difference()
{


rounded_tetrahedron(side,radius);


 translate([0,(lsc/3),(-lsc/(3*sqrt(2)))])                    // 1 2 4
rotate([atan(sqrt(2)),0,0])
   scale(0.15)
  translate(v=[60,-35,-10])
rotate([0,0,240])
 ArchitectsDaughter("1",steps=2,center=true,height=20);

 translate([0,-(lsc/3),(-lsc/(3*sqrt(2)))])                   // 1 2 3
 rotate([-atan(sqrt(2)),0,0])
  scale(0.15)
  translate(v=[85,35,-10])
rotate([0,0,120])
 ArchitectsDaughter("1",steps=2,center=true,height=20);

translate([(lsc/3),0,(lsc/(3*sqrt(2)))])                      // 1 3 4
 rotate([0,atan(sqrt(2)),0])
rotate([0,0,120])
   scale(0.15)
  translate(v=[-40,-90,10])
rotate([0,0,340])
 ArchitectsDaughter("1",steps=2,center=true,height=20);


translate([-(lsc/3),0,(lsc/(3*sqrt(2)))])                     // 2 3 4
  rotate([0,-atan(sqrt(2)),0])
  rotate([0,0,120])
  scale(0.15)
  translate(v=[25,50,10])
  rotate([0,0,330])
 ArchitectsDaughter("2",steps=2,center=true,height=20);

 translate([0,-(lsc/3),(-lsc/(3*sqrt(2)))])                   // 1 2 3
 rotate([-atan(sqrt(2)),0,0])
  scale(0.15)
  translate(v=[-45,30,-10])
rotate([0,180,90])
 ArchitectsDaughter("2",steps=2,center=true,height=20);

 translate([0,(lsc/3),(-lsc/(3*sqrt(2)))])                   // 1 2 4
rotate([atan(sqrt(2)),0,0])
   scale(0.15)
  translate(v=[-60,-35,-10])
rotate([0,180,120])
 ArchitectsDaughter("2",steps=2,center=true,height=20);



translate([-(lsc/3),0,(lsc/(3*sqrt(2)))])                    // 2 3 4
  rotate([0,-atan(sqrt(2)),0])
  rotate([0,0,120])
  scale(0.15)
  translate(v=[ -50, 0,0])
 rotate([0,0,90])
 ArchitectsDaughter("3",steps=2,center=true,height=20);

  translate([0,-(lsc/3),(-lsc/(3*sqrt(2)))])                  // 1 2 3
 rotate([-atan(sqrt(2)),0,0])
  scale(0.15)
  translate(v=[0,-85,-10])
 ArchitectsDaughter("3",steps=2,center=true,height=20);

translate([(lsc/3),0,(lsc/(3*sqrt(2)))])                      // 1 3 4
 rotate([0,atan(sqrt(2)),0])
rotate([0,0,120])
   scale(0.15)
  translate(v=[-40,80,10])
rotate([0,180,200])
 ArchitectsDaughter("3",steps=2,center=true,height=20);

translate([(lsc/3),0,(lsc/(3*sqrt(2)))])                     // 1 3 4
 rotate([0,atan(sqrt(2)),0])
rotate([0,0,120])
   scale(0.15)
  translate(v=[80,-20,10])
rotate([0,180,0])
 ArchitectsDaughter("4",steps=2,center=true,height=20);


 translate([0,(lsc/3),(-lsc/(3*sqrt(2)))])                    // 1 2 4
rotate([atan(sqrt(2)),0,0])
   scale(0.15)
  translate(v=[-30,70,-10])
rotate([0,0,270])
 ArchitectsDaughter("4",steps=2,center=true,height=20);

translate([-(lsc/3),0,(lsc/(3*sqrt(2)))])                     // 2 3 4
  rotate([0,-atan(sqrt(2)),0])
  rotate([0,0,120])
  scale(0.15)
  translate(v=[25,-40,10])
  rotate([0,0,220])
 ArchitectsDaughter("4",steps=2,center=true,height=20);



 }





module rounded_tetrahedron(sc,radius)
{

/*
from Wikipedia:

The following Cartesian coordinates define the four vertices
of a tetrahedron with edge-length 2, centered at the origin:

(±1, 0, -1/sqrt(2))
(0, ±1, 1/sqrt(2))

see tetrahedron module

distance from the origin to the triangle centers is:

sqrt(1/9 + 1/18)

sc is over all scale
radius is radius of spheres and cylinders used to round

*/


norm = 1/sqrt(1/9 + 1/18);

union()
{

atom(radius,sc,0,sc*(-1/sqrt(2)));
atom(radius,-sc,0,sc*(-1/sqrt(2)));
atom(radius,0,sc,sc*(1/sqrt(2)));
atom(radius,0,-sc,sc*(1/sqrt(2)));
bond(sc,0,sc*(-1/sqrt(2)),-sc,0,sc*(-1/sqrt(2)),radius);
bond(sc,0,sc*(-1/sqrt(2)),0,sc,sc*(1/sqrt(2)),radius);
bond(sc,0,sc*(-1/sqrt(2)),0,-sc,sc*(1/sqrt(2)),radius);
bond(-sc,0,sc*(-1/sqrt(2)),0,sc,sc*(1/sqrt(2)),radius);
bond(0,sc,sc*(1/sqrt(2)),0,-sc,sc*(1/sqrt(2)),radius);
bond(-sc,0,sc*(-1/sqrt(2)),0,-sc,sc*(1/sqrt(2)),radius);

translate([0,(norm/3)*radius,(-norm/(3*sqrt(2)))*radius])
scale(sc)
tetrahedron();

translate([-(norm/3)*radius,0,(norm/(3*sqrt(2)))*radius])
scale(sc)
tetrahedron();

translate([0,-(norm/3)*radius,(-norm/(3*sqrt(2)))*radius])
scale(sc)
tetrahedron();

translate([(norm/3)*radius,0,(norm/(3*sqrt(2)))*radius])
scale(sc)
tetrahedron();

}

}


module tetrahedron()
{


/*
  tetrahedron
*/
polyhedron
       (points = [
                 [  1, 0, -1/sqrt(2)],
                 [  -1, 0, -1/sqrt(2)],
                 [  0, 1, 1/sqrt(2)],
                  [  0, -1, 1/sqrt(2)],
                ],
            triangles = [
                 [   2,    1,   0],[    1,    3,   0],
                 [   2,   3,    1],[    0,   3,    2],
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




