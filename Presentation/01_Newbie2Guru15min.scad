// by Les Hall
// started Tue May 6 2014
// 




// Beginner Section
// 
// Concepts to learn:  
//		three basic shapes:  sphere, cube, and cylinder
//		center parameter, passing of parameters by name
//		translate transmogrifier (transformation)
//		use of chaining without indentation
//		implied union() at top level (talk of removing this)
//
// draw a sphere at the origin
sphere(r=5);
//
// draw a cube on the +x axis
translate([20, 0, 0])
cube(size=5*sqrt(3), center=true);
// 
// draw a cylinder on the -x axis
translate([-20, 0, 0])
cylinder(r=5, h=5, center=true);
//
// end of Beginner Section
// continue to intermediate section




// Intermediate Section
// 
// Concepts to learn:  
// 		variable declarations
//		vectors and multiplying vectors by scalars
//		smoothness variable $fn
//		default unit for 3D printing is millimeters
//		hierarchical transmogrification
//		use of variables in shape parameters
//		variables are evaluated at compile time
//			weird behavior results
//
// define adjustable global parameters
// 
//  distance between shapes
spacing = 20;
// 
// diameter of round things (mm)
diameter = 10;
// 
// height of cylinders (mm)
height = 10;
// 
// size of cubes (mm)
cubeSize = diameter*[1.5, 1, 0.5];
// 
// roundness of curved parts
fnSphere = 64;
fnCylinder = 32;
$fn = fnCylinder;
// 
// end of adjustable parameters
// 
// 
// 
// 
// draw shapes using defined variables
//
// draw a sphere on +y axis
color([0, 1, 0])
translate([0, spacing, 0])
{
	sphere(r=diameter/2, $fn=fnSphere);
	// 
	// cube to the -x of the above sphere
	translate([spacing, 0, 0])
	cube(size=cubeSize, center=true);
	//
	// draw a cylinder to the +x of the above sphere
	translate([-spacing, 0, 0])
	cylinder(r=diameter/2, h=height, center=true);
}
// 
// end of intermediate section
// please understand before continuing to advanced section
// 




// Begin advanced section
// 
// Concepts to learn:
// 	Constructive Solid Geometry (CSG)
//			union(), difference(), and intersection()
//		for loops
//		nested levels of hierarchy
//		modules without parameters
// 
// 
// define global parameters
// 
// number of holes in each direction (z not used)
num = [14, 7, 1];
// 
// size of each hole
holeDiameter = 2;
//
// spacing between holes
holeSpacing = 4;
// 
// plate thickness (mm)
thickness = 2.5;
//
// end of global parameters
// 
// 
// beginning of module definitions
// 
// draw holes
module holes()
{
	for(x = [1:num[0]], y = [1:num[1]])
	translate([(x-num[0]/2-0.5)*holeSpacing, (y-num[1]/2-0.5)*holeSpacing, 0])
	cylinder(d=holeDiameter, h=2*thickness, center=true);
}
//
// draw plate
module plate()
{
	union()
	{
		// flat of plate
		cube([num[0]+2, num[1]+2, num[2]/2]*holeSpacing, center=true);
		// frame of plate
		difference()
		{
			// positive material:  outer exents
			cube((num+[2, 2, 1])*holeSpacing, center=true);
			// negative material:  subtract center (extra tall)
			cube([num[0], num[1], num[2]+4]*holeSpacing, center=true);
		}
	}
}
// 
// 
// draw object 
!color([1, 0.5, 0])
translate([0, spacing+num[0]/2*holeSpacing, 0])
difference()
{
	// positive material
	plate();
	// negative material
	holes();
}


// Begin guru section
// 
// Concepts to lerarn:
//		echo as debug statement
//		modules including passing of parameters
//		for loops with assign sections
//		recursion
//		animation
//		text
// 
// 
// Begin define global variables
// 
// define the font
font = "knewave.dxf";	//default for aditional fonts
// 
// text height (mm)
textHeight = 1;
//
//
// module definitions
//
// text module
module drawText(text)
{
	rotate(90, [1, 0, 0])
	union()
	{
		for(letter = [0:len(text)-1])
		translate([4.5*(letter-len(text)/2), 0, 0])
		scale(textHeight)
		linear_extrude(height=1, convexity=10, center=true, $fn=2)
		import(file = font, layer=str(text[letter], "_"));
	}
}
// 
// add text above each section
module addText()
{
	translate([0, 0, spacing/2])
	union()
	{
		// text above basic shapes
		translate([0, 0, 0])
		drawText("beginner");
	
		// text above intermediate shapes
		color([0, 1, 0])
		translate([0, spacing, 0])
		drawText("intermediate");
	
		// text above advanced shapes
		color([1, 0.5, 0])
		translate([0, spacing+num[0]/2*holeSpacing, 0])
		drawText("advanced");
	
		// text above guru shapes
		color([1, 0, 1])
		translate([0, 3*spacing+num[0]/2*holeSpacing, 0])
		drawText("guru");
	}
}
//
//
// define numbers used to pass from one recursion to the next
//
// set the recursion level limit
recursionLimit = 3;
echo(str("recursionLimit = ", recursionLimit));
i = 0;
// 
// note:  set FPS = 8 and Steps = 64
// 
// 
// recursive module
module recursion(iteration)
{
	i = iteration/recursionLimit;
	cycle = (1+cos(360*$t*2))/2;
	color([1-cycle, cycle, 1-i, 0.2])
	cube([1, 1, 1]*spacing/4*cycle);
	for(y = [-1:2:1])
	for(x = [-1:2:1], z = [-1:2:1])
	translate([x*cycle, y*cycle, z*cycle]*spacing/4)
	if (iteration > 0)
		recursion(iteration-1);
}
//
//
//
// make the thing
union()
{
	addText();
	translate([0, 3*spacing+num[0]/2*holeSpacing, 0])
	recursion(recursionLimit);
}








