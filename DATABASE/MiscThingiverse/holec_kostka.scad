a=100;
intersection()
{    sphere (35,$fn=a);
    
difference()
{

    cube(center=true,50);
    
    //1
    translate([25,0,0])
    sphere (5, $fn=a);
    
    //2
    translate([12.5,25,12.5])
    sphere (5, $fn=a);
    translate([-12.5,25,-12.5])
    sphere (5, $fn=a);
    
    //3
    translate([12.5,12.5,25])
    sphere (5, $fn=a);
    translate([0,0,25])
    sphere (5, $fn=a);
    translate([-12.5,-12.5,25])
    
    //4
    sphere (5, $fn=a);
    translate([12.5,12.5,-25])
    sphere (5, $fn=a);
    translate([-12.5,12.5,-25])
    sphere (5, $fn=a);
    translate([12.5,-12.5,-25])
    sphere (5, $fn=a);
    translate([-12.5,-12.5,-25])
    sphere (5, $fn=a);
    
    //5
    translate([12.5,-25,12.5])
    sphere (5, $fn=a);
    translate([-12.5,-25,12.5])
    sphere (5, $fn=a);
    translate([-12.5,-25,-12.5])
    sphere (5, $fn=a);
    translate([12.5,-25,-12.5])
    sphere (5, $fn=a);    
    translate([0,-25,0])
    sphere (5, $fn=a);    
    
    //6
    translate([-25,-12.5,-12.5])
    sphere (5, $fn=a);
    translate([-25,-12.5,0])
    sphere (5, $fn=a);
    translate([-25,-12.5,12.5])
    sphere (5, $fn=a);   
    translate([-25,12.5,-12.5])
    sphere (5, $fn=a);
    translate([-25,12.5,0])
    sphere (5, $fn=a);
    translate([-25,12.5,12.5])
    sphere (5, $fn=a);
}
}