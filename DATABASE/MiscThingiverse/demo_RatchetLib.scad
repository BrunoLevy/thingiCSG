/* 
Parametric ratchet mechanism
License: CC BY-NC-SA 3.0
Version: 0.1
Date: 2010-05-23
By: rustedrobot

Changelog:
2012-02-06 - rustedrobot - added slant parmeter to demo

*/

use <lib/RatchetLib.scad>;

// inner (teeth) ring
inner_ring_diameter=40;		// outer diameter of the inner ring
inner_ring_height=10;		// height of the inner ring
inner_ring_thickness=6;		// thickess of the inner ring

// outer (arms) ring
outer_ring_diameter=70;		// outer diameter of the outer ring
outer_ring_height=12;		// height of the outer ring
outer_ring_thickness=2;		// thickness of the outer ring

// arms for outer ring (and cutting ratchet teeth on inner ring)
arm_type="straight";		// the arm type (currently straight only, eventually curved will be an option)
arms=4;					// total number of radially symmetric arms 
teeth_multiple=5;			// how many times more teeth than arms we will have
arm_height=5;				// height of the arm
arm_head_width=3;			// size of the head of the arm
arm_head_length=5;			// length of the arm head
arm_shaft_width=2;			// width of non-head part of the arm

// other settings
ratchet_direction="counter-clockwise"; // which way the outer ring should be able to move
slant=15;					// slant in degrees of the ratchet arm head, values between 0 and 50 are usable
tolerance=0.1;				// padding around arm head with when cutting ratchet teeth
facets=50;				// number of facets for cylinders

// =======================================================================

outer_ratchet_ring(
	ratchet_direction,
	inner_ring_diameter,
	inner_ring_height,
	inner_ring_thickness,
	outer_ring_diameter,
	outer_ring_height,
	outer_ring_thickness,
	arms,
	arm_type,
	arm_head_width,
	arm_head_length,
	arm_shaft_width,
	arm_height,
	tolerance,
	slant,
	facets
	);


inner_ratchet_ring(
	ratchet_direction,
	inner_ring_diameter,
	inner_ring_height,
	inner_ring_thickness,
	outer_ring_diameter,
	outer_ring_height,
	outer_ring_thickness,
	arms,
	arm_type,
	arm_head_width,
	arm_head_length,
	arm_height,
	teeth_multiple,
	tolerance,
	slant,
	facets);
