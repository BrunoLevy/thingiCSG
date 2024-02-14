// Note: to see intersection vertex with compute_CSG,
// use simplify=false 
union() {
   cube();
   translate([0.5,0,1]) cylinder(r1=0,r2=1,$fn=30);
}