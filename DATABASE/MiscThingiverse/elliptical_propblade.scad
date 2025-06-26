/*
NACA airfoil elliptical propeller blade
by Alex Matulich
March 2022 - initial release.
November 2022 - fixed angle_sweep consistency when changing sign of rotation direction.

On Thingiverse: https://www.thingiverse.com/thing:5300828
On Printables: https://www.printables.com/model/159163-elliptical-blade-naca-airfoil-propeller-library

This design models an elliptical propeller blade using three NACA airfoils, starting with (by default) NACA 8430 at the hub radius, transitioning to NACA 6412 at 33% of the blade length, then transitioning to NACA 3412 at the blade tip. In the NACA coding, the first digit is amount of camber as percent of airfoil chord length, second digit is position of camber top as percent of chord from the leading edge, last two digits are thickness as a percent of chord.

The NACA airfoils here are modified to have a slightly thicker trailing edge (0.4mm default), for easier printing. This is adjustable, as are the three NACA profiles.

The propblade() module renders a single blade vertically, with the blade arc in the x-z plane. The origin of the airfoil is always at y=0 along the length of the blade, and this origin is defined as a fractional position along the airfoil chord (controlled by the 'centerline' parameter).

The blade can be swept forward or backward around the propeller arc, and can be positioned forward or backward with respect to a centerline. For example, if the centerline is designated at the leading edge (centerline=0), the leading edge is straight and level. If the centerline is at the trailing edge (centerline=1), the trailing edge is straight and level, such that the propeller laying flat on a build plate has the trailing edge touching the build plate everywhere. When centerline=0.3, the maximum thickness of all airfoil cross-sections lie in a straight level line.

The blade taper profile is controlled by an ellipse length fraction, elenfrac, which should always be greater than 1. When elenfrac=1.001 for example, the blade shape is that of an ellipse, distorted by the centerline setting (a symmetrical ellipse is when centerline=0.5), and also distorted by the hub length constraint (the blade never exceeds the bounds of the hub length, so the chord is adjusted shorter if needed). Larger values of elenfrac cause more of the tip of the ellipse to be cut off where the blade ends.

The propblade() module has a fairing parameter. If positive, a fairing is generated between the blade and the hub, increasing the airfoil thickness by amount of millimeters specified by fairing, and extending outward from the hub by the same amount.

There are also modules parabolic_spinner() and ogive_spinner() for generating a parabolic or rounded ogive propeller spinner, respectively.

PROPELLER PROPERTIES
Except for the 'blades' parameter in propeller(), the parameters for propeller() and propblade() are the same. Default values are shown in parentheses.

Basic dimensions

blades (2)
    number of blades - propeller() module only
propdia (100)
    Propeller arc diameter.
hubdia (10)
    Hub cylinder diameter where blade root starts.
bladepitch (-1)
    Blade pitch - typically between 75% to 133% of blade length for aircraft. Lower pitch has better climb performance, higher pitch has better cruise performance. Defaults to same value as propeller arc radius if negative. For a low-speed pullcopter or boat propellers, a pitch of at least 2×ArcRadius works well.

The next 3 parameters determine the chord of the airfoil at any point along the blade length. The chord of the airfoil, tilted by the angle of attack at the position along the length, is made to fit inside an ellipse constructed by one axis being the hub height and the other axis being the chord of the blade ellipse profile.

maxchordfrac (0.2)
    Maximum possible chord length for zero attack angle blade, as a fraction of blade length. Theoretical chord length at the hub if not wrapped around.
hublen (10)
    Fore-to-aft length of hub cylinder.
elenfrac (1.05)
    Fraction of blade length for ellipse profile (typically a bit longer than blade length).

Other blade properties

dir (-1)
    Rotation direction (1=CW, -1=CCW) when viewed from top of airfoil.
centerline (0.3)
    Position this fraction of each airfoil cross section on a centerline (0=align leading edge, 1=align trailing edge (recommended for printing), 0.5=align center of airfoil, 0.3=align thickest part of airfoil).
angle_sweep (0)
    Blade sweep expressed in degrees per millimeter, starting from the hub radius.
te_thickness (0.4)
    Thickness of airfoil trailing edge in mm.
fairing (3)
    Millimeters to thicken the root airfoil, transitioning to normal thickness this many millimeters from the hub.

4-digit NACA airfoil sections at root, midway, and tip

naca_root (8430)
    NACA code for airfoil at root (should be high-camber and thick).
naca_mid (6412)
    NACA code for main airfoil starting at transition point (6412 is standard for propellers).
naca_tip (3412)
    NACA code 3412 for tip airfoil (less camber, more symmetric).
root_transition (0.33)
    Fraction of blade length where root airfoil completes its transition to mid airfoil. Set to zero to disable root transition (such as when the hub is already large diameter, in which case the blade airfoil starts with naca_mid).

Resolution parameters

profilepoints (0)
    Number of points to generate for top and bottom airfoil surfaces. If zero, a value is chosen to approximate 1 mm segments for the longest chord. 20-30 segments is typically fine for small 3D printed drone propellers.
slices (0)
    Subdivide blade length into this number of slices. If zero, a value is chosen to give 1 mm slices.
*/

