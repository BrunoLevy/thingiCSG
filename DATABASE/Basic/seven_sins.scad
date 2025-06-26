difference() {
   cylinder(r=30,h=1,$fn=200);
   for(i=[0:5])
      rotate(i*60)
         translate([20,0,0])
            cylinder(r=10,h=1,$fn=100);
}
