// by Oskar
// emailed to me on Tue May 6, 2014
// 


// a branch, 10 long, 1 wide
module branch() {
	// a slightly tapered cylinder
	cylinder(h=10,r1=1,r2=0.9);
}

module tree(level) {
	branch();

	if (level > 0)
		translate([0,0,9])    // translate up to the tip of the branch
			for (c = [1:3])       // generate 3 children
				assign(angle = c*100) 
					rotate(angle)         // rotated at different angles 
						rotate([35,0,0])      // 35° branching angle
							scale(0.75-(c-1)/9)    // shrink the branches a bit differently
								tree(level-1);
}

tree(7);