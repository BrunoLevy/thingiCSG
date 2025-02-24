// Convenience modules.


function segs(r) = $fn>0?($fn>3?$fn:3):(ceil(max(min(360.0/$fa,abs(r)*2*3.14159/$fs),5)));

function hypot(x,y) = sqrt(x*x+y*y);

function distance(point1, point2) =
	sqrt(
		pow(point2[0]-point1[0], 2.0) +
		pow(point2[1]-point1[1], 2.0) +
		((len(point1)<3)? 0.0 : pow(point2[2]-point1[2], 2.0))
	);

function cdr(list) = len(list)>1?[for (i=[1:len(list)-1]) list[i]]:[];
function reverse(list) = [ for (i = [len(list)-1 : -1 : 0]) list[i] ];


// Optionally pre-render if someone sets $do_prerender=true
//$do_prerender = true;
module prerender(convexity=10) {
	if ($do_prerender == true) {
		render(convexity=convexity) {
			children();
		}
	} else {
		children();
	}
}


// Rotates children around the Z axis by the given number of degrees.
// Example:
//   xrot(90) cylinder(h=10, r=2, center=true);
module xrot(a=0)
{
	rotate([a, 0, 0])
		children();
}


// Rotates children around the Y axis by the given number of degrees.
// Example:
//   yrot(90) cylinder(h=10, r=2, center=true);
module yrot(a=0)
{
	rotate([0, a, 0])
		children();
}


// Rotates children around the Z axis by the given number of degrees.
// Example:
//   zrot(90) cube(size=[9,1,4], center=true);
module zrot(a=0)
{
	rotate([0, 0, a])
		children();
}



module skew_along_x(yang=0, zang=0)
{
	multmatrix(m = [
		[1,         0,          0,        0],
		[sin(yang), 1,          0,        0],
		[sin(zang), 0,          1,        0],
		[0,         0,          0,        1]
	]) {
		children();
	}
}



module skew_along_y(xang=0, zang=0)
{
	multmatrix(m = [
		[1, sin(xang),          0,        0],
		[0,         1,          0,        0],
		[0, sin(zang),          1,        0],
		[0,         0,          0,        1]
	]) {
		children();
	}
}



module skew_along_z(xang=0, yang=0)
{
	multmatrix(m = [
		[1,         0,  sin(xang),        0],
		[0,         1,  sin(yang),        0],
		[0,         0,          1,        0],
		[0,         0,          0,        1]
	]) {
		children();
	}
}



module mirror_copy(v=[0,0,1])
{
	union() {
		children();
		mirror(v) children();
	}
}


// Given a number of euller angles, rotates copies of the given children to each of those angles.
// Example:
//   rot_copies(rots=[[0,0,0],[45,0,0],[0,45,120],[90,-45,270]])
//     translate([6,0,0]) cube(size=[9,1,4], center=true);
module rot_copies(rots=[[0,0,0]])
{
	for (rot = rots)
		rotate(rot)
			children();
}



// Given an array of angles, rotates copies of the children to each of those angles around the X axis.
// Example:
//   xrot_copies(rots=[0,15,30,60,120,240]) translate([0,6,0]) cube(size=[4,9,1], center=true);
//   xrot_copies(count=6, offset=15) translate([0,6,0]) cube(size=[4,9,1], center=true);
module xrot_copies(rots=[0], offset=0, count=undef)
{
	if (count != undef) {
		for (i = [0 : count-1]) {
			a = (i / count) * 360.0;
			rotate([a+offset, 0, 0]) {
				children();
			}
		}
	} else {
		for (a = rots) {
			rotate([a+offset, 0, 0]) {
				children();
			}
		}
	}
}


// Given an array of angles, rotates copies of the children to each of those angles around the Y axis.
// Example:
//   yrot_copies(rots=[0,15,30,60,120,240]) translate([6,0,0]) cube(size=[9,4,1], center=true);
//   yrot_copies(count=6, offset=15) translate([6,0,0]) cube(size=[9,4,1], center=true);
module yrot_copies(rots=[0], offset=0, count=undef)
{
	if (count != undef) {
		for (i = [0 : count-1]) {
			a = (i / count) * 360.0;
			rotate([0, a+offset, 0]) {
				children();
			}
		}
	} else {
		for (a = rots) {
			rotate([0, a+offset, 0]) {
				children();
			}
		}
	}
}


// Given an array of angles, rotates copies of the children to each of those angles around the Z axis.
// Example:
//   zrot_copies(rots=[0,15,30,60,120,240]) translate([6,0,0]) cube(size=[9,1,4], center=true);
//   zrot_copies(count=6, offset=15) translate([6,0,0]) cube(size=[9,1,4], center=true);
module zrot_copies(rots=[0], offset=0, count=undef)
{
	if (count != undef) {
		for (i = [0 : count-1]) {
			a = (i / count) * 360.0;
			rotate([0, 0, a+offset]) {
				children();
			}
		}
	} else {
		for (a = rots) {
			rotate([0, 0, a+offset]) {
				children();
			}
		}
	}
}


