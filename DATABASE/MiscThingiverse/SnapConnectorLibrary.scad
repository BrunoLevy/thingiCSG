$fn=100;
// This library simplifies modelling of annular, cantilever, and torsional snapfits
// if you are printing for FDM, where possible aim to have flexing parts oriented sideways on the bed (ie as they are in the examples)

// Examples are at the end of the file

// Be aware the ball sockets and sine/bump-toothed annular snapfits are relatively slow to process and can make viewing in preview jittery, so are not shown by default...

viewExamples = true;
viewSlowExamples = false;




module lockPlate(height, width, ratio, sides) {
    //restrict slope to approx 45deg
    cylinder(height,width,width+height*width/ratio, $fn=sides);
}    

module lockSlot(height, width, ratio, wall, sides) {
    //restrict slope to approx 45deg
    difference() {
        cylinder(height,width+height*width/ratio+wall,width+wall, $fn=sides);
        translate([0,0,-0.001]) lockPlate(height+0.002, width, ratio, sides);
    }
}    


module annularFemale(length=10, ID=4.5, OD=5.4, baseRatio=1.2, toothDistanceFromEnd=3, toothMinWallThickness=0.5, tooth="ridge", toothLength=1.5,toothHeight=0.3, baseRelief=true, reliefRadius = 1, ridgeToothRatio = 0.75, toothOut = true) {

    difference() {
        union() {
            cylinder(length,OD+(baseRatio-1)*(OD-ID),OD);
            if (toothOut==true) {
                // thicken the wall over the tooth so it is at least toothMinWallThickness
                translate([0,0,length-toothDistanceFromEnd])
                if (tooth=="sine") {sineTorus(ID,toothLength+(OD-ID),toothHeight+toothMinWallThickness);}
                else if  (tooth=="bump") {bumpTorus(ID,toothLength+(OD-ID),toothHeight+toothMinWallThickness);}
                else if  (tooth=="tri") {triTorus(ID,toothLength+(OD-ID),toothHeight+toothMinWallThickness);}
                else if  (tooth=="ridge") {ridgeTorus(ID,toothLength+(OD-ID),toothHeight+toothMinWallThickness,ridgeToothRatio);}
            }
        }
        translate([0,0,-0.001]) cylinder(length+1,ID,ID);
        if (toothOut==true) {
            translate([0,0,length-toothDistanceFromEnd])
            // cut out the tooth
            if (tooth=="sine") {sineTorus(ID-0.001,toothLength,toothHeight);}
            else if  (tooth=="bump") {bumpTorus(ID-0.001,toothLength,toothHeight);}
            else if  (tooth=="tri") {triTorus(ID-0.001,toothLength,toothHeight);}
            else if  (tooth=="ridge") {ridgeTorus(ID-0.001,toothLength,toothHeight,ridgeToothRatio);}
        }
    }
    
    // If this code is inside the difference clause it gets cut out by the hollowing-out cylinder
    if (toothOut!=true) {
        // add the tooth directed inward
        translate([0,0,length-toothDistanceFromEnd])
        if (tooth=="sine") {sineTorus(ID-0.001,toothLength,toothHeight,toothOut);}
        else if  (tooth=="bump") {bumpTorus(ID-0.001,toothLength,toothHeight,toothOut);}
        else if  (tooth=="tri") {triTorus(ID-0.001,toothLength,toothHeight,toothOut);}
        else if  (tooth=="ridge") {ridgeTorus(ID-0.001,toothLength,toothHeight,ridgeToothRatio,toothOut);}
    }

    // add strain relief at base
    if (baseRelief==true) {
        rotate_extrude() 
        translate( [ OD+(baseRatio-1)*(OD-ID), 0, 0 ] )
        polygon( [[0,0],[1,0],for (i =  [0 : 360/$fn : 90]) [reliefRadius*(1-sin(i)), reliefRadius*(1-cos(i))]]);
    }
    
}


module annularMale(length=10, ID=4, OD=4.5, baseRatio=1.35, toothDistanceFromEnd=0, toothMinWallThickness=0.5, tooth="ridge", toothLength=1.5,toothHeight=0.3, baseRelief=true, reliefRadius = 1, ridgeToothRatio = 0.75, toothOut = false) {

