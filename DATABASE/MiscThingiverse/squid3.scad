dim = 12;
num = 7;

// check the previous version for blabla

module main() {
  difference() {
    body();
    cut();
  }
}

// you can comment main() and use keychiain() for the keychain/earring/pendant version

// main();
keychain();

module body() {
  union(){

    difference() {
      // head
      scale([1, 1, 0.9])
        sphere(dim*2);

      rotate([0, 0, 12]) eyes();
    }

    // legs
    for(r = [1:num]) {
      rotate(360/num * r, [0, 0, 1]) translate([-dim, -dim, -dim])
      scale([1, 1, 0.7])
        sphere(dim);
    }

  }
}

// eyes

module eyes() {
  start = 0.3;
  range = 0.9;
  big    = start + range;
  small  = start - range;
  #translate([-dim*big, dim*small, dim*-0.9]) eye();
  #translate([-dim*small, dim*big, dim*-0.9]) eye();

}

module eye() {
  scale([0.8, 0.8, 1]) translate([-dim, dim, dim]) sphere(dim/1.5);
}

// body cut

module body_cut() {

}

module cut() {
  translate([0, 0,-dim*1.7]) cube([dim*6, dim*6, dim*0.3], center=true);
}


// keychain

module keychain() {
  union() {
    handler();
    main();
  }
}

module handler() {
  dim = dim*0.6;
  out = dim*0.7;

  translate([-dim*0.35, dim*0.35, dim*3]) rotate([90, 0, 45]) render() difference() {
    cylinder(dim*1.2, dim, dim);
    cylinder(dim*1.2, out, out);
  }
}

// smaller handler version
//
// dim = dim*0.3;
// out = dim*0.6;

// translate([-dim*0.35, dim*0.25, dim*6.5