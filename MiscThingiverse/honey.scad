module hex(r) {
  circle(r = r, $fn = 6);
}

module hexgrid(hexcoord_list, r) {
  h = sqrt(3)*r;

  V = [0, h, 0];
  U = [6/4*r, 1/2*h, 0];

  for (vec = hexcoord_list) {
    i = vec[0];
    j = vec[1];

    translate(i*V + j*U)
    children();
  }

}

hexes = [for (j=[-7:1:7]) for (i=[-7:1:7]) [i,j]];

module honeyvase(hexes, height, twist, slicereso) {
  difference() {
    linear_extrude(height = height, slices = slicereso, twist = twist, scale=2)
    hexgrid(hexes, 10)
        hex(10);


  difference() {
      linear_extrude(height = height, slices = slicereso, twist = twist, scale=2)
      hexgrid(hexes, 10)
          hex(r = 9);
      cylinder(r = 90, h = 1);
    }
  }
}

module honeytwist() {
  //original honeytwist
  hexes = [ [ 2,-2],[ 2,-1],[ 2, 0],
            [ 1,-2],[ 1,-1],[ 1, 0],[ 1, 1],
            [ 0,-2],[ 0,-1],[ 0, 0],[ 0, 1], [ 0, 2],
                    [-1,-1],[-1, 0],[-1, 1], [-1, 2],
                            [-2, 0],[-2, 1], [-2, 2] ];
  intersection() {
    honeyvase(hexes, 100, 90, 100);
    sphere(r=90);
  }
}
module honeypot() {
  //honeypot
  hexes = [ [ 3, 0],[ 2, 1],[ 1, 2],[ 0, 3],
            [ 3,-1],[ 2, 0],[ 1, 1],[ 0, 2],[-1, 3],
            [ 3,-2],[ 2,-1],[ 1, 0],[ 0, 1],[-1, 2],[-2, 3],
            [ 3,-3],[ 2,-2],[ 1,-1],[ 0, 0],[-1, 1],[-2, 2],[-3, 3],
                    [ 2,-3],[ 1,-2],[ 0,-1],[-1, 0],[-2, 1],[-3, 2],
                            [ 1,-3],[ 0,-2],[-1,-1],[-2, 0],[-3, 1],
                                    [ 0,-3],[-1,-2],[-2,-1],[-3, 0] ];
  intersection() {
    honeyvase(hexes, 90, 0, 2);
    sphere(r=90, $fa=30);
  }
}
honeypot();
//honeytwist();
