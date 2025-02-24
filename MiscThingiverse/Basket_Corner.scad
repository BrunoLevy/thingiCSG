
// Use the OpenScad customizer

  //////////////////////////////////
 // Basket Corner Support - V1.0 //
//////////////////////////////////




/* [Facets] */
$fn=30;              // [10:60]

/* [Extrude] */
// Extrusion Correction
$EC = 0.4;          // [0:.1:1]



/* [Body] */

// if enabled outer cross section given by $fn) 
ExtRound    = true;

// Adjustable top connector (compatible with Adjustable Elbow)
FlexTop     = true;

// Bottom connector
Bottom      = true;

// Number of sides to interior hole
TubeCorners = 30;    // [3:60]

// Angle of interior hole
Phase       = 0;     // [0:90]

// Thickness of wall if ExtRound = false
WallThick   =  4;    // [2:1:20]

// Interior Radius (from center to tip)
IntRad      =  8;    // [1:.01:50]

// Depth of hole from end inward
Depth       = 20.0;  // [2:1:70]

InsideAngle = 120;   // [20:180]



/* [Pin] */
PinEna = false;

// Radius of pin
PinRad = 3;         // [2:.01:10]

// Placement of pin along shaft

PinPos = .785;       // [0:.01:1]

// * Pin angle
PinPhase  = 45;        // [0:90]


fn = (ExtRound)? $fn: TubeCorners;

OuterRad  = IntRad + WallThick;
InnerRad  = IntRad + $EC;

SegH  = Depth+OuterRad; 
IA2 = 90-InsideAngle/2;


difference() {
   union() {
      if (!FlexTop) {
         Cyl();
      } else {
         Support();
      }
      if (Bottom) {
         mirror([0,0,1]) Cyl();
      } else {
         translate([0,0,-OuterRad])  
         Cyl1();
      }
      
      rotate([90,0,-IA2]) Cyl(); 
      rotate([-90,0,IA2]) mirror([0,1,0]) Cyl();

   }
   if (!FlexTop) Hole();
   if (Bottom) mirror([0,0,1]) Hole();
   rotate([90,0,-IA2]) Hole();
   rotate([-90,0,IA2]) mirror([0,1,0]) Hole();
}


module Support() {
   Cyl1();
   translate([0,0,OuterRad*2+Depth]) 
   mirror([0,0,1])
   difference() {
      Cyl();
      
      // clip bottom 
      translate([-OuterRad-1,0,-.01])
      cube(2*[(OuterRad+1),OuterRad,OuterRad+$EC]);

      translate([-OuterRad-1,-OuterRad*2.8,-.01])
      cube(2*[(OuterRad+1),OuterRad,OuterRad+$EC]);
      
      // Pinholw
      translate([0,0,OuterRad])
      rotate([90,0,0])
      cylinder(r=PinRad,h=OuterRad*4,center=true,$fn=30);
      
      // Round Bottom
      difference() {
         cube([2*OuterRad+1,4*OuterRad,2*OuterRad],center=true); 
     
         translate([0,0,OuterRad])
         rotate([90,0,0])
         cylinder(r=OuterRad,h=OuterRad*3,center=true);
         
      }
   }
}


module Cyl1(H=OuterRad){
   
   rotate([0,0,Phase]) 
      cylinder(h=H,r=OuterRad,$fn=fn); 
      
}

module Cyl(){
      
   rotate([0,0,Phase]) 
      cylinder(SegH,r=OuterRad,$fn=fn); 
      
}


module Hole(){
   rotate([0,0,Phase]) {
      translate([0,0,OuterRad]) 
      cylinder(SegH+5,r=InnerRad+$EC,$fn=TubeCorners); 
         
      if (PinEna) 
         translate([0,0,OuterRad+PinRad+$EC+PinPos*(Depth-(PinRad+$EC)*2)]) 
         rotate([45,90,Phase]) 
         cylinder(r=PinRad+$EC,h=OuterRad*4,center=true,$fn=30);
   }
}
