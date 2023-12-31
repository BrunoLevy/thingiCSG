include <lib/fibonalize.scad>

fibonalize(N=300) scale(0.15) rotate([15, 0, 0]) {
   difference() {
       cylinder(center=true,h=0.3,$fn=20);
       translate([0,0.5,-0.1]) cylinder(center=true,h=0.3,$fn=20);
   }
}


