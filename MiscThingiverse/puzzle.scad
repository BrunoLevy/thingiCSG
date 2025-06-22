// sphere puzzle 2 (new tolerance)

R=30; // radius of sphere
tol=0.5;// tolerance to allow looser fit
x=R*cos(45);

rotate([-90,0,])
difference(){
	sphere(r=R);
	translate([0,0,-R])
		cube(size=[R,2*R,2*R+tol],center=true);
	translate([0,-R,0])
		cube(size=[R,2*R+tol,2*R],center=true);
	rotate([-45,0,0])
		translate([0,0,-2*R])
			cube(size=4*R,center=true);
	translate([0,0,R+x])
		cube(size=2*R+tol,center=true);
	translate([0,R+x,0])
		cube(size=2*R+tol,center=true);
	translate([R/2,0,0])
		rotate([-45,0,0])rotate([0,45,0])
			cube(size=[x+tol,2*R,x+tol],center=true);
	translate([-R/2,0,0])
		rotate([-45,0,0])rotate([0,45,0])
			cube(size=[x+tol,2*R,x+tol],center=true);
	translate([0,-x+2*tol,0])
		rotate([45,0,0])translate([0,0,R/2])
			cube(size=[R,2*R,R],center=true);
	translate([0,0,-x+2*tol])
		rotate([45,0,0])translate([0,0,-R/2])
			cube(size=[R,2*R,R],center=true);
}