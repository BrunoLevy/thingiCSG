/* DNA Backbone Ornament/Trophy
Created by Cathal Garvey
Twitter: @onetruecathal
Email: cathalgarvey@gmail.com

Licensed under a Creative Commons Attribution, Sharealike License 3.0 Unported.
For information, see: http://creativecommons.org/licenses/by-sa/3.0/

This is a straightforward Double-Helix of DNA embedded in a stand. There are two sorts of bases: cuboid and ovoid.
I have tried to be reasonably accurate to the gross structure of DNA, so that one can easily see the major and minor grooves. It clearly does not resemble the "popular conception" image of DNA, that of a ladder twisted along a straight axis. Real DNA is much cooler.

Use this as an ornament, a trophy or mark of achievement, or a teaching aid, or anything else that takes your fancy.
Just please, please put pictures on Thingiverse when you make one or make a derivative! I love to see my stuff in the wild!
*/

// ===== Parameters =====
TotalHeight = 100; //How tall the whole thing is. This includes the stand.

// Backbone stuff:
BackboneRadius = 5; // How thick the backbone helices are.
SquareBBWidth = 8; // For square BBs, how wide perpendicular to bases
SquareBBDepth = 6; // For square BBs, how deep parallel to bases
BackboneCenterOffset = 11; // How far each backbone is from the center of rotation
BackboneRotationLag = 120; // How far "Behind" is the latter backbone?
BackboneTwist = 4.2; // Degrees of twist per unit height!

// Base stuff:
BaseLength = 20;
BaseWidth = 6;
BaseDepth = 4;
BaseFrequency = 12; // Units of height between each base on the "Ladder"

// Stand stuff:
StandDepth = 3;
StandLowerRadius = 22;
StandUpperRadius = 19;

// ===== Modules =====
module doublehelix()
	{

	linear_extrude(height = TotalHeight, center = false, convexity = 10, twist = BackboneTwist*TotalHeight, $fn = 50)
		translate([BackboneCenterOffset, 0, 0])
			circle(r = BackboneRadius);

	linear_extrude(height = TotalHeight, center = false, convexity = 10, twist = BackboneTwist*TotalHeight, $fn = 50)
		rotate([0, 0, BackboneRotationLag])
			translate([BackboneCenterOffset, 0, 0])
				circle(r = BackboneRadius);

	}

module Squaredoublehelix()
	{

	linear_extrude(height = TotalHeight, center = false, convexity = 10, twist = BackboneTwist*TotalHeight, slices = 80)
		translate([BackboneCenterOffset, 0, 0])
				square([SquareBBDepth,SquareBBWidth],center=true);


	linear_extrude(height = TotalHeight, center = false, convexity = 10, twist = BackboneTwist*TotalHeight, slices= 80)
		rotate([0, 0, BackboneRotationLag])
			translate([BackboneCenterOffset, 0, 0])
				square([SquareBBDepth,SquareBBWidth],center=true);

	}

module CuboidBase(Elevation){
	translate([0,0,Elevation])
		rotate ([0,0, -Elevation * BackboneTwist])
			linear_extrude(height = BaseDepth, center = false, convexity = 5, twist = 0)
				rotate([0, 0, 60])
					translate([5, 0, 0])
						square([BaseWidth, BaseLength],center=true);
}

module OvoidBase(Elevation){
	translate([0,0,Elevation])
		rotate([0,0,-Elevation * BackboneTwist])
			rotate([0, 0, 48])
				translate([4,0,BaseDepth/2])
					scale([BaseWidth/BaseLength,1,BaseDepth/BaseLength])
						sphere(r = BaseLength/2);
}

module Stand(){
	cylinder(StandDepth, StandLowerRadius, StandUpperRadius);
}

module SquareBaseDNA(){
	union(){
	doublehelix();

	for(i = [1 : (TotalHeight/BaseFrequency) -1]){
		CuboidBase(i * BaseFrequency);
	}

	Stand();
}
}

module OvoidBaseDNA(){
	union(){
	doublehelix();

	for(i = [1 : (TotalHeight/BaseFrequency) -1]){
		OvoidBase(i * BaseFrequency);
	}

	Stand();
}
}

module SquareBBOvoidBaseDNA(){
	union(){
	Squaredoublehelix();

	for(i = [1 : (TotalHeight/BaseFrequency) -1]){
		OvoidBase(i * BaseFrequency);
	}

	Stand();
}
}

// ===== Modelling =====
//SquareBaseDNA();
mirror(1,0,0){
	SquareBBOvoidBaseDNA();
}
//OvoidBaseDNA();