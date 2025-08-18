size=40;
hoehe=size*0.9;
raeder=size/3;
auge=size/5;
augendicke=size*0.5;
augenhoehe=size/3;
armdicke=size/12;
armlaenge=size*0.65;


$fn=30;
wall_e();

module wall_e(){	
	difference(){
		cube([size,size,hoehe],center=true);
		translate([-size/2,0,size/3.3]) cube([2,size*0.7,size/10],center=true);
		translate([-size/2,size/3.3,0]) cube([2,size/10,size*0.7],center=true);
		translate([size/2,0,size/3.3]) cube([2,size*0.7,size/10],center=true);
		translate([size/2,size/3.3,0]) cube([2,size/10,size*0.7],center=true);
		translate([size/2-size/9,size/2,hoehe/2-size/7]) cube([size/4,size/15,size/4],center=true);
		translate([-size/2+size/9,size/2,hoehe/2-size/7]) cube([size/4,size/15,size/4],center=true);
	}

	translate([-size/2,-raeder/1.45,-size/1.3])rotate([0,-90,0])ketten();
	translate([size/2,-raeder/1.45,-size/1.3])mirror([1,0,0])rotate([0,-90,0])ketten();
	translate([0,-size/6,size/2+augenhoehe]) rotate([10,6,0]) eyes();
	translate([0,0,hoehe/2])  hals();
	translate([size/2+armdicke*0.9,size/3.3,0])  arm();
	translate([-size/2-armdicke*0.9,size/3.3,size/6]) mirror([1,0,0]) arm(-100,140,20);
	translate([-size/8,size/2,-size/3]) rotate([90,0,180]) linear_extrude(height=1) text(text="WALL-E",size=size/7,font="TSCu_Comic",halign="center");
}
module eyes(){
	translate([-auge*1.05,0,0]) rotate([-90,170,0]) augen();
	translate([auge*1.05,0,0]) mirror([1,0,0]) rotate([-90,170,0]) augen();
	translate([0,augendicke*0.6,0]) rotate([90,0,0]) cylinder(d=auge,h=augendicke/2); ;
//	translate([0,augendicke*0.3,0]) sphere(auge*0.7)
}

module hals(){
	dicke=auge/2.5;
	rotate([0,90,0]) cylinder(h=dicke*2.2,r=dicke,center=true); //sockel
	rotate([-40,0,0]) {
		cylinder(h=augenhoehe*0.6,r=dicke); // unterer hals
		translate([0,0,augenhoehe*0.5+dicke]) {
			rotate([0,90,0]) cylinder(h=dicke*2,r=dicke,center=true);
			rotate([80,0,0]) translate([0,0,augenhoehe*0.8/2]) cube([dicke*2,dicke*2,augenhoehe*0.8],center=true);
		}
	}	
}


module arm(drehungarm=-50,drehunghand=30,drehunginnen=0){
	h=armlaenge/4;
	hdicke=armdicke*0.8;
	rotate([drehungarm,0,drehunginnen]){
		rotate([90,0,0]) cylinder(r=armdicke,h=armdicke*2,center=true);
		cylinder(r=armdicke,h=armlaenge);
		translate([0,-armdicke,0]) cube([armdicke,armdicke*2,armlaenge]);
		translate([0,0,armlaenge/3]) cylinder(r=armdicke*0.8,h=armlaenge);
		translate([0,0,armlaenge*1.3]) rotate([0,90,drehunghand]) 
			{
			
			cylinder(r=hdicke,h=armdicke*4,center=true);
			rotate([0,0,180]) linear_extrude(height=armdicke*3.8,center=true) 
				polygon([ [0,-hdicke/3], [h,0], [2*h,-hdicke], [h,hdicke], [0,hdicke]]);
			rotate([0,0,135]) mirror([0,1,0]) linear_extrude(height=armdicke*1.7,center=true) 
				polygon([ [0,-hdicke/3], [h,0], [2*h,-hdicke], [h,hdicke], [0,hdicke]]);
		}
	}

}

module ketten(){
	difference(){
		translate([-raeder*2*0.05,-raeder*1.5*0.05,0]) scale([1.1,1.1,1])hull() wheels();
		translate([0,0,2]) scale([1,1,1.1]) hull(){ wheels(); }
	}
	
	scale([1,1,0.9]) wheels();
}

module wheels(){
	translate([raeder/1.5,0,0]) cylinder(h=raeder,r=raeder/1.5); // Big
	translate([raeder*2,raeder/2,0]) cylinder(h=raeder,r=raeder/3.5); // upper
	translate([raeder/2,raeder*1.8,0]) cylinder(h=raeder,r=raeder/2); //front	
}


module augen(){

	difference(){
		union(){
			difference(){
				augenhuelle(a=1.1*auge);
				translate([0,0,augendicke*0.9])augenhuelle(a=auge);
			}
			color("black") 	cylinder(h=augendicke*0.95,d=auge); //linse			
		}	
		color("blue")translate([0,0,augendicke*0.9]) cylinder(h=augendicke,d=auge*0.9); //linse
		color("blue")translate([0,0,augendicke*0.85]) cylinder(h=augendicke,d=auge*0.5); //linse
	}

}

module augenhuelle(a){
	hull(){
		translate([a/2,-a/10,0]) cylinder(h=augendicke,r=a/1.5); // Big
		translate([-a*0.8,a/1.5-a/10-a/10,0]) cylinder(h=augendicke,r=a/10); // small
		color("red") translate([0,-a/10,0]) cylinder(h=augendicke,d=a*1.1); //unten
		translate([-a/6,0,0])	cylinder(h=augendicke,d=a*1.1); //unten
	}
}