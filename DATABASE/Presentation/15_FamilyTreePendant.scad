// Mom's Family Tree Pendant
// by Les Hall and Joan Hall-Edwards
// started 4-4-04
// 
//
//
// Mom’s Pendant
// 
// Mom 6-24-44
// Dorrie 4-11-59
// Les 10-16-66
// Keith 1-4-68
// Lori 9-4-78
// Lance 9-4-78
// Jason 8-29-94
// Kelly 12-30-99
// Katie 12-27-04
// Ava 3-9-14
// 
// black acrylic
// 




/* [Text] */
font = "../libraries/knewave.dxf";//["write/Letters.dxf":Basic,"write/orbitron.dxf":Orbitron,"write/BlackRose.dxf":BlackRose]
font_size=0.25;
text_depth=0.1;




// enter birthday data
Mom   = 5*sqrt(75);
Dori  = 5*sqrt(50);
Les   = 5*sqrt(50);
Keith = 5*sqrt(50);
Lance = 5*sqrt(50);
Lori  = 5*sqrt(50);
Jason = 5*sqrt(25);
Kelly = 5*sqrt(25);
Katie = 5*sqrt(25); 
Ava   = 5*sqrt(25);


// detail
detail = 16;
$fn = detail;
detail2 = 16;
// depth
thickness = 5;
// angle
alpha = 360/5;
// diameter before scaling (includes overage)
diameter = 1.0;

// ************* Executable part *************
use <../libraries/Write.scad>


scale(0.25)
difference()
{
	union()
	{
		// Mom
		scale([Mom, Mom, Mom])
			spheroid(diameter, "Mom", -15, false);
	
		// kids
		// 
		// Dori
		rotate(-alpha*2, [0, 0, 1])
		translate([(Mom+Dori)/2, 0, 0])
		scale([Dori, Dori, Dori])
			spheroid(diameter, "Dori", -90, false);
		// 
		// Les
		rotate(-alpha*1, [0, 0, 1])
		translate([(Mom+Les)/2, 0, 0])
		scale([Les, Les, Les])
			spheroid(diameter, "Les", -90, false);
		// 
		// Keith
		rotate(-alpha*0, [0, 0, 1])
		translate([(Mom+Keith)/2, 0, 0])
		scale([Keith, Keith, Keith])
			spheroid(diameter, "Keith", -90, false);
		// 
		// Lance
		rotate(alpha*1, [0, 0, 1])
		translate([(Mom+Lance)/2, 0, 0])
		scale([Lance, Lance, Lance])
			spheroid(diameter, "Lance", -90, false);
		// 
		// Lori
		rotate(alpha*2, [0, 0, 1])
		translate([(Mom+Lori)/2, 0, 0])
		scale([Lori, Lori, Lori])
			spheroid(diameter, "Lori", -90, false);
		
		// grandkids
		// 
		// Jason
		rotate(-alpha*2, [0, 0, 1])
		translate([(Mom+Dori)/2, 0, 0])
		translate([(Dori+Jason)/2, 0, 0])
		scale([Jason, Jason, Jason])
			spheroid(diameter, "Jason", -90, false);
		// 
		// Kelly
		rotate(-alpha*0, [0, 0, 1])
		translate([(Mom+Keith)/2, 0, 0])
		rotate(-alpha/2, [0, 0, 1])
		translate([(Keith+Kelly)/2, 0, 0])
		scale([Kelly, Kelly, Kelly])
			spheroid(diameter, "Kelly", -90, true);
		// 
		// Katie
		rotate(-alpha*0, [0, 0, 1])
		translate([(Mom+Keith)/2, 0, 0])
		rotate(alpha/2, [0, 0, 1])
		translate([(Keith+Katie)/2, 0, 0])
		scale([Katie, Katie, Katie])
			spheroid(diameter, "Katie", -90, true);
		// 
		// Ava
		rotate(alpha*2, [0, 0, 1])
		translate([(Mom+Lori)/2, 0, 0])
		translate([(Lori+Ava)/2, 0, 0])
		scale([Ava, Ava, Ava])
			spheroid(diameter, "Ava", -90, false);
	}

	// hole in Lance's disk
}



// each sphere looks like this
module spheroid(dia, chars, theta, hole)
{
	difference()
	{
		union()
		{
			rotate_extrude(convexity = 10)
			translate([dia/2, 0, 0])
			circle(d = dia/3, $fn = detail2);

			difference()
			{
				// flat in middle of circle
				cylinder(d = dia, h = 0.3*dia, center = true);

				// writing in middle of circle
				for (i = [0:len(chars)-1])
				rotate(theta, [0, 0, 1])
				translate([0, dia/10, 0.175*dia])
				write(chars, t = text_depth, h = font_size, 
					center = true, font = font);
		
				// hole
				if (hole == true)
				rotate(theta, [0, 0, 1])
				translate([0, dia/2-dia/4+dia/8-dia/16, 0])
				{
					// main hole
					cylinder(d = dia/8, h = dia, center = true);

					// upper bevel
					translate([0, 0, 0.3*dia])
					cylinder(d1 = 0, d2 = dia/4, h = dia/4, center = true);

					// lower bevel
					rotate(180, [0, 1, 0])
					translate([0, 0, 0.3*dia])
					cylinder(d1 = 0, d2 = dia/4, h = dia/4, center = true);
				}
			}
		}
	}
}




