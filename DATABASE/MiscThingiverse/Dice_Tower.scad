// Dice Tower

/* Play around with "faces" to round it off or square it off with less facets. Somewhere between 8 and 360. A higher number may slow your computer down, and rendering might take a bit longer. 20,40 and 80 look nice if you don't want it round. */
faces=120;

difference(){
// Change the size and shape here.......    
scale([.8,.8,.9]){
    
// Change these parameters at your own peril....    
translate([0,0,140])rotate([0,0,0]){
difference(){
translate([0,0,0])color("cornsilk")cylinder(r1=44,r2=50,h=12,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=12.02,$fn=faces);};
difference(){
translate([0,0,12])color("bisque")cylinder(r=50,h=8,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=42.02,$fn=faces);    
rotate([0,0,0])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,18])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,36])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,54])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,72])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,90])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,108])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);    
rotate([0,0,126])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,144])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,162])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);};};
//////////////////////////////////////////////
//////////////////////////////////////////////
difference(){
translate([0,0,0])color("cornsilk")cylinder(r=44,h=140,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);
translate([28,0,96])scale([1,2,1.28])rotate([0,90,0])cylinder(r=15,h=40,$fn=faces);    
rotate([0,0,0])translate([0,0,30])rotate([0,-90,0])scale([1,1,1])cylinder(r=10,h=80,$fn=4);    
rotate([0,0,0])translate([-80,-10,0])cube([80,20,30]);    
rotate([0,0,50])translate([-39,0,78])rotate([0,-100,0])scale([1,1,1])cylinder(r=12,h=6,$fn=4);
rotate([0,0,50])translate([-80,-10,60])cube([80,20,20]);};        
difference(){    
rotate([0,0,0])translate([-39,0,30])rotate([0,-108,0])scale([1,1,1])color("wheat")cylinder(r=12,h=4,$fn=4);
rotate([0,0,0])translate([-38,0,28])rotate([0,-108,0])scale([1,1,1])cylinder(r=12,h=6,$fn=4);
    translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);};
/////////////////////////////////////////////////////
//// Main cylinder ///////////////////////////////////
difference(){
translate([0,0,0])color("wheat")cylinder(r=44,h=140,$fn=faces);    
translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);
translate([28,0,96])scale([1,2,1.28])rotate([0,90,0])cylinder(r=15,h=40,$fn=faces);    
rotate([0,0,0])translate([60,0,30])rotate([0,-90,0])scale([1,1,1])cylinder(r=10,h=180,$fn=4);    
rotate([0,0,0])translate([-50,-10,0])cube([180,20,30]);    
rotate([0,0,50])translate([-80,-10,50])cube([80,32,18]);   
rotate([0,0,50])translate([-39,0,68.6])rotate([0,-100,0])scale([1.2,1,1])cylinder(r=10,h=6,$fn=faces);}; 
 ////////////    
 translate([0,0,50]){   
difference(){    
rotate([0,0,50])translate([-39.6,0,27.4])rotate([0,-104,0])scale([1,1.2,1])color("beige")cylinder(r=12,h=4,$fn=4);
rotate([0,0,50])translate([-38.6,0,25.4])rotate([0,-104,0])scale([1,1.2,1])cylinder(r=11,h=6,$fn=4);
    translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);};};
/////////////////////////////////////////////////
difference(){
translate([-50,-50,150])rotate([0,40,0])color("antiquewhite")cube([200,100,3.2]);
translate([0,0,-10]){
difference(){
translate([0,0,0])cylinder(r=140,h=180,$fn=faces);
translate([0,0,-.01])cylinder(r=42.1,h=180.02,$fn=faces);};};};
///////////////////////
//////////////////////////
///////////////////////
translate([60,0,-50])rotate([0,0,-90]){
translate([0,0,140])rotate([0,0,0]){
difference(){
translate([0,0,0])color("cornsilk")cylinder(r1=44,r2=50,h=12,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=12.02,$fn=faces);
translate([0,-60,-90])cylinder(r=42,h=240.02,$fn=faces);};  
difference(){
translate([0,0,12])color("bisque")cylinder(r=50,h=8,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=42.02,$fn=faces);    
rotate([0,0,0])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,18])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,36])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,54])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,72])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,90])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,108])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);    
rotate([0,0,126])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,144])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,162])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
    translate([0,-60,-90])cylinder(r=42,h=240.02,$fn=faces);};};
