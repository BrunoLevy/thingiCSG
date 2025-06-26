difference() {
   union() {
   cylinder(r=30,h=2,$fn=200,center=true);
   for(i=[0:5])
      rotate(i*60)
         translate([20,0,0])
            cylinder(r=9.5,h=2,$fn=100,center=true);
	    
   for(i=[0:5])
      rotate(i*60+30) {
         translate([7,0,0])
            cylinder(r=3,h=2,$fn=100,center=true);
         translate([26,0,0])
            cylinder(r=3,h=2,$fn=100,center=true);
      }
   }
   *difference() {
      cylinder(r=35,h=1.2,$fn=200,center=true);
      cylinder(r=4,h=1.2,$fn=200,center=true);
   }
   *cylinder(r=1,h=2,$fn=6,center=true);
}