// Makes copies of the given children at each of the given offsets.
//   offsets = array of XYZ offset vectors. Default [[0,0,0]]
// Example:
//   translate_copies([[-5,-5,0], [5,-5,0], [0,-5,7], [0,5,0]])
//     sphere(r=3,center=true);
module translate_copies(offsets=[[0,0,0]])
{
	for (off = offsets)
		translate(off)
			children();
}


// Makes a 3D XYZ grid of duplicate children.
//   xa = array or range of X-axis values to offset by. (Default: [0])
//   ya = array or range of Y-axis values to offset by. (Default: [0])
//   za = array or range of Z-axis values to offset by. (Default: [0])
//   count = number of copies to have per axis. (Default: none)
//   spacing = spacing of copies per axis. Use with count. (Default: 0)
// Examples:
//   grid_of(xa=[0,2,3,5],ya=[3:5],za=[-4:2:6]) sphere(r=0.5,center=true);
//   grid_of(ya=[-6:3:6],za=[4,7]) sphere(r=1,center=true);
//   grid_of(count=3, spacing=10) sphere(r=1,center=true);
//   grid_of(count=[3, 1, 2], spacing=10) sphere(r=1,center=true);
//   grid_of(count=[3, 4], spacing=[10, 8]) sphere(r=1,center=true);
//   grid_of(count=[3, 4, 2], spacing=[10, 8, 5]) sphere(r=1,center=true, $fn=24);
module grid_of(xa=[0], ya=[0], za=[0], count=[], spacing=[])
{
	count = (len(count) == undef)? [count,1,1] :
			((len(count) == 1)? [count[0], 1, 1] :
			((len(count) == 2)? [count[0], count[1], 1] :
			((len(count) == 3)? count : undef)));

	spacing = (len(spacing) == undef)? [spacing,spacing,spacing] :
			((len(spacing) == 1)? [spacing[0], 0, 0] :
			((len(spacing) == 2)? [spacing[0], spacing[1], 0] :
			((len(spacing) == 3)? spacing : undef)));

	if (count != undef && spacing != undef) {
		for (x = [-(count[0]-1)/2 : (count[0]-1)/2 + 0.1]) {
			for (y = [-(count[1]-1)/2 : (count[1]-1)/2 + 0.1]) {
				for (z = [-(count[2]-1)/2 : (count[2]-1)/2 + 0.1]) {
					translate([x*spacing[0], y*spacing[1], z*spacing[2]]) {
						children();
					}
				}
			}
		}
	} else {
		for (xoff = xa) {
			for (yoff = ya) {
				for (zoff = za) {
					translate([xoff,yoff,zoff]) {
						children();
					}
				}
			}
		}
	}
}


// Evenly distributes n duplicate children around a circle on the XY plane.
//   n = number of copies to distribute around the circle. (Default: 6)
//   r = radius of circle (Default: 1)
//   rx = radius of ellipse on X axis. Used instead of r.
//   ry = radius of ellipse on Y axis. Used instead of r.
//   d = diameter of circle. (Default: 2)
//   dx = diameter of ellipse on X axis. Used instead of d.
//   dy = diameter of ellipse on Y axis. Used instead of d.
//   rot = whether to rotate the copied children.  (Default: false)
//   sa = starting angle. (Default: 0.0)
//   ea = ending angle. Will distribute copies CCW from sa to ea. (Default: 360.0)
// Examples:
//   circle_of(d=8,n=5)
//     cube(size=[3,1,1],center=true);
//   circle_of(r=10,n=12,rot=true)
//     cube(size=[3,1,1],center=true);
//   circle_of(rx=15,ry=10,n=12,rot=true)
//     cube(size=[3,1,1],center=true);
//   circle_of(r=10,n=5,rot=true,sa=30.0,ea=150.0)
//     cube(size=[3,1,1],center=true);
//
module circle_of(
		n=6,
		r=1, rx=undef, ry=undef,
		d=undef, dx=undef, dy=undef,
		sa=0.0, ea=360.0,
		rot=false
) {
	r = (d == undef)?r:(d/2.0);
	rx = (dx == undef)?rx:(dx/2.0);
	ry = (dy == undef)?rx:(dy/2.0);
	rx = (rx == undef)?r:rx;
	ry = (ry == undef)?r:ry;
	sa = ((sa % 360.0) + 360.0) % 360.0; // make 0 < ang < 360 
	ea = ((ea % 360.0) + 360.0) % 360.0; // make 0 < ang < 360
	n = (abs(ea-sa)<0.01)?(n+1):n;
	delt = (((ea<=sa)?360.0:0)+ea-sa)/(n-1);
	for (ang = [sa:delt:(sa+delt*(n-1))])
		if (abs(abs(ang-sa)-360.0) > 0.01)
			translate([cos(ang)*rx,sin(ang)*ry,0])
				rotate([0,0,rot?atan2(sin(ang)*ry,cos(ang)*rx):0])
					children();
}



