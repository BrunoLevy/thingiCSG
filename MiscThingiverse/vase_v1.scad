$fn=99; // Resolution 
intersection(){
    union(){
        sphere(r=29);
        for(i=[0:20:359]){
            r =40; // fixed angle
            // r = rands(35,145,1)[0]; // random angle
            rotate([r,r,i]) 
                cylinder(r=30,h=2,center = true); 
        }
    }
    
    // cut top/bottom of sphere
    cube([80,80,40],center = true);
}