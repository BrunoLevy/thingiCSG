include <lib/fibonalize.scad>

difference() {
    sphere($fn=100);
    fibonalize(N=200,spin=true) scale(0.3) rotate([90,0,0]) import("bunnies/bunny_0_2k.stl");
}