// =======================================================================

// ---------- DEMOS (uncomment as needed) ----------

demo_collection(); // collection of plausible propellers

// Example single blade:
//propblade(propdia=150, hubdia=15, hublen=12, bladepitch=100, elenfrac=1.1, maxchordfrac=0.2, centerline=0.4);

//demo_5random(); // make 5 random fans - click preview repeatedly to regenerate

//demo_nbladedprop(blades=4); // n-bladed propeller blades

//demo_printable_boatprop(); // printable toy boat propeller

// =======================================================================

// ---------- propeller ----------

// for argument explanation, see comments above or propblade() module below

module propeller(blades=2, propdia=100, hubdia=10, bladepitch=-1, maxchordfrac=0.15, hublen=10, elenfrac=1.1, dir=-1, centerline=0.3, angle_sweep=0, te_thickness=0.4, fairing=3, naca_root=9430, naca_mid=6412, naca_tip=4412, root_transition=0.33, profilepoints=0, slices=0) {
    for (a=[0:360/blades:359])
        rotate([0, 0, a])
            rotate([90, 0, 0])
                propblade(propdia=propdia, hubdia=hubdia, bladepitch=bladepitch, maxchordfrac=maxchordfrac, hublen=hublen, elenfrac=elenfrac, dir=dir, centerline=centerline, angle_sweep=angle_sweep, te_thickness=te_thickness, naca_root=naca_root, naca_mid=naca_mid, naca_tip=naca_tip, root_transition=root_transition, profilepoints=profilepoints, slices=slices, fairing=fairing);
}

// ---------- vertical blade ----------

