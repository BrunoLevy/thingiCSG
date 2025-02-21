$fn = 100;

oD = 5.5; //outer diameter
iD = 2.5; //inner diameter
length = 50;


module cyl(){
    difference(){
        rotate([90,0,0])cylinder(length/2,oD,oD,false);
        rotate([90,0,0])cylinder(length/2,iD,iD,false);
        translate([0,-length/3,0])rotate([90,0,0])cylinder(length/4,iD,iD*2,false);
    }
}

module shape(){
    rotate([90,0,0])cylinder(length,oD,oD,true);
    rotate([0,0,45])cyl();
    rotate([0,0,-45])cyl();
}

module enlargeHoles(){
    difference(){
        shape();
        rotate([90,0,0])cylinder(length,iD,iD,true);
        rotate([90,0,45])cylinder(length/2,iD,iD,false);
        rotate([90,0,-45])cylinder(length/2,iD,iD,false);
        translate([0,-length/3,0])rotate([90,0,0])cylinder( length/4,iD,iD*2,false);
    }
}

enlargeHoles();
    
    
    
    
