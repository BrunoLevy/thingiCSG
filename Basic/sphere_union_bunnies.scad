include <lib/fibonalize.scad>

union() {
    sphere($fn=100);
    fibonalize(N=200,spin=true) scale(0.3) rotate([90,0,0]) import("bunnies/bunny_5k.stl");
}

