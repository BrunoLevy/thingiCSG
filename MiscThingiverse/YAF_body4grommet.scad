//      Yet-Another-Ultimaker-2-Feeder body for grommet
/* 
/modifies the YAUM2 v5 body by splicing in |Robert| v6 grommet holder
/ and cutting a slot to move the electrical cable around feeder
/ inludes a built-in clamp for routing the wire to the right of feeder
/ added pmdude version of v6 yoke with integrated filament guide
/ Text & logo added  9/27/2016 rob sheldon
/
/========== Adjustable Constants  ==========*/
// extruder label
xtrudertext="|Robert|+sfriedri";
//3mm space to thread wires behind feeder
space=3; 
// yoke label
yoketext="34/3mm pmdude";
//35mm is the default yoke length
long=34;
//8mm is the default yoke width 
wid=8;   
// filament offset (to avoid feeder gear)
offset=3;

translate([-40,31,0])yoke_n_hub();
body4grommet();
translate([50,-65,0])rotate([0,0,140])arm();

module body4grommet(){
fontsize=3; // adjust to fit
fontxt="LiberationSansNarrow";
logofont="Wingdings";
logo="W";
$fs=.2;
$fa=3;

// loading the two STL files
name1="NO_PRINT_feeder_body_for_grommet.stl";//STL from |Robert|
name2="NO_PRINT_feeder_body.stl"; //STL from sfriedri
rname=name1;
sname=name2;

difference(){
 union(){
  intersection(){
//    difference(){
   import(rname,convexity=8); //load |Robert| STL model
   translate([0,10,-1])cube([31.3,60,30]); //mask in
  }//end-diff
  difference(){
//   intersection(){
   translate([-6.2,-52.4,0])  //align the two models
     import(sname,convexity=8); //load sfriedri STL 
   translate([0,10,-1])cube([30,60,30]);  //mask out
   hull(){  //electrical cable thru
    translate([30,3,3])cube([2,7,15]);
    translate([40,3,3])cube([2,10,15]);
    }
    difference(){
        translate([31,6,3])cube([12,9.5,15]);
        translate([37,17.5,2])cylinder(14.5,5,5);
    }
  }//end-diff
 }//end-union
    translate([26.9,-12.42,2.5]) //clean up the top post
      difference(){
         cylinder(11,5,5);
         cylinder(12,3.45,3.45);
      }
    translate([3.8,-42.42,2.5]) //clean up the bottom post
      difference(){
         cylinder(11,5,5);
         cylinder(12,3.45,3.45);
      }
    translate([19,51,.4])  //engrave logo
      rotate([0,0,180])rotate([180,0,0])
        linear_extrude(height=1) 
            text(text=logo,font=logofont,size=8);
    translate([8,-40,.4])  // engrave text
      rotate([0,0,53])rotate([180,0,0])
        linear_extrude(height=1) 
            text(text=xtrudertext,font=fontxt,size=fontsize);
    translate([0,0,-10])cube([200,200,20],center=true); //flatten-bed
}//end-diff
}

module arm(){
//      Yet-Another-UltiMaker-2-Feeder guide arm
// 
//OpenSCAD modifies YAUM2 feeder arm adding cable holder 
// Text & logo added  9/27/2016 rob sheldon
//
fontsize=3; // adjust to fit
fontxt="LiberationSansNarrow";
logofont="Wingdings";
logo="W";
$fs=.2;
$fa=3;
// the STL file (fixed, original wouldn't print)
name3="NO_PRINT_feeder_guide_arm.stl"; //STL from sfriedri (repaired)
sname=name3;

difference(){
 rotate([0,0,180])translate([0,0,2.5])rotate([0,180,0])
  union(){
     translate([31,85,2.5])rotate([0,0,-1])rotate([180,0,0])
     intersection(){
      difference(){
       cylinder(11,space+23.5,space+23.5);
       translate([0,0,2.49])cylinder(12.5,space+21.5,space+21.5);
      }//end-difference
      translate([22.5+space/2,0,7.9])cube([10+space,24,16],center=true);
     }//end-int
    import(sname,convexity=15); //load sfriedri STL 
 }//end-union
// label by engraving the back
 union(){
    translate([space/2+46.5,-80,.5])  //engrave logo
      rotate([0,0,0])rotate([180,0,0])
        linear_extrude(height=1) 
            text(text=logo,font=logofont,size=8);
    translate([16,-13,.5])  // engrave text
      rotate([0,0,-55])rotate([180,0,0])
        linear_extrude(height=1) 
            text(text=xtrudertext,font=fontxt,size=fontsize);
    translate([0,0,-10.01])cube([300,400,20],center=true); //flatten-bed
 }//end-union
}//end-diff
}

