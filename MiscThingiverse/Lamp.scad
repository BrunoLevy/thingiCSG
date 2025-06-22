// blooming lamp

//translate([0,0,P])animation();
translate([0,0,P])assembly();
//stand();

$fa=4.5;// use 12 for animation, use 4.5 for STL (render takes ~30 minutes)
R=50;// radius of blub
theta=64;// angle of petal tips
w=5;// width of stems
tol=0.4;// tolerance for sliding
n=6;// number of petals
m=6;// number of slats (lamp1 only)

nub=2;
y=20+nub;
z1=3*nub;
z2=nub;
yU=33;
zU=28;

P=1.3*R*sqrt(2)*3/4;// position of bottom
z=27*(1-cos($t*360))/2;// vertical motion of lamp
phi1=atan2((yU-y),(zU-z1-z))-atan((yU-y)/(zU-z1));
phi2=atan2((yU-y),(zU-z2-z))-atan((yU-y)/(zU-z2));

echo(z);

use <../WriteScad/Write.scad>

module animation(){
translate([0,0,z])lamp1();
color([0,1,1])cage();
for(i=[1:n]){
	color([1,0,0])rotate([0,0,i*360/n+180/n])
		translate([0,-y,-P+z2+z])rotate([phi2,0,0])translate([0,y,P-z2])petal2();
	color([0,1,0])rotate([0,0,i*360/n])
		translate([0,-y,-P+z1+z])rotate([phi1,0,0])translate([0,y,P-z1])petal1();
}
color([1,0,1])translate([0,0,-150-P+15])stand();
}

module assembly(){
	lamp();
	color([0,1,1])cage();
	for(i=[1:n]){
		color([1,0,0])rotate([0,0,i*360/n+180/n])petal2();
		color([0,1,0])rotate([0,0,i*360/n])petal1();
	}
}

module stand($fa=4.5)
render()
difference(){
	shape(r=151,z=0);
	difference(){
		shape(r=155,z=1.5);
		translate([0,0,100])difference(){
			cylinder(r=14.25/2,h=50);
			for(i=[1:3])rotate([45,0,i*120-60])translate([5,0,0])cube(10,center=true);
		}
		for(i=[1:3])rotate([0,0,i*120])translate([0,-1,0])cube([100,2,200]);
	}
	translate([0,0,1.5])cylinder(r=10.25/2,h=150-18.49);
	translate([0,0,150-17])cylinder(r1=10.25/2,r2=9.75/2,h=1.01);
	translate([0,0,150-16])cylinder(r2=10.25/2,r1=9.75/2,h=1.01);
	for(i=[1:3])rotate([45,0,i*120-90])translate([0,20,50])
		linear_extrude(height=2*R)scale(0.3)petal_shape();
	translate([0,0,150-15+.01])cylinder(r1=31,r2=34,h=15);
	rotate([0,0,-90])writecylinder(text="Emmett Lalish",radius=65,h=8,face="bottom",t=1,space=1.2,
		font="../WriteScad/orbitron.dxf");
}

module shape(r=150,z=0)
rotate_extrude()difference(){
	translate([0,z])square(150);
	translate([180,100])circle(r=r);
}
		
module lamp()
render()
difference(){
	union(){
		base(t=10);
		translate([0,0,-P])cylinder(r=25-1,h=50);
	}
	difference(){
		base(t=10.5);
		translate([0,0,-R-P+21])cube(2*R,center=true);
	}
	translate([0,0,-P])cylinder(r=17,h=100,center=true);
	difference(){
		for(i=[1:n]){
			rotate([0,0,i*180/n])translate([0,0,-50])cube([w+2*tol,2*R,100],center=true);
		}
		difference(){
			base(t=10);
			translate([0,0,-R-P+9])cube(2*R,center=true);
		}
		for(i=[1:n]){
			rotate([0,0,i*360/n])translate([0,-y,z1-P])joint(tol=tol);
			rotate([0,0,i*360/n+180/n])translate([0,-y,z2-P])joint(tol=tol);
		}
	}
	
}

module lamp1()
render()
difference(){
	union(){
		intersection(){
			base(t=10);
			for(i=[1:m]){
				rotate([0,0,360*i/m])twist();
				rotate([0,0,360*i/m])mirror([1,0,0])twist();
			}
		}
		translate([0,0,-P])cylinder(r=25-1,h=22);
	}
	difference(){
		base(t=12);
		translate([0,0,-R-P+15])cube(2*R,center=true);
	}
	translate([0,0,-P])cylinder(r=17,h=100,center=true);
	difference(){
		for(i=[1:n]){
			rotate([0,0,i*180/n])translate([0,0,-50])cube([w+2*tol,2*R,100],center=true);
		}
		difference(){
			base(t=10);
			translate([0,0,-R-P+9])cube(2*R,center=true);
		}
		for(i=[1:n]){
			rotate([0,0,i*360/n])translate([0,-y,z1-P])joint(tol=tol);
			rotate([0,0,i*360/n+180/n])translate([0,-y,z2-P])joint(tol=tol);
		}
	}
	
}

