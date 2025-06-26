/***************************
# Introduction

This OpenSCAD module allows for rotational extrusion of generic user-defined profiles,
introducing a pitch in the longitudinal direction, the most common application being
the creation of screws. 
The solid is built as a single polyhedron by transforming the 2D points found in the
profile vector. No boolean operation is necessary, aiming at obtaining the ultimate
performance by producing the simplest possible object for the desired level of detail.

# Arguments
```
revolve(profile = [[]], length, nthreads=1, scale=1,
        preserve_thread_depth=false, preserve_thread_shape=false,
        $fn=$fn, force_alternate_construction=false)
```
* `profile` vector of 2D points defined as: $\big[[z_1, f(z_1)], [z_2, f(z_2)] \dots [z_n,f(z_n)]\big]$.
  $f(z)$ is defined over a closed interval (including the extremes) representing one period of the
  thread; it describes the shape of the thread with no fundamental restriction, that means that
  a square profile can be defined exactly, with points sharing the same $z$. Dovetail-like profiles
  are also possible.
  The shape of the profile can be made finer by adding more points. The `linspace` helper 
  function might be used to create the profile from a mathematical function (see example below).
* `length` how far to go in the longitudinal direction, note that the mesh size increases
  linearly with this parameter.
* `nthreads` allows the creation of screws with multiple threads, it should be an integer.
  Negative values are also accepted, generating left threads.
  `nthreads=0` results in no pitch, similar to `rotate_extrude`.
* `scale` enable scaling in the longitudinal direction: the top faces will be
  scale-times larger than the bottom one. Similar to scale in linear_extrude,
  however this only accepts a scalar value in the interval $]0, +\infty[$.
* `preserve_thread_depth` allows preserving the depth of the thread which otherwise
   may be "flattened". Only useful if `scaling != 1`.
* `preserve_thread_shape` allows preserving the shape of the thread. When `true`, it
  overrides `preserve_thread_depth`. Only useful if `scaling != 1`.
* `$fn`: the number of subdivisions in the angular direction, similar to $fn for a cylinder. 
  In the longitudinal direction the number of subdivisions is controlled directly by
  the number of points in the profile.
  Note that if this parameter is too small, it might be necessary to cut the thread faces,
  this will be accomplished by triggering the alternate construction.
* `force_alternate_construction` The alternate construction allows for properly cutting
  the top and bottom faces when these intercept the thread. This is typically needed when
  the number of angular steps is small and/or the number of threads is large and/or
  depending on the thread profile. The switch to  the alternate construction is handled
  automatically (an info message is echoed when this happens). If you know that your design
  will need the alternate construction, you may force it here making the code slightly faster.

# Example 
```
***************************/

// A sinusoidal profile function...
period = 3;
function prof_sin(z) = [z, 10+sin(z*360/period)];
// ...which becomes a profile vector with the help of linspace
sin_prof = [for (z=linspace(start=0, stop=period, n=15)) prof_sin(z)];
revolve( sin_prof, length=30, nthreads=2, $fn=30);

// Scale demo
// A square profile defined manually
sqr_prof = [[0,11],[2,11],[2,9],[4,9],[4,11]];
intersection() {
  translate([-20,10,-10]) cube([20,100,50]);
  union () {
    color("red") translate([0,30]) 
      revolve( sqr_prof, length=30, scale=0.2, nthreads=-1, $fn=30);
    color("blue") translate([0,60])
      revolve( sqr_prof, length=30, scale=0.2, preserve_thread_depth=true, nthreads=-1, $fn=30);
    color("green") translate([0,90])
      revolve( sqr_prof, length=30, scale=0.2, preserve_thread_shape=true, nthreads=-1, $fn=30);
  }
}

// To reproduce the sample STL:
// rotate([0,0,180]) revolve_demo_scene();

/***************************
```
# Licence

This OpenSCAD module was written by Dario Pellegrini `pellegrini dot dario at gmail dot com`
It is released under the Creative Commons Attribution (CC BY) licence v4.0 or later.
https://creativecommons.org/licenses/by/4.0/

# Changelog

2018/11/14 Released v2.0 - code almost entirely rewritten, for better clarity, stability,
           performance and added functionalities.
2018/11/09 Released v1.0

***************************/

// Vector generation
function linspace(start,stop, n) = let (step=(stop-start)/(n)) 
  concat( [ for (i = [0:1:n-step/2]) start+i*step], stop);
