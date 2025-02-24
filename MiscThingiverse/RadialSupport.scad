


// Use the OpenScad customizer

  //////////////////////////////
 // Pipe Corner Joint - V1.0 //
//////////////////////////////

/* [Facets] */
$fn=40;             // [10:60]  



/* [Extrude] */
// Extrusion Correction
$EC = 0.4;          // [0:.1:1]



/* [Body] */

// if enabled outer cross section given by $fn) 
ExtRound    = true;

// Number of arms
ArmCount    = 6;     // [3:12]

// Arm Dip angle
DipAngle  = 10;      // [0:90]

// Number of sides to interior hole
TubeCorners = 30;    // [3:60]
Phase     = 0;       // [0:90]

// Thickness of wall if ExtRound = false
WallThick =  5;      // [2:1:20]

// Interior Radius (from center to tip)
IntRad    =  8;   // [1:.01:50]

// Depth of hole from end inward
Depth     = 40;      // [2:1:70]

// Depth of interior plug
PlugDepth = 10;      // [0:40]



/* [Bottom Plate] */ 

BottomEna = true;
B_Thick = 1;      // [0.5:.02:2]
Adjust_R = 1;     // [0:.01:1]
Adjust_H = .75;   // [-1:.01:1]

/* [Cap] */ 
CapEna = true;
CapExtraR = .5;    // [0:.01:1]

/* [Pin] */
PinEna = false;
PinRad = 3;         // [2:.01:10]
PinPos = .75;       // [0:.01:1]
PinPhase = 45;      // [0:180]

OuterRad  = IntRad + WallThick;
InnerRad  = IntRad + $EC;

fn = (ExtRound)? $fn: TubeCorners;


difference() {
   union() {

      if (CapEna) Cap();
      
      //translate([0,0,-h1])
      //cylinder(r=15,h=WallThick+BottomPlate*Depth*cos(DipAngle),$fn=30);
      
      if (BottomEna) BottomPlate();
         
      for (i=[0:360/ArmCount:360]) {
         rotate([0,90+DipAngle,i]) 
         Cyl();         
      }
   }
      
   for (i=[0:360/ArmCount:360]) {
      rotate([0,90+DipAngle,i]) 
      Hole();         
   }

}

function Rotate(V) = [cos(DipAngle) * V.x - sin(DipAngle) * V.y,
                      sin(DipAngle) * V.x + cos(DipAngle) * V.y];

module BottomPlate() {

   V  = Rotate([Adjust_R * (Depth+PlugDepth),Adjust_H * OuterRad]);
   r1 = V.x;
   h1 = V.y;
   echo(V,r1,h1);
   
   
   difference() {
      translate([0,0,-h1])
      union() {
         cylinder(r=r1,h=B_Thick*WallThick,$fn=ArmCount);
         cylinder(r1=r1,r2=0,h=h1,$fn=ArmCount);
      }   
      translate([0,0,-h1-B_Thick*WallThick])
      cylinder(r1=r1,r2=0,h=h1,$fn=ArmCount);
      }
}

module Cap() {
   r= OuterRad*sin(DipAngle)+CapExtraR*PlugDepth;
   
   translate([0,0,OuterRad*cos(DipAngle)]) {
      cylinder(r1=r,r2=0,h=r/4,$fn=ArmCount);
      translate([0,0,-2*OuterRad])
      cylinder(r=r,h=2*OuterRad,$fn=ArmCount);
   }
}


module Cyl() {
   rotate([0,0,Phase]) {
      cylinder(Depth+PlugDepth,r=OuterRad,$fn=fn); 
   }
}


module Hole() {
   rotate([0,0,Phase]) {
   translate([0,0,PlugDepth+.01]) 
   cylinder(Depth,r=InnerRad+$EC,$fn=TubeCorners); 
      
   if (PinEna) {
   
      p = PinRad+PinPos*(Depth-2*PinRad)+PlugDepth;
   
      translate([0,0,p]) 
      rotate([PinPhase,90,0]) 
      cylinder(r=PinRad+$EC,h=OuterRad*2+WallThick*3,center=true,$fn=30);
   }
   }
}
