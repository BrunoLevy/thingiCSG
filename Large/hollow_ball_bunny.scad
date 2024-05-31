include <lib/fibonalize.scad>

difference() {
    difference() {
        sphere($fn=100,r=1.02);
        sphere($fn=100,r=0.98);
    }
    fibonalize(N=200,spin=true) scale(0.2) import("bunnies/bunny_0_2k.stl");
}