    difference() {
        union() {
            cylinder(length,OD,OD);
            if (toothOut==true) {
                translate([0,0,toothDistanceFromEnd+toothLength/2])
                if (tooth=="sine") {sineTorus(OD,toothLength,toothHeight);}
                else if  (tooth=="bump") {bumpTorus(OD,toothLength,toothHeight);}
                else if  (tooth=="tri") {triTorus(OD,toothLength,toothHeight);}
                else if  (tooth=="ridge") {ridgeTorus(OD,toothLength,toothHeight,ridgeToothRatio);}
            }
        }
        translate([0,0,-0.001]) cylinder(length+1,ID,ID-(baseRatio-1)*(OD-ID));
        if (toothOut!=true) {
            translate([0,0,toothDistanceFromEnd+toothLength/2])
            // cut out the tooth
            if (tooth=="sine") {sineTorus(OD+0.001,toothLength,toothHeight,toothOut);}
            else if  (tooth=="bump") {bumpTorus(OD+0.001,toothLength,toothHeight,toothOut);}
            else if  (tooth=="tri") {triTorus(OD+0.001,toothLength,toothHeight,toothOut);}
            else if  (tooth=="ridge") {ridgeTorus(OD+0.001,toothLength,toothHeight,ridgeToothRatio,toothOut);}
        }
    }

    // If this in inside the difference clause it gets cut out by the hollowing-out cylinder
    // thicken the wall under the tooth so it is at least toothMinWallThickness
    if (toothOut!=true) {
        translate([0,0,toothDistanceFromEnd+toothLength/2]) difference() {
            if (tooth=="sine") {sineTorus(OD,toothLength+(OD-ID),toothHeight+toothMinWallThickness,toothOut);}
            else if  (tooth=="bump") {bumpTorus(OD,toothLength+(OD-ID),toothHeight+toothMinWallThickness,toothOut);}
            else if  (tooth=="tri") {triTorus(OD,toothLength+(OD-ID),toothHeight+toothMinWallThickness,toothOut);}
            else if  (tooth=="ridge") {ridgeTorus(OD,toothLength+(OD-ID),toothHeight+toothMinWallThickness,ridgeToothRatio,toothOut);}
            
            if (tooth=="sine") {sineTorus(OD+0.001,toothLength,toothHeight,toothOut);}
            else if  (tooth=="bump") {bumpTorus(OD+0.001,toothLength,toothHeight,toothOut);}
            else if  (tooth=="tri") {triTorus(OD+0.001,toothLength,toothHeight,toothOut);}
            else if  (tooth=="ridge") {ridgeTorus(OD+0.001,toothLength,toothHeight,ridgeToothRatio,toothOut);}
            
        }
    }
    
    // add strain relief at base
    if (baseRelief==true) {
        translate([0,0,length])
        rotate_extrude() 
        translate( [ -(ID-(baseRatio*(1-toothLength/length)-1)*(OD-ID)), 0, 0 ] )
        polygon( [[0,0],[1,0],for (i =  [0 : 360/$fn : 90]) [reliefRadius*(1-sin(i)), -reliefRadius*(1-cos(i))]]);
    }
  
    
}


module triTorus(ID=5,toothLength=1.5,toothHeight=0.7,toothOut = true) {
    //some of the resize, projection, and rotate_extrude results are really bizarre, so haven't figured out how to use the xTooth() functions as the basis of a torus
    ID= toothOut==true ? ID : -1*ID;
    
    rotate_extrude() 
    translate([ID,0,0])     
    polygon( points = [[0, -toothLength/2], [ toothHeight ,0], [ 0, toothLength/2 ]], paths = [[0,1,2]]);
}

module bumpTorus(ID=5,toothLength=1.5,toothHeight=0.7,toothOut = true) {
    // NB This doesn't correctly extrude with the middle section excluded
    ID= toothOut==true ? ID : -1*ID;

    rotate_extrude() 
	translate( [ ID, 0, 0 ] )
    polygon( [for (i =  [0 : 360/$fn : 180]) [toothHeight*sin(i), toothLength/2*cos(i)]]);
    
}

module sineTorus(ID=5,toothLength=1.5,toothHeight=0.7,toothOut = true) {
    ID= toothOut==true ? ID : -1*ID;

    rotate_extrude() 
	translate( [ ID, 0, 0 ] )
    polygon( [for (i =  [-90 : 360/$fn : 270]) [(sin(i)/2+0.5)*toothHeight, (i/360*toothLength-0.25*toothLength)]]);
}

module ridgeTorus(ID=5,toothLength=1.5,toothHeight=0.7, ratio=0.75,toothOut = true) {
    ID= toothOut==true ? ID : -1*ID;

