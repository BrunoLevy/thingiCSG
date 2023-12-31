include <lib/fibonalize.scad>

difference() {
   sphere($fn=70);
   fibonalize(R=0.05,N=750) sphere($fn=10);
}