// Evenly distributes n duplicate children along an XYZ line.
//   p1 = starting point of line.  (Default: [0,0,0])
//   p2 = ending point of line.  (Default: [10,0,0])
//   n = number of copies to distribute along the line. (Default: 6)
// Examples:
//   line_of(p1=[0,0,0], p2=[-10,15,20], n=5)
//     cube(size=[3,1,1],center=true);
//
module line_of(p1=[0,0,0], p2=[10,0,0], n=6)
{
	delta = (p2 - p1) / (n-1);
	for (i = [0:n-1])
		translate([p1[0]+delta[0]*i, p1[1]+delta[1]*i, p1[2]+delta[2]*i])
			children();
}


// Makes a cube with rounded edges and corners.
//   size = size of cube [X,Y,Z].  (Default: [1,1,1])
//   r = radius of edge/corner rounding.  (Default: 0.25)
// Examples:
//   rcube(size=[9,4,1], r=0.333, center=true, $fn=24);
//   rcube(size=[5,7,3], r=1);
module rcube(size=[1,1,1], r=0.25, center=false, $fn=undef)
{
	$fn = ($fn==undef)?max(18,floor(180/asin(1/r)/2)*2):$fn;
	xoff=abs(size[0])/2-r;
	yoff=abs(size[1])/2-r;
	zoff=abs(size[2])/2-r;
	offset = center?[0,0,0]:size/2;
	translate(offset) {
		union() {
			grid_of([-xoff,xoff],[-yoff,yoff],[-zoff,zoff])
				sphere(r=r,center=true,$fn=$fn);
			grid_of(xa=[-xoff,xoff],ya=[-yoff,yoff])
				cylinder(r=r,h=zoff*2,center=true,$fn=$fn);
			grid_of(xa=[-xoff,xoff],za=[-zoff,zoff])
				rotate([90,0,0])
					cylinder(r=r,h=yoff*2,center=true,$fn=$fn);
			grid_of(ya=[-yoff,yoff],za=[-zoff,zoff])
				rotate([90,0,0])
				rotate([0,90,0])
					cylinder(r=r,h=xoff*2,center=true,$fn=$fn);
			cube(size=[xoff*2,yoff*2,size[2]], center=true);
			cube(size=[xoff*2,size[1],zoff*2], center=true);
			cube(size=[size[0],yoff*2,zoff*2], center=true);
		}
	}
}



// Makes a cube with rounded vertical edges.
//   size = size of cube [X,Y,Z].  (Default: [1,1,1])
//   r = radius of edge/corner rounding.  (Default: 0.25)
// Examples:
//   rrect(size=[9,4,1], r=1, center=true);
//   rrect(size=[5,7,3], r=1, $fn=24);
module rrect(size=[1,1,1], r=0.25, center=false, $fn=undef)
{
	$fn = ($fn==undef)?max(18,floor(180/asin(1/r)/2)*2):$fn;
	xoff=abs(size[0])/2-r;
	yoff=abs(size[1])/2-r;
	offset = center?[0,0,0]:size/2;
	translate(offset) {
		union(){
			grid_of([-xoff,xoff],[-yoff,yoff])
				cylinder(r=r,h=size[2],center=true,$fn=$fn);
			cube(size=[xoff*2,size[1],size[2]], center=true);
			cube(size=[size[0],yoff*2,size[2]], center=true);
		}
	}
}



// Makes a cube with chamfered edges.
//   size = size of cube [X,Y,Z].  (Default: [1,1,1])
//   chamfer = chamfer inset along axis.  (Default: 0.25)
module chamfcube(
		size=[1,1,1],
		chamfer=0.25,
		chamfaxes=[1,1,1],
		chamfcorners=false
) {
	ch_width = sqrt(2)*chamfer;
	ch_offset = 1;
	difference() {
		cube(size=size, center=true);
		for (xs = [-1,1]) {
			for (ys = [-1,1]) {
				if (chamfaxes[0] == 1) {
					translate([0,xs*size[1]/2,ys*size[2]/2]) {
						rotate(a=[45,0,0])
						 cube(size=[size[0]+0.1,ch_width,ch_width], center=true);
					}
				}
				if (chamfaxes[1] == 1) {
					translate([xs*size[0]/2,0,ys*size[2]/2]) {
						rotate(a=[0,45,0])
						 cube(size=[ch_width,size[1]+0.1,ch_width], center=true);
					}
				}
				if (chamfaxes[2] == 1) {
					translate([xs*size[0]/2,ys*size[1]/2],0) {
						rotate(a=[0,0,45])
						 cube(size=[ch_width,ch_width,size[2]+0.1], center=true);
					}
				}
				if (chamfcorners) {
					for (zs = [-1,1]) {
						translate([xs*size[0]/2,ys*size[1]/2,zs*size[2]/2]) {
							scale([chamfer,chamfer,chamfer]) {
								polyhedron(
									points=[
										[0,-1,-1], [0,-1,1], [0,1,1], [0,1,-1],
										[-1,0,-1], [-1,0,1], [1,0,1], [1,0,-1],
										[-1,-1,0], [-1,1,0], [1,1,0], [1,-1,0]
									],
									faces=[
										[ 8,  4,  9,  5],
										[ 9,  3, 10,  2],
										[10,  7, 11,  6],
										[11,  0,  8,  1],
										[ 0,  7,  3,  4],
										[ 1,  5,  2,  6],

										[ 1,  8,  5],
										[ 5,  9,  2],
										[ 2, 10,  6],
										[ 6, 11,  1],

										[ 0,  4,  8],
										[ 4,  3,  9],
										[ 3,  7, 10],
										[ 7,  0, 11],
									]
								);
							}
						}
					}
				}
			}
		}
	}
}