function range(start,step,stop) = [ for (i=[start:step:stop]) i ];

// Operations of vectors
function front(v) = v[0];
function back(v) = v[len(v)-1];
function reverse(v) = [for (i=[len(v)-1:-1:0]) v[i]];
function empty(v) = len(v)==0;
function flatten(v) = [ for (a = v) for (b = a) b ] ;
function make_circular(v) = concat(v, [front(v)]);
function pos(v, p, L=-1, R=-1) = //binary_search (v must be sorted)
  L == -1 ? pos(v, p, 0, len(v)-1) :
  L <= R ? let( i = floor((L + R) / 2))
  v[i] < p ? pos(v, p, i + 1, R) :
  v[i] > p ? pos(v, p, L, i - 1) :
  i : -1;
function cum_sum(v, r=[0], i=0) =
  len(r)==len(v) ? r : cum_sum(v, concat(r, back(r)+v[i]), i+1);

// helper functions for dealing with raw_points = [index, x, y, z]
function raw2pt(ipt) = [ipt[1],ipt[2],ipt[3]];
function raw2z(ipt) = ipt[3];
function set_raw_z(ipt,z) = [ipt[0], ipt[1], ipt[2], z];
function raw2indx(ipt) = ipt[0];
function raw_pts2pts (raw_pts) = [ for (col=raw_pts) [for (pt=col) raw2pt(pt) ]];
function raw_pts2indx(raw_pts) = [ for (col=raw_pts) [for (pt=col) raw2indx(pt) ]];

// Geometric operations
function rotate_2D(p, a=0) = concat(
  [cos(a)*p.x-sin(a)*p.y, sin(a)*p.x+cos(a)*p.y],
  [for (i=[2:1:len(p)-1]) p[i]]);
function lookup_2D(pts, z) = 
  let(x=[for (p=pts) [p[2],p[0]]], y=[for (p=pts) [p[2],p[1]]])
    [lookup(z,x), lookup(z,y), z];
function do_scale(r, z, table) = r*max(-1e3, lookup(z,table));

// Manipulations of the list of points
function trim_bottom(raw_pts, val) =
  concat([ for (i=[0:1:len(raw_pts)-2]) if ( raw2z(raw_pts[i+1])>val+1e-9 )
    (raw2z(raw_pts[i])<val) ? 
      concat(raw2indx(raw_pts[i]), lookup_2D([raw2pt(raw_pts[i]),raw2pt(raw_pts[i+1])], val)) : raw_pts[i]
  ], [back(raw_pts)]);
    
function trim_top(raw_pts, val) =
  concat([ for (i=[len(raw_pts)-1:-1:1]) if ( raw2z(raw_pts[i-1])<val-1e-9 ) 
    (raw2z(raw_pts[i])>val) ? 
      concat( raw2indx(raw_pts[i]), lookup_2D([raw2pt(raw_pts[i-1]),raw2pt(raw_pts[i])], val)) : raw_pts[i]
  ], [front(raw_pts)]);

function trim(raw_pts, b, t) = 
  [ for (col=raw_pts) reverse(trim_top(trim_bottom(col, b), t)) ];

function add_bottom_top(raw_pts, minz, maxz) = 
  [for (col=raw_pts) let(b=front(col), t=back(col))
    concat([[b[0]-1,b[1],b[2], minz]], col, [[t[0]+1,t[1],t[2], maxz]]) ];

// Helpers for triangulation
function filter_indx(fcs, indx) = 
  [for (fc=fcs) [for (pt=fc) let(j=pos(indx,pt)) if (j!=-1) j]];

function split_square(v,normal=true) = normal ?
  [[v[0],v[1],v[3]], [v[1],v[2],v[3]]] :
// change the splitting diagonal to reduce face stretching
  [[v[0],v[2],v[3]], [v[0],v[1],v[2]]] ;  

function filter(fcs, indx, normal) = let(tmp=filter_indx(fcs,indx))
  flatten([for (f=tmp) if (len(f)>=3) len(f)==3 ? [f] : split_square(f,normal)]);
    
function make_bottom_top_fcs(indx) = let(lns=[for (i=indx) len(i)])
  [cum_sum(lns,[0]), reverse(cum_sum(lns,[front(lns)-1],1))];
  
function expected_n_fcs(indx, n=0, i=0) = 
  i == len(indx) ? n+2 :
    expected_n_fcs(indx, n+len(indx[i])+(i==0?len(back(indx)):len(indx[i-1]))-2, i+1);