    rotate_extrude() 
	translate( [ ID, 0, 0 ] )
	polygon( points = [ [ 0, -toothLength/2], [ toothHeight, -toothLength/2+toothLength*ratio ], [toothHeight, toothLength/2], [ 0, toothLength/2] ], paths = [ [ 0, 1, 2, 3 ] ] );
}




module torus(outerRadius, innerRadius)
{
  r=(outerRadius-innerRadius)/2;
  rotate_extrude() translate([innerRadius+r,0,0]) circle(r);
}

module torus2(r1, r2)
{
  rotate_extrude() translate([r1,0,0]) circle(r2);
}




module gripper(length=0, gap=0, height=0, thickness=0, diameter=2, core="ballSub", rounded=true, slot=false) {
    if ((core=="ballSub" || core== "axleSub") && (diameter<=gap)) { echo("WARNING: gripper gap is larger than diameter: no cutout will form");}

    // if one of the dimensions hasn't been defined then set it relative to the diameter
    length= length==0 ? diameter : length;
    gap= gap==0 ? diameter*0.75 : gap;
    height= height==0 ? diameter : height;
    thickness= thickness==0 ? diameter/4 : thickness;
    
    
    difference() {
        union() {
            if (rounded==true) {
                if (core!="axleAdd" || gap<diameter) {
                    translate([length/2,0, -height/2]) cylinder(height,gap/2+thickness,gap/2+thickness); // base
                } else {
                    translate([length/2+diameter/2,-gap/2+diameter/2, -height/2]) cube([thickness,gap-diameter,height]);  // base
                    translate([length/2,gap/2-diameter/2, -height/2]) cylinder(height,diameter/2+thickness,diameter/2+thickness); // base corner
                    translate([length/2,-(gap/2-diameter/2), -height/2]) cylinder(height,diameter/2+thickness,diameter/2+thickness); // base corner
                }
                translate([-length/2,-gap/2-thickness, -height/2]) cube([length,thickness,height]);  // side
                translate([-length/2,gap/2, -height/2]) cube([length,thickness,height]);   // side
            } else {
                translate([length/2+gap/2,-gap/2-thickness, -height/2]) cube([thickness,gap+thickness*2,height]);  // base
                translate([-length/2,-gap/2-thickness, -height/2]) cube([length+gap/2,thickness,height]);  // side
                translate([-length/2,gap/2, -height/2]) cube([length+gap/2,thickness,height]);   // side
            }
            
            translate([-length/2,gap/2+thickness/2, -height/2]) cylinder(height,thickness/2,thickness/2); //tip
            translate([-length/2,-gap/2-thickness/2, -height/2]) cylinder(height,thickness/2,thickness/2); // tip

        }
        if (core=="ballSub") {
            sphere(diameter/2);
        } else if (core=="axleSub") {
            translate([0,0,-height]) cylinder(height*4,diameter/2,diameter/2);
        }
        if (rounded==true) {
                if (core!="axleAdd" || gap<diameter) {
                    translate([length/2,0, -height]) cylinder(height*2,gap/2,gap/2); // base cutout
                    translate([-length/2,-gap/2, -height]) cube([length,gap,height*2]); // gap cutout
                } else {
                    translate([-thickness*2-diameter/2,-gap/2+diameter/2, -height]) cube([length+diameter,gap-diameter,height*2]);  // base
                    translate([length/2,gap/2-diameter/2, -height]) cylinder(height*2,diameter/2,diameter/2); // base
                    translate([length/2,-(gap/2-diameter/2), -height]) cylinder(height*2,diameter/2,diameter/2); // base
                    translate([-length/2,-gap/2, -height]) cube([length,gap,height*2]); // gap cutout
                }
        }
        if (slot==true) {
            translate([-length/2-thickness/2,-gap*2-thickness*2, -gap*0.05]) cube([length+thickness,gap*4+thickness*4,gap*0.1]); // gap cutout
        }
    }
    if (core=="ballAdd") {
        sphere(diameter/2);
    } else if (core =="axleAdd") {
        translate([0,gap/2,0]) rotate([90,0,0]) cylinder(gap,diameter/2,diameter/2);
    }

    
}



// Ball and socket

module ball() {
    sphere(r=1);
    translate([0,0,-2]) cylinder(2,0.3,0.3);
}

