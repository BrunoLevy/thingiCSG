// overall height
height = 30;
// outer-diameter
od = 20;
// inner-diameter #1
id1 = 5;
// inner-diameter #2
id2 = 8;



difference() {
    union() {
        translate([0, 0, height-0.6]) cylinder(d1=od, d2=od-0.6, h=0.6, $fn=64);    // obere Fase
        translate([0, 0, 0.6]) cylinder(d=od, h=height-1.2, $fn=64);                // cylinder
        cylinder(d1=od-0.6, d2=od, h=0.6, $fn=64);                                  // untere Fase
        
        translate([max(id1, id2)/2+2, -2.5, height/4*3]) rotate([90, 0, 0]) cylinder(d=6.5, h=5, center=true, $fn=32);     // Schraubenkopf oben
        translate([max(id1, id2)/2+2, -2.5, height/4]) rotate([90, 0, 0]) cylinder(d=6.5, h=5, center=true, $fn=32);     // Schraubenkopf unten
        
        translate([max(id1, id2)/2+2, 2.5, height/4*3]) rotate([90, 0, 0]) cylinder(d=6.1, h=5, center=true, $fn=6);     // Mutter oben
        translate([max(id1, id2)/2+2, 2.5, height/4]) rotate([90, 0, 0]) cylinder(d=6.1, h=5, center=true, $fn=6);     // Mutter unten
    }
    
    translate([0, 0, height/2]) cylinder(d=id1, h=height/2, $fn=32);    // oberer id
    cylinder(d=id2, h=height/2, $fn=32);                                // unterer id
    
    loch(height/4*3);   // oberes Schraubenloch
    loch(height/4);     // unteres Schraubenloch
    
    translate([-od/4-max(id1, id2)/4, 0, 0]) cylinder(d=2.5, h=height, $fn=16); // Loch
    translate([-od/4-max(id1, id2)/4, -0.75, 0]) cube([od, 1.5, height]); // Schlitz
}

module loch(h) {
    translate([max(id1, id2)/2+2, 0, h]) rotate([90, 0, 0]) cylinder(d=3.5, h=od, center=true, $fn=16);     // Loch
    translate([max(id1, id2)/2+2, -5, h]) rotate([90, 0, 0]) cylinder(d=6.5, h=od/2, $fn=32);     // Schraubenkopf
    translate([max(id1, id2)/2+2, 5+od/2, h]) rotate([90, 0, 0]) cylinder(d=6.1, h=od/2, $fn=6);     // Mutter
}