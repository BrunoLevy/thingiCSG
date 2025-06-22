/*

rounded cube 
decorated as dice
                            PCM

radius = radius of spheres and cylinders
         used to round the vertices and edges
llx    = x dimension in mm
lly    = y dimension in mm
llz    = z dimension in mm

*/


radius = 6;
llx = 20;
lly = 20;
llz = 20;

include<ArchitectsDaughter.scad>

difference()
{


rounded_cube(llx,lly,llz,radius);


 translate([llx/2,0,llz/2])
    rotate([90,0,0])
   scale(0.15)
  translate(v=[-5,-15,0])
  ArchitectsDaughter("1",steps=2,center=true,height=20);


translate([llx/2,lly,llz/2])
    rotate([90,0,0])
   scale(0.15)
  translate(v=[-5,-15,0])
 rotate([0,180,0])
  ArchitectsDaughter("6",steps=2,center=true,height=20);


translate([llx,lly/2,llz/2])
 rotate([0,90,0])
   scale(0.15)
  translate(v=[-5,-15,0])
  ArchitectsDaughter("2",steps=2,center=true,height=20);


  translate([0,lly/2,llz/2])
 rotate([0,90,0])
    scale(0.15)
  translate(v=[-5,-15,0])
rotate([0,180,0])
  ArchitectsDaughter("5",steps=2,center=true,height=20);


   translate([llx/2,lly/2,llz])
    scale(0.15)
  translate(v=[-5,-15,0])
  ArchitectsDaughter("3",steps=2,center=true,height=20);


 translate([llx/2,lly/2,0])
    scale(0.15)
  translate(v=[-5,-15,0])
 rotate([0,180,0])
  ArchitectsDaughter("4",steps=2,center=true,height=20);


 }



// required modules start here


module rounded_cube(lx,ly,lz,rr)
{


union()
{


translate([rr,rr,0])
cube([lx-2*rr,ly-2*rr,lz]);
translate([0,rr,rr])
cube([lx,ly-2*rr,lz - 2*rr]);
translate([rr,0,rr])
cube([lx-2*rr,ly,lz-2*rr]);

atom(rr,rr,rr,rr)  ;
atom(rr,lx-rr,rr,rr);
atom(rr,rr,ly-rr,rr);
atom(rr,lx-rr,ly-rr,rr);
atom(rr,rr,rr,lz-rr);
atom(rr,lx-rr,rr,lz-rr);
atom(rr,rr,ly-rr,lz-rr);
atom(rr,lx-rr,ly-rr,lz-rr);

bond(rr,rr,rr,lx-rr,rr,rr,rr);
bond(rr,rr,rr,rr,ly-rr,rr,rr);
bond(lx-rr,rr,rr,lx-rr,ly-rr,rr,rr);
bond(rr,ly-rr,rr,lx-rr,ly-rr,rr,rr);
bond(rr,rr,lz-rr,lx-rr,rr,lz-rr,rr);
bond(rr,rr,lz-rr,rr,ly-rr,lz-rr,rr);
bond(lx-rr,rr,lz-rr,lx-rr,ly-rr,lz-rr,rr);
bond(rr,ly-rr,lz-rr,lx-rr,ly-rr,lz-rr,rr);
bond(rr,rr,rr,rr,rr,lz-rr,rr);
bond(lx-rr,rr,rr,lx-rr,rr,lz-rr,rr);
bond(rr,ly-rr,rr,rr,ly-rr,lz-rr,rr);
bond(lx-rr,ly-rr,rr,lx-rr,ly-rr,lz-rr,rr);

}

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