// Makes a teardrop shape in the XZ plane. Useful for 3D printable holes.
//   r = radius of circular part of teardrop.  (Default: 1)
//   h = thickness of teardrop. (Default: 1)
// Example:
//   teardrop(r=3, h=2, ang=30);
module teardrop(r=1, h=1, ang=45, $fn=undef)
{
	$fn = ($fn==undef)?max(12,floor(180/asin(1/r)/2)*2):$fn;
	xrot(90) union() {
		translate([0, r*sin(ang), 0]) {
			scale([1, 1/tan(ang), 1]) {
				difference() {
					zrot(45) {
						cube(size=[2*r*cos(ang)/sqrt(2), 2*r*cos(ang)/sqrt(2), h], center=true);
					}
					translate([0, -r/2, 0]) {
						cube(size=[2*r, r, h+1], center=true);
					}
				}
			}
		}
		cylinder(h=h, r=r, center=true);
	}
}



// Makes a simple threadless screw, useful for making screwholes.
//   screwsize = diameter of threaded part of screw.
//   screwlen = length of threaded part of screw.
//   headsize = diameter of the screw head.
//   headlen = length of the screw head.
// Example:
//   screw(screwsize=3,screwlen=10,headsize=6,headlen=3);
module screw(screwsize=3,screwlen=10,headsize=6,headlen=3,$fn=undef)
{
	$fn = ($fn==undef)?max(8,floor(180/asin(2/screwsize)/2)*2):$fn;
	translate([0,0,-(screwlen)/2])
		cylinder(r=screwsize/2, h=screwlen+0.05, center=true, $fn=$fn);
	translate([0,0,(headlen)/2])
		cylinder(r=headsize/2, h=headlen, center=true, $fn=$fn*2);
}


function get_metric_bolt_head_size(size) = lookup(size, [
		[ 4.0,  7.0],
		[ 5.0,  8.0],
		[ 6.0, 10.0],
		[ 7.0, 11.0],
		[ 8.0, 13.0],
		[10.0, 16.0],
		[12.0, 18.0],
		[14.0, 21.0],
		[16.0, 24.0],
		[18.0, 27.0],
		[20.0, 30.0]
	]);


function get_metric_nut_size(size) = lookup(size, [
		[ 2.0,  4.0],
		[ 2.5,  5.0],
		[ 3.0,  5.5],
		[ 4.0,  7.0],
		[ 5.0,  8.0],
		[ 6.0, 10.0],
		[ 7.0, 11.0],
		[ 8.0, 13.0],
		[10.0, 17.0],
		[12.0, 19.0],
		[14.0, 22.0],
		[16.0, 24.0],
		[18.0, 27.0],
		[20.0, 30.0],
	]);


function get_metric_nut_thickness(size) = lookup(size, [
		[ 2.0,  1.6],
		[ 2.5,  2.0],
		[ 3.0,  2.4],
		[ 4.0,  3.2],
		[ 5.0,  4.0],
		[ 6.0,  5.0],
		[ 7.0,  5.5],
		[ 8.0,  6.5],
		[10.0,  8.0],
		[12.0, 10.0],
		[14.0, 11.0],
		[16.0, 13.0],
		[18.0, 15.0],
		[20.0, 16.0]
	]);



// Makes an unthreaded model of a standard nut for a standard metric screw.
//   size = standard metric screw size in mm. (Default: 3)
//   hole = include an unthreaded hole in the nut.  (Default: true)
// Example:
//   metric_nut(size=8, hole=true);
//   metric_nut(size=3, hole=false);
module metric_nut(size=3, hole=true, $fn=undef, center=false)
{
	$fn = ($fn==undef)?max(8,floor(180/asin(2/size)/2)*2):$fn;
	radius = get_metric_nut_size(size)/2/cos(30);
	thick = get_metric_nut_thickness(size);
	offset = (center == true)? 0 : thick/2;
	translate([0,0,offset]) difference() {
		cylinder(r=radius, h=thick, center=true, $fn=6);
		if (hole == true)
			cylinder(r=size/2, h=thick+0.5, center=true, $fn=$fn);
	}
}



function get_lmXuu_bearing_diam(size) = lookup(size, [
		[  4.0,   8.0],
		[  5.0,  10.0],
		[  6.0,  12.0],
		[  8.0,  15.0],
		[ 10.0,  19.0],
		[ 12.0,  21.0],
		[ 13.0,  23.0],
		[ 16.0,  28.0],
		[ 20.0,  32.0],
		[ 25.0,  40.0],
		[ 30.0,  45.0],
		[ 35.0,  52.0],
		[ 40.0,  60.0],
		[ 50.0,  80.0],
		[ 60.0,  90.0],
		[ 80.0, 120.0],
		[100.0, 150.0]
	]);


