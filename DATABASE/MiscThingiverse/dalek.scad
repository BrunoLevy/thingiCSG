// Dalek model
// By RevK 2013

$fn=10;

ab=[0,45,90,90,101,125,146]; // angle
wb=[29,27,23,23,30,32,29];   // width at base
at=[0,45,90,90,105,127,160]; // angle
wt=[22,22,16,16,22,21,20.45];   // width at base
function sumbx(n) = n>0?sumbx(n-1)-wb[n-1]*cos(ab[n-1]):0;
function sumby(n) = n>0?sumby(n-1)-wb[n-1]*sin(ab[n-1]):52;
function sumtx(n) = n>0?sumtx(n-1)-wt[n-1]*cos(at[n-1]):0;
function sumty(n) = n>0?sumty(n-1)-wt[n-1]*sin(at[n-1]):38;
function sumx(n,f) = sumbx(n)*f+sumtx(n)*(1-f);
function sumy(n,f) = sumby(n)*f+sumty(n)*(1-f);

module base(solid=-1,R=1)
{
 difference()
 {
  for(z=[0:1])mirror([z,0,0])for(f=[0:6])hull()for(q=[0:1])
  {
   translate([sumbx(f+q),sumby(f+q),0])rotate([0,0,f+q>6?180:f+q?(ab[f+q-1]+ab[f+q])/2:0])
   {
    translate([0,0,18.5])sphere(R);
    translate([0,4.5+R,18.5])sphere(R);
    translate([0,11+R,12.8])sphere(R);
    translate([0,11+R,0])sphere(R);
   }
   if(solid>0)sphere(R); // allows a less solid based if using solid=-1
  }
  translate([-100,-100,-200])cube(200); // flat base at 0
 }
 s=0.05;
 for(z=[0:1])mirror([z,0,0])for(f=[0:6])for(h=[0:s:0.999])hull()
 {
  translate([sumx(f,h),sumy(f,h),18.5*h+100*(1-h)])sphere(R);
  translate([sumx(f,h+s),sumy(f,h+s),18.5*(h+s)+100*(1-(h+s))])sphere(R);
  translate([sumx(f+1,h),sumy(f+1,h),18.5*h+100*(1-h)])sphere(R);
  translate([sumx(f+1,h+s),sumy(f+1,h+s),18.5*(h+s)+100*(1-(h+s))])sphere(R);
  if(solid)
  {
   translate([0,0,18.5*h+100*(1-h)])sphere(R);
   translate([0,0,18.5*(h+s)+100*(1-(h+s))])sphere(R);
  }
 }
 for(z=[0:1])mirror([z,0,0])for(f=[0:6])for(b=[0.65:0.92:3.5])translate([(sumbx(f)-wb[f]*cos(ab[f])/2)*(4-b)/4+(sumtx(f)-wt[f]*cos(at[f])/2)*b/4,(sumby(f)-wb[f]*sin(ab[f])/2)*(4-b)/4+(sumty(f)-wt[f]*sin(at[f])/2)*b/4,18.5+b*81.5/4])sphere(6,$fs=1,$fn=25);
}

module topbase(i=0)
{
  hull()
  {
   for(z=[0:1])mirror([z,0,0])for(f=[0:7])translate([sumtx(f),sumty(f),0])rotate([0,0,f>6?180:f?(at[f-1]+at[f])/2:0])translate([0,-18-i,0])cylinder(r1=20,r2=0,h=1);
   translate([0,0,42])cylinder(r=34-i,h=2);
  }
}

module top(hole=1,$fn=50)
{
 translate([0,0,100])difference()
 {
  union()
  {
   difference()
   {
    intersection()
    {
     topbase();
     cylinder(r=100,h=10);
    }
    translate([-50,-125,5])cube([100,100,10]);
   }
   difference()
   {
    union()
    {
     difference()
     {
      topbase(3);
      translate([0,-60,3])rotate([-40,0,0])hull()
      {
       translate([-5,0,0])cube([10,1,1]);
       translate([-18,0,0])cube([36,1,1]);
       translate([-7,0,20])cube([14,20,1]);
      }
     }
     topbase(5);
    }
    translate([-50,-10,20])cube([100,100,15]);
    translate([-50,-50,25])cube([100,100,10]);
   }
   topbase(5);
   translate([0,0,0.1])intersection()
   {
    difference()
    {
     topbase();
     translate([-50,-120,5])cube([100,100,20]); 
    }
    translate([-50,-50,12])cube([100,100,28]);
    union()
    {
     for(a=[10-4:(360+2*4)/18:359])rotate([0,0,a])translate([-3,-100,0])cube([6,100,100]);
     translate([-3,-100,0])cube([6,100,100]);
    }
   }
   translate([0,0,42])cylinder(r1=30,r2=27,h=35);
   translate([0,0,42])cylinder(r=34,h=2);
   translate([0,0,52])cylinder(r=33,h=2);
   translate([0,0,62])cylinder(r=32,h=2);
   intersection()
   {
    union()
    {
     translate([0,0,42])cylinder(r1=32,r2=28,h=35);
     translate([0,0,30])cylinder(r1=30,r2=33,h=13);
     translate([0,0,47])cylinder(r1=30,r2=33,h=5);
     translate([0,0,57])cylinder(r1=29,r2=32,h=5);
     translate([0,0,67])cylinder(r1=28,r2=30,h=5);
    }
    for(a=[0:45:359])rotate([0,0,a])translate([-100,-1,0])cube([100,2,100]);
   }
   hull()
   {
    translate([0,0,72])cylinder(r=30,h=2);
    translate([0,0,78])cylinder(r=28,h=2);
   }
   translate([0,0,78])intersection()
   {
    cylinder(r=28,h=20,$fn=50);
    translate([0,0,-19])sphere(35,$fn=50);
   }
   hull()
   {
    translate([-10,-29,75])cube([20,10,0.1]);
    translate([-6,-29,90])cube([12,1,1]);
    translate([-4,-10,90])cube([8,1,1]);
   }
   for(z=[0:1])mirror([z,0,0])
   {
    translate([23,-1,83])rotate([0,45,0])
    {
     cylinder(r=5,h=4);
     cylinder(r=3,h=14);
     translate([0,0,14])cylinder(r=3.5,h=1);
     intersection()
     {
      union()
      {
       cylinder(r=3.5,h=14);
       translate([0,0,4])cylinder(r=5,h=2);
       translate([0,0,6])cylinder(r1=5,r2=3,h=3);
      }
      for(a=[0:90:359])rotate([0,0,a])translate([-100,-1,0])cube([100,2,100]);
     }
    }
    hull()
    {
     translate([22.5,-47,15])rotate([-107,0,0])translate([-9,-9,3])cube([18,18,1]);
     translate([13.5,-30,22])rotate([-90,0,0])cube([18,22,1]);
    }
    translate([22.5,-47,15])rotate([-107,0,0])translate([0,0,2])cylinder(r=8,h=3);
   }
  }
  if(hole)
  {
   for(z=[0:1])mirror([z,0,0])translate([22.5,-46,15])rotate([-107,0,0])
   {
    cylinder(r=5+hole*0.25,h=15);
    translate([0,0,15])sphere(6+hole*0.25);
   }
   translate([0,-30,85])rotate([-100,0,0])
   {
    cylinder(r=5+hole*0.25,h=15);
    translate([0,0,15])sphere(6+hole*0.25);
   }
   hull()
   {
    translate([0,-29,90])sphere(5);
    translate([0,-28,85])sphere(5);
   }
  }
 }
}

module weapons(s=0,$fn=50)
{
 translate([0,(s?-17:-30),s?0:185])rotate([s?-90:-100,0,0])
 {
  if(s)translate([0,0,1.999])difference()
  {
   union()
   {
    cylinder(r=5,h=15);
    translate([0,0,15])sphere(6);
   }
   translate([-25,-1.5,5])cube([50,3,50]);
   translate([5,-25,5])cube([10,50,50]);
   translate([-15,-25,5])cube([10,50,50]);
  }
  translate([0,0,0])cylinder(r1=4,r2=5,h=2);
  translate([0,0,-45])cylinder(r=4,h=50);
  translate([0,0,-20])cylinder(r=6,h=1);
  if(s)translate([0,0,-22])cylinder(r1=4,r2=6,h=2);
  translate([0,0,-22])cylinder(r=7,h=1);
  if(s)translate([0,0,-24])cylinder(r1=4,r2=7,h=2);
  translate([0,0,-24])cylinder(r=8,h=1);
  if(s)translate([0,0,-26])cylinder(r1=4,r2=8,h=2);
  translate([0,0,-26])cylinder(r=8,h=1);
  if(s)translate([0,0,-28])cylinder(r1=4,r2=8,h=2);
  translate([0,0,-28])cylinder(r=7,h=1);
  if(s)translate([0,0,-30])cylinder(r1=4,r2=7,h=2);
  translate([0,0,-30])cylinder(r=6,h=1);
  if(s)translate([0,0,-32])cylinder(r1=4,r2=6,h=2);
  difference()
  {
   union()
   {
    translate([0,0,-45])sphere(8);
    translate([0,0,-49])cylinder(r=8,h=4);
    translate([0,0,-50])cylinder(r1=7,r2=8,h=1);
   }
   translate([0,0,-60])cylinder(r1=15,r2=4,h=13);
  }
 }
 translate([22.5,s?-22:-46,s?-0:115])rotate([s?-90:-107,0,0])
 {
  if(s)translate([0,0,1.999])difference()
  {
   union()
   {
    cylinder(r=5,h=15);
    translate([0,0,15])sphere(6);
   }
   translate([-25,-1.5,5])cube([50,3,50]);
   translate([5,-25,5])cube([10,50,50]);
   translate([-15,-25,5])cube([10,50,50]);
  }
  translate([0,0,0])cylinder(r1=4,r2=5,h=2);
  translate([0,0,-45])cylinder(r=4,h=50);
  intersection()
  {
   union()
   {
    translate([0,0,-15])cylinder(r1=7,r2=4,h=5);
    translate([0,0,-35])cylinder(r=7,h=20);
    translate([0,0,-40])cylinder(r1=4,r2=7,h=5);
   }
   for(a=[0:45:359])rotate([0,0,a])translate([-100,-1,-50])cube([100,2,100]);
  }
 }
 translate([-22.5,s?0:-46,s?0:115])rotate([s?-90:-100,0,0])	
 {
  if(s)translate([0,0,1.999])difference()
  {
   union()
   {
    cylinder(r=5,h=15);
    translate([0,0,15])sphere(6);
   }
   translate([-25,-1.5,5])cube([50,3,50]);
   translate([5,-25,5])cube([10,50,50]);
   translate([-15,-25,5])cube([10,50,50]);
  }
  translate([0,0,0])cylinder(r1=4,r2=5,h=2);
  translate([0,0,-55])cylinder(r=4,h=60);
  difference()
  {
   translate([0,0,-68])sphere(r=14);
   translate([0,0,-68])sphere(r=12);
   translate([-15,-15,-97])cube([30,30,30]);
  }
 }
}


s=1; // scale

// Use ! to pick what you want...
scale(1/s){base();top(0);}	// no holes/weapons
scale(1/s){base();top(s);}	// with holes
scale(1/s)translate([0,0,67])rotate([90,0,0])weapons(s);	// weapons
scale(1/s){base();top(s);weapons(0);}	// full
!scale(1/s)		// Large Dalek in parts to fit makerbot replicator 2
{
 translate([-25,0,0])
 {
  rotate([0,0,-90])base();
  translate([0,0,99.9])difference()
  {
   union()
   {
    cylinder(r=10,h=30,$fn=100);
    translate([0,0,30])sphere(12,$fn=100);
   }
   translate([-25,-2.5,5])cube([50,5,50]);
   translate([10,-25,5])cube([10,50,50]);
   translate([-20,-25,5])cube([10,50,50]);
  }
 }
 translate([85,15,-100])difference()
 {
  top(s);
  translate([0,0,99.9])
  {
   cylinder(r=10.5,h=30,$fn=100);
   translate([0,0,30])sphere(12.5,$fn=100);
  }
 }
 translate([70,-47,67])rotate([90,0,0])weapons(s);
}
