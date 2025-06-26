//basic unit
//design parameters
sp = 25.34;




module con(r2=6.2,h2=13){
		translate([0,sp,0])rotate([45,0,0])cylinder(r=r2,h=h2,$fn=6);
}	

module con_hole(r1=3.1, h1=8){
	translate([0,sp,0])rotate([45,0,0])cylinder(r=r1,h=h1);
}

rotate([180,0,0]){
scale([0.5,0.5,0.5]){
difference(){
	union(){
		cylinder(r=20, h=13,center=false,$fn=36);
		con();
		rotate([0,0,90])con();
		rotate([0,0,180])con();
		rotate([0,0,270])con();
	}
	cylinder(r=15,h=30,center=false);
	con_hole();
	rotate([0,0,90])con_hole();
	rotate([0,0,180])con_hole();
	rotate([0,0,270])con_hole();

}
}
}
//translate([sp/2,0,0])sphere(r=1);
