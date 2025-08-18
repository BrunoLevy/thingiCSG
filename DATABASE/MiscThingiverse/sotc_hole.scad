
h=40;			//	высота цилиндра
n=20;			//	количество сот на окружности
dw=4.9;		//	расстояние между гранями соты
h1=2;			//	высота выступа соты
w=0.5;		//	промежуток между сотами
an=30;		//	угол наклона заострения соты
din=15;     // диаметр отверстия
squ=true;  //  true - square, false - circle

$fn=64;

ds=(dw-w)/sin(360/6);
dc=((n*dw)/(2*PI))*2;
dh=dw*sin(360/6);


module st() {
difference() {
translate([dc/2, 0,0]) rotate([0,90,0]) cylinder(h1*2, ds/2, ds/2, $fn=6, true);
for (r1=[0:2])
translate([dc/2+h1, 0,0]) rotate([r1*120,0,0]) rotate([0,-an,0]) translate([0.01,-dw/2,0]) cube([h1*2,dw,dw]);
} // df

} // mod st;

module sotc() {
difference() {
union() {
cylinder(h+0.1, dc/2, dc/2, $fn=128, true);

for (mz=[0,1]) mirror([0,0,mz])
for (hn=[dh:dh*2:h/2+dh])
translate([0,0,hn]) mirror([0,0,mz])
for (r=[0:n-1]) {
	translate([0,0,dh/2]) rotate([0,0,360/n*r]) st();
	translate([0,0,-dh/2]) rotate([0,0,360/n/2]) rotate([0,0,360/n*r]) st();
} // for

} // un
for (mz=[0,1]) mirror([0,0,mz])
translate([0,0,h/2]) cylinder(ds*2, dc/2+h1*2, dc/2+h1*2, $fn=128);

if (squ)
  cube([din, din, h+2],true);
else
  cylinder(h+2, din/2, din/2,true);
} // df
} // mod sotc


sotc();