//////////////////////////////////////////////
//////////////////////////////////////////////
///////////////// MID Part /////////////////////    
difference(){
translate([0,0,0])color("antiquewhite")cylinder(r=44,h=140,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);
translate([28,0,96])scale([1,2,1.28])rotate([0,90,0])cylinder(r=15,h=40,$fn=faces);
translate([-50,-50,-50])cube([100,100,100]);    
translate([0,-60,50])cylinder(r=42,h=240.02,$fn=faces);    
translate([-60,-10,90])cube([20,20,20]);
translate([-60,-0,110])rotate([0,90,0])scale([.6,1,1])cylinder(r=10,h=20,$fn=4);};
difference(){
translate([-42,0,110])rotate([0,60,0])scale([1,1.6,1])color("beige")cylinder(r=10,h=6,$fn=4);
translate([-42,0,108])rotate([0,60,0])scale([1,1.6,1])cylinder(r=10,h=10,$fn=4);
translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);};
/////////////////////////////////////////////////
difference(){
translate([-50,-50,150])rotate([0,40,0])color("antiquewhite")cube([200,100,3.2]);
translate([0,-60,0])cylinder(r=42,h=240.02,$fn=faces);    
translate([0,0,-10]){
difference(){
translate([0,0,0])cylinder(r=140,h=180,$fn=faces);
translate([0,0,-.01])cylinder(r=42.1,h=180.02,$fn=faces);};};};};
//////////////////////////////////
///////////////////////////////
////////////////////////
/////////////////////////////////
///// Bottom Part /////////////////
difference(){
translate([60,-60,-130]){
translate([0,0,140])rotate([0,0,0]){
difference(){
translate([0,0,0])color("cornsilk")cylinder(r1=60,r2=66,h=12,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=12.02,$fn=faces);};
difference(){
translate([0,0,12])color("bisque")cylinder(r=66,h=8,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=42.02,$fn=faces);    
rotate([0,0,0])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,18])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,36])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,54])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,72])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,90])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,108])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);    
rotate([0,0,126])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);        
rotate([0,0,144])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);
rotate([0,0,162])translate([-100,-4,0])rotate([0,0,0])cube([200,8,40]);};};};
//////////////////////////////////////////////
//////////////////////////////////////////////
translate([60,-60,2.4])cylinder(r=58,h=140.02,$fn=faces);translate([60,0,-.01])color("blue")cylinder(r=44,h=120.02,$fn=faces);
translate([0,0,0])cylinder(r=44,h=120,$fn=faces);
translate([60,0,0])cylinder(r=44,h=120,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);
translate([0,0,0])rotate([0,0,0])cylinder(r=20,h=40,$fn=4);};
difference(){
translate([60,-60,0])color("cornsilk")cylinder(r=60,h=10,$fn=faces);
translate([60,-60,2.4])cylinder(r=58,h=140.02,$fn=faces);translate([60,0,-.01])cylinder(r=44,h=120.02,$fn=faces);
translate([0,0,-.01])cylinder(r=42,h=140.02,$fn=faces);};
///////Everything is here^^^^^^^^^^^^^^^^^^^^^^
};

///////////////////////////////////////////////////////////
// You can put extra windows here.....
rotate([0,0,0])translate([60,0,30])rotate([0,-90,0])scale([1.6,1,1])cylinder(r=10,h=40,$fn=faces);    
rotate([0,0,0])translate([30,-10,0])cube([40,20,30]);
translate([0,0,60])scale([.6,1,.6]){
rotate([0,0,70])translate([60,0,30])rotate([0,-90,0])scale([1.6,1,1])cylinder(r=10,h=40,$fn=faces);    
rotate([0,0,70])translate([30,-10,0])cube([40,20,30]);};
translate([0,0,80])scale([.5,1,.5]){
rotate([0,0,150])translate([60,0,30])rotate([0,-90,0])scale([1.6,1,1])cylinder(r=10,h=40,$fn=faces);    
rotate([0,0,150])translate([30,-10,0])cube([40,20,30]);};




};