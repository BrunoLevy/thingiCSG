difference() {
   cylinder(r=30,h=1,$fn=200);
   for(i=[0:23])
      rotate(i*15)
         translate([30,0,0])
            cylinder(r=5,h=1,$fn=100);
}
