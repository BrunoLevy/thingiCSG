n = 70;
alpha = 90/n;

union() {
   for(i=[0:n-1])
      rotate(i*alpha)
         cube(center=true);
}