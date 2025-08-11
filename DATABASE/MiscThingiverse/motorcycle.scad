

// openscad motorcycle
// design copeid from:
// https://www.thingiverse.com/thing:2092113

// egg function used for tank taken from: 
// https://www.thingiverse.com/thing:38677

// the rest is simple and hopefully well commented

$fn=100;
//translate([0,-20,0])
//import("/home/lb/STL/Motorcycles/motorcycle1_centered.stl");
//cube([100,100,10],center=true);


egginess = -45; //[-100:100]

//egg(curveFactor = (100 + egginess) / 100);

//This makes an egg
//New
//-Fixed egg floating above 0 now sits on 0 like a cylinder

module egg( steps = 60, height = 100, curveFactor = 1, faces = 45 ) {	
    a = height;
    b = height * (0.78 * curveFactor);  //Through keen observation I have determined that egginess should be 0.78

    //Equation for the egg curve
    function eggCurve( offset ) = sqrt(abs( 
                                  a - b - 2 * offset * step 
                                  + sqrt( 4 * b * offset * step +
                                  pow(a - b, 2) ) ))
                                  * sqrt(offset * step) / sqrt(2);
	
	step = a / steps;
	union() {
        //This resembles the construction of a UV sphere
        //A series of stacked cylinders with slanted sides
        for( i = [0:steps]) {
		  //echo(i * step);
		  translate( [0, 0, a - ( i + 1 ) * step - 0.01] )
		    cylinder( r1 = eggCurve( i + 1 ),
		              r2 = eggCurve( i ), 
		              h = step,
		              $fn = faces );
		}
    }
}

    
 
 module back_wheel(){
     difference(){
         //base object
         sphere(r=6,center=true);
         //cutoff side
         translate([0,-6,0])
         cube([15,5,15],center=true);
         //cutoff other side
         translate([0,6,0])
         cube([15,5,15],center=true);
         // cut inset
         translate([0,-.5,0])
         rotate([90,0,0])
         cylinder(r1=3,r2=4.5,h=4);
         // cut other side inset
         translate([0,.5,0])
         rotate([-90,0,0])
         cylinder(r1=3,r2=4.5,h=4);
     }
 }
 
 module front_wheel() {
     difference(){
     scale([1.3,.6,1.3])
        sphere(r=4.7,center=true);
         //cutoff side
         translate([0,-4.1,0])
         cube([15,5,15],center=true);
         //cutoff other side
         translate([0,4.1,0])
         cube([15,5,15],center=true);
          // cut inset
         translate([0,-.5,0])
         rotate([90,0,0])
         cylinder(r1=3.5,r2=5.5,h=4);
         // cut other side inset
         translate([0,.5,0])
         rotate([-90,0,0])
         cylinder(r1=3.5,r2=5.5,h=4);
     }
     
}

module handlebar() {
    union() {
    translate([2.75,0,0])
        // curved piece
        difference() {
            //start with donut
            rotate_extrude()
            translate([5.5, 0, 0])
            circle(r = .65);
            
            // angle cut for bars
            translate([0,-5,0])
            rotate([0,0,15])
            cube([4,4,4],center=true);
            
            // angle cut for bars opposite side
            translate([0,5,0])
            rotate([0,0,-15])
            cube([4,4,4],center=true);
            
            // cut the rest off
            translate([-5,0,0])
            rotate([0,0,0])
            cube([7,16,16],center=true);
        }
        
        // right handlebar
        translate([1.5,-6.25,0])
        rotate([0,90,20])
        cylinder(r=.65,h=9,center=true);
        
        // left handlebar
        translate([1.5,6.25,0])
        rotate([0,90,-20])
        cylinder(r=.65,h=9,center=true);
    }  
    
}

//handlebar();

module headlight() {
    
    difference() {
        // start with outer shape - sloped cylinder
        rotate([0,-90,0])
        cylinder(r1=3.5,r2=1.5,h=5.5,center=true);
        
        // cut smaller sloped cylinder to create headlight shape
        translate([2.5,0,0])
        rotate([0,-90,0])
        cylinder(r1=3.5,r2=2,h=1.5,center=true);
    }
    
}
//headlight();

module fork() {

    union() {
        translate([-17.5,0,17])
        handlebar();
        
        translate([-7.6,0,15])
        headlight();

        //axle
        rotate([90,0,0])
        cylinder(r=1.1,h=11,center=true);

         
        //left fork
        rotate([0,-30,0])
        translate([0,3.8,-2])
        cylinder(r=1.2,h=22);
         