module ballHalf() {
    difference() {
        //ball();
        union() {
            sphere(r=1);
            translate([0,0,-2]) cylinder(2,0.3,0.3);
        }
        translate([0,-1.5,-3.5]) cube([1,3,5]);
    }
}



module ballsocketB() {
    rotate([0,0,90]) {
        difference() {
            sphere(1.1);
            sphere(0.999);
            translate([0,0,1.5]) sphere(1.5);
            translate([0.4,-1.5,-1.5]) cube([1,3,3]);
            translate([-1.4,-1.5,-1.5]) cube([1,3,3]);
            
        }
        translate([-0.4,0.2,-0.95]) sphere(0.05);
        translate([-0.4,-0.2,-0.95]) sphere(0.05);
        translate([0.4,0.2,-0.95]) sphere(0.05);
        translate([0.4,-0.2,-0.95]) sphere(0.05);
        translate([0,0,-1.2]) cylinder(0.2,0,0.2);
    }
}

module ballsocketA() {
    difference() {
        union() {
            difference() {
                sphere(1.1);
 //               translate([0.4,-1.5,-1.5]) cube([1,3,3]);
 //               translate([-1.4,-1.5,-1.5]) cube([1,3,3]);
 //               translate([-1.4,-0.2,-1.5]) cube([3,0.4,3]);
            }
            translate([0,0,-2]) cylinder(2,0.3,0.3);
            difference() {
                sphere(1.2);
                difference() {
                    translate([0,0,-2]) cylinder(3,2,2);
                    translate([0,0,-2]) cylinder(3,0.7,0.7);
                }
            }
        }
        sphere(1);
        translate([0,0,1.5]) sphere(1.5);
        translate([0.4,-1.5,-1.5]) cube([1,3,3]);
        translate([-1.4,-1.5,-1.5]) cube([1,3,3]);
        ballsocketB();
    }
}
    



module singleHook(length=10,width=5,tipHeight=1, baseRatio=1.35, tooth="sine", toothLength=1.5,toothWidth=0,toothHeight=0.7, baseRelief=true, reliefRadius = 1, ridgeToothRatio = 0.75, opposingHook=false, layerThickness=0.8) {

    // set defaults if they haven't been defined
    tipHeight= tipHeight!=0 ? tipHeight : length*0.07;
    toothWidth= toothWidth!=0 ? toothWidth : width;

    // create the main shaft of the hook
    translate([0,-width/2,0])
    rotate([0,-90,-90])
    linear_extrude(width) 
    polygon( points = [[0, 0], [ 0, length ], [ -tipHeight * baseRatio, length ], [-tipHeight,0]], paths = [[0,1,2,3]]);

    // add strain relief at base of hook
    if (baseRelief==true) {
        translate([length- reliefRadius,width/2,-tipHeight * baseRatio - reliefRadius]) 
        rotate([90,0,0])
        difference() {
            cube([reliefRadius,tipHeight * baseRatio + 2 * reliefRadius,width]);
            translate([0,0,-1]) cylinder(width+2, reliefRadius, reliefRadius);
            translate([0,tipHeight * baseRatio + 2 * reliefRadius,-1]) cylinder(width+2, reliefRadius, reliefRadius);
        }
    }
    
    polytooth(tooth, toothLength,toothWidth,toothHeight,5,1,ridgeToothRatio);
    
    if (opposingHook==true) {
        translate([toothLength*2+layerThickness,0,0]) rotate([0,0,180])
        polytooth("ridge", toothLength,toothWidth,toothHeight, 0,1,ridgeToothRatio);
    }

}

//call this with the same values as singleHook to create an object which can be used to cut out the required space for the hook
module singleHookCutout(length=10,width=5,tipHeight=1, baseRatio=1.35, tooth="sine", toothLength=1.5,toothWidth=0,toothHeight=0.7, baseRelief=true, reliefRadius = 1, ridgeToothRatio = 0.75, opposingHook=false, layerThickness=0.8) {

    // set defaults if they haven't been defined
    tipHeight= tipHeight!=0 ? tipHeight : length*0.07;
    toothWidth= toothWidth!=0 ? toothWidth : width;

    // create space for the main shaft and tooth of the hook
    translate([0,-width/2,-tipHeight-toothHeight])
    cube([length,width,tipHeight+toothHeight]);

    singleHook(length,width,tipHeight, baseRatio, tooth, toothLength,toothWidth,toothHeight, baseRelief, reliefRadius, ridgeToothRatio, opposingHook, layerThickness);
    
}

