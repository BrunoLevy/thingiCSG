union() {
   cylinder(r=30,h=1,$fn=200);
   translate([10,10,0])
      rotate(12)
         cylinder(r=30,h=1,$fn=200);
}