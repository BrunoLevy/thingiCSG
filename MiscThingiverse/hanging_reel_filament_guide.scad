//               Hanging Reel Filament Guide 
// 
// based on NacoKaoS "Ultimaker 2 Filament Guide Beta V1.3"
// http://www.youmagine.com/designs/ultimaker-2-filament-guide-beta-v1-3
// Licensed under Creative Commons
//
//OpenSCAD modifies the filament guide for wider reel sizes 
// all dimensions adjustable
//  9/22/2016 rob sheldon
//
//========== Adjustable Constants  ==========
// space between uprights
width=78; //in millimeters
// height of uprights
height=95; //in mm
// spool radius
radius=31; //mm
// text appears engraved on bottom
text="78mm Hatchbox Reel";
fontsize=8; // adjust to fit
fontxt="LiberationSansNarrow";
logofont="Wingdings";
logo="W";

// machine constants
eps=.01;
$fs=0.1;
$fa=2; //smaller=smoother circles

// checking the old model
//name1="e:/sheldonr/Desktop/Dad/Torch/3D/reel_holder/";
//name2="ultimaker-2-filament-guide-beta-v1-3/";
//name3="ultimaker2_filament_guide_3_.stl";
//name=str(name1,name2,name3);
//import(name,convexity=8);

//* * * * main * * * * 

rotate([0,0,180])
difference(){
  union(){
//   translate([-width/2,0,0])left_upright(names=name);
    translate([-width/2,0,0])lu();
//   translate([width/2,0,0])right_upright(names=name);
    translate([width/2,0,0])ru();
    translate([0,3,3])cube([width+20,28,6],center=true);
    mg();
//    middle_guide(names=name);
    }
    translate([-6,36,.7]) 
      rotate([180,0,0])
        linear_extrude(height=1) 
            text(text=logo,font=logofont,size=12);
    translate([-width/2-6,6,.7]) 
      rotate([180,0,0])
        linear_extrude(height=1) 
            text(text=text,font=fontxt,size=fontsize);
    translate([0,0,-10])cube([200,200,20],center=true); //flatten-bed
}
module lu(){
  difference(){
    union(){
        translate([-10,-11,0])cube([10,20,height]);
        translate([-10,-.5,height+33.5])rotate([0,90,0])
            cylinder(10,radius+6.5,radius+6.5);
    }
    translate([-11,0,height+33.5])rotate([0,90,0])
            cylinder(12,radius,radius);
   }//end-diff
}
module ru(){
  difference(){
    union(){
        translate([0,-11,0])cube([10,20,height]);
        translate([0,-.5,height+33.5])rotate([0,90,0])
            cylinder(10,radius+6.5,radius+6.5);
    }
    translate([-1,0,height+33.5])rotate([0,90,0])
            cylinder(12,radius,radius);
   }//end-diff
   intersection(){
        translate([0,-.5,height+33.5])rotate([0,90,0])
            cylinder(10,radius+6.5,radius+6.5);
        translate([0,-radius,height+5])cube([10,15,21]);
   }   
}
module mg(){
  difference(){
    union(){
       translate([0,3,3.5])cube([width+20,28,7],center=true);
       translate([0,23,3.5])cube([27,48,7],center=true);
       hull(){
         translate([0,45,7])cube([27,4,14],center=true);
         translate([0,45,16])rotate([90,0,0])
            cylinder(4,13.5,13.5,center=true);
       }
    }
    translate([0,45,16])rotate([90,0,0])
        cylinder(5,7,7,center=true);  
    }
  translate([0,45,7])cube([27,4,14],center=true);
}
    
/* slice-n-dice an STL model
module left_upright(names="?"){
translate([30,0,0])
    difference(){
        import(names,convexity=8);
        translate([10,0,140-eps])
            cube([80,180,280],center=true);
}//end-diff
}

module right_upright(names="?"){
translate([-30,0,0])
    difference(){
        import(name,convexity=8);
        translate([-10,0,140-eps])
            cube([80,180,280],center=true);
}//end-diff
}
module middle_guide(names="?"){
intersection(){
import(name,convexity=8);
translate([0-eps,0,40])
    cube([50,180,80],center=true);
}//end-int
}
*/