module propblade(
    propdia=100,        // Propeller arc diameter.
    hubdia=10,          // Hub cylinder diameter where blade root starts.
    bladepitch=-1,      // Blade pitch - -1 defaults to 1/2 propdia.
    maxchordfrac=0.2,   // Maximum (at hub) chord length for zero attack if not wrapped around.
    hublen=10,          // Fore-to-aft length of hub cylinder.
    elenfrac=1.05,      // Fraction of blade length for ellipse profile.
    dir=-1,             // Rotation direction (1=CW, -1=CCW) when viewed from front.
    centerline=0.3,     // Align this fraction of each airfoil.
    angle_sweep=0,      // Blade sweep in degrees per millimeter.
    te_thickness = 0.4, // Thickness of airfoil trailing edge in mm.
    fairing=3,          // Millimeters to thicken (flair out) the root airfoil.
    naca_root = 8430,   // NACA code for airfoil at root (high-camber and thick).
    naca_mid = 6412,    // NACA code for main airfoil starting at transition point.
    naca_tip = 3412,    // NACA code for tip airfoil (less camber, more symmetric).
    root_transition = 0.33, // Fraction of blade length where root airfoil completes its transition to mid airfoil.
    profilepoints=0,    // Number of points for top and bottom of airfoils (0=calculate reasonable default).
    slices=0            // Slice blade length this many times (0=use 1mm slices).
    ) {

    // convert 4-digit NACA codes to dimensional values

    rootcamber = 0.01*floor(0.001*naca_root);       // root camber as fraction of chord
    rootcamberpos = 0.1*(floor(0.01*naca_root)%10); // root camber position as fraction of chord
    rootthickness = 0.01*(naca_root%100);           // root thickness as fraction of chord
    midcamber = 0.01*floor(0.001*naca_mid);         // mid camber as fraction of chord
    midcamberpos = 0.1*(floor(0.01*naca_mid)%10);   // mid camber position as fraction of chord
    midthickness = 0.01*(naca_mid%100);             // mid thickness as fraction of chord
    tipcamber = 0.01*floor(0.001*naca_tip);         // tip camber as fraction of chord
    tipcamberpos = 0.1*(floor(0.01*naca_tip)%10);   // tip camber position as fraction of chord
    tipthickness = 0.01*(naca_tip%100);             // tip thickness as fraction of chord

    // other initializations

    rhub = 0.5 * hubdia;            // hub radius
    length = 0.5*propdia - rhub;    // blade length from hub
    bpitch = bladepitch>=0 ? bladepitch : length;
    esemimajor = elenfrac*length;           // semimajor axis of ellipse
    maxchordlen = 2*maxchordfrac*length;    // full minor axis of ellipse
    hh = min(maxchordlen, hublen);  // hub height constraint for blade need not be longer than max chord
    ztrans = length*root_transition;    // transition point where root becomes mid airfoil    
    blen = length - ztrans;     // length of blade past the transition
    slicelen = slices > 0 ? length/slices : 1;  // size of cross-section slice
    airfoilsegs = profilepoints > 0 ?   // number of segments on one side of airfoil
        profilepoints : round(2*length * maxchordfrac);
    fairthickness =     // thickness adjustment for fairing at blade root
        fairing / ellipse_d(maxchordlen, hh, -dir*atan(bpitch/(2*PI*rhub)));

    // pxc is an array of airfoil profile cross-sections
    pxc = //fairing == 0 ? // make the blade if not making a fairing
        [
        // root section, from rhub to ztrans

        for(z=[(ztrans>0?0:-0.01*slicelen):slicelen:ztrans])
            let(
                rz = rhub + z,
                interp = sin(90*z/ztrans),
                fairthk = fairthickness * (fairing > 0 ? 1-sin(90*min(1,z/fairing)) : 0),
                thk = (midthickness-rootthickness)*interp+rootthickness + fairthk,
                cam = (midcamber-rootcamber)*interp+rootcamber,
                campos = (midcamberpos-rootcamberpos)*interp+rootcamberpos,
                attackangle = -dir*atan(bpitch/(2*PI*rz)),
                elen = maxchordlen*sqrt(1-z*z/(esemimajor*esemimajor)),
                chordlen = ellipse_d(elen, hh, attackangle))
                convert2dto3d(NACA_profile(airfoilsegs, cam, campos, thk, chordlen, centerline, dir, te_thickness), rz, attackangle, angle_sweep*sign(dir)),

        // main section, from ztrans to tip

        for(bz=[0:slicelen:blen+0.9*slicelen])
            let(z = min(bz,blen),
                ze = ztrans+z, rz = rhub + ze,
                interp = 1 - cos(90*z/blen),
                fairthk = fairthickness * (fairing > 0 ? 1-sin(90*min(1,ze/fairing)) : 0),
                thk = (tipthickness-midthickness)*interp+midthickness + fairthk,
                cam = (tipcamber-midcamber)*interp+midcamber,
                campos = (tipcamberpos-midcamberpos)*interp+midcamberpos,
                attackangle = -dir*atan(bpitch/(2*PI*rz)),
                elen = maxchordlen*sqrt(1-ze*ze/(esemimajor*esemimajor)),
                chordlen = ellipse_d(elen, hh, attackangle))
                convert2dto3d(NACA_profile(airfoilsegs, cam, campos, thk, chordlen, centerline, dir, te_thickness), rz, attackangle, angle_sweep*sign(dir))
        ];

    // assemble the blade object from all the airfoil cross-sections

    translate([0,(1-centerline)*hublen, 0])
        difference () {
            airfoil_polyhedron_stack(pxc); // connect all the profiles together into a big polyhedron
            // shave off anything extending under bottom of hub
            translate([0,-hublen*(1-centerline)-1,0]) cube([2*esemimajor+1, 2, 2*esemimajor+1], center=true);
        }

    // internal function to return chord length constrained by an ellipse defined by planform width and hub height
    function ellipse_d(majaxis, minaxis, angle) = // ellipse "diameter" at some angle
        let(a=0.5*majaxis, b=0.5*minaxis, bc = b*cos(angle), as = a*sin(angle))
            2 * a * b / sqrt(bc*bc + as*as);
}

