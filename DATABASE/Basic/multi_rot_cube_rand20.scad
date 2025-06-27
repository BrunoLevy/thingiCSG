seed = 0;
n = 20;
alphas = rands(0,360.0,n,seed);
off_x = rands(0,0.3,n);
off_y = rands(0,0.3,n);
intersection() {
   for(i=[0:n-1])
      translate([off_x[i], off_y[i], 0.0])
         rotate(alphas[i])
            cube(center=true);
}
