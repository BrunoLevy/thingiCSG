module multi_rot_cube(N=10) {
   alpha=360/N;
   union() {
      for(i=[0:N-1]) {
         rotate(i*alpha)
            cube(center=true);
      }
   }
}


difference() {
   scale([2,2,1]) multi_rot_cube(N=50);
   multi_rot_cube(N=50);
}
   

