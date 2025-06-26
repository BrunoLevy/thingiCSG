use <MCAD/involute_gears.scad>

// preview[view:west, tilt:top]

// user parameters
// number of holes =
Holes = 5; // [2:20]

// Bent Arm = 'true' or 'false'
Bend = true; // 

// Shaft Clearance. If you are printing with flexible material leave this set to zero. If you are printing with a hard filament then set this to .15
clearance = 0;
      
//Are you making gripper arms or a flag mount?
Configuration = "gripper"; // 'gripper' or 'flag' 

      
      
//*HIDDEN*//

// Height of the block. A ratio of "1" is a standard LEGO brick height; a ratio of "1/3" is a standard LEGO plate height; "1/2" is a standard DUPLO plate.
block_height_ratio = 2/3;

//Constants
Pitch = 8*1.0; //hole spacing
Radius1 = 5.0/2; //thru hole radus
Radius2 = 6.1/2; //countersunk hole radius
Height = 9.6*block_height_ratio;
Depth = 0.85*1.0; //depth of beam hole counterbore
Width = 7.3*1.0; 
 

//Length of arms
arm_length = (Holes-1) * Pitch;
	
//Width of arms		
arm_width = 9;//[5:15]

//Number of teeth on the small gears
Gear_Teeth = 12;


//Space between gear teeth (smaller is tighter.)
Gear_Pitch = 215;
Gear_thickness = Height;



$fn=100;

FinishGear1();
//translate([25,0,0])rotate([0,0,-45])mirror([1,1,0])Finish();
    

if (Configuration == "gripper"){
translate([20,0,0])rotate([0,0,-90])mirror([1,1,0])FinishGear2();
} 

    
module FinishGear1(){
   difference(){
     union(){
         GearArmL(arm_length);
         cylinder(r=3,h=Gear_thickness,center=false);
       }
    translate([0,0,-.01])cylinder(r=2.2+clearance,h=Gear_thickness*2/3,center=false); //Larger thru hole in gear center
       cylinder(r=1.2,h=Gear_thickness+.01,center=false); //Tiny thru hole for servo mount shaft in gear center
 }  
}
  
module FinishGear2(){
   difference(){
     union(){
         GearArmR(arm_length);
         cylinder(r=3,h=Gear_thickness,center=false);
       }
       //Larger thru hole in gear center
    translate([0,0,-.01])cylinder(r=2.2+clearance,h=Gear_thickness*2/3,center=false); 
       //Tiny thru hole for servo mount shaft in gear center
       cylinder(r=1.2,h=Gear_thickness+.01,center=false); 
 }  
}

module GearArmL(l=arm_length) {
	rotate([0,0,90])
		union(){
               if (Configuration == "gripper"){
                difference(){
                gear (number_of_teeth=Gear_Teeth,
								circular_pitch=Gear_Pitch,
								gear_thickness = Gear_thickness,
								rim_thickness = Gear_thickness,
								hub_thickness = Gear_thickness,
								circles=1);
                translate([Width+.5,0,0]){
                    cylinder(r=3.6,h=Gear_thickness*3,center=true); //Removes portion blocking the frst hole
                }
            }}
            else if (Configuration == "flag") {//Replaces gear with a circle.
                difference(){
                cylinder(r=7.,h=Gear_thickness,center=false); 
                translate([Width+.5,0,0]){
                    cylinder(r=3.6,h=Gear_thickness*3,center=true); //Removes portion blocking the frst hole
                }
            }
        }
       
        
            translate([0,-Width/2,0]){
                rotate(0){	
                beam(l); //placement of first beam
                }
            }
            
            if (Bend == true){
            translate([l+Width/3.1,-Width/2.9,0]){
                rotate(a=[0,0,45]){	
                beam(l); //places second leg of beam
                }
            }
            }
		}
}

module GearArmR(l=arm_length) {
	rotate([0,0,90])
		union(){
			difference(){
                	rotate([0,0,360/Gear_Teeth/2])gear (number_of_teeth=Gear_Teeth,
								circular_pitch=Gear_Pitch,
								gear_thickness = Gear_thickness,
								rim_thickness = Gear_thickness,
								hub_thickness = Gear_thickness,
								circles=1);
			        translate([Width+.5,0,0]){
            cylinder(r=3.6,h=Gear_thickness*3,center=true); //Removes single gear tooth blocking the frst hole
                }
            }
                       
            translate([0,-Width/2,0]){
                rotate(0){	
                beam(l); //placement of first beam
                }
            }
            
            if (Bend == true){
            translate([l+Width/3.1,-Width/2.9,0]){
                rotate(a=[0,0,45]){	
                beam(l); //places second leg of beam
                }
            }
            }
		}
}
module beam()
{
    Length = (Holes-1) * Pitch;
    difference()
    {
	union()
	{			
            cube([Length, Width, Height]);
            for (i = [1:Holes])
                {
                translate([(i-1)*Pitch, Width/2,0]) 
                cylinder(r=Width/2, h=Height);
                }
	}
        union()
	{
            for (i = [1:Holes])
            {
                translate([(i-1)*Pitch, Width/2,-.01]) //the -.01 is just to get rid of thin walls
                {
                    cylinder(r=Radius2,h=Depth);
                    cylinder(r=Radius1,h=Height);
                    
                    translate([0,0,Height-Depth]) 
                    cylinder(r=Radius2,h=Depth+.1);  //the +.1 is just to get rid of thin walls
                    
                    translate([0,0,Depth])
                    cylinder(h=(Radius2 - Radius1), r1=Radius2, r2=Radius1);
                }
            }
        }
    }
}