include <MCAD/involute_gears.scad>
//brain gears

//basic unit
//design parameters
octahedron_side_length = 100;
gear_centre_gap = 10;
n1 = 18;
gear_face_width = 10;
bore_diameter = 7;

cone_height = (octahedron_side_length - gear_centre_gap)/2;
pitch_angle = 30; //degrees
dc  = cone_height/cos(pitch_angle);
pitch_radius = dc*sin(pitch_angle);
echo("pitch_radius",pitch_radius);
pitch = pitch_radius*2*180/n1;

b = 0.5; //backlash I don't think this is calculated for bevel gears


module basic_gear(){
	bevel_gear (number_of_teeth=n1,
				outside_circular_pitch=pitch,
				cone_distance=dc,
				face_width=gear_face_width,
				bore_diameter=bore_diameter,
				backlash=b,
				finish=0);	
}
module full_gear(){
	union(){
		basic_gear();
		mirror([0,0,1])basic_gear();
		
		translate([0,0,gear_centre_gap]){
			basic_gear();
			mirror([0,0,1])basic_gear();
		}
	}
}


module torus(r1 =1, r2=2){
	rotate_extrude($fn=n1)
	translate([r2,0,0])
	circle(r=r1,$fn=18);
}
	
scale([0.5,0.5,0.5]){
	difference(){
	 	full_gear();
		translate([0,0,5])torus(r1=8,r2=17);
		translate([0,0,20])torus(r1=6,r2=12);
		translate([0,0,-10])torus(r1=6,r2=12);
		for (i=[0:8]){
		rotate(a=0+i*40,v=[0,0,1])
		translate([12,0,-20])
		scale([1,0.5,1])cylinder(h=80,r=5,centre=true);
		}
	}
}