function get_lmXuu_bearing_length(size) = lookup(size, [
		[  4.0,  12.0],
		[  5.0,  15.0],
		[  6.0,  19.0],
		[  8.0,  24.0],
		[ 10.0,  29.0],
		[ 12.0,  30.0],
		[ 13.0,  32.0],
		[ 16.0,  37.0],
		[ 20.0,  42.0],
		[ 25.0,  59.0],
		[ 30.0,  64.0],
		[ 35.0,  70.0],
		[ 40.0,  80.0],
		[ 50.0, 100.0],
		[ 60.0, 110.0],
		[ 80.0, 140.0],
		[100.0, 175.0]
	]);


// Creates a model of a clamp to hold a given linear bearing cartridge.
//   d = Diameter of linear bearing. (Default: 15)
//   l = Length of linear bearing. (Default: 24)
//   tab = Clamp tab height. (Default: 7)
//   tabwall = Clamp Tab thickness. (Default: 5)
//   wall = Wall thickness of clamp housing. (Default: 3)
//   gap = Gap in clamp. (Default: 5)
//   screwsize = Size of screw to use to tighten clamp. (Default: 3)
module linear_bearing_housing(d=15,l=24,tab=7,gap=5,wall=3,tabwall=5,screwsize=3)
{
	od = d+2*wall;
	ogap = gap+2*tabwall;
	tabh = tab/2+od/2*sqrt(2)-ogap/2;
	translate([0,0,od/2]) difference() {
		union() {
			rotate([0,0,90])
				teardrop(r=od/2,h=l);
			translate([0,0,tabh])
				cube(size=[l,ogap,tab+0.05], center=true);
			translate([0,0,-od/4])
				cube(size=[l,od,od/2], center=true);
		}
		rotate([0,0,90])
			teardrop(r=d/2,h=l+0.05);
		translate([0,0,(d*sqrt(2)+tab)/2])
			cube(size=[l+0.05,gap,d+tab], center=true);
		translate([0,0,tabh]) {
			translate([0,-ogap/2+2-0.05,0])
				rotate([90,0,0])
					screw(screwsize=screwsize*1.06, screwlen=ogap, headsize=screwsize*2, headlen=10);
			translate([0,ogap/2+0.05,0])
				rotate([90,0,0])
					metric_nut(size=screwsize,hole=false);
		}
	}
}


module lmXuu_housing(size=8,tab=7,gap=5,wall=3,tabwall=5,screwsize=3)
{
	d = get_lmXuu_bearing_diam(size);
	l = get_lmXuu_bearing_length(size);
	linear_bearing_housing(d=d,l=l,tab=tab,gap=gap,wall=wall,tabwall=tabwall,screwsize=screwsize);
}
//lmXuu_housing(size=8);
//lmXuu_housing(size=10);


// Makes a hollow tube with the given size and wall thickness.
//   h = height of tube. (Default: 1)
//   r = Outer radius of tube.  (Default: 1)
//   r1 = Outer radius of bottom of tube.  (Default: value of r)
//   r2 = Outer radius of top of tube.  (Default: value of r)
//   wall = horizontal thickness of tube wall. (Default 0.5)
// Example:
//   tube(h=3, r=4, wall=1, center=true);
//   tube(h=6, r=4, wall=2, $fn=6);
//   tube(h=3, r1=5, r2=7, wall=2, center=true);
module tube(h=1, r=1, r1=undef, r2=undef, wall=0.5, center=false, $fn=undef)
{
	r1 = (r1==undef)? r : r1;
	r2 = (r2==undef)? r : r2;
	$fn = ($fn==undef)?max(12,floor(180/asin(2/max(r1,r2))/2)*2):$fn;
	difference() {
		cylinder(h=h, r1=r1, r2=r2, center=center, $fn=$fn);
		cylinder(h=h+0.03, r1=r1-wall, r2=r2-wall, center=center, $fn=$fn);
	}
}



// Example:
//   narrowing_strut(w=10, l=100, wall=3, ang=30);
module narrowing_strut(w=10, l=100, wall=5, ang=30)
{
	union() {
		translate([0, 0, wall/2])
			cube(size=[w, l, wall], center=true);
		difference() {
			translate([0, 0, wall])
				scale([1, 1, 1/tan(ang)]) yrot(45)
					cube(size=[w/sqrt(2), l, w/sqrt(2)], center=true);
			translate([0, 0, -w+0.05])
				cube(size=[w+1, l+1, w*2], center=true);
		}
	}
}
//!narrowing_strut();



// Makes a wall which thins to a smaller width in the center,
// with angled supports to prevent critical overhangs.
// Example:
//   thinning_wall(h=50, l=100, thick=4, ang=30, strut=5, wall=2);
module thinning_wall(h=50, l=100, thick=5, ang=30, strut=5, wall=3, bracing=true)
{
	dang = atan((h-2*strut)/(l-2*strut));
	dlen = (h-2*strut)/sin(dang);
	union() {
		xrot_copies([0, 180]) {
			translate([0, 0, -h/2])
				narrowing_strut(w=thick, l=l, wall=strut, ang=ang);
			translate([0, -l/2, 0])
				xrot(-90) narrowing_strut(w=thick, l=h-0.1, wall=strut, ang=ang);
			if (bracing == true) {
				intersection() {
					cube(size=[thick, l, h], center=true);
					xrot_copies([-dang,dang]) {
						grid_of(za=[-strut/4, strut/4]) {
							scale([1,1,1.5]) yrot(45) {
								cube(size=[thick/sqrt(2), dlen, thick/sqrt(2)], center=true);
							}
						}
						cube(size=[thick, dlen, strut/2], center=true);
					}
				}
			}
		}
		cube(size=[wall, l-0.1, h-0.1], center=true);
	}
}
//!thinning_wall(bracing=false);



