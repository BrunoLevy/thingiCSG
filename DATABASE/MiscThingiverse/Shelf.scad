// shelf bracket

R=18;
d=8;
n=5;

bracket();
//loops();
//outer();
//hyperbola(rmin=3,rmax=5,h=10,$fn=30);

module bracket()
union(){
    rotate([90,0,0])difference(){
        intersection(){
            translate([0,(n-1)*R*sqrt(3),0])union(){
                rotate([0,-120,0])translate([R,0,0])loops();
                rotate([0,-60,0])translate([R,0,0])loops();
            }
            translate([-10*R,0,0])cube(20*R);
        }
        translate([0,1.5*R/sqrt(3),0])countersink();
        translate([0,10.5*R/sqrt(3),0])countersink();
    }
    difference(){
        rotate(90)translate([-(n*R+R)/sqrt(3)-2,0,0])triangle();
        for(i=[0:n/2])rotate(-120)translate([2*R*i+R,0,0])
            scale([1,.5+.25*i])cylinder(r=R-d,h=3,center=true);
        for(i=[0:n/2])rotate(-60)translate([2*R*i+R,0,0])
            scale([1,.5+.25*i])cylinder(r=R-d,h=3,center=true);
        for(i=[0:n-3],j=[i:n-3])
            translate([1.5*R*i,-2*R-3,0])rotate([0,0,-120])translate([1.5*R*j,0,0])
                cylinder(r=2,h=3,center=true,$fn=12);
    }
}

module loops()
difference(){
    render(convexity=4)
    union(){
        translate([0,0,-d])rotate([0,0,-150])cube([2*(n-1)*R,2*(n-1)*R,2*d]);
        for(i=[0:n-1])
            translate([2*R*i,0,0])rotate([0,0,-120])translate([2*R*i,0,0])
                outer(rmin=R-d,rmax=R+d,h=2.5*d,rOuter=R+d,$fn=50);
    }
    for(i=[0:n-1],j=[i:n-1])
        translate([2*R*i,0,0])rotate([0,0,-120])translate([2*R*j,0,0])
            hyperbola(rmin=R-d,rmax=R+d,h=2.5*d,$fn=50);
}

module hyperbola(rmin=4,rmax=10,h=10)
rotate_extrude()difference(){
    translate([0,-h/2,0])square([rmax,h]);
    projection(cut=true)translate([0,0,rmin*h/2/rmax])rotate([0,90,0])cylinder(r1=0,r2=h/2,h=rmax);
}

module outer(rmin=4,rmax=10,h=10,rOuter=20)
rotate_extrude()translate(-[rmin+rOuter,0])
    projection(cut=true)translate([0,0,rmin*h/2/rmax])rotate([0,90,0])cylinder(r1=0,r2=h/2,h=rmax);

module countersink(){
    cylinder(r=2,h=30,center=true,$fn=20);
    translate([0,0,6])cylinder(r1=0,r2=4.5,h=4.5,$fn=20);
    translate([0,0,10.5-.01])cylinder(r=4.5,h=10,$fn=20);
}

module triangle()
cylinder(r=(n*R+R)/sqrt(3)+2,h=1,$fn=3);