include <lib/fibonalize.scad>

module star() {
  difference() {
    circle($fn=6);
      union() {
        for(i = [0:5]) {
          rotate(i*360/6) translate([1,0,0]) circle($fn=20,r=0.5);
      }
    }
  }
}

difference() {
   difference() {
       sphere($fn=100,r=1.02);
       sphere($fn=100,r=0.98);
   }
   fibonalize(N=150,spin=true) scale(0.12) linear_extrude(height=0.6,center=true) star();
}