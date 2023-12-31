include <lib/fibonalize.scad>

difference() {
    difference() {
        sphere($fn=100,r=1.05);
        sphere($fn=100,r=0.95);
    }
    fibonalize(N=200) cylinder($fn=20,h=0.2,center=true,r=0.1);
}