// Makes a triangular wall which thins to a smaller width in the center,
// with angled supports to prevent critical overhangs.
// Example:
//   thinning_triangle(h=50, l=100, thick=4, ang=30, strut=5, wall=2);
module thinning_triangle(h=50, l=100, thick=5, ang=30, strut=5, wall=3, diagonly=false)
{
	dang = atan((h-strut)/(l-strut));
	dlen = (h-strut)/sin(dang);
	difference() {
		union() {
			if (!diagonly) {
				translate([0, 0, -h/2])
					narrowing_strut(w=thick, l=l, wall=strut, ang=ang);
				translate([0, -l/2, 0])
					xrot(-90) narrowing_strut(w=thick, l=h-0.1, wall=strut, ang=ang);
			}
			intersection() {
				cube(size=[thick, l, h], center=true);
				xrot(-dang) yrot(180) {
					narrowing_strut(w=thick, l=dlen*1.2, wall=strut, ang=ang);
				}
			}
			cube(size=[wall, l-0.1, h-0.1], center=true);
		}
		xrot(-dang) {
			translate([0, 0, h/2]) {
				cube(size=[thick+0.1, l*2, h], center=true);
			}
		}
	}
}
//!thinning_triangle(bracing=false);



// Makes a triangular wall which thins to a smaller width in the center,
// with angled supports to prevent critical overhangs.
// Example:
//   thinning_brace(h=50, l=100, thick=4, ang=30, strut=5, wall=2);
module thinning_brace(h=50, l=100, thick=5, ang=30, strut=5, wall=3)
{
	dang = atan((h)/(l));
	dlen = (h)/sin(dang);
	difference() {
		union() {
			intersection() {
				cube(size=[thick, l, h], center=true);
				translate([0, 0, 0]) {
					xrot(-dang) yrot(180) {
						narrowing_strut(w=thick, l=dlen, wall=strut, ang=ang);
					}
				}
			}
			cube(size=[wall, l-0.1, h-0.1], center=true);
		}
		xrot(-dang) {
			translate([0, 0, h/2]) {
				cube(size=[thick+0.1, l*2, h], center=true);
			}
		}
	}
}
//!thinning_brace(bracing=false);



// Example:
//   sparse_strut(h=40, l=120, thick=4, maxang=30, strut=5, max_bridge=20);
module sparse_strut(h=50, l=100, thick=4, maxang=30, strut=5, max_bridge = 20)
{

	zoff = h/2 - strut/2;
	yoff = l/2 - strut/2;

	maxhyp = 1.5 * (max_bridge+strut)/2 / sin(maxang);
	maxz = 2 * maxhyp * cos(maxang);

	zreps = ceil(2*zoff/maxz);
	zstep = 2*zoff / zreps;

	hyp = zstep/2 / cos(maxang);
	maxy = min(2 * hyp * sin(maxang), max_bridge+strut);

	yreps = ceil(2*yoff/maxy);
	ystep = 2*yoff / yreps;

	ang = atan(ystep/zstep);
	len = zstep / cos(ang);

	union() {
		grid_of(za=[-zoff, zoff])
			cube(size=[thick, l, strut], center=true);
		grid_of(ya=[-yoff, yoff])
			cube(size=[thick, strut, h], center=true);
		grid_of(ya=[-yoff+ystep/2:ystep:yoff], za=[-zoff+zstep/2:zstep:zoff]) {
			xrot( ang) cube(size=[thick, strut, len], center=true);
			xrot(-ang) cube(size=[thick, strut, len], center=true);
		}
	}
}


// Makes a corrugated wall which relieved contraction stress while
// still providing support strength.
// Example:
//   corrugated_wall(h=50, l=100, thick=4, ang=30, strut=5, wall=2);
module corrugated_wall(h=50, l=100, thick=5, ang=30, strut=5, wall=2)
{
	innerlen = l - strut*2;
	inner_height = h - wall*2;
	spacing = thick*sqrt(3);
	corr_count = floor(innerlen/spacing/2)*2;

	grid_of(ya=[-(l-strut)/2, (l-strut)/2]) {
		cube(size=[thick, strut, h], center=true);
	}
	grid_of(za=[-(h-wall)/2, (h-wall)/2]) {
		cube(size=[thick, l, wall], center=true);
	}

