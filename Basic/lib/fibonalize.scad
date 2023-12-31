// Bruno Levy Dec 2023
// Distributes a set of objects on a unit sphere, along a Fibonacci spiral.

// usage: fibonalize(args) children;
//  N:    number of generated instances of children
//  spin: if set, children are rotated along normal axis
//
// examples:
//   fibonalize(N=100) scale(0.5) sphere($fn=30);
//   fibonalize(N=70) scale(0.2) cube(center=true);
//   fibonalize(N=70,spin=true) scale(0.2) cube(center=true);
//
//   union() {
//       sphere($fn=100);
//       fibonalize(N=200,spin=true) scale(0.2) import("my_mesh.stl");
//    }


module fibonalize(N=100,spin=false) {
    N = N + 1; // because we gonna skip last one (see below)
    PHI = 2.618033; // golden section
    union() {
        for(i=[1:N-1]) { // skip last one, because often too close to another one
           z = 2*i/N - 1;
           r = sqrt(1-z*z);
           theta = 360*i/PHI;
           phi = (z+1)*90;
           gamma = spin ? theta : 0;
           c = cos(theta); // OpenSCAD's sin() and cos() take angles
           s = sin(theta); // in degrees !!! (omg !)
           x = r*c; 
           y = r*s; 
           Z = [x,y,z];
           X = [-s,c,0];
           Y = cross(Z,X);
           multmatrix(
               [[   X[0], Y[0], Z[0], x],
                [   X[1], Y[1], Z[1], y],
                [   X[2], Y[2], Z[2], z],
                [      0,    0,    0, 1]]
           ) rotate(gamma) children();
       }
    }
}

