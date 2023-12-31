N = 200;
phi = 2.618033;
R  = 0.2;

union() {
    for(i=[1:N]) {
        z = 2*i/N - 1;
        r = sqrt(1-z*z);
        theta = 360*i/phi; 
        x = r*sin(theta); // OpenSCAD's sin() and cos() take angles
        y = r*cos(theta); // in degrees !!! (omg !)
        translate([x,y,z]) sphere(R,$fn=200);
    }
}