	prerender(convexity=corr_count*4+4)
	difference() {
		for (ypos = [-innerlen/2:spacing:innerlen/2]) {
			translate([0, ypos, 0]) {
				translate([0, spacing/4, 0])
					zrot(-45) cube(size=[wall, thick*sqrt(2), inner_height], center=true);
				translate([0, spacing*3/4, 0])
					zrot(45) cube(size=[wall, thick*sqrt(2), inner_height], center=true);
			}
		}
		grid_of(xa=[-thick, thick]) {
			cube(size=[thick, l, h], center=true);
		}
		grid_of(ya=[-l, l]) {
			cube(size=[thick*2, l, h], center=true);
		}
	}
}
//!corrugated_wall(h=50, l=100, thick=5, ang=30, strut=5, wall=2);



module torus(or=1, ir=0.5)
{
	rotate_extrude(convexity = 10)
		translate([(or-ir)/2+ir, 0, 0])
			circle(r = (or-ir)/2, $fs=1);
}
//!torus(or=30, ir=10);



module chamfer(chamfer=1, size=[1,1,1], edges=[[0,0,0,0], [1,1,0,0], [0,0,0,0]])
{
	difference() {
		union() {
			children();
		}
		union() {
			if (edges[0][0] != 0)
				translate([0,  size[1]/2,  size[2]/2])
					xrot(45) cube(size=[size[0]+0.1, chamfer*sqrt(2), chamfer*sqrt(2)], center=true);
			if (edges[0][1] != 0)
				translate([0, -size[1]/2,  size[2]/2])
					xrot(45) cube(size=[size[0]+0.1, chamfer*sqrt(2), chamfer*sqrt(2)], center=true);
			if (edges[0][2] != 0)
				translate([0,  size[1]/2, -size[2]/2])
					xrot(45) cube(size=[size[0]+0.1, chamfer*sqrt(2), chamfer*sqrt(2)], center=true);
			if (edges[0][3] != 0)
				translate([0, -size[1]/2, -size[2]/2])
					xrot(45) cube(size=[size[0]+0.1, chamfer*sqrt(2), chamfer*sqrt(2)], center=true);

			if (edges[1][0] != 0)
				translate([ size[0]/2, 0,  size[2]/2])
					yrot(45) cube(size=[chamfer*sqrt(2), size[1]+0.1, chamfer*sqrt(2)], center=true);
			if (edges[1][1] != 0)
				translate([-size[0]/2, 0,  size[2]/2])
					yrot(45) cube(size=[chamfer*sqrt(2), size[1]+0.1, chamfer*sqrt(2)], center=true);
			if (edges[1][2] != 0)
				translate([ size[0]/2, 0, -size[2]/2])
					yrot(45) cube(size=[chamfer*sqrt(2), size[1]+0.1, chamfer*sqrt(2)], center=true);
			if (edges[1][3] != 0)
				translate([-size[0]/2, 0, -size[2]/2])
					yrot(45) cube(size=[chamfer*sqrt(2), size[1]+0.1, chamfer*sqrt(2)], center=true);

			if (edges[2][0] != 0)
				translate([ size[0]/2,  size[1]/2, 0])
					zrot(45) cube(size=[chamfer*sqrt(2), chamfer*sqrt(2), size[2]+0.1], center=true);
			if (edges[2][1] != 0)
				translate([-size[0]/2,  size[1]/2, 0])
					zrot(45) cube(size=[chamfer*sqrt(2), chamfer*sqrt(2), size[2]+0.1], center=true);
			if (edges[2][2] != 0)
				translate([ size[0]/2, -size[1]/2, 0])
					zrot(45) cube(size=[chamfer*sqrt(2), chamfer*sqrt(2), size[2]+0.1], center=true);
			if (edges[2][3] != 0)
				translate([-size[0]/2, -size[1]/2, 0])
					zrot(45) cube(size=[chamfer*sqrt(2), chamfer*sqrt(2), size[2]+0.1], center=true);
		}
	}
}
//!chamfer(chamfer=2, size=[10,40,90], edges=[[0,0,0,0], [1,1,0,0], [0,0,0,0]]) {
//	cube(size=[10,40,90], center=true);
//}


module extrude_2d_hollow(wall=2, height=50, twist=90, slices=60)
{
  linear_extrude(height=height, twist=twist, slices=slices) {
    difference() {
      children();
      offset(r=-wall) {
        children();
      }
    }
  }
}


function sum_of_sines(a,sines) = len(sines)==0? 0 :
    len(sines)==1?sines[0][0]*sin(a*sines[0][1]+(len(sines[0])>2?sines[0][2]:0)):
    sum_of_sines(a,[sines[0]])+sum_of_sines(a,cdr(sines));


module modulated_circle(r=40, sines=[10])
{
  freqs = len(sines)>0? [for (i=sines) i[1]] : [5];
  points = [
      for (a = [0 : (360/segs(r)/max(freqs)) : 360])
          let(nr=r+sum_of_sines(a,sines)) [nr*cos(a), nr*sin(a)]
  ];
  polygon(points);
}


function bez_B0(curve,u) = curve[0]*pow((1-u),3);
function bez_B1(curve,u) = curve[1]*(3*u*pow((1-u),2));
function bez_B2(curve,u) = curve[2]*(3*pow(u,2)*(1-u));
function bez_B3(curve,u) = curve[3]*pow(u,3);
function bez_point(curve,u) = bez_B0(curve,u) + bez_B1(curve,u) + bez_B2(curve,u) + bez_B3(curve,u);

