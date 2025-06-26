include <lib/fibonalize.scad>

module ecaille() {
    difference() {
        union() {
            difference() {
                cylinder(center=true,h=0.3,$fn=20);
                for(alpha=[-60 : 20 : 60])
                    translate([-0.05,0,0.1]) rotate(alpha)  cube(size=[0.1, 1.5, 0.1]);
            }
            translate([0,0,0.1]) sphere(r=0.35,$fn=20);
        }
        translate([0,0.5,-0.1]) cylinder(center=true,h=0.3,$fn=20);
    }
}


fibonalize(N=300) scale(0.15) rotate([15, 0, 0]) ecaille();



