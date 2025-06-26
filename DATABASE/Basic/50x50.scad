n=50;
d=1.0/n;

difference() {
   union() {
      for(i=[0:n-1]) {
         translate([i*d, 0.0, 0.0])
            scale([0.5*d, 1.0, 0.5*d])
               cube();
      }
   }
   union() {
      for(i=[0:n-1]) {
         translate([0.0, i*d, 0.0])
           scale([1.0, 0.5*d, 0.5*d])
             cube();
      }
   }
}

