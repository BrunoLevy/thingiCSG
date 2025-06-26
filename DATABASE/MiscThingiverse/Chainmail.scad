

module chain(w,h)
{

module ring()
{
	module blocks()  //four blocks
	{	
		for (i = [0:3]){		
		rotate([0,0,90*i])
			translate([-0.6001,r_halfwidth,0])
				cube([1.2002,line_width*b_width,layer_thick*b_height]); }
	}

	module diagonal() 	//thin diagonals
		{
			mirror([-1,1,0])
				translate([0.6,r_halfwidth,0])
				union() {
				cube([corner,line_width*b_width,layer_thick*d_height]);
				rotate([0,0,-45])
					translate([-corner,0,0])
					cube([corner,line_width*b_width,layer_thick*d_height]);
				}
			translate([0.6,r_halfwidth,0])
			union() {
				cube([corner,line_width*b_width,layer_thick*d_height]);
				rotate([0,0,-45])
					translate([-corner,0,0])
					cube([corner,line_width*b_width,layer_thick*d_height]);
				rotate([0,0,-45])
					cube([sqrt(2)*(r_halfwidth-0.6),line_width*b_width,layer_thick*d_height]);
					}	
		}
	module 4_diagonals() //all four diagonals
		{
		union(){
		diagonal();
		mirror([1,1,0]) diagonal(); }
		translate([0,0,layer_thick*(b_height-d_height)]) 
			union(){
				rotate([0,0,90]) diagonal();
				rotate([0,0,-90]) diagonal(); }				
		}

union(){
	blocks();
	4_diagonals();	
	}	
}



	layer_thick = 0.25;  //filament layer thickness
	line_width = 0.5;    //filament line width, = layer thickness * width/thickness
	
	b_width = 2;	//block width in lines
	b_height = 6;    //block height in layers
	d_height = 2; 		//diagonals height in lines

	r_halfwidth = .95+1.5*line_width*b_width+0.45; //ring inner half width
	corner = tan(22.5)*line_width*b_width;  	  //fills in corner between block and diagonal

module line() {
for(i=[0:w-1]){
translate([i*(2*r_halfwidth-.45),0,0])
ring();}}

for(j=[0:h-1]){
translate([0,j*(2*r_halfwidth-.45),0])
line();}
}

//usage: chain(w,h) gives w columns, h rows
chain(3,3);