module bezier_path(bezier, splinesteps=16) {
	pointslist = [
		for (
			b = [0 : 3 : len(bezier)-4],
			l = [0 : splinesteps-1]
		) let (
			crv = [bezier[b+0], bezier[b+1], bezier[b+2], bezier[b+3]],
			u = l / (splinesteps-1)
		) bez_point(crv, u)
	];
	polygon(points=pointslist);
}

module revolve_bezier(bezier, splinesteps=16) {
	yrot(90) rotate_extrude(convexity=10) {
		xrot(180) zrot(-90) bezier_path(bezier, splinesteps);
	}
}


function bezier_close_to_axis(bezier) =
	let(bezend = len(bezier)-1)
		concat(
			[ [bezier[0][0], 0], [bezier[0][0], 0], bezier[0] ],
			bezier,
			[ bezier[bezend], [bezier[bezend][0], 0], [bezier[bezend][0], 0] ]
		);

module revolve_bezier_solid_to_axis(bezier, splinesteps=16) {
	revolve_bezier(bezier=bezier_close_to_axis(bezier), splinesteps=splinesteps);
}


function bezier_offset(inset, bezier) =
	let(backbez = reverse([ for (pt = bezier) [pt[0], pt[1]-inset] ]))
		concat(
			bezier,
			[bezier[len(bezier)-1]],
			[backbez[0]],
			backbez,
			[backbez[len(backbez)-1]],
			[bezier[0]],
			[bezier[0]]
		);

module revolve_bezier_offset_shell(bezier, offset=1, splinesteps=16) {
	revolve_bezier(bezier=bezier_offset(offset, bezier), splinesteps=splinesteps);
}


module extrude_along_bezier(bezier, splinesteps=16) {
	pointslist = [
		for (
			b = [0 : 3 : len(bezier)-4],
			l = [0 : splinesteps-2]
		) let (
			crv = [bezier[b+0], bezier[b+1], bezier[b+2], bezier[b+3]]
		) bez_point(crv, l / (splinesteps-1))
	];

	ptcount = len(pointslist);
	for (i = [0 : ptcount-2]) {
		pt1 = pointslist[i];
		pt2 = pointslist[i+1];
		pt0 = i==0? pt1 : pointslist[i-1];
		pt3 = (i>=ptcount-2)? pt2 : pointslist[i+2];
		dist = distance(pt1,pt2);
		v1 = pt2-pt1;
		v0 = (i==0)? v1 : (pt1-pt0);
		v2 = (i==ptcount-2)? v1 : (pt3-pt2);
		az1 = atan2(v1[1], v1[0]);
		alt1 = (len(pt1)<3)? 0 : atan2(v1[2], hypot(v1[1], v1[0]));
		az0 = atan2(v0[1], v0[0]);
		alt0 = (len(pt0)<3)? 0 : atan2(v0[2], hypot(v0[1], v0[0]));
		az2 = atan2(v2[1], v2[0]);
		alt2 = (len(pt2)<3)? 0 : atan2(v2[2], hypot(v2[1], v2[0]));
		translate(pt1) {
			difference() {
				rotate([0, 90-alt1, az1]) {
					translate([0, 0, -1]) {
						linear_extrude(height=dist*3, convexity=10) {
							children();
						}
					}
				}
				rotate([0, 90-(alt0+alt1)/2, (az0+az1)/2]) {
					translate([0, 0, -dist-0.05]) {
						cube(size=[99,99,dist*2], center=true);
					}
				}
				rotate([0, 90-(alt1+alt2)/2, (az1+az2)/2]) {
					translate([0, 0, dist+dist]) {
						cube(size=[99,99,dist*2], center=true);
					}
				}
			}
		}
	}
}


// vim: noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap
// use <GDMUtils.scad>

filter_diam    = 33.0;  // mm
filter_thick   =  2.0;  // mm
slot_width     =  2.0;  // mm
wall_size      =  2.0;  // mm
descender_drop =  1.5;  // mm
descender_size =  4.0;  // mm
descender_ang  = 30.0;  // deg
standoff_count =  4;

$fa = 2;
$fs = 2;

slots = ceil((filter_diam-2*wall_size) / (slot_width+wall_size));
union() {
	difference() {
		cylinder(d=filter_diam, h=filter_thick, center=true);
		intersection() {
			grid_of(count=slots, spacing=slot_width+wall_size) {
				cube(size=[slot_width, filter_diam, filter_thick+1], center=true);
			}
			cylinder(d=filter_diam-2*wall_size, h=filter_thick+1, center=true);
		}
	}
	zrot_copies(count=standoff_count) {
		translate([(filter_diam-wall_size)/2, 0, filter_thick/2+descender_drop/2]) {
			cube(size=[wall_size, wall_size, descender_drop], center=true);
		}
		translate([(filter_diam-wall_size)/2, 0, filter_thick/2+descender_drop]) {
			translate([wall_size/2, 0, 0]) {
				yrot(-descender_ang) {
					translate([-wall_size/2, 0, descender_size/2]) {
						cube(size=[wall_size, wall_size, descender_size], center=true);
					}
				}
			}
		}
	}
}


// vim: noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap
