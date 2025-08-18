// OpenScad MiniFigure Head                  By Kevin Symss

R1=2;           R2=10.2;        wall=0.9;        walls=wall*2;

t=0.1;           T=0.2;               $fn=100;

$fn=60;

Depth=1;

///////////////////////////////////////////////////////////////////////////////

 color( "Yellow", 0.5 ) { 
  
translate([0,0,     8.5 ])  Head_Knob();
translate([0,0,1.21+6.5 ])  Torus_Hollow();
translate([0,0,2.6      ])  Head_Support();
                            Neck() ;
//                          The_Face();
                            The_Base_Of_Face();
 }
//
///////////////////////////////////////////////////////////////////////////////

module Sad_Mouth() translate([5,0,2])rotate([0,270,0]){
intersection(){
Tube();rotate([0,0,-45])translate([0,0,-2])cube(size=4, center=false);}}
//

module Mouth() translate([5,0,6])rotate([0,90,0]){
intersection(){
Tube();rotate([0,0,-45])translate([0,0,-2])cube(size=4, center=false);}}
//

module Tube() {
difference(){
cylinder(h=Depth  ,d=4.88        ,center=true);
cylinder(h=Depth+1,d=4.88-wall  ,center=true);}}
//

module The_Face();{ // So the Eyes and Mouth are Dark
  difference(){
 translate([ 0, 0,2+1.21   ]) Face(); // need to subtract eyes and lips to this
  
 color( "Black", 1 ){Eyes();
 
 rotate([0, 0, 120]) Eyes();   rotate([0, 0,-120]) Eyes();
      
 Mouth();     rotate([0, 0, 120])Mouth();
 rotate([ 0, 0, 240])Sad_Mouth(); 
 rotate([ 0, 0, 120]) Sad_Mouth();;
 
   }}
   }
//
  
module The_Base_Of_Face(){
difference(){
translate([0,0,1.21+2   ])
rotate(a = [0, 180,    0])  Torus_Hollow();
 
translate([0,0,2.6-t    ])  cylinder(1,5/2,0,true);
                            cylinder(4,5/2,5/2,true);
 }}
//

module Eyes(){
translate([ 4, 2,5.793]) Eye() ;  translate([ 4,-2,5.793]) Eye() ;}
//

module Eye(){
    
    r1=.8;        r2=.4;      h1= 1;        h2=h1+T;

rotate([0,90,0]){difference(){
translate([0,0,h1/2  ])     cylinder(h1,r1,r1,true); // Outer Part Of Eye
translate([0,0,h2/2-t])     cylinder(h2,r2,r2,true); // Inter Part Of Eye
}}}
//

module Face()color( "Yellow", 0.5 ){
    
    r1=10.2/2;      r2=r1-wall  ;       h1=4.5;        h2=h1+T;
    
difference(){
translate([0,0,h1/2  ])     cylinder(h1,r1,r1,true);
    color( "Red", 0.5 ){
translate([0,0,h2/2-t])     cylinder(h2,r2,r2,true);}
}}
//

module Head_Support(){
    
    r1=3.7/2;      r2=1 ;               h1=6.5;        h2=h1+T;
    
difference(){
translate([0,0,h1/2  ])     cylinder(h1,r1,r1,true);
translate([0,0,h2/2-t])     cylinder(h2,r2,r2,true);
}}
//

module Torus_Hollow(){
difference(){         Torus_Half();
   
translate([0,0,-1.6 ])Torus_Half();

}}
//

module Torus_Half(){
difference(){ Torus(R1,R2); 
translate([0,0,-2 ])cylinder(4,11/2,11/2,true);}}
//

module Head_Knob(){
    
 r1=4.88/2;      r2=3/2;        h1=1.8+1.21;    h2=h1+T;

difference(){
translate([0,0,h1/2  ])     cylinder(h1,r1,r1,true);
translate([0,0,h2/2-t])     cylinder(h2,r2,r2,true);
}}
//

module Neck(){
    
  r1=6.51/2;      r2=5/2;       h1=1.21;        h2=h1+T;
    
difference(){
translate([0,0,h1/2  ])     cylinder(h1,r1,r1,true);
translate([0,0,h2/2-t])     cylinder(h2,r2,r2,true);
}}
//

module Torus(R1,R2){
    
  RA=R1               ;     // Radius   of  Torus
  RB=R2      /2 - R1  ;     // Radius   of  Torus overall 
    
rotate_extrude(convexity = 10 ) // the value is the sides the finer
translate([RB, 0, 0])           circle(r = RA); // the value is the sides
}
// 