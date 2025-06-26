// globoidworm.scad: Rudolf Huttary, Berlin (c) 
// version 15.1.2018
// 
// non commercial use, attribution (contact for license) 

use <lib/shortcuts.scad>  // help_shortcuts() and https://www.thingiverse.com/thing:644830
use <lib/Naca_sweep.scad> // help_Naca_sweep() and https://www.thingiverse.com/thing:900137
// help_Naca_sweep();
// help_shortcuts();

/////////////////////////////////////////////////
// Parameter section: choose values and adjust design carefully
// ratio
i = 20;          // gear ratio (4 <= i <= 100) slow render with high values
k = 1;           // # threads   (keep low) 
z = i*k;         // # teeth of wormgear (don't alter) !! CPU time grows with z !!
N = 20;          // refinement of donut for cutting worm and gear (default = 20)

// gear shape
m = 2;           // modulus (default = 2) better use scale() for resize
w = 20;          // attack angle (default = 20) 

// worm
min_r = 11;      // pitch circle radius of worm (default = 11)
max_r = 15;      // outer circle radius of worm (default = 15)
shaft_w = 2.5;   // shaft radius of worm
shaft_wn = 6;    // #edges of shaft bore
L = .9*m*z;     // length of worm, adjust factor for low and high ratio
cr = z+min_r;    // outer cycle radius for carving (don't alter)

// wormgear
h = 11;          // height of wormgear (default = 11) 
eng_t = 4.5;       // adjust to # of properly engaged theeth (proper render)
shaft_g = 2.5;   // shaft radius of worm gear
shaft_gn = 6;    // #edges of shaft bore 
clearance = .2;  // clearance (mm) of wormgear default (0.2)

// bracket()     // just to be complete
d = 2;           // bracket fatness (default = 2)


////////////////////////////////////////////////////////////
// production code section, uncomment one line only
// worm();  
// wormgear(); 
 system(); // bracket();   // full system 

////////////////////////////////////////////////////////////////
// test code section, uncomment one line only
// sweep (half(clearance = .1)); // donut
// polygon(gear2D());  // tool for cutting worm
// tooth(); //cube(1, center = true);  // -> warning, export looks OK for Kisslicer 
// system($t*360); // bracket();   // Animation
echo (pitch_diameter_of_wormgear = z*m); 


module system(ang = 0) // full system (F5), alter ang for animation
{
  C("gold")Ry(ang)worm(); 
  C("lightblue")T(cr)Rz(ang/i)wormgear(); 
}

module wormgear(stl=0) // F6-render can take long. 
{                      // building wormgear with import can be faster
  D()
  {
    forN(0, z) // compose z teeth
    if(stl) import(stl); 
    else       tooth(); 
      Cy(shaft_g, h+1, $fn=shaft_gn); 
  }
}

module tooth(sector = 30) // 2-phase trimming of pie with 
{                         // properly rotated worm sector
  eg = eng_t/2;           // timming angle
  dw = 360/z; 
  i = 0; 
  D()
  {
     CyS((z+3)/2*m, h, 179.9-dw/2, 180.1+dw/2);   // tooth blank 
     Cy(shaft_g/2, h+1, $fn=shaft_gn);  // half shaft to avoid singularity
     for(i=[-eg, eg])  // trimming phases
      Rz(i*dw) T(-cr) 
      D()
      {
        R(90)Cy(max_r+5, 2*(z+1), $fn = 100); // worm blank
        Ry(-i*360)sweep(half(-i*360-sector, -i*360+sector, N=ceil(N/3)));  // worm sector
      }
  }
}

module worm(N=N)
{ 
  D()
  {
    R(90)Cy(max_r, L);  // worm blank
    R(90)Cy(shaft_w, L+1, $fn=shaft_wn);  // shaft
    sweep(half(N=N, clearance = clearance)); // half donut
    sweep(half(90, 270, N=N, clearance = clearance)); // half donut 
  }
}

module bracket(gap = 1.5) // just for completeness
{
  L_ = max(m*(z+2), L);
  T(cr/2)
  D()
  {
    Cu(1.7*cr, L_+2*d+gap, h+2*d+gap); 
    Cu(3*cr, L_+gap, h+gap); 
    T(-cr/2-2) Cu(2*max_r-gap+4, L_+gap, 2*h); 
    T(-cr/2)  
    {
      R(90)Cy(shaft_w, 2*L, $fn=20);  
      T(cr)Cy(shaft_g, 2*h, $fn=20);
    } 
  }
}

// functions 
// generate part of a donut
function half(start=-90.1, end=90.1, N=20, clearance = 0) = let(dw = (end-start)/N)
  [for(I=[0:N]) let(w = start+I*dw) 
    Ry_(w,Tx_(cr, Rz_(w/i, Rz_(90, vec3D(gear2D(z=z, m=m, clearance = clearance))))))];   

function gear2D(z = 10, m = 1, clearance = 0.01) =  // generate gear polygon
  let (dw = 360/z*tan(w/2)) 
  let (u = [0, 180/z-dw, 180/z, 360/z-dw])
  let (r0 = (z-2)*m/2, r1 = (z+2)*m/2)
  let (r =[r0+clearance, r0+clearance, r1+clearance, r1+clearance])
    [for(i=[0:z-1], j=[0:3])
      let(w_ = (4*i+1)*90/z+dw/2)
      r[j]*[sin(w_+u[j]), cos(w_+u[j])]]; 
