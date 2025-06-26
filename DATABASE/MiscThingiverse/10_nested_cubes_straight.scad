t = 10;
wth = 1.1;//width of bars
for(h = [0 : 17])
{ 
    
 difference(){
     
    cube(size = [h,h,h], center = true);
     
         cube(size = [h,h-wth,h-wth], center = true);
         cube(size = [h-wth,h,h-wth], center = true);
         cube(size = [h-wth,h-wth,h], center = true);
     t=t-1;
     
  } 
}