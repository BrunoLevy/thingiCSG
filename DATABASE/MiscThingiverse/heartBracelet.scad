module torus(major,minor,q) {
rotate_extrude(convexity = 10, $fn = q)
translate([major, 0, 0])
circle(r = minor, $fn = q/2);
}
 include <oldbezier.scad>

// Borrowed from the tutorial found here:
// http://www.local-guru.net/blog/2010/09/19/pulsating-heart-made-from-bezier-curves-in-processing

//beginShape();
//vertex(150,150);
//bezierVertex( 150,120, 100,120, 100, 150);
//bezierVertex( 100,180, 150,185, 150, 210 );
//bezierVertex( 150,185, 200,180, 200, 150 );  
//bezierVertex( 200,120, 150,120, 150, 150 );  
//endShape();

gDemoSteps = 50;
gDemoHeight = 6;

loadHeart=true;
module DrawHeart() {
	if (loadHeart) {
		import_stl("heart.stl",convexity=15);
	} else {
		translate([-150, -190, -2]) {
			BezCubicFilletColored( [[150, 150],[150,120],[100,120],[100,150]], [150,150], 
			gDemoSteps, gDemoHeight, [[1,0,0],[1,0,0],[1,1,1],[1,0,0]]);
			
			BezCubicFilletColored( [[100, 150],[100,180],[150,185],[150,210]], [150,150], 
			gDemoSteps, gDemoHeight, [[1,0,0],[1,0,0],[1,1,1],[1,0,0]]);
			
			BezCubicFilletColored( [[150, 210],[150,185],[200,180],[200,150]], [150,150], 
			gDemoSteps, gDemoHeight,  [[1,0,0],[1,0,0],[1,1,1],[1,0,0]]);
			
			BezCubicFilletColored( [[200, 150],[200,120],[150,120],[150,150]], [150,150], 
			gDemoSteps, gDemoHeight,  [[1,0,0],[1,0,0],[1,1,1],[1,0,0]]);
		}
	}
}
numHearts=24;
diameter=88;
thickness=1;
loadBand=true;
module bracelet() {
	if (loadBand) {
		import_stl("heartBand2.stl",convexity=15);
	} else {
		difference() {
			translate([0,0,-13])cylinder(26,diameter/2,diameter/2,$fn=200);
			for (i=[0:numHearts-1]) {
				rotate([0,(i%2)*180,i*(360/numHearts)])translate([0,diameter/2-3,-1])rotate([-90,0,0])scale([0.2,0.2,1]) DrawHeart();
				rotate([0,(i%2)*180,i*(360/numHearts)])translate([0,diameter/2-3,15])rotate([-90,0,0])scale([0.9,0.2,1]) DrawHeart();
				rotate([0,(i%2)*180,(i+1)*(360/numHearts)])translate([0,diameter/2-3,12.5])rotate([-90,0,0])scale([0.25,0.2,1]) DrawHeart();
			}
			translate([0,0,-16])cylinder(32,diameter/2-thickness,diameter/2-thickness,$fn=200);
		}
	}
}

color([0.9,0.9,0.9,1])bracelet();
//color([0.1,0.1,1,1])rotate([0,0,(360/numHearts)])scale([0.97,0.97,1])bracelet();
color([0.9,0.9,0.9,1])translate([0,0,13])torus((diameter/2)-thickness,thickness,200);
color([0.9,0.9,0.9,1])translate([0,0,-13])torus((diameter/2)-thickness,thickness,200);