module twist()
translate([0,0,6])linear_extrude(height=151,twist=180,center=true)
	translate([15,-5])square([R-10-15,10]);

module cage()
render()
difference(){
	union(){
		base(t=2);
		translate([0,0,-P])cylinder(r1=31,r2=34,h=15);
	}
	difference(){
		cube(4*R,center=true);
		translate([0,0,-100-R+11])cylinder(r=35,h=100);
	}
	translate([0,0,-R+7])difference(){
		cube([2*R,2*R,9],center=true);
		cylinder(r1=32.5,r2=36,h=10,center=true);
	}
	cylinder(r=25,h=300,center=true);
	base(t=9);
	for(i=[1:n]){
		difference(){
			intersection(){
				base(t=-1);
				rotate([0,0,i*180/n])translate([0,0,-50])cube([w+2*tol,2*R,100],center=true);
			}
			rotate([0,0,i*180/n])translate([0,yU,zU-P])joint(tol=tol);
			rotate([0,0,i*180/n])translate([0,-yU,zU-P])joint(tol=tol);
		}
	}
}

module petal2()
render()
intersection(){
	difference(){
		union(){
			intersection(){
				union(){
					difference(){
						rotate([45,0,0])linear_extrude(height=2*R)scale(0.4)petal_shape();
						translate([0,-R*3/4,0])rotate([0,0,-5])translate([0,R*3/4,0])base(t=6);
					}
					translate([0,-45,0])rotate([15,0,0])cube([w,20,150],center=true);
				}
				translate([0,-R*3/4,0])rotate([0,0,-5])translate([0,R*3/4,0])base(t=5);
			}
			translate([0,-25,25-P])cube([w,25,50],center=true);
		}
		base(t=9);
		translate([0,-y,z2-P])joint();
		translate([0,-yU,zU-P])rotate([atan((yU-y)/(zU-z2))-90,0,0])
			slot(L=sqrt((yU-y)*(yU-y)+(zU-z2)*(zU-z2))-(yU-y));
	}
	base(t=0);
}

module petal1()
render()
difference(){
	intersection(){
		union(){
			difference(){
				rotate([100,0,0])linear_extrude(height=2*R)scale(0.55)petal_shape();
				translate([0,-R,0])rotate([0,0,4])translate([0,R,0])base(t=1);
			}
			translate([0,-40,-51])rotate([40,0,0])cube([w,30,100],center=true);
		}
		translate([0,-R,0])rotate([0,0,4])translate([0,R,0])base(t=0);
	}		
	base(t=9);
	translate([0,-y,z1-P])joint();
	translate([0,-yU,zU-P])rotate([atan((yU-y)/(zU-z1))-90,0,0])
		slot(L=sqrt((yU-y)*(yU-y)+(zU-z1)*(zU-z1))-(yU-y));
}

module slot(L)
union(){
	translate([-w/2-0.01,0,0])rotate([0,90,0]){
		cylinder(r1=nub,r2=0,h=nub,$fn=12);
		translate([0,L,0])cylinder(r1=nub,r2=0,h=nub,$fn=12);
		translate([0,L/2,0])rotate([0,45,0])cube([nub*sqrt(2),L,nub*sqrt(2)],center=true);
	}
	translate([w/2+0.01,0,0])rotate([0,-90,0]){
		cylinder(r1=nub,r2=0,h=nub,$fn=12);
		translate([0,L,0])cylinder(r1=nub,r2=0,h=nub,$fn=12);
		translate([0,L/2,0])rotate([0,45,0])cube([nub*sqrt(2),L,nub*sqrt(2)],center=true);
	}
}

module joint(tol=0)
union(){
	translate([-w/2-tol-0.01,0,0])rotate([0,90,0])cylinder(r1=nub,r2=0,h=nub,$fn=12);
	translate([w/2+tol+0.01,0,0])rotate([0,-90,0])cylinder(r1=nub,r2=0,h=nub,$fn=12);
}

module petal_shape()
scale([1,1.3])difference(){
	union(){
		circle(r=R);
		square([R*2*cos(theta),R*4*sin(theta)],center=true);
	}
	translate(2*R*[cos(theta),sin(theta)])circle(r=R);
	translate(2*R*[-cos(theta),sin(theta)])circle(r=R);
	translate(2*R*[cos(theta),-sin(theta)])circle(r=R);
	translate(2*R*[-cos(theta),-sin(theta)])circle(r=R);
}

module base(t=0)
rotate_extrude()scale([1,1.3])translate([-t,0])difference(){
	union(){
		circle(r=R);
		translate([0,-R*sqrt(2)*3/4])square([R/sqrt(2),150/1.3]);
	}
	translate((R+R/2)/sqrt(2)*[1,1])circle(r=R/2);
	translate((R+R/2)/sqrt(2)*[1,-1])circle(r=R/2);
	translate([t-2*R,-2*R])square([2*R,4*R]);
}