// Given a stack of n-sided polygons in 3D space, connect them together into a polyhedron.
module airfoil_polyhedron_stack(stack) {
    nz = len(stack); // number of z layers
    np = len(stack[0]); // number of polygon vertices
    hnp = floor(np/2); // half of polygon vertices
    facets = [
        //[ for(j=[0:np-1]) j ], // close first opening
        for(k1=[0:hnp-1]) let(k2=k1+1, k3=np-2-k1, k4=np-1-k1) k1==k4 ? [k1,k2,k3] : [k1,k2,k3,k4],
        for(i=[0:nz-2])
            for(j=[0:np-1]) let(k1=i*np+j, k4=i*np+((j+1)%np), k2=k1+np, k3=k4+np)
                [k1, k2, k3, k4],
        // close last opening
        let(n=np*(nz-1)) for(k1=[0:hnp-1]) let(k2=k1+1, k3=np-2-k1, k4=np-1-k1) k2==k3 ? [k1+n,k4+n,k2+n] : [k1+n,k4+n,k3+n,k2+n]
    ];
    polyhedron(flatten(stack), facets, convexity=6);

    function flatten(v) = [ for (a=v) for (b=a) b ] ;
}

// ---------- spinners ----------

// parabolic propeller spinner
module paraboloc_spinner(length=20, diameter=20) {
    r = 0.5*diameter;
    p = [ [0,0], for(x=[0:0.05:1.001]) [ x*r, length*(1-x*x) ] ];
    rotate_extrude(angle=360, $fn=64) polygon(points=p);
}

// ogive (vertical slope base) propeller spinnner with rounded nose
// noseradius is a fraction of the diameter; must be <0.25
module ogive_spinner(length=20, diameter=20, noseradius=0.2) {
    rnose = noseradius*diameter;
    r = 0.5*diameter - rnose;
    ht = length-rnose;
    x = (ht*ht - r*r) / (2*r);
    circrad = x+r;
    astart = atan(ht/x);
    p = [ [0,rnose], for(a=[astart:-0.05*astart:-0.001]) [ circrad*cos(a)-x, circrad*sin(a) ] ];
    rotate_extrude(angle=360, $fn=64)
    difference() {
//        offset(r=rnose, $fn=32) polygon(points=p);
        translate([-rnose-1,-1]) square(size=[rnose+1,length+2]);
        translate([-1,-rnose-1]) square(size=[r+2+rnose, rnose+1]);
    }
}

// ---------- demo modules ----------

// demo: three bladed propeller
module demo_nbladedprop(blades=3) {
    color("#99ccff") difference() {
        union() {
            propeller(blades=blades, propdia=100, hubdia=10, fairing=2);
            cylinder(11, d=10, $fn=60);
        }
        translate([0,0,-1]) cylinder(13, d=3, $fn=36);
    }
}

// demo: Random propeller with properties displayed in console.
module demo_random() {
    // set random values for blade parameters
    nblades = floor(rands(1,6,1)[0]) + 1;
    elenfrac = rands(1.01,1.8,1)[0];
    maxchordfrac = rands(0.15,0.9,1)[0];
    centerline = rands(0,1,1)[0]; // 1=trailing edge always on build plate
    sweep = rands(-1.5,1.5,1)[0];
    dia = 150;

