include <lib/fibonalize.scad>


union() {
   sphere($fn=30);
   fibonalize(N=150,spin=true) 
       cylinder(center=true,r1=0.1,r2=0.0,h=0.5,$fn=20);
}