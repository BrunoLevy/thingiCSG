/*
I'm quite fond of hyperboloid meshes, like the one in the central section of this:

https://plus.google.com/photos/103946165422859151776/albums/5858912181595088385/5858912200058638914?banner=pwa&pid=5858912200058638914&oid=103946165422859151776

Sorry about the long url.  It's full of pulsating LEDs, btw.  This type of hyperboloid can be generated as a solid of revolution by taking a line coaxial with the z axis, translating it along the x axis, rotating about the x axis (<90 degrees) then rotating about the z axis.  Generating a mesh is therefore fairly straightforward in OpenSCAD - just do a for loop that generates a series of cylinders with appropriate translations and rotations, then repeat it with the x-axis rotation in the opposite direction like this:
*/


nrods=12;
rod_dia=3.5;
rodlen=90;
rodangle=36;
rodoffset=20;
pivotpoint=36;

topheight=(rodlen-pivotpoint)*cos(rodangle);
botheight=-pivotpoint*cos(rodangle);
ytop=(rodlen-pivotpoint)*sin(rodangle);
ybot= -pivotpoint*sin(rodangle);
toprad=sqrt(pow(rodoffset,2)+pow(ytop,2));
botrad=sqrt(pow(rodoffset,2)+pow(ybot,2));
toprot=atan(ytop/rodoffset);
botrot=atan(ybot/rodoffset);


totalheight=topheight-botheight;

bot_od=botrad+rod_dia;
bot_id=botrad-rod_dia;

top_od=toprad+rod_dia;
top_id=toprad-rod_dia;

echo ("top od: ",top_od,"  top id: ",top_id,"  bot od: ",bot_od,"  bot id: ",bot_id,"  height: ",totalheight);

$fn=16;




difference(){ 

	rods (nrods,rod_dia,rodlen,rodoffset,rodangle,pivotpoint);
	rods (nrods,rod_dia*.75,rodlen*1.1,rodoffset,rodangle,pivotpoint*1.1);
	}

// ******************** End of Main Program ****************



module rods (rods,dia,length,offset,lean,pivotpoint)
union(){
for (group = [-1,1]){
for (rod = [0:rods-1]){
	rotate (a=[0,0,rod*(360/rods)]){
		rotate (a=[group*lean,0,0]) {
			translate ([offset,0,-pivotpoint]){cylinder (r=dia/2, h=length);}
		}
	}
}}}
// ********************** End of Module ******************


/*
Here's the code I used to generate hollow versions of these things, with some useful trig to help find the ends of the rods and place other structures around them.
*/


nrods=12;
rod_dia=3.5;
rodlen=90;
rodangle=36;
rodoffset=20;
pivotpoint=36;

topheight=(rodlen-pivotpoint)*cos(rodangle);
botheight=-pivotpoint*cos(rodangle);
ytop=(rodlen-pivotpoint)*sin(rodangle);
ybot= -pivotpoint*sin(rodangle);
toprad=sqrt(pow(rodoffset,2)+pow(ytop,2));
botrad=sqrt(pow(rodoffset,2)+pow(ybot,2));
toprot=atan(ytop/rodoffset);
botrot=atan(ybot/rodoffset);


totalheight=topheight-botheight;

bot_od=botrad+rod_dia;
bot_id=botrad-rod_dia;

top_od=toprad+rod_dia;
top_id=toprad-rod_dia;

echo ("top od: ",top_od,"  top id: ",top_id,"  bot od: ",bot_od,"  bot id: ",bot_id,"  height: ",totalheight);

$fn=16;




difference(){ 

	rods (nrods,rod_dia,rodlen,rodoffset,rodangle,pivotpoint);
	rods (nrods,rod_dia*.75,rodlen*1.1,rodoffset,rodangle,pivotpoint*1.1);
	}

// ******************** End of Main Program ****************



module rods (rods,dia,length,offset,lean,pivotpoint)
union(){
for (group = [-1,1]){
for (rod = [0:rods-1]){
	rotate (a=[0,0,rod*(360/rods)]){
		rotate (a=[group*lean,0,0]) {
			translate ([offset,0,-pivotpoint]){cylinder (r=dia/2, h=length);}
		}
	}
}}}
// ********************** End of Module ******************


/*
Ian

-- 
Stand firm for what you believe in, until and unless logic and experience
prove you wrong.  Remember: when the emperor looks naked, the emperor *is* 
naked, the truth and a lie are not "sort-of the same thing" and there is
no aspect, no facet, no moment of life that can't be improved with pizza.

-Daria Morgendorffer
*/

