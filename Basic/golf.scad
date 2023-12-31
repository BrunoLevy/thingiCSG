include <lib/fibonalize.scad>

difference() {
   sphere($fn=70);
   fibonalize(N=750) scale(0.05) sphere($fn=10);
}


