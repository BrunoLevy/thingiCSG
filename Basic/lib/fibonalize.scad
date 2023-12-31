module fibonalize(N=100,R=1.0,spin=false) {
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
           ) scale(R) rotate(gamma) children();
       }
    }
}

