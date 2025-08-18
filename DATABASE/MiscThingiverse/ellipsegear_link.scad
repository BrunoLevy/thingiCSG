dxf = "ellipsegear.dxf";
layer = "gear";

gearheight = 6;
linkdist1= 30;
linkdist2= 52;
linkheight = 3;
linkadd = 8;
snap_r1 = 4.4;
snap_r2 = 5.4;
snap_clear = 0.6;
snap_height=gearheight-0.5;
snap_gap = 2;
snap_addheight = 0.5;
ellipse_inner_r1 = 20;
ellipse_inner_r2 = 15;

$fn = 100;

module con(rsmall, rbig, h) {
  cylheight = gearheight/2;
  union() {
    translate([0,0,cylheight]) cylinder(r1=rbig, r2=rsmall, h=cylheight, center=false);
    translate([0,0,0.001]) cylinder(r2=rbig, r1=rsmall, h=cylheight, center=false);
  }
}


module snap() {
  translate([0,0,snap_addheight-0.001]) difference() {
    intersection() {
      union() {
        con(snap_r1, snap_r2);
        translate([0,0,-snap_addheight]) cylinder(r=snap_r1, h=snap_addheight+1);
      }
      cube(size=[100,snap_r1*2,snap_height*2], center=true);
    }
    cube(size=[snap_gap, 100,100], center=true);
  }
}

module gear() {
  difference() {
    linear_extrude(height=gearheight,center=false)
        import(file = dxf, layer = layer, height = gearheight);
    difference() {
      translate([linkdist1/2,0,-1]) scale([1,ellipse_inner_r2/ellipse_inner_r1,1]) cylinder(r=ellipse_inner_r1, h=gearheight+2);
      translate([0,0,-2]) cylinder(r=snap_r2+linkadd/2, h=gearheight+4);
      translate([linkdist1,0,-2]) cylinder(r=snap_r2+linkadd/2, h=gearheight+4);
    }
    scale([1,1,1.01]) translate([0,0,-0.001]) con(snap_r1+snap_clear, snap_r2+snap_clear);
    scale([1,1,1.01]) translate([linkdist1,0,-0.001]) con(snap_r1+snap_clear, snap_r2+snap_clear);
  }
}

module link() {
  union() {
    difference() {
      intersection() {
        scale([1,0.3,1]) cylinder(r1=linkdist2/2+linkadd+5, r2=linkdist2/2+linkadd, h=linkheight);
        scale([1,0.35,1]) cylinder(r=linkdist2/2+linkadd, h=linkheight);
      }
      translate([0,0,-1]) intersection() {
        scale([1,0.35,1]) cylinder(r1=linkdist2/2-linkadd, r2=linkdist2/2-linkadd+8, h=linkheight+2);
        scale([1,0.5,1]) cylinder(r=linkdist2/2-linkadd, h=linkheight+2);
      }
    }
    translate([-linkdist2/2,0,linkheight]) snap();
    translate([+linkdist2/2,0,linkheight]) snap();
  }
}

scale([1.2,1.2,1]) {
//  gear();
    link();
}