// This joins two walls in a plane with each other
// Set centreAlignedWalls=true if the one face of each wall are aligned (eg forming a flat outside)
// Set centreAlignedWalls=false if the centres of each wall are aligned
module wallJoiner(layer1Thickness=0.8, layer2Thickness=2, layerGap=15, length=10,width=5,tipHeight=0, baseRatio=1.35, tooth="ridge", toothLength=1.5,toothWidth=0,toothHeight=0, toothGap =0.2, baseRelief=false, reliefRadius = 1, ridgeToothRatio = 0.75, opposingHook=false, centreAlignedWalls=false) {
    
    // set defaults if they haven't been defined
    layer2Thickness= layer2Thickness!=0 ? layer2Thickness : layer1Thickness;
    layerSpacer= layer1Thickness<layer2Thickness ? layer2Thickness : layer1Thickness;

    tipHeight= tipHeight!=0 ? tipHeight : length*0.07;
    toothWidth= toothWidth!=0 ? toothWidth : width;
    toothHeight1= toothHeight!=0 ? toothHeight : (layer1Thickness-toothGap)/2;
    toothHeight2= toothHeight!=0 ? toothHeight : (layer2Thickness-toothGap)/2;
    
    wall1ZCentre= centreAlignedWalls==false ? layer1Thickness/2+tipHeight*baseRatio : layerSpacer/2+tipHeight*baseRatio;
    wall2ZCentre= centreAlignedWalls==false ? layer2Thickness/2+tipHeight*baseRatio : layerSpacer/2+tipHeight*baseRatio;
    
    // create 4 hooks facing towards each other
    // WallOne Hooks
    translate([0,0,-wall1ZCentre+layer1Thickness/2]) rotate([180,0,0]) 
      singleHook(length, width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight1,baseRelief,reliefRadius,ridgeToothRatio, opposingHook, layer1Thickness);
    
    translate([0,0,-wall1ZCentre-layer1Thickness/2]) rotate([0,0,0]) 
      singleHook(length, width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight1,baseRelief,reliefRadius,ridgeToothRatio, opposingHook, layer1Thickness);

    // WallTwo Hooks    
    translate([length*2,0,-wall2ZCentre+layer2Thickness/2]) rotate([180,0,180]) 
      singleHook(length, width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight2,baseRelief,reliefRadius,ridgeToothRatio, opposingHook, layer2Thickness);
    
    translate([length*2,0,-wall2ZCentre-layer2Thickness/2]) rotate([0,0,180]) 
      singleHook(length, width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight2,baseRelief,reliefRadius,ridgeToothRatio, opposingHook, layer2Thickness);
    
    // centre joining block
    translate([length-layerSpacer/2-tipHeight*baseRatio,-width/2,-wall1ZCentre-layer1Thickness/2])
      cube([layerSpacer/2+tipHeight*baseRatio,width,layer1Thickness]);
    translate([length,-width/2,-wall2ZCentre-layer2Thickness/2])
      cube([layerSpacer/2+tipHeight*baseRatio,width,layer2Thickness]);
    translate([length-layerSpacer/2-tipHeight*baseRatio,-width/2,-layerSpacer/2-tipHeight*baseRatio])  rotate([0,45,0]) 
      cube([sqrt(pow((layerSpacer/2+tipHeight*baseRatio),2)*2),width,sqrt(pow((layerSpacer/2+tipHeight*baseRatio),2)*2)]);
}

// This joins two layers parallel to each other separated by layerGap
module layerJoiner(layer1Thickness=0.8, layer2Thickness=0, layerGap=15, length=10,width=5,tipHeight=0, baseRatio=1.35, tooth="ridge", toothLength=1.5,toothWidth=0,toothHeight=0.7, baseRelief=false, reliefRadius = 1, ridgeToothRatio = 0.75, opposingHook=true) {
    
    // set defaults if they haven't been defined
    layer2Thickness= layer2Thickness!=0 ? layer2Thickness : layer1Thickness;
    tipHeight= tipHeight!=0 ? tipHeight : length*0.07;
    toothWidth= toothWidth!=0 ? toothWidth : width;

