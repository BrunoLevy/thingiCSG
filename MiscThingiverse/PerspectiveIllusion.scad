
ext = 200;//distance of extrusion, this should be bigger than the size of the final shape 


module shape1(){
	sf=2;
	scale([sf,sf,1])
	color([1,0,1])
	translate([-2,281,0])
	import("yes.dxf");

}

module shape2(){
	sf=2;
	scale([sf,sf,1])
	color([0,1,1])
	translate([-32,174,0])
	import("no.dxf");
}


module extrude1(){
	rotate([90,0,0])
	translate([0,0,-ext/2])
	linear_extrude(height = ext) shape1();
}

module extrude2(){
	rotate([90,0,90])
	translate([0,0,-ext/2]) 
	linear_extrude(height = ext) shape2();
}

module diagonal(w=20,a=45){
	rotate([0,0,a])
	cube([ext,w,ext],true);
}

module base(l=50, w=50,h=10, a=45){
	rotate([0,0,a]) translate([0,-w/2,-h+1])cube([l,w,h]);
}

module illusion(){
	width = 15;
	length= 100;
	angle = 35;
	intersection(){
		extrude1();
		extrude2();
		diagonal(w=width, a=angle);
	}
	base(l=length, w=width, a=angle);
}

//base();
//shape1();
//shape2();

//extrude1();
//extrude2();

illusion();