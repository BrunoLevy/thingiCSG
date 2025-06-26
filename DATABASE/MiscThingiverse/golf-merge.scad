owall = 2;
iwall = 1.5;
osup = 0.5;
nsup = 4;
rot = 180/nsup;

size = 43;

difference() {
   import_stl("golf-out.stl", convexity = 5);
//  sphere(r=size/2);
  sphere(r=size/2-owall);
}

//  heavy internal support (optional)
intersection(){
  sphere(r=size/2-owall/2);
  sup(iwall,size);
}

// external support on bottom only
difference() {
  translate([0,0,-size/8*3]) sup(osup,size/4);
  sphere(r=size/2-1);
}

module sup(w,h) {
for (i=[1:nsup]){
    rotate([0,0,rot*i])
      cube([w, size, h],center=true);
 }
}