    // create 4 hooks facing away from each other
    singleHook(layerGap/2+layer1Thickness+toothLength, width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight,baseRelief,reliefRadius,ridgeToothRatio, opposingHook, layer1Thickness);
    translate([0,0,(-tipHeight-toothHeight)*2]) rotate([180,0,0]) 
      singleHook(layerGap/2+layer1Thickness+toothLength, width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight,baseRelief,reliefRadius,ridgeToothRatio, opposingHook, layer1Thickness);
    translate([toothLength*2+layer1Thickness*2+layerGap,0,0]) rotate([0,0,180]) 
      singleHook(layerGap/2+layer1Thickness+toothLength, width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight,baseRelief,reliefRadius,ridgeToothRatio, opposingHook, layer2Thickness);
    translate([toothLength*2+layer1Thickness*2+layerGap,0,(-tipHeight-toothHeight)*2]) rotate([180,0,180]) 
      singleHook(layerGap/2+layer1Thickness+toothLength, width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight,baseRelief,reliefRadius,ridgeToothRatio, opposingHook, layer2Thickness);
    
    // centre joining cube
    translate([-layerGap/6+toothLength+layer1Thickness+layerGap/2,-width/2,(-tipHeight-toothHeight)*2]) cube([layerGap/3,width,-(-tipHeight-toothHeight)*2]);
}

module layerJoinerCutout(layer1Thickness=0.8, layer2Thickness=0, layerGap=15, length=10,width=5,tipHeight=0, baseRatio=1.35, tooth="ridge", toothLength=1.5,toothWidth=5,toothHeight=0.7, baseRelief=false, reliefRadius = 1, ridgeToothRatio = 0.75, opposingHook=true) {
    // set defaults if they haven't been defined
    tipHeight= tipHeight!=0 ? tipHeight : length*0.07;

    layerJoiner(layer1Thickness, layer2Thickness, layerGap, length,width,tipHeight,baseRatio,tooth,toothLength,toothWidth,toothHeight,baseRelief,reliefRadius,ridgeToothRatio, opposingHook);    
    
    translate([0,-width/2,-2*(tipHeight+toothHeight)])
    cube([2*(layerGap/2+layer1Thickness+toothLength),width,2*(tipHeight+toothHeight)]);
}

  

module polytooth(tooth="sine",length=1,width=1,height=1,ratio=1,repeats=1, ridgeRatio = 0.75) {
    // if height == 0 then set it to a ratio of length
    height= height!=0 ? height : length*ratio;
    
    for (i=[0: 1: repeats-1])
    translate([i*length,0,0])
    scale([length,width,height])
    if (tooth=="sine") {sineTooth();}
    else if  (tooth=="bump") {bumpTooth();}
    else if  (tooth=="tri") {triTooth();}
    else if  (tooth=="ridge") {ridgeTooth(ridgeRatio);}
}

module triTooth() {
    rotate( [ 90, 0, 0 ] )
    resize([1,1,1]) 
    polygon( points = [[0, 0], [ 0.5, 1 ], [ 1, 0 ]], paths = [[0,1,2]]);
}

module bumpTooth() {
	translate( [ 0.5, 0, 0 ] )
   difference() {
        resize([1,1,1]) sphere(0.5);
        translate([-0.5,-0.5,-1]) cube([1,1,1]);
	}
}


module sineTooth() {
	translate( [ 0.25, 0, 0.5 ] )
	rotate( [ 90, 0, 0 ] )
    resize([1,1,1]) polygon( [for (i =  [-90 : 360/$fn : 270]) [i, sin(i)]]);
}

module ridgeTooth(ratio=0.75) {
	rotate( [ 90, 0, 0 ] )
	polygon( points = [ [ 0, 0], [ ratio, 1 ], [1, 1], [ 1, 0] ], paths = [ [ 0, 1, 2, 3 ] ] );
}
























// Examples

