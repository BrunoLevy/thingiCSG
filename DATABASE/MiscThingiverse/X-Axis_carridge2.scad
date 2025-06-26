part="carridge"; //mount or carridge

// LM8UU dimentions
LM8UU_length = 25;
LM8UU_diameter = 15;

// X Axis dimensions
x_rod_spacing = 45;
x_rod_radius = 4;

//Belt
belt_thickness_no_tooth = 0.75;
belt_thickness_tooth = 1.45;
belt_double = belt_thickness_no_tooth+belt_thickness_tooth+0.5;

//Carriage
carriage_width = 30;
carriage_padding = 0.1;
carriage_height = x_rod_spacing+LM8UU_diameter+carriage_padding*2;
carriage_depth = 12;

//cyclops
heatbreak_x1=6;
heatbreak_x2=24;
heatbreak_z1=3;
heatbreak_z2=11;
heatbreak_diameter=4;
heatsink_baseline=carriage_padding*2+LM8UU_diameter-1;
mount_x1=15;
mount_z1=10;
mount_x2=10.5;
mount_z2=20;
mount_x3=19.5;
mount_z3=20;
mount_diameter=3.8;

module tie(){
    difference(){
        rotate([0,90,0]) cylinder(d=LM8UU_diameter+10, h=4, $fn=50);
        rotate([0,90,0]) cylinder(d=LM8UU_diameter+3, h=4, $fn=50);
    }
}

module heatbreak_hole(){
    rotate([-90,0,0]) cylinder(d=heatbreak_diameter, h=carriage_depth*2+10, $fn=50);
    //translate([0,-4,0]) rotate([-90,0,0]) cylinder(d=heatbreak_diameter+3, h=carriage_depth+2, $fn=100);
}

module mount_hole(){
    rotate([-90,0,0]) cylinder(d=mount_diameter, h=carriage_depth*2+10, $fn=50);
    if (part=="carridge") translate([0,-4,0]) rotate([-90,0,0]) cylinder(d=mount_diameter+3, h=carriage_depth+2, $fn=50);
}

module lug_hole(){
    rotate([-90,0,0]) cylinder(d=4, h=carriage_depth+2, $fn=50);
    //translate([0,0,-2]) rotate([-90,0,0]) cylinder(d=5, h=carriage_depth+2, $fn=100);
}


difference(){
    if (part=="carridge") {
        //back plane
        cube(size=[carriage_width,carriage_depth,carriage_height+1]);
    }
    else if (part=="mount") {
        local_height = x_rod_spacing-LM8UU_diameter-carriage_padding*2-3;
        translate([0,8,LM8UU_diameter+carriage_padding*2]) 
            cube(size=[carriage_width,8,local_height]);
    }
    
    if (part=="carridge"){
    //LM8UU
    translate([2.5,0,carriage_padding+LM8UU_diameter/2]) rotate([0,90,0]) cylinder(d=LM8UU_diameter, h=LM8UU_length, $fn=50);
    translate([2.5,0,carriage_height-carriage_padding-LM8UU_diameter/2]) rotate([0,90,0]) cylinder(d=LM8UU_diameter, h=LM8UU_length, $fn=50);
    
    //ties
    translate([8,0,carriage_padding+LM8UU_diameter/2]) tie();
    translate([carriage_width-12,0,carriage_padding+LM8UU_diameter/2]) tie();
    translate([6,0,carriage_height-carriage_padding-LM8UU_diameter/2]) tie();
    translate([carriage_width-10,0,carriage_height-carriage_padding-LM8UU_diameter/2]) tie();
    
    translate([8,-1,-1]) cube(size=[4,LM8UU_diameter/2,3]);
    translate([carriage_width-12,-1,-1]) cube(size=[4,LM8UU_diameter/2,3]);
    
    //translate([8,LM8UU_diameter/2-.01,LM8UU_diameter/8]) cube(size=[3,carriage_depth,LM8UU_diameter/3*2+1]);
   // translate([carriage_width-11,LM8UU_diameter/2-.01,LM8UU_diameter/8]) cube(size=[3,carriage_depth,LM8UU_diameter/3*2+1]);
    
    //rods
    translate([-1,0,carriage_padding+x_rod_radius+3.5]) rotate([0,90,0]) cylinder(r=x_rod_radius+2, h=carriage_width+2, $fn=50);
    translate([-1,0,carriage_height-x_rod_radius-3.5-carriage_padding]) rotate([0,90,0]) cylinder(r=x_rod_radius+2, h=carriage_width+2, $fn=50);
    
    //belt
    translate([-1,-1,LM8UU_diameter+carriage_padding*2+1]) difference(){
        local_height = x_rod_spacing-LM8UU_diameter-carriage_padding*2-5;
        cube(size=[carriage_width+2,8,local_height]);
        
        //posts
        translate([3,-1,12.5]) lug_hole();
        translate([29,-1,12.5]) lug_hole();
        //channels
        translate([0,0,carriage_padding*2]){
            difference() {
                union() {
                    translate([1,-1,local_height-belt_double-5]) cube(size=[4,10,5]);
                    translate([27,-1,local_height-belt_double-5]) cube(size=[4,10,5]);
                
                    translate([5,0,local_height-belt_double-2.5]) rotate([-90,0,0]) cylinder(d=5,h=100,$fn=50);
                    translate([27,0,local_height-belt_double-2.5]) rotate([-90,0,0]) cylinder(d=5,h=100,$fn=50);
                }
                translate([5,0,local_height-belt_double-2.5]) rotate([-90,0,0]) cylinder(d=3.5,h=100,$fn=50);
                translate([27,0,local_height-belt_double-2.5]) rotate([-90,0,0]) cylinder(d=3.5,h=100,$fn=50);
            }
        }
    }
    }
   
    //Cyclops heatbreak 
    translate([heatbreak_x1,-1,heatbreak_z1+heatsink_baseline]) heatbreak_hole();
    translate([heatbreak_x2,-1,heatbreak_z1+heatsink_baseline]) heatbreak_hole();
    translate([heatbreak_x1,-1,heatbreak_z2+heatsink_baseline]) heatbreak_hole();
    translate([heatbreak_x2,-1,heatbreak_z2+heatsink_baseline]) heatbreak_hole();
    
    //Cyclops mount
    translate([mount_x1,-1,mount_z1+heatsink_baseline]) mount_hole();
    translate([mount_x2,-1,mount_z2+heatsink_baseline]) mount_hole();
    translate([mount_x3,-1,mount_z3+heatsink_baseline]) mount_hole();
     
    //cooling
    if (part=="mount") translate([0.001,7,LM8UU_diameter+carriage_padding*2-1]){
        local_height = x_rod_spacing-LM8UU_diameter-carriage_padding*2+2;
        translate([2,0,0]) cube(size=[2,3,local_height]);
        translate([6,0,0]) cube(size=[2,3,local_height]);
        translate([10,0,0]) cube(size=[2,3,local_height]);
        translate([14,0,0]) cube(size=[2,3,local_height]);
        translate([18,0,0]) cube(size=[2,3,local_height]);
        translate([22,0,0]) cube(size=[2,3,local_height]);
        translate([26,0,0]) cube(size=[2,3,local_height]);
    }
    
    
    //translate([-1,LM8UU_diameter/2+1,-1]) cube(size=[carriage_width+2,carriage_depth-LM8UU_diameter/2+1,LM8UU_diameter]);
}


