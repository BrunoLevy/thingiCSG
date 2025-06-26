module multi_rot_cube(N=10) {
   alpha=360/N;
   union() {
      for(i=[0:N-1]) {
         rotate(i*alpha)
            cube(center=true);
      }
   }
}


union() {
   scale(2) multi_rot_cube(N=50);
   translate([0,0,0.5]) multi_rot_cube(N=50);
}
   

