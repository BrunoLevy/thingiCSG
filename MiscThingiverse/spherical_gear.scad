
//the top of every teeth and the bottom of every valey is based 
//on a circle, this is the circle.
teeth_curve_radius=5;

//tooth height... self explanotory
teeth_height=14;

//full gear radius (teeth top to teeth top)
gear_radius=100;

//number of tooth in the gear, use an even number 
//otherwise one pole will have a hole, the other one a peak
teeth_count=20;

//if the "polar" tooth should be a hole or a peak.
center_is_valley=false;

module simpleGear2D(crest_circle_radius=4,
             valley_circle_radius=4,
             tooth_height=14,
             radius=100,
             tooth_count=30,
             odd=true){
    angle= 360/(tooth_count*2);      
    inner_radius=radius-tooth_height;
    ra=valley_circle_radius;
    rb=crest_circle_radius;
    dx = inner_radius * tan(angle);
    dy = tooth_height-rb-ra;
    hypothenuse = sqrt(pow(dx,2)+pow(dy,2));
    seq_dx = ra+rb;
    angleA = acos(seq_dx/hypothenuse)-acos(dx/hypothenuse);
    y1=(ra*sin(angleA))*-1;
    x1=dx-(ra*cos(angleA));
    y2=dy+(rb*sin(angleA));
    x2=rb*cos(angleA);
    offset_angle = odd ? angle : 0;

    difference(){             
        for(i=[0:angle*2:360]){
            rotate(i+offset_angle) translate([0,inner_radius]) union(){
                translate([0,dy]) circle(r=rb);
                polygon([[-x1,y1],[-x2,y2],[x2,y2],[x1,y1],[dx,-ra],[0,-inner_radius],[-dx,-ra]]);
            }
        }
        
        for(i=[0:angle*2:360]){
            rotate(i+offset_angle) translate([0,inner_radius]) union(){
                translate([dx,0]) circle(r=ra);
            }
        }
    }

}
//need all X to be positive, so rotate just the half 360
//use an even number of teeths
module halfSimple2DGear(crest_circle_radius=4,
             valley_circle_radius=4,
             tooth_height=14,
             radius=100,
             tooth_count=30,
             odd=true){
    difference(){
        simpleGear2D(crest_circle_radius,
             valley_circle_radius,
             tooth_height,
             radius,
             tooth_count,
             odd);
        translate([-(radius*2)-2,-radius-1]) square((radius*2)+2);
    }                 
}
intersection(){
    rotate_extrude() halfSimple2DGear(teeth_curve_radius,teeth_curve_radius,teeth_height,gear_radius,teeth_count,center_is_valley);
    rotate([90,0,0]) rotate_extrude() halfSimple2DGear(teeth_curve_radius,teeth_curve_radius,teeth_height,gear_radius,teeth_count,center_is_valley);
}