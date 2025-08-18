

// outer diam, inner diam, length, open/closed (1/0)
module tube(od, id, len, opentop, openbottom=0) {
	difference() {
		cylinder(h=len, r=od/2);
		translate(v=[0,0,1-2*openbottom]) { cylinder(h=len-4+4*opentop+2*openbottom, r=id/2); }
	}
}

// outer diam, length, thickness of cut on skinny end, cut angle
module plug(od, len, cut, angle) {
	difference() {
		cylinder(h=len, r=od/2);
		translate(v=[od/2-cut, -od/2, 0]) {
			rotate(a=[0,angle,0]) {
				cube(size=[od, od, len*2]);
			}
		}
	}
}

module cutout(pos, od, depth, angle) {
	translate(v=[od/2-depth,-od/2,pos]) {
		rotate(a=[0,angle,0]) {
			cube(size=[od, od, od*2]);
		}
	}
}

module whistle(od, id, len, angle) {

	difference() {
		union() {
			tube(od,id,len,0, 1);
			plug(id+0.5, 10, 4, angle);
		}
		cutout(10, od, od/4, angle);
		//// subtract out another tube to make it skinnier on top
		//translate(v=[0,0,30]){ tube(od-1, 1, len-31, 0); }
	

		// bevel with cone for tapered mouthpiece
		#difference() {
			cylinder(h=5, r1=od/2, r2=od/2);
			cylinder(h=5, r1=id/2+0.5, r2=od/2);
		}
	}
	
}


module sideblown(od, id, len, holediam, holepos) {
	difference() {
		tube(od, id, len, 0);
		
		scale(v=[1,1,1.6]) 
			translate(v=[0,0,holepos])
				rotate(a=[0,90,0]) 
						cylinder(h=od+1, r=holediam/2);
	}
}


//whistle(15,10,55,10);


function diatonic(i) = lookup(i,
	[
		[0,0],
		[1,2],
		[2,4],
		[3,5],
		[4,7],
		[5,9],
		[6,11],
		[7,12]
	]
);


anglestep = -8.8;
radius = 90;
difference()
{
	for (i = [0 : 7] ) 
	{
		translate(v=[radius*sin(i*anglestep), radius*cos(i*anglestep) ,0]) 
			rotate(a=[0,0,90-i*anglestep])
				whistle(15,11,40+50*((12-diatonic(i))/12),10);
	}
	
	//cylinder(h=12, r1=radius, r2=radius-8);
	
}