// revolve module
module revolve(profile = [[]], length, nthreads=1, scale=1,
               preserve_thread_depth=false, preserve_thread_shape=false,
               $fn=$fn, force_alternate_construction=false) {
                 
  // Extend the profile to accomodate the required length and number of threads
  period = back(profile)[0]-front(profile)[0];
  profile_ext = let( Nz = len(profile), 
    zps = nthreads > 0 ?
      range(-period*(nthreads+1),period,length):
      range(-period,period,length-period*nthreads)
    ) concat(
      [for (zp = zps) for ( np=[0:1:Nz-2]) [ profile[np][0]+zp, profile[np][1]]],
      [[ profile[Nz-1][0]+back(zps), profile[Nz-1][1]]] 
    );

  // Prepare some auxiliary variables
  minZ = min([for (p=profile_ext) p[0]])-1+(nthreads<0 ? period*nthreads : 0);
  maxZ = max([for (p=profile_ext) p[0]])+1+(nthreads>0 ? period*nthreads : 0);
  Nz = len(profile_ext)+1;
  z0 = profile[0][0];
  minR = min([for (p=profile) p[1]]);
  maxR = max([for (p=profile) p[1]]);
  Na = ($fn==undef || $fn<3) ? max(5, maxR*max(abs(scale),1)) : $fn;
  stepa = 360/Na;
  scale_table = [[z0,1],[z0+length, scale]];
  maxS = max(scale,1);
  
  // Compute the vector of points
  raw_pts = add_bottom_top(
    [for (an=[0:1:Na-1]) [for (pn=[1:1:Nz-2])
      let(ai=an*stepa, zi=profile_ext[pn][0]+an*period*nthreads/Na, ri=profile_ext[pn][1],
        r_z = scale==1? [ri,zi] : 
          preserve_thread_shape ?
            rotate_2D([ri,zi], atan(minR*(1-scale)/length)) :
          preserve_thread_depth ?
            [do_scale(minR, zi, scale_table)+ri-minR, zi] :
            [do_scale(ri, zi, scale_table), zi],
        r = r_z[0], z = r_z[1]
      )
      if (r>0) concat(pn+an*Nz, rotate_2D([r, 0, z], ai))]],
    minZ, maxZ);
 
  // Extract the vector of indexes
  raw_indx = raw_pts2indx(raw_pts);

  // Compute the faces
  raw_fcs = concat( 
    [for (col=[0:1:Na-2]) for (row=[0:1:Nz-2]) [
      raw_indx[col][row], raw_indx[col][row+1],
      raw_indx[col+1][row+1], raw_indx[col+1][row] 
    ]],
    nthreads>=0 ?
    concat(
      //last side, 4-point faces
      [for (i=[0:1:Nz-nthreads*(len(profile)-1)-2])
        [raw_indx[Na-1][i], raw_indx[Na-1][i+1], 
         raw_indx[0][i+nthreads*(len(profile)-1)+1],
         raw_indx[0][i+nthreads*(len(profile)-1)]]],
      //bottom connection, 3-point faces
      [for (i=[0:1:nthreads*(len(profile)-1)-1]) 
        [raw_indx[Na-1][0], raw_indx[0][i+1],raw_indx[0][i]]],
      //top connection, 3-point faces
      [for (i=[Nz-nthreads*(len(profile)-1)-1:1:Nz-2]) 
        [raw_indx[Na-1][i], raw_indx[Na-1][i+1],raw_indx[0][Nz-1]]]
      ) :
    concat(
      //last side, 4-point faces
      [for (i=[0:1:Nz-nthreads*(1-len(profile))-2])
        [raw_indx[Na-1][i+nthreads*(1-len(profile))],
         raw_indx[Na-1][i+nthreads*(1-len(profile))+1],
         raw_indx[0][i+1], raw_indx[0][i] ]],
      //bottom connection, 3-point faces
      [for (i=[0:1:nthreads*(1-len(profile))-1]) 
        [raw_indx[Na-1][i], raw_indx[Na-1][i+1],raw_indx[0][0]]],
      //top connection, 3-point faces
      [for (i=[Nz-nthreads*(1-len(profile))-1:1:Nz-2]) 
        [raw_indx[Na-1][Nz-1], raw_indx[0][i+1],raw_indx[0][i]]]
      )
  );

  if (force_alternate_construction) {
    revolve_alternate_construction(raw_pts, raw_fcs, nthreads, maxR*maxS, z0, length);
  } else {
    trim_raw_pts = trim(raw_pts,z0,z0+length);
    trim_indx = raw_pts2indx(trim_raw_pts);
    trim_fcs = concat(filter(raw_fcs, flatten(trim_indx), normal=(nthreads>=0)),
                      make_bottom_top_fcs(trim_indx));

    n_fcs = len(trim_fcs);
    exp_n_fcs = expected_n_fcs(trim_indx);
    if (n_fcs < exp_n_fcs) {
      //echo(str("REVOLVE INFO: the number of computed faces (", n_fcs, ") is smaller than the expected number of faces (",exp_n_fcs,"). Using alternate construction to allow for face splitting."));
      echo(str("REVOLVE INFO: Using alternate construction."));
      revolve_alternate_construction(raw_pts, raw_fcs, nthreads, maxR*maxS,  z0, length);
    } else {
      trim_pts = flatten(raw_pts2pts(trim_raw_pts));
      polyhedron( points = trim_pts, faces = trim_fcs, convexity=10);
 //     plot_indx(trim_pts);
    }
  }
}

