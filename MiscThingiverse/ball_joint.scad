//ball joint 

rad_ext = 14.5/2;
enforce_cube_xy=6;
enforce_cube_z=6;
enforce_cube_embedd_coef = 2;

enforce_cube2_xy=5;
enforce_cube2_z=2*rad_ext;

enforce_cylinder_d= 5;
enforce_cylinder_h=2*rad_ext;
enforce_cylinder_embedd_coef = 3;


module joint_raw() {
    scale([1.3,1,1]) sphere(rad_ext,center=true,$fn=100); //to make ellipsoid
    translate ([-rad_ext,0,0]) cube([enforce_cube2_xy,enforce_cube2_xy,enforce_cube2_z],center=true);
    translate ([-rad_ext-enforce_cylinder_embedd_coef,0,0]) cylinder (d=enforce_cylinder_d,h=enforce_cylinder_h,center=true,$fn=100);
    translate ([-rad_ext,0,0]) rotate(-90,[0,1,0]) cylinder (d1=rad_ext*1.7,d2=enforce_cylinder_d,h=enforce_cylinder_h/2,center=true,$fn=100);
}

cube_diff_x = 20;
cube_diff_y = 2*rad_ext;
cube_diff_z = 9;
cube_diff_trans=7;

module joint_raw2() { 
    intersection() {
        joint_raw() ;
        translate([-cube_diff_trans,0,0]) cube([cube_diff_x,cube_diff_y,cube_diff_z],center=true);

    }
}

rad_int = 9.7/2;
rim_coef = 1;
scale_coef = 1.2;
inner_cylinder_d = 3.5;
module socket() {
    $fs = 10;
    difference() {
        joint_raw2();
        sphere(rad_int,center=true,$fn=100);
        // rim cut
        translate([rad_int+rim_coef,0,0]) scale([scale_coef,scale_coef,scale_coef]) sphere(rad_int,center=true,$fn=100); //making rim //for  boundary smoothness
        translate([0,0,rad_int+rim_coef])sphere(rad_int,center=true,$fn=100); //making rim //for  boundary smoothness
        translate([0,0,-rad_int-rim_coef])sphere(rad_int,center=true,$fn=100); //making rim //for  boundary smoothness  
        //cyl cut
        translate([-rad_int+rim_coef,0,0]) cylinder (d = inner_cylinder_d, h = cube_diff_z+1, center = true,$fn=100);
              
    }
}


bone_d = 5;
bone_h = 16.5;
bone_hole_d = 2.5; 

supp_y=1.2;
supp_x=2.25;
supp_z=bone_h;


module stud() {
    translate ([-2*rad_ext,0,0]) rotate(90,[0,1,0]) {
      difference () {
           union() {
                cylinder ( d= bone_d, h = bone_h ,center = true,$fn=100);
                translate ([supp_x+1.125,0,-3]) cube ([supp_x,supp_y,supp_z],center=true);
           }
           cylinder ( d= bone_hole_d, h = bone_h ,center = true,$fn=100);
      }
    }
}


ball_rad = 10/2;
x_shift = bone_h;
hole_d = 4.5;

module ball() {
    translate([-x_shift-1.5*rad_ext,0,0]) {
     difference(){  
           intersection(){
                union(){
                     sphere(r=ball_rad,center=true,$fn=100); 
                     translate([ball_rad*0.7,0,0]) rotate(90,[0,1,0]) cylinder ( d2 = bone_d, d1= ball_rad*1.9, h = ball_rad*0.8 ,center = true,$fn=100); 
                }
                translate([1,0,0.5]) cube([ball_rad*2,ball_rad*2,ball_rad*2],center=true); // rim for support
            }
       
            translate([-ball_rad/2,0,0]) rotate(90,[0,1,0]) cylinder ( d = hole_d, h = ball_rad ,center = true,$fn=100);  //hole
            
            
     }
    }
}
module ball_joint() {
socket() ;
ball();    
stud();

}

ball_joint();
