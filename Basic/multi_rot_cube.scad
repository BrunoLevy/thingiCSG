n = 70;
alpha = 60/n;

union() {
   for(i=[0:n])
      rotate(i*alpha)
         cube(center=true);
}