    echo("Blades:", nblades);
    echo("Ellipse length fraction:", elenfrac);
    echo("Max chord fraction:", maxchordfrac);
    echo("Centerline at:", centerline, "of chord length");
    echo("Sweep angle degrees per radial millimeter:", sweep);

    // render the propeller
    propeller(blades=nblades, propdia=dia, hubdia=10, bladepitch=0.5*dia, hublen=20, elenfrac=elenfrac, maxchordfrac=maxchordfrac, centerline=centerline, angle_sweep=sweep);

    // put a spinner in the middle
    ogive_spinner(25,30);

    // randomly put an airfoil ring around the propeller
    if (rands(0,1,1)[0] < 0.4)
        rotate_extrude(angle=360, $fn=192) translate([75,0,0]) rotate([0,0,-90])
            polygon(NACA_profile(20, 0, 0.4, 0.15, chordlen=min(20,0.5*dia*maxchordfrac), origin=1, dir=1, te_thick=0.4));
}

// demo: 5 random props at once
module demo_5random() {
    for(a=[0:72:359]) rotate([0,0,a]) translate([140,0,0]) color("#99ccff") demo_random();
}

// demo: example boat propeller (blades only no hub)
module demo_boatpropblades() {
    hublen = 25;
    dia=80;
    translate([0,0,hublen+0.1]) rotate([180,0,0]) // flip upside-down
        propeller(blades=3, propdia=dia, hubdia=12, bladepitch=60, maxchordfrac=.7, hublen=hublen, elenfrac=1.001, naca_root=6410, naca_mid=4410, naca_tip=2410, centerline=0.5, angle_sweep=1);
}

// demo: printable boat propeller with spinner
module demo_printable_boatprop() {
    hublen = 25;
    dia=80;
    difference() {
        translate([0,0,hublen+0.1]) rotate([180,0,0]) // flip upside-down
            propeller(blades=3, propdia=dia, hubdia=6, bladepitch=60, maxchordfrac=.7, hublen=hublen, elenfrac=1.1, naca_root=6412, centerline=0, angle_sweep=2);
        translate([0,0,-6]) cylinder(6, d=dia+7);  // shave off leading edges that penetrate buildplate
    }
    cylinder(hublen-1, r=3, $fn=64);   // add the hub
    translate([0,0,hublen-1]) ogive_spinner(6, 6); // add the spinner
}

module demo_collection() {
    // 3-blade model airplane propeller
    translate([0,-30,0]) demo_nbladedprop(3);

    // 2-blde model airplane propeller
    translate([60,-35,0]) rotate([0,0,-70]) {
        propeller(blades=2, propdia=90, hubdia=8, bladepitch=-1, maxchordfrac=0.15, hublen=10, elenfrac=1.001, dir=-1, centerline=0.3, angle_sweep=0, profilepoints=32, slices=50);
        cylinder(11, r=4, $fn=32);
    }

    // toy boat propeller
    translate([0,30,0]) color("#99FF99") rotate([0,0,-8]) {
        demo_boatpropblades();
        cylinder(24, r=6, $fn=64);   // add the hub
        translate([0,0,24]) ogive_spinner(8, 12); // add the spinner
    }

    // toy rubber-band airplane propeller
    translate([-33,8,0]) color("#FF9999") rotate([0,0,60]) {
        propeller(blades=2, propdia=80, hubdia=3, bladepitch=70, maxchordfrac=0.5, hublen=6, elenfrac=1.001, dir=1, centerline=0.5, angle_sweep=0, profilepoints=32, slices=50);
        cylinder(7, r=1.5, $fn=30);
    }

    // computer cooling fan
    translate([62,18,0]) color("#999999") rotate([0,0,-5]) {
        propeller(blades=5, propdia=70, hubdia=30, bladepitch=70, maxchordfrac=0.75, hublen=16, elenfrac=2, dir=1, naca_root=6412, centerline=0.5, angle_sweep=0, profilepoints=32, slices=50, fairing=0);
        cylinder(16, r=15, $fn=30);
    }
}

