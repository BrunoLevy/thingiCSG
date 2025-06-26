/*

Creates a model of a molcule from a set
of orthogonal coordinates

*/

module atom(rx,x0,y0,z0)
{
  translate(v=[x0,y0,z0])
  sphere(r=rx,$fn=10);
}

/* spheres of radius rx are placed at the atomic
 positions - x0,y0,z0
*/



module bond(x2,y2,z2,x1,y1,z1)

{
tx = (x2 + x1)/2;
ty = (y2 + y1)/2;
tz = (z2 + z1)/2;
ax = x2 - x1 ;
ay = y2 - y1;
az = z2 - z1;

translate(v=[tx,ty,tz])
rotate(a = [-acos(az/sqrt(ax*ax+ay*ay+az*az)), 0, -atan2(ax, ay)])
cylinder(r=.2,h=sqrt(ax*ax+ay*ay+az*az),center=true,$fn=10);

// cylinder radius, here r=.2, can be altered in the cylinder command

}

/*

Module bond represents a bond between two atoms -
as a cylinder - the orthogonal coordinates of the two
atoms are passed



 x1,y1,z1 coordinates of the first atom
 x2,y2,z2 coordinates of the second atom


tx,ty,and tz are the coordinates of the midpoint of the line
             connecting the atoms
ax,ay,and az is the vector between the atoms

              A cylinder whose height is equal to the bond length
              is placed at the origin and rotated to align with the
              bond.  The cylinder is then translated to the proper
              position

             David Moews supplied the rotate command.

                                                            P Moews


*/



union()
{

 // input to make a water molecule

atom (.3, 0 , 0 ,0) ;                     // oxygen radius = 0.3 Angstroms
atom  (.25 ,-.96 , 0 ,0);                   // H1   radius = 0.25 Angstoms
atom  (.25 , .24, .93, 0);                  // H2

bond (0,0,0, -.96, 0, 0);                  // O - H bond
bond (0, 0, 0, .24, .93, 0);               // second O - H bond

}
/*

Orthogonal coordinates of water (Angstroms)

  The hydrogen oxygen bond distance is about 0.96 Angstroms
  The hydrogen oxygen hydrogen angle is 104.5 degrees

  oxygen (at origin)  x = 0 , y = 0 , z = 0
  hydrogen 1 about 0.96 Angstroms from oxygen - put it
  along the negative x axis  i.e. x = -0.96 , y = 0 , z = 0
  hydrogen 2 in first quadrant - makes 104.5 degree angle with hydrogen 1
  x = .96 * cos(180 - 104.5) = 0.24 , y = .96 * sin (75.5) = .93 , z = 0

  so coordinates are:

        x     y    z
  O     0     0    0
  H1 -.96     0    0
  H2  .24   .93    0
*/
