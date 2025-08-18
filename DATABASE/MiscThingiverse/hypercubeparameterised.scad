//Set parameters here
ocs= 100; //Outer cube size
oct= 12.5; //Outer cube thickness
ics=  50; //Inner cube size
ict= 7.5; //Inner cube thickness

//creates the Outer and inner cubes
difference(){
cube(ocs, center=true);
cube([ocs+2,ocs-2*oct,ocs-2*oct],center=true);
cube([ocs-2*oct,ocs+2,ocs-2*oct],center=true);
cube([ocs-2*oct,ocs-2*oct,ocs+2],center=true);
}
difference(){
cube(ics, center=true);
cube([ics+2,ics-2*ict,ics-2*ict],center=true);
cube([ics-2*ict,ics+2,ics-2*ict],center=true);
cube([ics-2*ict,ics-2*ict,ics+2],center=true);
}

//creates the module for the connecting polyhedron at one corner in the positive quadrant
module connector(){
polyhedron(points=[
[ocs/2-oct,ocs/2-oct,ocs/2],
[ocs/2-oct,ocs/2,ocs/2-oct],
[ocs/2,ocs/2-oct,ocs/2-oct],
[ics/2-ict,ics/2-ict,ics/2],
[ics/2-ict,ics/2,ics/2-ict],
[ics/2,ics/2-ict,ics/2-ict],
],
triangles=[[0,1,2],[0,4,1],[1,4,2],[0,3,4],[0,2,3],[3,2,5],[5,2,4],[5,4,3]]);
}


//mirrors connector to all corners
connector();
mirror([1,0,0]){
connector();}
mirror([0,1,0]){
connector();
mirror([1,0,0])
connector();
}
mirror([0,0,1]){
connector();
mirror([1,0,0]){
connector();}
mirror([0,1,0]){
connector();
mirror([1,0,0])
connector();
}
}