if(viewExamples) {

//These are the lockslot plate and socket
//I'm actually not sure why you might want a socket, as I'd expect to just use the plate in a difference operation to create the socket
    // but you get one anyway...
color("orange") translate([-25,-15,2]) rotate([0,180,60]) lockPlate(0.4, 3, 4, 3);
translate([-25,-15,0]) lockSlot(0.4, 3, 4, 1, 3);
    
    
//These are the polytooth patterns in the centre
//polytooth(tooth="sine",length=1,width=1,height=1,ratio=1,repeats=1, ridgeRatio = 0.75)    
translate([-25,3,0]) polytooth("sine",1.5,6,0.5,5,8);
translate([-12,3,0]) polytooth("ridge",3,5,1,5,3);
translate([-2,3,0]) polytooth("tri",3,5,1,5,4);
translate([13,3,0]) polytooth("bump",3,3,3,5,4);

//The Hook and cutout at the back on the Left
translate([-25,10,2.5]) rotate([90,0,0]) {
    singleHook(tooth="ridge", baseRelief=true);
    #translate([0,0,-4]) singleHookCutout(tooth="ridge", baseRelief=true);
}

//The Double-ended "layerJoiner" at the back on the Left
translate([-25,20,2.5])  rotate([90,0,0]) layerJoiner(layerGap=7, width=3, tooth="sine", toothHeight=0.4);

//The Double-ended "layerJoiner" Hooks in the middle (hooks point out)
//layerJoiner(layer1Thickness=0.8, layer2Thickness=0, layerGap=15, length=10,width=5,tipHeight=0, baseRatio=1.35, tooth="ridge", toothLength=1.5,toothWidth=0,toothHeight=0.7, baseRelief=false, reliefRadius = 1, ridgeToothRatio = 0.75, opposingHook=true)
translate([-10,10,2.5]) rotate([90,0,0]) layerJoiner();
#translate([-10,15,2.5]) rotate([90,0,0]) layerJoinerCutout();


//The Double-ended "wallJoiner" Hooks in the middle (hooks point in)
translate([-10,22,2.5]) rotate([90,0,0]) wallJoiner(centreAlignedWalls=false);
translate([-10,28,2.5]) rotate([90,0,0]) wallJoiner(centreAlignedWalls=true);



//the multiple hooks on the RHS at the back
//singleHook(length=10,width=5,tipHeight=1, baseRatio=1.35, tooth="sine", toothLength=1.5,toothWidth=0,toothHeight=0.7, baseRelief=true, reliefRadius = 1, ridgeToothRatio = 0.75, opposingHook=false, layerThickness=0.8)
translate([15,10,2.5]) rotate([90,0,0]) {
    singleHook(tooth="sine", toothHeight=0.7, baseRelief=true);
    translate([0,0,-5]) singleHook(tooth="bump", toothHeight=1.5, baseRelief=true);
    translate([0,0,-10]) singleHook(tooth="tri", toothHeight=1.5, baseRelief=true);
    translate([0,0,-15]) singleHook(tooth="ridge", toothLength=2, toothHeight=1, baseRelief=true);
    //#translate([0,0,-4]) singleHookCutout(tooth="ridge", baseRelief=true);
}

//The square gripper just in front of the polytooth row
translate([-15,-15,3]) scale([3,3,3]) gripper(height=1, thickness=0.5, gap=1.9, diameter=2, core="ballAdd", rounded=false);

//The rounded ball gripper just in front of the polytooth row
translate([0,-15,3]) scale([3,3,3]) {
    color("orange") rotate([0,90,0]) ball();
    gripper(slot = true);
}

//The long axle grip on the right of the row
color("orange") translate([15,-15,3]) rotate([90,0,180]) scale([3,3,3]) gripper(diameter=1, height=5, core="axleSub");
translate([18,-15,3]) scale([3,3,3]) gripper(gap = 6, diameter=1, core="axleAdd");


// Be aware the sine annular snapfits are relatively slow to process (esp when varying view in preview)...

// Draw annular snapfit
//annularFemale(length=10, ID=4.5, OD=5.4, baseRatio=1.2, toothDistanceFromEnd=3, toothMinWallThickness=0.5, tooth="ridge", toothLength=1.5,toothHeight=0.3, baseRelief=true, reliefRadius = 1, ridgeToothRatio = 0.75, toothOut = true)
//annularMale(length=10, ID=4, OD=4.5, baseRatio=1.35, toothDistanceFromEnd=0, toothMinWallThickness=0.5, tooth="ridge", toothLength=1.5,toothHeight=0.3, baseRelief=true, reliefRadius = 1, ridgeToothRatio = 0.75, toothOut = false)
translate([35,10,0]) scale([0.8,0.8,0.8]) {
    difference() {
        annularFemale(length=5, ID=4.5, OD=5.4, baseRelief=false, toothDistanceFromEnd=3, tooth="tri");
        translate([-7,-7,-0.001]) cube([7,7,12]);
    }

    color("orange") translate([0,0,7]) difference() {
        annularMale(tooth="tri",OD=4.5,ID=4, baseRelief=false);
        annularMale(tooth="tri",OD=4,ID=3, baseRelief=false);
        translate([-5,-4,-1]) cube([5,5,12]);
    }
}

//The $fn trick doesn't work for an odd number of sides... (but it does look quite cool)
translate([35,30,0]) scale([0.5,0.5,0.5]) annularFemale(length=5, ID=4.5, OD=5.4, toothDistanceFromEnd=3, tooth="sine", $fn=3);

//The $fn trick also gives inaccurate sizing (size is based on a true circular profile)
translate([35,-5,0]) scale([0.8,0.8,0.8]) {
    difference() {
        annularFemale(length=5, ID=4.5, OD=5.4, baseRelief=false, toothDistanceFromEnd=3, tooth="tri", toothOut = false, $fn=4);
        translate([-11,-8,-1]) cube([10,10,12]);
    }
    difference() {
        translate([0,0,7]) rotate([0,0,360/16]) color("orange") annularMale(tooth="ridge",OD=3.5,ID=3, baseRelief=false, toothOut = false, $fn=8);
        translate([-10,-10,6]) cube([10,10,12]);
    }
}

//Circular annular snapfit with multiple slots for strain relief
numberOfCuts = 5;
widthOfCuts = 0.5;
translate([35,-15,0]) scale([0.8,0.8,0.8]) {
    cylinder(4,2.5,2.5);
    translate([0,0,7]) {
    rotate([0,180,0]) difference() {
        rotate([0,0,360/16]) annularMale(length=4 ,OD=2,ID=1.5, toothDistanceFromEnd=0.4, toothLength=0.8, tooth="ridge", toothOut = true);
        for (zAng = [0:360/numberOfCuts:360])
             rotate([0,0,zAng]) translate([0,-widthOfCuts/2,-1]) cube([3,widthOfCuts,6]);}        
    }
}

//Square annular snapfit with multiple slots for strain relief
numberOfCuts1 = 4;
widthOfCuts1 = 0.5;
translate([35,-20,0]) scale([0.8,0.8,0.8]) {
    cylinder(4,2.5,2.5,$fn=8);
    translate([0,0,7]) {
    rotate([0,180,0]) difference() {
        rotate([0,0,360/16]) annularMale(length=4 ,OD=2,ID=1.5, toothDistanceFromEnd=0.4, toothLength=0.8, tooth="ridge", toothOut = true, $fn=4);
        for (zAng = [25:360/numberOfCuts1:360])
             rotate([0,0,zAng]) translate([0,-widthOfCuts1/2,-1]) cube([3,widthOfCuts1,6]);}        
    }
}


//annularMale(length=10, ID=0, OD=4.5, toothDistanceFromEnd=2, toothMinWallThickness=0.5, tooth="ridge", toothLength=1.5,toothHeight=0.3, ridgeToothRatio = 0.75, toothLength=0.5,toothHeight=0.3, ridgeToothRatio = 0.75, toothOut = true)

// The true ball and socket is slow to process (esp when varying view in preview), so by default not displayed...
if (viewSlowExamples) {
    translate([-10,-30,0]) scale([3,3,3]) {
        color("orange") rotate([0,90,0]) ball();
        rotate([0,-90,0]) ballsocketA() ;
        rotate([0,-90,0]) color("red") ballsocketB() ;
    }

    translate([15,-30,1.2]) scale([3,3,3]) {
        translate([-2,0,0]) color("orange") rotate([0,90,0]) ballHalf();
        translate([2,0,0]) rotate([0,-90,0]) ballsocketA() ;
        rotate([90,0,-90]) color("red") ballsocketB() ;
    }
} else {
    translate([-10,-30,0])  scale([3,3,3]) color("grey") {
        translate([-1,0,0]) rotate([0,90,0])  ballHalf();
        translate([1,0,0]) rotate([0,90,180]) ballHalf();
    }

    translate([15,-30,1.2]) scale([3,3,3]) color("grey") {
        difference() {
            cylinder(0.8,1,1);
            translate([0,0,-1]) cylinder(4,0.85,0.85);
            translate([-5.2,-2.5,-1]) cube([5,5,5]);
        }

        translate([2,0,0]) difference() {
            cylinder(0.8,1,1);
            translate([0,0,-1]) cylinder(4,0.85,0.85);
            translate([-5.2,-2.5,-1]) cube([5,5,5]);
        }
        
        translate([-2,0,0]) rotate([0,90,0]) ballHalf();
    }
}
}




module lockingConnectorCalibrationPiece() {
}