//      Yet-Another-UltiMaker-2-Feeder v6 yoke
/*        from pmdude
/ 
/OpenSCAD modifies pmdude v6 feeder yoke for any length, width, and tip position
/ Text & logo added  9/27/2016 rob sheldon
/ 
/========== Adjustable Constants  ==========*/

module yoke_n_hub(){
$fs=.05; //make smooth circles
$fa=2;   //with lots of facets
fontsize=3; 
fontxt="LiberationSansNarrow"; //fits more text in the space
logofont="Wingdings";
logo="W"; // in Wingdings font it is a celtic cross

// the STL file (repaired, b/c original didn't print)
name4="NO_PRINT_feeder_v6_yokeAndHub_guide.stl"; //STL from pmdude (fixed)
sname=name4;
    
difference(){
 union(){
   translate([0,0,0])intersection(){ //the hole for the bolt
     translate([0,5,10])rotate([180,0,0])import(sname,convexity=15); //load pmdude STL 
     translate([15,1,7])cube([10,7,16],center=true);
   }
   translate([0,(7-wid)/2,0])intersection(){ //near back
     translate([0,5,10])rotate([180,0,0])import(sname,convexity=15); //load pmdude STL 
    translate([25,-4,7])cube([30,7,16],center=true);
   }
   translate([0,(wid-7)/2,0])intersection(){ //far back
     translate([0,5,10])rotate([180,0,0])import(sname,convexity=15); //load pmdude STL 
     translate([25,6,7])cube([30,7,16],center=true);
   }
   translate([long-35,(7-wid)/2,0]) //near tip
    intersection(){
     translate([0,5,10])rotate([180,0,0])import(sname,convexity=15); //load pmdude STL 
     translate([38,-4,7])cube([28,7,16],center=true);
   }
   translate([long-35,(wid-7)/2,0]) //far tip
    intersection(){
     translate([0,5,10])rotate([180,0,0])import(sname,convexity=15); //load pmdude STL 
     translate([38,6,7])cube([28,7,16],center=true);
   }
   translate([long-35,(7-wid)/2,offset]) // offset tip front
    intersection(){
     translate([0,5,10])rotate([180,0,0])import(sname,convexity=15); //load pmdude STL 
     translate([64,-4,7])cube([26,9,16],center=true);
   }
   translate([long-35,(wid-7)/2,offset]) // offset tip back
    intersection(){
     translate([0,5,10])rotate([180,0,0])import(sname,conveity=15); //load pmdude STL 
     translate([64,6,7])cube([26,9,16],center=true);
   }   
   translate([0,0,0]) //this is the hub that seemed distorted so we stretched it
    intersection(){
     scale([1.06,1,1])import(sname,convexity=15); //load pmdude STL 
     translate([4,4,7])cube([10,16,16],center=true);
   }
   #translate([14,(7-wid)/2+8.6,6])  // emboss text
      rotate([-90,0,0])
        linear_extrude(height=1) 
            text(text=yoketext,font=fontxt,size=fontsize);
 }//end-union

 union(){
    translate([9.5,1.0,5])rotate([0,90,0])cylinder(8,1.8,1.8); //hole in yoke opened up
    translate([4.28,4.05,-1])cylinder(9,1.8,1.8); //hole in washer opened up
    translate([4.28,4.05,-1]) //outer washer trimmed to fit more loosely
      difference(){
         cylinder(8,5,5);
         cylinder(8,3.9,3.9);
      }//end-diff 
    translate([22,(wid-7)/2-7.5,8.5])  //engrave logo
      rotate([-90,0,0])
        linear_extrude(height=1) 
            text(text=logo,font=logofont,size=7);
        //flatten-bed
    translate([0,0,-10.01])cube([300,400,20],center=true); 
 }//end-union
}//end-diff
}