        //right fork
        rotate([0,-30,0])
        translate([0,-3.8,-2])
        cylinder(r=1.2,h=22);
         
         //fork brace 
        rotate([0,60,0])
        translate([-4,0,0])
        difference(){
            // start with donut shape by extruding a circle
            rotate_extrude()
            translate([3.8, 0, 0])
            circle(r = 1.2);
            // cut off half the donut shape to end up with a U shape
            translate([5,0,0])
            cube([10,10,10],center=true);

        }
    }
}

module engine() {
    union() {
        // round engine base
        translate([0,0,3.5])
        rotate([90,0,0])
        cylinder(r=2.6,h=5,center=true);
        
        // upper engine piece - start with a cube
        translate([0,0,6.2])
        difference() {
            cube([5.5,5.75,5],center=true);
            
            // cut away a rotated cube for one side of inverted triange shape
            translate([6.3,0,0])
            rotate([0,25,0])
            cube([8,8,19],center=true);
            
            // cut away a rotated cube for other side of inverted triange shape
            translate([-6.3,0,0])
            rotate([0,-25,0])
            cube([8,8,10],center=true);    
        }
    }

}


module exhaust() {
    
    union() {
        
        difference() {
            // pipe bend
            // start with dounut shape
            rotate_extrude()
            translate([3, 0, 0])
            circle(r = .9);
            // cut away half of donut
            translate([-4,0,0])
            cube([8,18,18],center=true);
        }
        // pipe section -- r1 is bigger adding a little flare to the pipe
        translate([-14.9,3,0])
        rotate([0,90,0])
        cylinder(r1=1.25,r2=.9,h=15);
        
    }
    
}

//exhaust();

module top_tube() {
    translate([-13,0,4])
    rotate([0,-28,0])
    union() {
        // start with a long cylinder
        rotate([0,90,0])
        cylinder(r=1.25,h=22.5);
        
        // connect to flattened shpere with a hole cut for the rear wheel
        difference() {
            scale([1,1,.4])
                translate([-4.2,0,0])
                sphere(r=5.25,center=true);
                // cut wheel hole
                translate([-4.2,0,0])
                cylinder(r=4.2, h=28,center=true);
        }
    }
    
}

//top_tube();

module seat() {
    
    difference() {
        // start with a short cylinder
        cylinder(r=5,h=6,center=true);
        // cut for curved top of seat
        translate([0,0,9])
        rotate([90,0,0])
        cylinder(r=8,h=10,center=true);
        // cut for rear wheel clearance
        translate([-10.,0,-12.6])
        sphere(r=15);
        // cut to shape bottom front of seat
        translate([8,0,-18.5])
        rotate([90,0,0])
        cylinder(r=20,h=10,center=true);
        // cut for  legroom
        translate([4.5,4,2])
        rotate([0,0,0])
        cylinder(r=3,h=5,center=true);
        //cut for legroom
        translate([4.5,-4,2])
        rotate([0,0,0])
        cylinder(r=3,h=5,center=true);
    }
    
}

//seat();


module tank() {
    union() {
        rotate([0,240,0])
        scale([.08,.14,.14])
        egg(curveFactor = (140 + egginess) / 100);
        // join small cylinder -- gas cap
        translate([-3,0,-1.5])
        cylinder(r=1,h=3);
    }
    
}

//tank();

module chassis() {
    // some code and some modules
    // start putting some pieces together
    
    difference() {
        // surfboard shape baselpate
        hull(){
            scale([1,1,.25])
            translate([4,0,0])
            sphere(r=5.25,center=true);
            translate([-15.5,0,0])
            scale([1,1,.25])
            sphere(r=5.25,center=true);
        }
        // cut out hole for rear wheel
        translate([-16,0,0])
        scale([.8,1,1])
        cylinder(r=4.5,h=10,center=true);
        
    }
    
    engine();
    
    // down tube
    translate([3,0,0])
    rotate([0,15,0])
    cylinder(r=1.25,h=17.7);
    
    
    top_tube();
    
    translate([5,0,16])
    tank();
    
    //exhaust 1
    translate([2,3.75,2.25])
    rotate([-40,0,0])
    exhaust();
    
    //exhaust 2
    translate([2,-3.75,2.25])
    rotate([-140,0,0])
    exhaust();
    
    translate([-14,0,5])
    seat();
    
}

module motorcycle() {
    union() {
        translate([17.6,0,0])
        front_wheel();
        translate([-20,0,0])
        back_wheel();
        translate([17.6,0,0])
        fork();
        chassis();
    }
}

motorcycle();