// ---------- functions ----------

// convert 2D airfoil profile to 3D, tilting by attack angle and sweeping around the prop axle

function convert2dto3d(a, z, attackangle=0, anglesweep=0) = let(
    rd = 180/PI, n = len(a)-1,
    cosat = cos(attackangle), sinat = sin(attackangle),
    rotmatrix = [[cosat, -sinat], [sinat, cosat]],
    tilta = [ for(i=[0:n]) rotmatrix * a[i] ], // tilt the 2D airfoil
    sweeprot = z*anglesweep // angle position of airfoil origin
    ) [ // wrap the tilted 2D airfoil around the propeller shaft at distance z
        for(i=[0:n]) let(ang = rd*tilta[i][0]/z + sweeprot)
            [ z*sin(ang), tilta[i][1], z*cos(ang) ]
    ];

/*
From http://airfoiltools.com/airfoil/naca4digit
Given NACA 4-digit airfoil code ABCC
x = fraction of chord for which to calculate
M = maximum camber as fraction of chord (A/10)
P = position of maximum camber as fraction of chord (B/10)
T = thickness as a fraction of chord (CC/100)
*/
        
// primary function - return a polygon representing an airfoil cross-section
// chordlen = length of chord in mm
// origin = fraction of chord at which to center the polygon (0=front, 1=tail)
// dir = direction (1=facing left, -1=facing right)
// te_thick = trailing edge thickness
function NACA_profile(n, M, P, T, chordlen=1, origin=0, dir=1, te_thick=0.2) =
    dir < 0 ?
    [
        for (x=[1.0:-1/n:0.1/n]) NACA_profile_lower(x, M, P, T, chordlen, origin, dir, te_thick),
        for (x=[0:1/n:1-0.1/n]) NACA_profile_upper(x, M, P, T, chordlen, origin, dir, te_thick),
        NACA_profile_upper(1, M, P, T, chordlen, origin, dir, te_thick)
    ]
    : [
        for (x=[1.0:-1/n:0.1/n]) NACA_profile_upper(x, M, P, T, chordlen, origin, dir, te_thick),
        for (x=[0:1/n:1-0.1/n]) NACA_profile_lower(x, M, P, T, chordlen, origin, dir, te_thick),
        NACA_profile_lower(1, M, P, T, chordlen, origin, dir, te_thick)
    ];

// supporting functions

function NACA_camber(x, M, P) =
    let(a = 2*P*x-x*x, denom = x<P ? P : 1-P)
        M * (x<P ? a : 1-2*P+a) / (denom*denom);

function NACA_gradient(x, M, P) =
    let(num = 2*M*(P-x), denom = x<P ? P : 1-P)
        num / (denom*denom);

function NACA_thickness(x, T) =
    let(a0=0.2969, a1=-0.126, a2=-0.3516, a3=0.2843, a4=-0.1036 /*gives closed trailing edge; normally use -0.1015 to have a thickness*/ , x2=x*x)
        5*T*(a0*sqrt(x) + a1*x + a2*x2 + a3*x2*x + a4*x2*x2);

function NACA_profile_upper(x, M, P, T, chordlen=1, origin=0, dir=1, te_thick=0.2) = let(
    xp = 0.5 * (1 - cos(180*x)),
    theta = atan(NACA_gradient(xp, M, P)),
    yc = NACA_camber(xp, M, P),
    yt = NACA_thickness(xp, T))
        [chordlen*dir*(xp - yt * sin(theta) - origin), chordlen*(yc + yt * cos(theta)) + xp*te_thick/2];

function NACA_profile_lower(x, M, P, T, chordlen=1, origin=0, dir=1, te_thick=0.2) = let(
    xp = 0.5 * (1 - cos(180*x)),
    theta = atan(NACA_gradient(xp, M, P)),
    yc = NACA_camber(xp, M, P),
    yt = NACA_thickness(xp, T))
        [chordlen*dir*(xp + yt * sin(theta) - origin), chordlen*(yc - yt * cos(theta)) - xp*te_thick/2];
