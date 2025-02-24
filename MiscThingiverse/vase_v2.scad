f = 40;
$fn=99;
intersection(){
    difference(){
        sphere(r=29);
        for(i=[0:15:359]){
            r = 40;
            rotate([r,r+i*0.25,i]) ring();
        }
    }
    cube([80,80,40],center = true);
}
module ring(){rotate_extrude() translate([28,0,0]) polygon([[2,3],[2,-3],[0,0]]);}