module revolve_alternate_construction(raw_pts, raw_fcs, nthreads, maxR, z0, length) {
  indx = raw_pts2indx(raw_pts);
  pts  = flatten(raw_pts2pts(raw_pts));
  fcs  = concat(filter(raw_fcs, flatten(indx), normal=(nthreads>=0)),
               make_bottom_top_fcs(indx));
  intersection() {
    polyhedron( points = pts, faces = fcs, convexity=10);
    translate([0,0,z0]) cylinder(r=maxR+1, h=length);
  } 
//  plot_indx(pts);
}

module revolve_demo_scene() {
  // A square profile vector defined manually
  sq_prof = [[0, 11], [0, 9], [2, 9], [2, 11], [4, 11]];
  translate([0,-5]) rotate([-81,0]) translate ([0,-11/sqrt(2)]) difference() {
    revolve( sq_prof, length=40, nthreads=-2, scale=2, preserve_thread_shape=true, $fn=30);
    translate([0,0,-1]) rotate([0,0,45]) cube(110);
  }
  
  // A dovetail profile vector defined manually
  dt_prof = [[0, 6], [2*2/5, 6], [2*1/5, 5], [2*4/5, 5], [2*3/5, 6], [2, 6]];
  
  translate([28,22,0]) intersection() {
    translate([0,0,5]) sphere(r=10.5);
    difference() {
      cylinder(r=10,h=10, $fn=6);
      translate([0,0,-1]) revolve( dt_prof, length=12, $fn=30);
      translate([2,5,4]) rotate([0,0,15]) cylinder( r=10, h=12, $fn=3 );      
    }
  }

  // Puzzle piece profile
  pz_prof = [[0, 50], [10, 50], [12.8, 50.7], [14.6, 51.7], [15.1, 53], [14.9, 54.5], [13.8, 56.3], [11.6, 58.4], [10.3, 60.6], [10.4, 62.7], [11.4, 64.7], [13, 66.5], [15.3, 68], [18, 69.1], [21.2, 69.8], [25, 70], [28.8, 69.8], [32, 69.1], [34.7, 68], [37, 66.5], [38.6, 64.7], [39.6, 62.7], [39.7, 60.6], [38.4, 58.4], [36.2, 56.3], [35.1, 54.5], [34.9, 53], [35.4, 51.7], [37.2, 50.7], [40, 50], [50, 50]];

  translate([20,0,-1.5]) rotate([0,-30]) translate([70*0.2,0]) rotate([0,0,60]) scale(0.2) difference() {
      revolve( pz_prof, length=250, nthreads=3, $fn=45);
      rotate([0,0,-30]) translate([10,10,150]) cube(500);
  }
}

//debugging module - use only with F5!!
//module plot_indx( pts) 
//  for(i=[0:1:len(pts)-1])
//  let(x=pts[i][0], y=pts[i][1], z=pts[i][2], r=sqrt(x*x+y*y), phi=atan2(y,x))
//  rotate([0,0,phi]) translate([r+0.5,0,z]) rotate([90,0,90])
//  color("red") linear_extrude(0.02) scale(0.05)
//  text(str(i), valign="center", halign="center", $fn=4);