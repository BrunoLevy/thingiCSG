// MakerBot Thingiverse Customizer template 
// with build chamber limiter, 
// Replicator model selection, 
// and cross section option.  
// 
// by Les Hall
// 
// started 3-19-2014
// All dimensions are in millimeters.  
// This template works in Customizer.  
// 



/* [General] */

// MakerBot Replicator Model
buildVolume = 3; // [0:Replicator 2X, 1:Replicator 2, 2:Replicator Z18, 3:Replicator Mini, 4:Replicator]

// Make whole thing or half thing
crossSection = 1; // [0:whole thing, 1: positive x half, 2:negative x half, 3:positive y half, 4:negative y half, 5:positive z half, 6:negative z half]

// Thickness (mm)
wallThickness = 4; // [1:16]

// Round shape smoothness
detail = 64; // [3:128]

// Select a part
part = 0; // [0:Full Assembly, 1:Retainer Ring, 2:Main Tube, 3:Adapter, 4:Lens, 5:Tensioner]


/* [Details] */

// Lens Diameter
lensDiameter = 61; // [1:100]

// Light Source Diameter
lightSourceDiameter = 21; // [1:100]

// Light Source Preset
source = 4; // [0:Light Source Diameter, 1:21 mm, 2:23 mm, 3:25 mm, 4:MagLite Mag-Tac]

// Main Tube Length
mainTubeLength = 125; // [50:457]

// Retainer Length
retainerLength = 6; // [1:24]

// Coupling Length
couplingLength = 24; // [1:64]

// Funnel Length
adapterLength = 32; // [1:100]

// Slot Count
slotCount = 8; // [0:16]

// Tensioner Aggressiveness
tensionerTightness = 1; // [0:7];




/* [Strangeness] */

// adjust source diameter to preset
lightSourceArray = [lightSourceDiameter, 21, 23, 25, 26.67];
sourceDiameter = lightSourceArray[source];

// size of build volume in millimeters
buildSize = [
	[246, 152, 155], 
	[285, 153, 155], 
	[305, 305, 457], 
	[100, 100, 125],
	[252, 199, 150], 
];

// select the build volume by model
MakerBotSize = buildSize[buildVolume];

// determine offset and size of cross section eraser
xs = MakerBotSize[0];
ys = MakerBotSize[1];
zs = MakerBotSize[2];
crossSectionOffsets = [
	[ 0,   0,   0], 
	[-xs,  0,   0], 
	[ xs,  0,   0], 
	[ 0,  -ys,  0], 
	[ 0,   ys,  0], 
	[ 0,   0, -zs], 
	[ 0,   0,  zs]
];
crossSectionOffset = crossSectionOffsets[crossSection];
crossSectionSize = 2 * MakerBotSize;

// set lens zoom
lensZoom = lensDiameter/100;

// set level of detail for round shapes
$fn = detail;


module retainer()
	difference()
	{
		cylinder(r = lensDiameter/2, h = retainerLength, center = true);
		cylinder(r = lensDiameter/2 - wallThickness, h = retainerLength+2, center = true);
		translate([0, 0, couplingLength])
		translate([lensDiameter/4, 0, 0])
		rotate(90, [0, 0, 1])
			cube([lensDiameter/16, lensDiameter, MakerBotSize[2]], 
				center = true);
	}

module mainTube()
	difference()
	{
		cylinder(r = lensDiameter/2 + wallThickness, 
			h = mainTubeLength, center = true);
		cylinder(r = lensDiameter/2, 
			h = mainTubeLength+2, center = true);
		for (slot = [0:slotCount])
			rotate(slot*360/slotCount, [0, 0, 1])
			translate([0, 0, couplingLength])
			translate([lensDiameter/4, 0, 0])
			rotate(90, [0, 0, 1])
				cube([lensDiameter/slotCount, lensDiameter, mainTubeLength], 
				center = true);
	}


module adapter()
	union()
	{
		// main tube insertion
		translate([0, 0, retainerLength/2 + adapterLength/2])
		{
			difference()
			{
				cylinder(r = lensDiameter/2, 
					h = retainerLength, center = true);
				cylinder(r = lensDiameter/2 - wallThickness, 
					h = retainerLength + 2, center = true);
			}
		}

		// adapting cone
		translate([0, 0, 0])
		{
			difference()
			{
				cylinder(r1 = sourceDiameter/2 + wallThickness, 
					r2 = lensDiameter/2, 
					h = adapterLength, center = true);
				cylinder(r1 = sourceDiameter/2, 
					r2 = lensDiameter/2 - wallThickness, 
					h = adapterLength + 2, center = true);
			}
		}

		// light source adapter
		translate([0, 0, -couplingLength/2 - adapterLength/2])
		{
			difference()
			{
				cylinder(r = sourceDiameter/2 + wallThickness, 
					h = couplingLength, center = true);
				cylinder(r = sourceDiameter/2, 
					h = couplingLength+2, center = true);
			}
		}
	}


module lens()
	scale(lensZoom)
	intersection()
	{
		translate([0, 0, MakerBotSize[2]/4])
			cylinder(r = 50, 
				h = MakerBotSize[2]/2, center = true);
		translate([0, 0, -75])
			sphere(r = 100);
	}


module tensioner()
	difference()
	{
		cylinder(r = lensDiameter/2 + 2*wallThickness - tensionerTightness, 
			h = retainerLength, center = true);
		cylinder(r = lensDiameter/2 + wallThickness - tensionerTightness, 
			h = retainerLength+2, center = true);
	}

module fullAssembly()
	union()
	{
		translate([0, 0, 0])
			mainTube();
		translate([0, 0, mainTubeLength/2 - retainerLength/2])
			retainer();
		translate([0, 0, mainTubeLength/2 - retainerLength/2 - 
			6*lensZoom])
		rotate(180, [0, 1, 0])
			lens();
		translate([0, 0, mainTubeLength/2 - retainerLength - 
			20*lensZoom])
			retainer();
		tensioner();
		translate([0, 0, -mainTubeLength/2 - adapterLength/2 + 
			retainerLength + 48*lensZoom])
			retainer();
		translate([0, 0, -mainTubeLength/2 - 
			adapterLength/2 + retainerLength/2 + 
			48*lensZoom])
		rotate(180, [0, 1, 0])
			lens();
		translate([0, 0, -mainTubeLength/2 - 
			adapterLength/2])
			adapter();
	}





// make it!
difference()
{
	// use intersection to ensure evertything fits in build chamber
	intersection()
	{
		// Select part(s) to generate
		union()
		{
			if(part == 0) // Full Assembly
			{
				fullAssembly();
			}
			if(part == 1) // Retainer Ring
			{
				retainer();
			}
			if(part == 2) // Main Tube
			{
				mainTube();
			}
			if(part == 3) // Adapter
			{
				adapter();
			}
			if(part == 4) // Lens
			{
				lens();
			}
			if(part == 5) // Tensioner
			{
				tensioner();
			}
		}
		// build chamber size limiter
		if(part > 0)
			cube(MakerBotSize, center = true);
	}
	// cross-section option
	if (crossSection > 0)
		translate(crossSectionOffset)
			cube(crossSectionSize, center = true);
}



