module ArchitectsDaughter_contour00x21_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[4, 4], [7, 4], [7.5, 3.5], 
		[8, 3], [8, 3], [7, 0], 
		[5, 0], [4, 0], [4.0, 0.0], 
		[4, 0], [3.0, 0.0], [2, 0], 
		[2, 1],[1, 2], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[4, 4], [7, 4], [7.5, 3.5], 
		[8, 3], [8, 3], [7, 0], 
		[5, 0], [4, 0], [4.0, 0.0], 
		[4, 0], [3.0, 0.0], [2, 0], 
		[2, 1],[1, 2], ]);
}}}

module ArchitectsDaughter_contour00x21_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7.5, 3.5], [8, 3], [8, 3],steps,height);
	BezConic([5, 0], [4, 0], [4.0, 0.0],steps,height);
	BezConic([4.0, 0.0], [4, 0], [3.0, 0.0],steps,height);
}
}

module ArchitectsDaughter_contour00x21_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 4], [7, 4], [7.5, 3.5],steps,height);
	BezConic([8, 3], [7, 0], [5, 0],steps,height);
	BezConic([3.0, 0.0], [2, 0], [2, 1],steps,height);
	BezConic([2, 1], [1, 2], [4, 4],steps,height);
}
}

module ArchitectsDaughter_contour00x21(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x21_skeleton(height);
			ArchitectsDaughter_contour00x21_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x21_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x21_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 56], [7, 55], [7.0, 36.0], 
		[7, 17], [6, 15], [3.5, 15.0], 
		[1, 15], [1, 21], [2, 31], 
		[3, 50], [3, 56], [5.0, 56.0], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 56], [7, 55], [7.0, 36.0], 
		[7, 17], [6, 15], [3.5, 15.0], 
		[1, 15], [1, 21], [2, 31], 
		[3, 50], [3, 56], [5.0, 56.0], 
		 ]);
}}}

module ArchitectsDaughter_contour10x21_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 31], [3, 50], [3, 56],steps,height);
}
}

module ArchitectsDaughter_contour10x21_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 56], [7, 55], [7.0, 36.0],steps,height);
	BezConic([7.0, 36.0], [7, 17], [6, 15],steps,height);
	BezConic([1, 15], [1, 21], [2, 31],steps,height);
}
}

module ArchitectsDaughter_contour10x21(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x21_skeleton(height);
			ArchitectsDaughter_contour10x21_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x21_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x21(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x21(steps, height);
		
	}
}

module ArchitectsDaughter_chunk20x21(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour10x21(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x21=[[1, 0], [8, 56]];

module ArchitectsDaughter_letter0x21(steps=2, height) {
	ArchitectsDaughter_chunk10x21(steps, height);
	ArchitectsDaughter_chunk20x21(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x22_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[9, 37], [9.0, 38.0], [9, 39], 
		[9.0, 40.0], [9, 41], [9, 47], 
		[11, 48], [11.5, 47.5], [12, 47], 
		[12.0, 40.5], [12, 34], [12.5, 33.0], 
		[13, 32], [13, 32], [12.5, 31.5], 
		[12, 31], [11, 31], [9, 31], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[9, 37], [9.0, 38.0], [9, 39], 
		[9.0, 40.0], [9, 41], [9, 47], 
		[11, 48], [11.5, 47.5], [12, 47], 
		[12.0, 40.5], [12, 34], [12.5, 33.0], 
		[13, 32], [13, 32], [12.5, 31.5], 
		[12, 31], [11, 31], [9, 31], 
		 ]);
}}}

module ArchitectsDaughter_contour00x22_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour00x22_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([9, 41], [9, 47], [11, 48],steps,height);
	BezConic([13, 32], [13, 32], [12.5, 31.5],steps,height);
	BezConic([12.5, 31.5], [12, 31], [11, 31],steps,height);
	BezConic([11, 31], [9, 31], [9, 37],steps,height);
}
}

module ArchitectsDaughter_contour00x22(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x22_skeleton(height);
			ArchitectsDaughter_contour00x22_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x22_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x22_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3, 37], [3.0, 37.5], [3, 38], 
		[3.0, 39.5], [3, 41], [3, 46], 
		[6, 47], [6.5, 46.5], [7, 46], 
		[7.0, 40.0], [7, 34], [7.5, 33.0], 
		[8, 32], [7, 31], [6.5, 31.0], 
		[6, 31], [6, 31], [3, 31], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3, 37], [3.0, 37.5], [3, 38], 
		[3.0, 39.5], [3, 41], [3, 46], 
		[6, 47], [6.5, 46.5], [7, 46], 
		[7.0, 40.0], [7, 34], [7.5, 33.0], 
		[8, 32], [7, 31], [6.5, 31.0], 
		[6, 31], [6, 31], [3, 31], 
		 ]);
}}}

module ArchitectsDaughter_contour10x22_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6.5, 31.0], [6, 31], [6, 31],steps,height);
}
}

module ArchitectsDaughter_contour10x22_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 41], [3, 46], [6, 47],steps,height);
	BezConic([8, 32], [7, 31], [6.5, 31.0],steps,height);
	BezConic([6, 31], [3, 31], [3, 37],steps,height);
}
}

module ArchitectsDaughter_contour10x22(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x22_skeleton(height);
			ArchitectsDaughter_contour10x22_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x22_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x22(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x22(steps, height);
		
	}
}

module ArchitectsDaughter_chunk20x22(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour10x22(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x22=[[3, 31], [13, 48]];

module ArchitectsDaughter_letter0x22(steps=2, height) {
	ArchitectsDaughter_chunk10x22(steps, height);
	ArchitectsDaughter_chunk20x22(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x23_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 21], [5, 23], [8, 23], 
		[9, 23], [10.0, 22.5], [11, 22], 
		[12, 22], [12.0, 25.0], [12, 28], 
		[11, 28], [9.0, 28.5], [7, 29], 
		[6.0, 29.0], [5, 29], [4, 29], 
		[4, 30], [4.0, 30.5], [4, 31], 
		[4, 31], [5, 31], [6.0, 31.5], 
		[7, 32], [8, 32], [11, 32], 
		[12, 32], [12.0, 35.5], [12, 39], 
		[12, 40], [12.5, 40.5], [13, 41], 
		[14, 41], [14, 41], [15.0, 40.5], 
		[16, 40], [16, 39], [16.0, 36.0], 
		[16, 33], [19.0, 33.0], [22, 33], 
		[22.0, 37.5], [22, 42], [23.5, 42.0], 
		[25, 42], [26.0, 37.5], [27, 33], 
		[32.5, 33.0], [38, 33], [38, 30], 
		[34, 30], [32, 30], [30.0, 30.5], 
		[28, 31], [27, 31], [27.0, 27.5], 
		[27, 24], [31, 24], [34.5, 24.5], 
		[38, 25], [42, 25], [42.0, 24.5], 
		[42, 24], [42, 22], [32, 21], 
		[30, 21], [29.0, 21.0], [28, 21], 
		[27, 21], [27, 19], [27.0, 17.5], 
		[27, 16], [27, 15], [26, 13], 
		[22, 13], [22.0, 16.0], [22, 19], 
		[21, 19], [19.5, 19.0], [18, 19], 
		[17.0, 19.0], [16, 19], [15.5, 18.0], 
		[15, 17], [15.5, 16.0], [16, 15], 
		[16.5, 14.5], [17, 14], [16.5, 13.5], 
		[16, 13], [14, 12], [13.5, 12.0], 
		[13, 12], [13, 12], [13, 12], 
		[12, 19], [9, 20], [8, 20], 
		[6.5, 20.5],[5, 21], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 21], [5, 23], [8, 23], 
		[9, 23], [10.0, 22.5], [11, 22], 
		[12, 22], [12.0, 25.0], [12, 28], 
		[11, 28], [9.0, 28.5], [7, 29], 
		[6.0, 29.0], [5, 29], [4, 29], 
		[4, 30], [4.0, 30.5], [4, 31], 
		[4, 31], [5, 31], [6.0, 31.5], 
		[7, 32], [8, 32], [11, 32], 
		[12, 32], [12.0, 35.5], [12, 39], 
		[12, 40], [12.5, 40.5], [13, 41], 
		[14, 41], [14, 41], [15.0, 40.5], 
		[16, 40], [16, 39], [16.0, 36.0], 
		[16, 33], [19.0, 33.0], [22, 33], 
		[22.0, 37.5], [22, 42], [23.5, 42.0], 
		[25, 42], [26.0, 37.5], [27, 33], 
		[32.5, 33.0], [38, 33], [38, 30], 
		[34, 30], [32, 30], [30.0, 30.5], 
		[28, 31], [27, 31], [27.0, 27.5], 
		[27, 24], [31, 24], [34.5, 24.5], 
		[38, 25], [42, 25], [42.0, 24.5], 
		[42, 24], [42, 22], [32, 21], 
		[30, 21], [29.0, 21.0], [28, 21], 
		[27, 21], [27, 19], [27.0, 17.5], 
		[27, 16], [27, 15], [26, 13], 
		[22, 13], [22.0, 16.0], [22, 19], 
		[21, 19], [19.5, 19.0], [18, 19], 
		[17.0, 19.0], [16, 19], [15.5, 18.0], 
		[15, 17], [15.5, 16.0], [16, 15], 
		[16.5, 14.5], [17, 14], [16.5, 13.5], 
		[16, 13], [14, 12], [13.5, 12.0], 
		[13, 12], [13, 12], [13, 12], 
		[12, 19], [9, 20], [8, 20], 
		[6.5, 20.5],[5, 21], ]);
}}}

module ArchitectsDaughter_contour00x23_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([10.0, 22.5], [11, 22], [12, 22],steps,height);
	BezConic([9.0, 28.5], [7, 29], [6.0, 29.0],steps,height);
	BezConic([6.0, 29.0], [5, 29], [4, 29],steps,height);
	BezConic([4, 29], [4, 30], [4.0, 30.5],steps,height);
	BezConic([4.0, 30.5], [4, 31], [4, 31],steps,height);
	BezConic([4, 31], [5, 31], [6.0, 31.5],steps,height);
	BezConic([8, 32], [11, 32], [12, 32],steps,height);
	BezConic([30.0, 30.5], [28, 31], [27, 31],steps,height);
	BezConic([27, 24], [31, 24], [34.5, 24.5],steps,height);
	BezConic([32, 21], [30, 21], [29.0, 21.0],steps,height);
	BezConic([29.0, 21.0], [28, 21], [27, 21],steps,height);
	BezConic([27, 21], [27, 19], [27.0, 17.5],steps,height);
	BezConic([27.0, 17.5], [27, 16], [27, 15],steps,height);
	BezConic([22, 19], [21, 19], [19.5, 19.0],steps,height);
	BezConic([19.5, 19.0], [18, 19], [17.0, 19.0],steps,height);
	BezConic([17.0, 19.0], [16, 19], [15.5, 18.0],steps,height);
	BezConic([15.5, 18.0], [15, 17], [15.5, 16.0],steps,height);
	BezConic([15.5, 16.0], [16, 15], [16.5, 14.5],steps,height);
	BezConic([13, 12], [13, 12], [13, 12],steps,height);
	BezConic([13, 12], [12, 19], [9, 20],steps,height);
	BezConic([6.5, 20.5], [5, 21], [5, 21],steps,height);
}
}

module ArchitectsDaughter_contour00x23_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 21], [5, 23], [8, 23],steps,height);
	BezConic([8, 23], [9, 23], [10.0, 22.5],steps,height);
	BezConic([12, 28], [11, 28], [9.0, 28.5],steps,height);
	BezConic([6.0, 31.5], [7, 32], [8, 32],steps,height);
	BezConic([12, 39], [12, 40], [12.5, 40.5],steps,height);
	BezConic([12.5, 40.5], [13, 41], [14, 41],steps,height);
	BezConic([14, 41], [14, 41], [15.0, 40.5],steps,height);
	BezConic([15.0, 40.5], [16, 40], [16, 39],steps,height);
	BezConic([38, 33], [38, 30], [34, 30],steps,height);
	BezConic([34, 30], [32, 30], [30.0, 30.5],steps,height);
	BezConic([34.5, 24.5], [38, 25], [42, 25],steps,height);
	BezConic([42, 24], [42, 22], [32, 21],steps,height);
	BezConic([27, 15], [26, 13], [22, 13],steps,height);
	BezConic([16.5, 14.5], [17, 14], [16.5, 13.5],steps,height);
	BezConic([16.5, 13.5], [16, 13], [14, 12],steps,height);
	BezConic([9, 20], [8, 20], [6.5, 20.5],steps,height);
}
}

module ArchitectsDaughter_contour00x23(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x23_skeleton(height);
			ArchitectsDaughter_contour00x23_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x23_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x23_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[23.0, 29.5], [23, 30], [22.5, 30.0], 
		[22, 30], [21.5, 30.0], [21, 30], 
		[20.0, 30.0], [19, 30], [18, 30], 
		[16, 30], [16, 29], [16.0, 25.5], 
		[16, 22], [20, 22], [21, 23], 
		[23, 24], [23, 27], [23, 29], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[23.0, 29.5], [23, 30], [22.5, 30.0], 
		[22, 30], [21.5, 30.0], [21, 30], 
		[20.0, 30.0], [19, 30], [18, 30], 
		[16, 30], [16, 29], [16.0, 25.5], 
		[16, 22], [20, 22], [21, 23], 
		[23, 24], [23, 27], [23, 29], 
		 ]);
}}}

module ArchitectsDaughter_contour10x23_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([23.0, 29.5], [23, 30], [22.5, 30.0],steps,height);
	BezConic([22.5, 30.0], [22, 30], [21.5, 30.0],steps,height);
	BezConic([21.5, 30.0], [21, 30], [20.0, 30.0],steps,height);
	BezConic([20.0, 30.0], [19, 30], [18, 30],steps,height);
	BezConic([18, 30], [16, 30], [16, 29],steps,height);
	BezConic([16, 22], [20, 22], [21, 23],steps,height);
	BezConic([21, 23], [23, 24], [23, 27],steps,height);
	BezConic([23, 27], [23, 29], [23.0, 29.5],steps,height);
}
}

module ArchitectsDaughter_contour10x23_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x23(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x23_skeleton(height);
			ArchitectsDaughter_contour10x23_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x23_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk00x23(steps=2, height) {
	difference() {
		
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x23(steps, height);
	translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x23(steps, height);
	}
}

ArchitectsDaughter_bbox0x23=[[4, 12], [42, 42]];

module ArchitectsDaughter_letter0x23(steps=2, height) {
	ArchitectsDaughter_chunk00x23(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x24_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[21, 12], [22.0, 7.0], [23, 2], 
		[23.0, 1.5], [23, 1], [23, 1], 
		[20, 0], [19, 0], [17, 0], 
		[16.5, 6.0], [16, 12], [16, 11], 
		[12, 11], [11.0, 11.0], [10, 11], 
		[10, 11], [9, 12], [9, 13], 
		[9, 14], [9, 15], [15, 15], 
		[16, 16], [16, 16], [16.0, 20.0], 
		[16, 24], [15.5, 24.0], [15, 24], 
		[5, 24], [2, 27], [1, 28], 
		[1, 29], [1, 30], [1.0, 31.0], 
		[1, 32], [2.0, 34.0], [3, 36], 
		[5, 37], [9, 40], [14, 41], 
		[14.0, 48.0], [14, 55], [15.5, 55.0], 
		[17, 55], [18.0, 49.0], [19, 43], 
		[25.5, 43.0], [32, 43], [32.0, 41.5], 
		[32, 40], [26.5, 39.0], [21, 38], 
		[20.5, 32.0], [20, 26], [27.5, 26.0], 
		[35, 26], [35, 26], [35.0, 24.5], 
		[35, 23], [34.0, 21.5], [33, 20], 
		[32.0, 18.5], [31, 17], [29.5, 16.5], 
		[28, 16], [26.5, 15.0], [25, 14], 
		[23.5, 13.5],[22, 13], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[21, 12], [22.0, 7.0], [23, 2], 
		[23.0, 1.5], [23, 1], [23, 1], 
		[20, 0], [19, 0], [17, 0], 
		[16.5, 6.0], [16, 12], [16, 11], 
		[12, 11], [11.0, 11.0], [10, 11], 
		[10, 11], [9, 12], [9, 13], 
		[9, 14], [9, 15], [15, 15], 
		[16, 16], [16, 16], [16.0, 20.0], 
		[16, 24], [15.5, 24.0], [15, 24], 
		[5, 24], [2, 27], [1, 28], 
		[1, 29], [1, 30], [1.0, 31.0], 
		[1, 32], [2.0, 34.0], [3, 36], 
		[5, 37], [9, 40], [14, 41], 
		[14.0, 48.0], [14, 55], [15.5, 55.0], 
		[17, 55], [18.0, 49.0], [19, 43], 
		[25.5, 43.0], [32, 43], [32.0, 41.5], 
		[32, 40], [26.5, 39.0], [21, 38], 
		[20.5, 32.0], [20, 26], [27.5, 26.0], 
		[35, 26], [35, 26], [35.0, 24.5], 
		[35, 23], [34.0, 21.5], [33, 20], 
		[32.0, 18.5], [31, 17], [29.5, 16.5], 
		[28, 16], [26.5, 15.0], [25, 14], 
		[23.5, 13.5],[22, 13], ]);
}}}

module ArchitectsDaughter_contour00x24_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([20, 0], [19, 0], [17, 0],steps,height);
	BezConic([10, 11], [10, 11], [9, 12],steps,height);
	BezConic([9, 12], [9, 13], [9, 14],steps,height);
	BezConic([15, 15], [16, 16], [16, 16],steps,height);
	BezConic([1, 29], [1, 30], [1.0, 31.0],steps,height);
	BezConic([34.0, 21.5], [33, 20], [32.0, 18.5],steps,height);
	BezConic([29.5, 16.5], [28, 16], [26.5, 15.0],steps,height);
	BezConic([23.5, 13.5], [22, 13], [21, 12],steps,height);
}
}

module ArchitectsDaughter_contour00x24_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([23, 1], [23, 1], [20, 0],steps,height);
	BezConic([16, 12], [16, 11], [12, 11],steps,height);
	BezConic([9, 14], [9, 15], [15, 15],steps,height);
	BezConic([15, 24], [5, 24], [2, 27],steps,height);
	BezConic([2, 27], [1, 28], [1, 29],steps,height);
	BezConic([1.0, 31.0], [1, 32], [2.0, 34.0],steps,height);
	BezConic([2.0, 34.0], [3, 36], [5, 37],steps,height);
	BezConic([5, 37], [9, 40], [14, 41],steps,height);
	BezConic([35, 26], [35, 26], [35.0, 24.5],steps,height);
	BezConic([35.0, 24.5], [35, 23], [34.0, 21.5],steps,height);
	BezConic([32.0, 18.5], [31, 17], [29.5, 16.5],steps,height);
	BezConic([26.5, 15.0], [25, 14], [23.5, 13.5],steps,height);
}
}

module ArchitectsDaughter_contour00x24(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x24_skeleton(height);
			ArchitectsDaughter_contour00x24_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x24_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x24_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[30, 23], [29, 24], [27, 24], 
		[25, 24], [23.5, 23.5], [22, 23], 
		[21, 23], [21.0, 20.5], [21, 18], 
		[30, 20], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[30, 23], [29, 24], [27, 24], 
		[25, 24], [23.5, 23.5], [22, 23], 
		[21, 23], [21.0, 20.5], [21, 18], 
		[30, 20], ]);
}}}

module ArchitectsDaughter_contour10x24_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([30, 23], [29, 24], [27, 24],steps,height);
	BezConic([27, 24], [25, 24], [23.5, 23.5],steps,height);
	BezConic([21, 18], [30, 20], [30, 23],steps,height);
}
}

module ArchitectsDaughter_contour10x24_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([23.5, 23.5], [22, 23], [21, 23],steps,height);
}
}

module ArchitectsDaughter_contour10x24(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x24_skeleton(height);
			ArchitectsDaughter_contour10x24_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x24_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour20x24_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[10, 27], [11.5, 27.0], [13, 27], 
		[14, 27], [14.5, 27.0], [15, 27], 
		[15.5, 27.0], [16, 27], [16, 27], 
		[15.5, 31.5], [15, 36], [15, 36], 
		[14.5, 36.5], [14, 37], [13.5, 37.0], 
		[13, 37], [11.5, 36.0], [10, 35], 
		[9, 34], [6, 32], [6, 30], 
		[6, 27], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[10, 27], [11.5, 27.0], [13, 27], 
		[14, 27], [14.5, 27.0], [15, 27], 
		[15.5, 27.0], [16, 27], [16, 27], 
		[15.5, 31.5], [15, 36], [15, 36], 
		[14.5, 36.5], [14, 37], [13.5, 37.0], 
		[13, 37], [11.5, 36.0], [10, 35], 
		[9, 34], [6, 32], [6, 30], 
		[6, 27], ]);
}}}

module ArchitectsDaughter_contour20x24_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([13, 27], [14, 27], [14.5, 27.0],steps,height);
	BezConic([14.5, 27.0], [15, 27], [15.5, 27.0],steps,height);
	BezConic([15.5, 27.0], [16, 27], [16, 27],steps,height);
	BezConic([15, 36], [15, 36], [14.5, 36.5],steps,height);
	BezConic([14.5, 36.5], [14, 37], [13.5, 37.0],steps,height);
	BezConic([13.5, 37.0], [13, 37], [11.5, 36.0],steps,height);
	BezConic([11.5, 36.0], [10, 35], [9, 34],steps,height);
	BezConic([9, 34], [6, 32], [6, 30],steps,height);
	BezConic([6, 30], [6, 27], [10, 27],steps,height);
}
}

module ArchitectsDaughter_contour20x24_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour20x24(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour20x24_skeleton(height);
			ArchitectsDaughter_contour20x24_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x24_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x24(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x24(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x24(steps, height);
	translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x24(steps, height);
	}
}

ArchitectsDaughter_bbox0x24=[[1, 0], [35, 55]];

module ArchitectsDaughter_letter0x24(steps=2, height) {
	ArchitectsDaughter_chunk10x24(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x25_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[21.5, 4.0], [20, 5], [19.5, 5.5], 
		[19, 6], [19.0, 8.0], [19, 10], 
		[20, 11], [21, 13], [23, 13], 
		[25, 13], [27, 12], [29, 11], 
		[30, 8], [30, 5], [28.5, 4.0], 
		[27, 3], [25, 3], [23, 3], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[21.5, 4.0], [20, 5], [19.5, 5.5], 
		[19, 6], [19.0, 8.0], [19, 10], 
		[20, 11], [21, 13], [23, 13], 
		[25, 13], [27, 12], [29, 11], 
		[30, 8], [30, 5], [28.5, 4.0], 
		[27, 3], [25, 3], [23, 3], 
		 ]);
}}}

module ArchitectsDaughter_contour00x25_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour00x25_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([21.5, 4.0], [20, 5], [19.5, 5.5],steps,height);
	BezConic([19.5, 5.5], [19, 6], [19.0, 8.0],steps,height);
	BezConic([19.0, 8.0], [19, 10], [20, 11],steps,height);
	BezConic([20, 11], [21, 13], [23, 13],steps,height);
	BezConic([23, 13], [25, 13], [27, 12],steps,height);
	BezConic([27, 12], [29, 11], [30, 8],steps,height);
	BezConic([30, 8], [30, 5], [28.5, 4.0],steps,height);
	BezConic([28.5, 4.0], [27, 3], [25, 3],steps,height);
	BezConic([25, 3], [23, 3], [21.5, 4.0],steps,height);
}
}

module ArchitectsDaughter_contour00x25(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x25_skeleton(height);
			ArchitectsDaughter_contour00x25_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x25_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x25_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[27, 9], [25, 10], [24, 10], 
		[22, 10], [21, 9], [21, 8], 
		[21.0, 7.5], [21, 7], [22, 6], 
		[23, 5], [24, 5], [27, 5], 
		[27, 7], [27, 7], [27.0, 7.5], 
		[27, 8], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[27, 9], [25, 10], [24, 10], 
		[22, 10], [21, 9], [21, 8], 
		[21.0, 7.5], [21, 7], [22, 6], 
		[23, 5], [24, 5], [27, 5], 
		[27, 7], [27, 7], [27.0, 7.5], 
		[27, 8], ]);
}}}

module ArchitectsDaughter_contour10x25_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([27, 9], [25, 10], [24, 10],steps,height);
	BezConic([24, 10], [22, 10], [21, 9],steps,height);
	BezConic([21, 9], [21, 8], [21.0, 7.5],steps,height);
	BezConic([21.0, 7.5], [21, 7], [22, 6],steps,height);
	BezConic([22, 6], [23, 5], [24, 5],steps,height);
	BezConic([24, 5], [27, 5], [27, 7],steps,height);
	BezConic([27, 7], [27, 7], [27.0, 7.5],steps,height);
	BezConic([27.0, 7.5], [27, 8], [27, 9],steps,height);
}
}

module ArchitectsDaughter_contour10x25_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x25(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x25_skeleton(height);
			ArchitectsDaughter_contour10x25_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x25_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour20x25_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[4.5, 27.0], [3, 28], [2.5, 29.0], 
		[2, 30], [2.0, 31.5], [2, 33], 
		[3, 35], [4, 37], [6, 37], 
		[8, 37], [10, 36], [12, 34], 
		[13, 32], [13, 28], [11.5, 27.0], 
		[10, 26], [8, 26], [6, 26], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[4.5, 27.0], [3, 28], [2.5, 29.0], 
		[2, 30], [2.0, 31.5], [2, 33], 
		[3, 35], [4, 37], [6, 37], 
		[8, 37], [10, 36], [12, 34], 
		[13, 32], [13, 28], [11.5, 27.0], 
		[10, 26], [8, 26], [6, 26], 
		 ]);
}}}

module ArchitectsDaughter_contour20x25_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour20x25_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4.5, 27.0], [3, 28], [2.5, 29.0],steps,height);
	BezConic([2.5, 29.0], [2, 30], [2.0, 31.5],steps,height);
	BezConic([2.0, 31.5], [2, 33], [3, 35],steps,height);
	BezConic([3, 35], [4, 37], [6, 37],steps,height);
	BezConic([6, 37], [8, 37], [10, 36],steps,height);
	BezConic([10, 36], [12, 34], [13, 32],steps,height);
	BezConic([13, 32], [13, 28], [11.5, 27.0],steps,height);
	BezConic([11.5, 27.0], [10, 26], [8, 26],steps,height);
	BezConic([8, 26], [6, 26], [4.5, 27.0],steps,height);
}
}

module ArchitectsDaughter_contour20x25(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour20x25_skeleton(height);
			ArchitectsDaughter_contour20x25_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x25_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour30x25_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[10, 33], [8, 34], [7, 34], 
		[5, 34], [4, 32], [4, 32], 
		[4.0, 31.5], [4, 31], [5, 30], 
		[6, 29], [7.0, 28.5], [8, 28], 
		[9, 29], [10, 30], [10.0, 31.0], 
		[10, 32], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[10, 33], [8, 34], [7, 34], 
		[5, 34], [4, 32], [4, 32], 
		[4.0, 31.5], [4, 31], [5, 30], 
		[6, 29], [7.0, 28.5], [8, 28], 
		[9, 29], [10, 30], [10.0, 31.0], 
		[10, 32], ]);
}}}

module ArchitectsDaughter_contour30x25_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([10, 33], [8, 34], [7, 34],steps,height);
	BezConic([7, 34], [5, 34], [4, 32],steps,height);
	BezConic([4.0, 31.5], [4, 31], [5, 30],steps,height);
	BezConic([5, 30], [6, 29], [7.0, 28.5],steps,height);
	BezConic([7.0, 28.5], [8, 28], [9, 29],steps,height);
	BezConic([9, 29], [10, 30], [10.0, 31.0],steps,height);
	BezConic([10.0, 31.0], [10, 32], [10, 33],steps,height);
}
}

module ArchitectsDaughter_contour30x25_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 32], [4, 32], [4.0, 31.5],steps,height);
}
}

module ArchitectsDaughter_contour30x25(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour30x25_skeleton(height);
			ArchitectsDaughter_contour30x25_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour30x25_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour40x25_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 0], [4, 0], [4, 2], 
		[4.0, 2.0], [4, 2], [4, 5], 
		[14, 21], [21, 31], [23.5, 34.5], 
		[26, 38], [26, 38], [26, 38], 
		[26.5, 38.0], [27, 38], [27.0, 37.0], 
		[27, 36], [26.0, 34.0], [25, 32], 
		[23.5, 29.0], [22, 26], [20.0, 23.0], 
		[18, 20], [16.0, 16.5], [14, 13], 
		[12, 10],[7, 3], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 0], [4, 0], [4, 2], 
		[4.0, 2.0], [4, 2], [4, 5], 
		[14, 21], [21, 31], [23.5, 34.5], 
		[26, 38], [26, 38], [26, 38], 
		[26.5, 38.0], [27, 38], [27.0, 37.0], 
		[27, 36], [26.0, 34.0], [25, 32], 
		[23.5, 29.0], [22, 26], [20.0, 23.0], 
		[18, 20], [16.0, 16.5], [14, 13], 
		[12, 10],[7, 3], ]);
}}}

module ArchitectsDaughter_contour40x25_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([23.5, 34.5], [26, 38], [26, 38],steps,height);
	BezConic([26, 38], [26, 38], [26.5, 38.0],steps,height);
	BezConic([20.0, 23.0], [18, 20], [16.0, 16.5],steps,height);
	BezConic([12, 10], [7, 3], [5, 0],steps,height);
}
}

module ArchitectsDaughter_contour40x25_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 0], [4, 0], [4, 2],steps,height);
	BezConic([4, 2], [4, 5], [14, 21],steps,height);
	BezConic([14, 21], [21, 31], [23.5, 34.5],steps,height);
	BezConic([26.5, 38.0], [27, 38], [27.0, 37.0],steps,height);
	BezConic([27.0, 37.0], [27, 36], [26.0, 34.0],steps,height);
	BezConic([26.0, 34.0], [25, 32], [23.5, 29.0],steps,height);
	BezConic([23.5, 29.0], [22, 26], [20.0, 23.0],steps,height);
	BezConic([16.0, 16.5], [14, 13], [12, 10],steps,height);
}
}

module ArchitectsDaughter_contour40x25(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour40x25_skeleton(height);
			ArchitectsDaughter_contour40x25_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour40x25_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x25(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x25(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x25(steps, height);
	}
}

module ArchitectsDaughter_chunk20x25(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour20x25(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour30x25(steps, height);
	}
}

module ArchitectsDaughter_chunk30x25(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour40x25(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x25=[[2, 0], [30, 38]];

module ArchitectsDaughter_letter0x25(steps=2, height) {
	ArchitectsDaughter_chunk10x25(steps, height);
	ArchitectsDaughter_chunk20x25(steps, height);
	ArchitectsDaughter_chunk30x25(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x26_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[39, 5], [39, 3], [36, 3], 
		[34, 3], [31, 5], [30, 5], 
		[29.0, 5.5], [28, 6], [27, 6], 
		[25, 5], [23, 4], [15, 0], 
		[9, 0], [8.0, 0.0], [7, 0], 
		[7, 0], [6.5, 0.0], [6, 0], 
		[5, 0], [2, 1], [1, 2], 
		[0, 3], [0.0, 3.0], [0, 3], 
		[0, 4], [6.0, 13.0], [12, 22], 
		[9, 27], [8, 29], [7, 32], 
		[7, 36], [8, 42], [12, 46], 
		[15, 49], [18, 49], [20, 49], 
		[21, 47], [22, 46], [22, 43], 
		[22, 36], [15, 23], [15, 20], 
		[21, 16], [24, 13], [25.5, 12.0], 
		[27, 11], [28, 11], [31, 13], 
		[32.5, 14.5], [34, 16], [34.5, 16.5], 
		[35, 17], [36, 18], [38, 21], 
		[41, 23], [41, 23], [42.0, 22.5], 
		[43, 22], [43.0, 22.0], [43, 22], 
		[42.5, 21.0], [42, 20], [40, 18], 
		[37, 14], [30, 9], [39, 5], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[39, 5], [39, 3], [36, 3], 
		[34, 3], [31, 5], [30, 5], 
		[29.0, 5.5], [28, 6], [27, 6], 
		[25, 5], [23, 4], [15, 0], 
		[9, 0], [8.0, 0.0], [7, 0], 
		[7, 0], [6.5, 0.0], [6, 0], 
		[5, 0], [2, 1], [1, 2], 
		[0, 3], [0.0, 3.0], [0, 3], 
		[0, 4], [6.0, 13.0], [12, 22], 
		[9, 27], [8, 29], [7, 32], 
		[7, 36], [8, 42], [12, 46], 
		[15, 49], [18, 49], [20, 49], 
		[21, 47], [22, 46], [22, 43], 
		[22, 36], [15, 23], [15, 20], 
		[21, 16], [24, 13], [25.5, 12.0], 
		[27, 11], [28, 11], [31, 13], 
		[32.5, 14.5], [34, 16], [34.5, 16.5], 
		[35, 17], [36, 18], [38, 21], 
		[41, 23], [41, 23], [42.0, 22.5], 
		[43, 22], [43.0, 22.0], [43, 22], 
		[42.5, 21.0], [42, 20], [40, 18], 
		[37, 14], [30, 9], [39, 5], 
		 ]);
}}}

module ArchitectsDaughter_contour00x26_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([29.0, 5.5], [28, 6], [27, 6],steps,height);
	BezConic([27, 6], [25, 5], [23, 4],steps,height);
	BezConic([7, 0], [7, 0], [6.5, 0.0],steps,height);
	BezConic([6.5, 0.0], [6, 0], [5, 0],steps,height);
	BezConic([1, 2], [0, 3], [0.0, 3.0],steps,height);
	BezConic([0.0, 3.0], [0, 3], [0, 4],steps,height);
	BezConic([15, 23], [15, 20], [21, 16],steps,height);
	BezConic([21, 16], [24, 13], [25.5, 12.0],steps,height);
	BezConic([25.5, 12.0], [27, 11], [28, 11],steps,height);
	BezConic([28, 11], [31, 13], [32.5, 14.5],steps,height);
	BezConic([32.5, 14.5], [34, 16], [34.5, 16.5],steps,height);
	BezConic([42.0, 22.5], [43, 22], [43.0, 22.0],steps,height);
	BezConic([30, 9], [39, 5], [39, 5],steps,height);
}
}

module ArchitectsDaughter_contour00x26_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([39, 5], [39, 3], [36, 3],steps,height);
	BezConic([36, 3], [34, 3], [31, 5],steps,height);
	BezConic([31, 5], [30, 5], [29.0, 5.5],steps,height);
	BezConic([23, 4], [15, 0], [9, 0],steps,height);
	BezConic([5, 0], [2, 1], [1, 2],steps,height);
	BezConic([12, 22], [9, 27], [8, 29],steps,height);
	BezConic([8, 29], [7, 32], [7, 36],steps,height);
	BezConic([7, 36], [8, 42], [12, 46],steps,height);
	BezConic([12, 46], [15, 49], [18, 49],steps,height);
	BezConic([18, 49], [20, 49], [21, 47],steps,height);
	BezConic([21, 47], [22, 46], [22, 43],steps,height);
	BezConic([22, 43], [22, 36], [15, 23],steps,height);
	BezConic([34.5, 16.5], [35, 17], [36, 18],steps,height);
	BezConic([36, 18], [38, 21], [41, 23],steps,height);
	BezConic([41, 23], [41, 23], [42.0, 22.5],steps,height);
	BezConic([43.0, 22.0], [43, 22], [42.5, 21.0],steps,height);
	BezConic([42.5, 21.0], [42, 20], [40, 18],steps,height);
	BezConic([40, 18], [37, 14], [30, 9],steps,height);
}
}

module ArchitectsDaughter_contour00x26(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x26_skeleton(height);
			ArchitectsDaughter_contour00x26_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x26_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x26_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 4], [5, 3], [6, 3], 
		[6, 3], [7.5, 3.0], [9, 3], 
		[11.5, 3.5], [14, 4], [16, 4], 
		[19, 5], [24, 8], [19.0, 13.5], 
		[14, 19], [12, 17], [10, 14], 
		[5, 6], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 4], [5, 3], [6, 3], 
		[6, 3], [7.5, 3.0], [9, 3], 
		[11.5, 3.5], [14, 4], [16, 4], 
		[19, 5], [24, 8], [19.0, 13.5], 
		[14, 19], [12, 17], [10, 14], 
		[5, 6], ]);
}}}

module ArchitectsDaughter_contour10x26_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 4], [5, 3], [6, 3],steps,height);
	BezConic([6, 3], [6, 3], [7.5, 3.0],steps,height);
	BezConic([7.5, 3.0], [9, 3], [11.5, 3.5],steps,height);
	BezConic([16, 4], [19, 5], [24, 8],steps,height);
	BezConic([14, 19], [12, 17], [10, 14],steps,height);
	BezConic([10, 14], [5, 6], [5, 4],steps,height);
}
}

module ArchitectsDaughter_contour10x26_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([11.5, 3.5], [14, 4], [16, 4],steps,height);
}
}

module ArchitectsDaughter_contour10x26(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x26_skeleton(height);
			ArchitectsDaughter_contour10x26_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x26_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour20x26_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[13, 26], [16, 28], [17, 33], 
		[19, 38], [19, 42], [19.0, 43.0], 
		[19, 44], [19, 45], [18.5, 45.5], 
		[18, 46], [16.5, 46.0], [15, 46], 
		[14.0, 44.5], [13, 43], [12, 42], 
		[10, 39], [10.0, 34.5], [10, 30], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[13, 26], [16, 28], [17, 33], 
		[19, 38], [19, 42], [19.0, 43.0], 
		[19, 44], [19, 45], [18.5, 45.5], 
		[18, 46], [16.5, 46.0], [15, 46], 
		[14.0, 44.5], [13, 43], [12, 42], 
		[10, 39], [10.0, 34.5], [10, 30], 
		 ]);
}}}

module ArchitectsDaughter_contour20x26_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([13, 26], [16, 28], [17, 33],steps,height);
	BezConic([17, 33], [19, 38], [19, 42],steps,height);
	BezConic([19, 44], [19, 45], [18.5, 45.5],steps,height);
	BezConic([18.5, 45.5], [18, 46], [16.5, 46.0],steps,height);
	BezConic([16.5, 46.0], [15, 46], [14.0, 44.5],steps,height);
	BezConic([12, 42], [10, 39], [10.0, 34.5],steps,height);
	BezConic([10.0, 34.5], [10, 30], [13, 26],steps,height);
}
}

module ArchitectsDaughter_contour20x26_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([14.0, 44.5], [13, 43], [12, 42],steps,height);
}
}

module ArchitectsDaughter_contour20x26(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour20x26_skeleton(height);
			ArchitectsDaughter_contour20x26_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x26_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x26(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x26(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x26(steps, height);
	translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x26(steps, height);
	}
}

ArchitectsDaughter_bbox0x26=[[0, 0], [43, 49]];

module ArchitectsDaughter_letter0x26(steps=2, height) {
	ArchitectsDaughter_chunk10x26(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x27_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 39], [8, 39], [8, 37], 
		[8, 34], [6, 30], [5, 29], 
		[5, 28], [3.5, 27.5], [2, 27], 
		[3.5, 32.5], [5, 38], [6, 39], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 39], [8, 39], [8, 37], 
		[8, 34], [6, 30], [5, 29], 
		[5, 28], [3.5, 27.5], [2, 27], 
		[3.5, 32.5], [5, 38], [6, 39], 
		 ]);
}}}

module ArchitectsDaughter_contour00x27_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6, 30], [5, 29], [5, 28],steps,height);
}
}

module ArchitectsDaughter_contour00x27_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 39], [8, 39], [8, 37],steps,height);
	BezConic([8, 37], [8, 34], [6, 30],steps,height);
	BezConic([5, 38], [6, 39], [7, 39],steps,height);
}
}

module ArchitectsDaughter_contour00x27(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x27_skeleton(height);
			ArchitectsDaughter_contour00x27_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x27_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x27(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x27(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x27=[[2, 27], [8, 39]];

module ArchitectsDaughter_letter0x27(steps=2, height) {
	ArchitectsDaughter_chunk10x27(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x28_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[12, 2], [12, 1], [10.5, 1.0], 
		[9, 1], [7.5, 2.5], [6, 4], 
		[5.0, 6.0], [4, 8], [3.0, 10.5], 
		[2, 13], [2, 15], [1, 20], 
		[1.0, 22.0], [1, 24], [1.5, 27.0], 
		[2, 30], [3.0, 33.5], [4, 37], 
		[5.5, 40.5], [7, 44], [8, 47], 
		[12, 54], [16, 54], [16, 54], 
		[16.5, 54.0], [17, 54], [18, 53], 
		[12, 45], [10.0, 41.0], [8, 37], 
		[7.0, 33.0], [6, 29], [6.0, 25.5], 
		[6, 22], [7.0, 19.0], [8, 16], 
		[9.0, 13.0], [10, 10], [11.0, 7.5], 
		[12, 5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[12, 2], [12, 1], [10.5, 1.0], 
		[9, 1], [7.5, 2.5], [6, 4], 
		[5.0, 6.0], [4, 8], [3.0, 10.5], 
		[2, 13], [2, 15], [1, 20], 
		[1.0, 22.0], [1, 24], [1.5, 27.0], 
		[2, 30], [3.0, 33.5], [4, 37], 
		[5.5, 40.5], [7, 44], [8, 47], 
		[12, 54], [16, 54], [16, 54], 
		[16.5, 54.0], [17, 54], [18, 53], 
		[12, 45], [10.0, 41.0], [8, 37], 
		[7.0, 33.0], [6, 29], [6.0, 25.5], 
		[6, 22], [7.0, 19.0], [8, 16], 
		[9.0, 13.0], [10, 10], [11.0, 7.5], 
		[12, 5], ]);
}}}

module ArchitectsDaughter_contour00x28_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5.5, 40.5], [7, 44], [8, 47],steps,height);
	BezConic([16, 54], [16, 54], [16.5, 54.0],steps,height);
	BezConic([18, 53], [12, 45], [10.0, 41.0],steps,height);
	BezConic([10.0, 41.0], [8, 37], [7.0, 33.0],steps,height);
	BezConic([7.0, 33.0], [6, 29], [6.0, 25.5],steps,height);
	BezConic([6.0, 25.5], [6, 22], [7.0, 19.0],steps,height);
	BezConic([7.0, 19.0], [8, 16], [9.0, 13.0],steps,height);
	BezConic([9.0, 13.0], [10, 10], [11.0, 7.5],steps,height);
}
}

module ArchitectsDaughter_contour00x28_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([12, 2], [12, 1], [10.5, 1.0],steps,height);
	BezConic([10.5, 1.0], [9, 1], [7.5, 2.5],steps,height);
	BezConic([7.5, 2.5], [6, 4], [5.0, 6.0],steps,height);
	BezConic([5.0, 6.0], [4, 8], [3.0, 10.5],steps,height);
	BezConic([3.0, 10.5], [2, 13], [2, 15],steps,height);
	BezConic([2, 15], [1, 20], [1.0, 22.0],steps,height);
	BezConic([1.0, 22.0], [1, 24], [1.5, 27.0],steps,height);
	BezConic([1.5, 27.0], [2, 30], [3.0, 33.5],steps,height);
	BezConic([3.0, 33.5], [4, 37], [5.5, 40.5],steps,height);
	BezConic([8, 47], [12, 54], [16, 54],steps,height);
	BezConic([16.5, 54.0], [17, 54], [18, 53],steps,height);
	BezConic([11.0, 7.5], [12, 5], [12, 2],steps,height);
}
}

module ArchitectsDaughter_contour00x28(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x28_skeleton(height);
			ArchitectsDaughter_contour00x28_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x28_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x28(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x28(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x28=[[1, 1], [18, 54]];

module ArchitectsDaughter_letter0x28(steps=2, height) {
	ArchitectsDaughter_chunk10x28(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x29_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 48], [2.0, 48.5], [2, 49], 
		[2, 50], [2.5, 50.5], [3, 51], 
		[4, 51], [10, 51], [14, 45], 
		[19, 38], [20, 26], [21, 23], 
		[21.0, 21.5], [21, 20], [20.5, 18.0], 
		[20, 16], [19.0, 13.5], [18, 11], 
		[17.0, 8.5], [16, 6], [15, 4], 
		[12, 0], [8, 0], [8, 0], 
		[7.5, 0.5], [7, 1], [7, 1], 
		[8, 4], [9.5, 6.0], [11, 8], 
		[12.5, 10.5], [14, 13], [15.0, 15.5], 
		[16, 18], [16.0, 22.0], [16, 26], 
		[15.0, 29.5], [14, 33], [12.0, 36.0], 
		[10, 39], [7.5, 42.0], [5, 45], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 48], [2.0, 48.5], [2, 49], 
		[2, 50], [2.5, 50.5], [3, 51], 
		[4, 51], [10, 51], [14, 45], 
		[19, 38], [20, 26], [21, 23], 
		[21.0, 21.5], [21, 20], [20.5, 18.0], 
		[20, 16], [19.0, 13.5], [18, 11], 
		[17.0, 8.5], [16, 6], [15, 4], 
		[12, 0], [8, 0], [8, 0], 
		[7.5, 0.5], [7, 1], [7, 1], 
		[8, 4], [9.5, 6.0], [11, 8], 
		[12.5, 10.5], [14, 13], [15.0, 15.5], 
		[16, 18], [16.0, 22.0], [16, 26], 
		[15.0, 29.5], [14, 33], [12.0, 36.0], 
		[10, 39], [7.5, 42.0], [5, 45], 
		 ]);
}}}

module ArchitectsDaughter_contour00x29_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8, 0], [8, 0], [7.5, 0.5],steps,height);
	BezConic([7.5, 0.5], [7, 1], [7, 1],steps,height);
	BezConic([9.5, 6.0], [11, 8], [12.5, 10.5],steps,height);
	BezConic([12.5, 10.5], [14, 13], [15.0, 15.5],steps,height);
	BezConic([15.0, 15.5], [16, 18], [16.0, 22.0],steps,height);
	BezConic([16.0, 22.0], [16, 26], [15.0, 29.5],steps,height);
	BezConic([15.0, 29.5], [14, 33], [12.0, 36.0],steps,height);
	BezConic([12.0, 36.0], [10, 39], [7.5, 42.0],steps,height);
	BezConic([7.5, 42.0], [5, 45], [2, 48],steps,height);
}
}

module ArchitectsDaughter_contour00x29_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 49], [2, 50], [2.5, 50.5],steps,height);
	BezConic([2.5, 50.5], [3, 51], [4, 51],steps,height);
	BezConic([4, 51], [10, 51], [14, 45],steps,height);
	BezConic([14, 45], [19, 38], [20, 26],steps,height);
	BezConic([20, 26], [21, 23], [21.0, 21.5],steps,height);
	BezConic([21.0, 21.5], [21, 20], [20.5, 18.0],steps,height);
	BezConic([20.5, 18.0], [20, 16], [19.0, 13.5],steps,height);
	BezConic([19.0, 13.5], [18, 11], [17.0, 8.5],steps,height);
	BezConic([17.0, 8.5], [16, 6], [15, 4],steps,height);
	BezConic([15, 4], [12, 0], [8, 0],steps,height);
	BezConic([7, 1], [8, 4], [9.5, 6.0],steps,height);
}
}

module ArchitectsDaughter_contour00x29(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x29_skeleton(height);
			ArchitectsDaughter_contour00x29_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x29_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x29(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x29(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x29=[[2, 0], [21, 51]];

module ArchitectsDaughter_letter0x29(steps=2, height) {
	ArchitectsDaughter_chunk10x29(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x2a_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 12], [10, 20], [10, 23], 
		[10, 25], [8, 26], [7, 27], 
		[6, 27], [2, 29], [2, 32], 
		[2, 32], [3, 33], [5, 33], 
		[6.5, 32.0], [8, 31], [9, 31], 
		[11, 29], [13, 29], [13, 29], 
		[14, 29], [16.5, 35.5], [19, 42], 
		[20, 44], [23, 44], [23, 41], 
		[22.0, 38.0], [21, 35], [21.0, 33.0], 
		[21, 31], [21, 29], [23, 29], 
		[25.5, 30.0], [28, 31], [29.5, 31.0], 
		[31, 31], [33, 31], [33, 29], 
		[32.0, 28.0], [31, 27], [29.5, 26.5], 
		[28, 26], [26.5, 25.5], [25, 25], 
		[23, 24], [20, 23], [20, 20], 
		[20, 18], [21, 16], [22, 11], 
		[22.0, 10.0], [22, 9], [21.5, 8.5], 
		[21, 8], [19, 7], [18, 8], 
		[17.5, 9.0], [17, 10], [16.5, 11.5], 
		[16, 13], [15.5, 14.5], [15, 16], 
		[14, 16], [13, 15], [12.0, 14.0], 
		[11, 13], [10.0, 11.5], [9, 10], 
		[7.5, 9.0], [6, 8], [5, 8], 
		[4, 8], [4.0, 8.5], [4, 9], 
		[4, 9],[4, 10], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 12], [10, 20], [10, 23], 
		[10, 25], [8, 26], [7, 27], 
		[6, 27], [2, 29], [2, 32], 
		[2, 32], [3, 33], [5, 33], 
		[6.5, 32.0], [8, 31], [9, 31], 
		[11, 29], [13, 29], [13, 29], 
		[14, 29], [16.5, 35.5], [19, 42], 
		[20, 44], [23, 44], [23, 41], 
		[22.0, 38.0], [21, 35], [21.0, 33.0], 
		[21, 31], [21, 29], [23, 29], 
		[25.5, 30.0], [28, 31], [29.5, 31.0], 
		[31, 31], [33, 31], [33, 29], 
		[32.0, 28.0], [31, 27], [29.5, 26.5], 
		[28, 26], [26.5, 25.5], [25, 25], 
		[23, 24], [20, 23], [20, 20], 
		[20, 18], [21, 16], [22, 11], 
		[22.0, 10.0], [22, 9], [21.5, 8.5], 
		[21, 8], [19, 7], [18, 8], 
		[17.5, 9.0], [17, 10], [16.5, 11.5], 
		[16, 13], [15.5, 14.5], [15, 16], 
		[14, 16], [13, 15], [12.0, 14.0], 
		[11, 13], [10.0, 11.5], [9, 10], 
		[7.5, 9.0], [6, 8], [5, 8], 
		[4, 8], [4.0, 8.5], [4, 9], 
		[4, 9],[4, 10], ]);
}}}

module ArchitectsDaughter_contour00x2a_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 12], [10, 20], [10, 23],steps,height);
	BezConic([10, 23], [10, 25], [8, 26],steps,height);
	BezConic([8, 26], [7, 27], [6, 27],steps,height);
	BezConic([2, 32], [2, 32], [3, 33],steps,height);
	BezConic([6.5, 32.0], [8, 31], [9, 31],steps,height);
	BezConic([9, 31], [11, 29], [13, 29],steps,height);
	BezConic([13, 29], [13, 29], [14, 29],steps,height);
	BezConic([22.0, 38.0], [21, 35], [21.0, 33.0],steps,height);
	BezConic([21, 29], [23, 29], [25.5, 30.0],steps,height);
	BezConic([29.5, 31.0], [31, 31], [33, 31],steps,height);
	BezConic([26.5, 25.5], [25, 25], [23, 24],steps,height);
	BezConic([23, 24], [20, 23], [20, 20],steps,height);
	BezConic([20, 20], [20, 18], [21, 16],steps,height);
	BezConic([16.5, 11.5], [16, 13], [15.5, 14.5],steps,height);
	BezConic([15.5, 14.5], [15, 16], [14, 16],steps,height);
	BezConic([14, 16], [13, 15], [12.0, 14.0],steps,height);
	BezConic([12.0, 14.0], [11, 13], [10.0, 11.5],steps,height);
	BezConic([4.0, 8.5], [4, 9], [4, 9],steps,height);
}
}

module ArchitectsDaughter_contour00x2a_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6, 27], [2, 29], [2, 32],steps,height);
	BezConic([3, 33], [5, 33], [6.5, 32.0],steps,height);
	BezConic([19, 42], [20, 44], [23, 44],steps,height);
	BezConic([23, 44], [23, 41], [22.0, 38.0],steps,height);
	BezConic([21.0, 33.0], [21, 31], [21, 29],steps,height);
	BezConic([25.5, 30.0], [28, 31], [29.5, 31.0],steps,height);
	BezConic([33, 31], [33, 29], [32.0, 28.0],steps,height);
	BezConic([32.0, 28.0], [31, 27], [29.5, 26.5],steps,height);
	BezConic([29.5, 26.5], [28, 26], [26.5, 25.5],steps,height);
	BezConic([21, 16], [22, 11], [22.0, 10.0],steps,height);
	BezConic([22.0, 10.0], [22, 9], [21.5, 8.5],steps,height);
	BezConic([21.5, 8.5], [21, 8], [19, 7],steps,height);
	BezConic([19, 7], [18, 8], [17.5, 9.0],steps,height);
	BezConic([17.5, 9.0], [17, 10], [16.5, 11.5],steps,height);
	BezConic([10.0, 11.5], [9, 10], [7.5, 9.0],steps,height);
	BezConic([7.5, 9.0], [6, 8], [5, 8],steps,height);
	BezConic([5, 8], [4, 8], [4.0, 8.5],steps,height);
	BezConic([4, 9], [4, 10], [5, 12],steps,height);
}
}

module ArchitectsDaughter_contour00x2a(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x2a_skeleton(height);
			ArchitectsDaughter_contour00x2a_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x2a_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x2a(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x2a(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x2a=[[2, 7], [33, 44]];

module ArchitectsDaughter_letter0x2a(steps=2, height) {
	ArchitectsDaughter_chunk10x2a(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x2b_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[13, 30], [13, 31], [15, 31], 
		[16, 31], [16.5, 31.0], [17, 31], 
		[17.0, 30.0], [17, 29], [17.5, 27.5], 
		[18, 26], [18.0, 25.0], [18, 24], 
		[18.0, 22.5], [18, 21], [18, 21], 
		[25.0, 21.0], [32, 21], [32, 18], 
		[26, 18], [25, 18], [23, 18], 
		[19, 18], [18, 18], [18, 17], 
		[18.0, 16.0], [18, 15], [18.5, 13.5], 
		[19, 12], [19, 11], [19, 7], 
		[19.0, 5.5], [19, 4], [19, 3], 
		[18, 2], [17, 2], [15, 2], 
		[15, 3], [15, 4], [15.0, 6.0], 
		[15, 8], [15, 10], [14, 14], 
		[13, 17], [11, 17], [9, 16], 
		[4, 15], [2.5, 15.0], [1, 15], 
		[1, 16], [1, 18], [7, 18], 
		[11, 18], [12.0, 18.5], [13, 19], 
		[13, 20],[13.0, 25.0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[13, 30], [13, 31], [15, 31], 
		[16, 31], [16.5, 31.0], [17, 31], 
		[17.0, 30.0], [17, 29], [17.5, 27.5], 
		[18, 26], [18.0, 25.0], [18, 24], 
		[18.0, 22.5], [18, 21], [18, 21], 
		[25.0, 21.0], [32, 21], [32, 18], 
		[26, 18], [25, 18], [23, 18], 
		[19, 18], [18, 18], [18, 17], 
		[18.0, 16.0], [18, 15], [18.5, 13.5], 
		[19, 12], [19, 11], [19, 7], 
		[19.0, 5.5], [19, 4], [19, 3], 
		[18, 2], [17, 2], [15, 2], 
		[15, 3], [15, 4], [15.0, 6.0], 
		[15, 8], [15, 10], [14, 14], 
		[13, 17], [11, 17], [9, 16], 
		[4, 15], [2.5, 15.0], [1, 15], 
		[1, 16], [1, 18], [7, 18], 
		[11, 18], [12.0, 18.5], [13, 19], 
		[13, 20],[13.0, 25.0], ]);
}}}

module ArchitectsDaughter_contour00x2b_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([15, 31], [16, 31], [16.5, 31.0],steps,height);
	BezConic([17.0, 30.0], [17, 29], [17.5, 27.5],steps,height);
	BezConic([18.0, 25.0], [18, 24], [18.0, 22.5],steps,height);
	BezConic([18.0, 22.5], [18, 21], [18, 21],steps,height);
	BezConic([26, 18], [25, 18], [23, 18],steps,height);
	BezConic([23, 18], [19, 18], [18, 18],steps,height);
	BezConic([18, 18], [18, 17], [18.0, 16.0],steps,height);
	BezConic([18.0, 16.0], [18, 15], [18.5, 13.5],steps,height);
	BezConic([19, 11], [19, 7], [19.0, 5.5],steps,height);
	BezConic([19.0, 5.5], [19, 4], [19, 3],steps,height);
	BezConic([15, 3], [15, 4], [15.0, 6.0],steps,height);
	BezConic([15.0, 6.0], [15, 8], [15, 10],steps,height);
	BezConic([15, 10], [14, 14], [13, 17],steps,height);
	BezConic([13, 17], [11, 17], [9, 16],steps,height);
	BezConic([7, 18], [11, 18], [12.0, 18.5],steps,height);
	BezConic([12.0, 18.5], [13, 19], [13, 20],steps,height);
}
}

module ArchitectsDaughter_contour00x2b_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([13, 30], [13, 31], [15, 31],steps,height);
	BezConic([16.5, 31.0], [17, 31], [17.0, 30.0],steps,height);
	BezConic([17.5, 27.5], [18, 26], [18.0, 25.0],steps,height);
	BezConic([32, 21], [32, 18], [26, 18],steps,height);
	BezConic([18.5, 13.5], [19, 12], [19, 11],steps,height);
	BezConic([19, 3], [18, 2], [17, 2],steps,height);
	BezConic([17, 2], [15, 2], [15, 3],steps,height);
	BezConic([9, 16], [4, 15], [2.5, 15.0],steps,height);
	BezConic([2.5, 15.0], [1, 15], [1, 16],steps,height);
	BezConic([1, 16], [1, 18], [7, 18],steps,height);
}
}

module ArchitectsDaughter_contour00x2b(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x2b_skeleton(height);
			ArchitectsDaughter_contour00x2b_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x2b_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x2b(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x2b(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x2b=[[1, 2], [32, 31]];

module ArchitectsDaughter_letter0x2b(steps=2, height) {
	ArchitectsDaughter_chunk10x2b(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x2c_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3, 5], [3, 6], [3.5, 6.0], 
		[4, 6], [5.0, 6.0], [6, 6], 
		[6, 6], [7, 6], [7, 5], 
		[7, 5], [7.0, 5.0], [7, 5], 
		[7.0, 4.5], [7, 4], [6.5, 3.0], 
		[6, 2], [5.0, 0.5], [4, -1], 
		[3.5, -1.5], [3, -2], [3.0, -2.5], 
		[3, -3], [2, -4], [1, -5], 
		[-1, -5], [-1, -5], [-1, -5], 
		[1.0, 0.0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3, 5], [3, 6], [3.5, 6.0], 
		[4, 6], [5.0, 6.0], [6, 6], 
		[6, 6], [7, 6], [7, 5], 
		[7, 5], [7.0, 5.0], [7, 5], 
		[7.0, 4.5], [7, 4], [6.5, 3.0], 
		[6, 2], [5.0, 0.5], [4, -1], 
		[3.5, -1.5], [3, -2], [3.0, -2.5], 
		[3, -3], [2, -4], [1, -5], 
		[-1, -5], [-1, -5], [-1, -5], 
		[1.0, 0.0], ]);
}}}

module ArchitectsDaughter_contour00x2c_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.5, 6.0], [4, 6], [5.0, 6.0],steps,height);
	BezConic([5.0, 6.0], [6, 6], [6, 6],steps,height);
	BezConic([7, 5], [7, 5], [7.0, 5.0],steps,height);
	BezConic([3.5, -1.5], [3, -2], [3.0, -2.5],steps,height);
	BezConic([-1, -5], [-1, -5], [-1, -5],steps,height);
}
}

module ArchitectsDaughter_contour00x2c_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 5], [3, 6], [3.5, 6.0],steps,height);
	BezConic([6, 6], [7, 6], [7, 5],steps,height);
	BezConic([7.0, 5.0], [7, 5], [7.0, 4.5],steps,height);
	BezConic([7.0, 4.5], [7, 4], [6.5, 3.0],steps,height);
	BezConic([6.5, 3.0], [6, 2], [5.0, 0.5],steps,height);
	BezConic([5.0, 0.5], [4, -1], [3.5, -1.5],steps,height);
	BezConic([3.0, -2.5], [3, -3], [2, -4],steps,height);
	BezConic([2, -4], [1, -5], [-1, -5],steps,height);
}
}

module ArchitectsDaughter_contour00x2c(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x2c_skeleton(height);
			ArchitectsDaughter_contour00x2c_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x2c_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x2c(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x2c(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x2c=[[-1, -5], [7, 6]];

module ArchitectsDaughter_letter0x2c(steps=2, height) {
	ArchitectsDaughter_chunk10x2c(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x2d_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 14], [2, 14], [2, 15], 
		[2, 16], [2.5, 16.5], [3, 17], 
		[5.0, 17.0], [7, 17], [9.5, 17.5], 
		[12, 18], [15, 18], [17, 18], 
		[17, 18], [19, 17], [19, 16], 
		[19, 16], [18.5, 15.5], [18, 15], 
		[17, 15],[11.0, 14.5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 14], [2, 14], [2, 15], 
		[2, 16], [2.5, 16.5], [3, 17], 
		[5.0, 17.0], [7, 17], [9.5, 17.5], 
		[12, 18], [15, 18], [17, 18], 
		[17, 18], [19, 17], [19, 16], 
		[19, 16], [18.5, 15.5], [18, 15], 
		[17, 15],[11.0, 14.5], ]);
}}}

module ArchitectsDaughter_contour00x2d_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5.0, 17.0], [7, 17], [9.5, 17.5],steps,height);
	BezConic([15, 18], [17, 18], [17, 18],steps,height);
}
}

module ArchitectsDaughter_contour00x2d_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 14], [2, 14], [2, 15],steps,height);
	BezConic([2, 15], [2, 16], [2.5, 16.5],steps,height);
	BezConic([2.5, 16.5], [3, 17], [5.0, 17.0],steps,height);
	BezConic([9.5, 17.5], [12, 18], [15, 18],steps,height);
	BezConic([17, 18], [19, 17], [19, 16],steps,height);
	BezConic([19, 16], [19, 16], [18.5, 15.5],steps,height);
	BezConic([18.5, 15.5], [18, 15], [17, 15],steps,height);
}
}

module ArchitectsDaughter_contour00x2d(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x2d_skeleton(height);
			ArchitectsDaughter_contour00x2d_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x2d_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x2d(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x2d(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x2d=[[2, 14], [19, 18]];

module ArchitectsDaughter_letter0x2d(steps=2, height) {
	ArchitectsDaughter_chunk10x2d(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x2e_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3, 0], [1, 0], [1, 1], 
		[1, 3], [3, 4], [4, 4], 
		[4.0, 4.0], [4, 4], [5, 4], 
		[6, 4], [6.5, 3.5], [7, 3], 
		[7.0, 2.0], [7, 1], [6.5, 0.5], 
		[6, 0], [5, 0], [5, 0], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3, 0], [1, 0], [1, 1], 
		[1, 3], [3, 4], [4, 4], 
		[4.0, 4.0], [4, 4], [5, 4], 
		[6, 4], [6.5, 3.5], [7, 3], 
		[7.0, 2.0], [7, 1], [6.5, 0.5], 
		[6, 0], [5, 0], [5, 0], 
		 ]);
}}}

module ArchitectsDaughter_contour00x2e_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 4], [4, 4], [4.0, 4.0],steps,height);
	BezConic([4.0, 4.0], [4, 4], [5, 4],steps,height);
	BezConic([5, 0], [5, 0], [3, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x2e_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 0], [1, 0], [1, 1],steps,height);
	BezConic([1, 1], [1, 3], [3, 4],steps,height);
	BezConic([5, 4], [6, 4], [6.5, 3.5],steps,height);
	BezConic([6.5, 3.5], [7, 3], [7.0, 2.0],steps,height);
	BezConic([7.0, 2.0], [7, 1], [6.5, 0.5],steps,height);
	BezConic([6.5, 0.5], [6, 0], [5, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x2e(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x2e_skeleton(height);
			ArchitectsDaughter_contour00x2e_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x2e_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x2e(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x2e(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x2e=[[1, 0], [7, 4]];

module ArchitectsDaughter_letter0x2e(steps=2, height) {
	ArchitectsDaughter_chunk10x2e(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x2f_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 0], [1, 0], [1, 2], 
		[1.0, 2.5], [1, 3], [2, 5], 
		[26, 41], [27, 43], [27, 43], 
		[28, 43], [28.0, 42.5], [28, 42], 
		[27.0, 39.5], [26, 37], [24.0, 33.0], 
		[22, 29], [19.5, 24.0], [17, 19], 
		[14, 14],[7, 4], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 0], [1, 0], [1, 2], 
		[1.0, 2.5], [1, 3], [2, 5], 
		[26, 41], [27, 43], [27, 43], 
		[28, 43], [28.0, 42.5], [28, 42], 
		[27.0, 39.5], [26, 37], [24.0, 33.0], 
		[22, 29], [19.5, 24.0], [17, 19], 
		[14, 14],[7, 4], ]);
}}}

module ArchitectsDaughter_contour00x2f_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 41], [27, 43], [27, 43],steps,height);
	BezConic([24.0, 33.0], [22, 29], [19.5, 24.0],steps,height);
}
}

module ArchitectsDaughter_contour00x2f_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 0], [1, 0], [1, 2],steps,height);
	BezConic([1, 3], [2, 5], [26, 41],steps,height);
	BezConic([27, 43], [28, 43], [28.0, 42.5],steps,height);
	BezConic([28.0, 42.5], [28, 42], [27.0, 39.5],steps,height);
	BezConic([27.0, 39.5], [26, 37], [24.0, 33.0],steps,height);
	BezConic([19.5, 24.0], [17, 19], [14, 14],steps,height);
	BezConic([14, 14], [7, 4], [2, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x2f(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x2f_skeleton(height);
			ArchitectsDaughter_contour00x2f_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x2f_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x2f(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x2f(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x2f=[[1, 0], [28, 43]];

module ArchitectsDaughter_letter0x2f(steps=2, height) {
	ArchitectsDaughter_chunk10x2f(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x30_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 3], [5, 4], [3.5, 6.5], 
		[2, 9], [2.0, 11.5], [2, 14], 
		[3.0, 17.0], [4, 20], [5.0, 23.0], 
		[6, 26], [8.0, 29.0], [10, 32], 
		[12, 34], [16, 38], [22, 38], 
		[30, 38], [35, 33], [38, 27], 
		[38, 19], [38, 10], [33, 5], 
		[27, 0], [17, 0], [12, 0], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 3], [5, 4], [3.5, 6.5], 
		[2, 9], [2.0, 11.5], [2, 14], 
		[3.0, 17.0], [4, 20], [5.0, 23.0], 
		[6, 26], [8.0, 29.0], [10, 32], 
		[12, 34], [16, 38], [22, 38], 
		[30, 38], [35, 33], [38, 27], 
		[38, 19], [38, 10], [33, 5], 
		[27, 0], [17, 0], [12, 0], 
		 ]);
}}}

module ArchitectsDaughter_contour00x30_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.0, 17.0], [4, 20], [5.0, 23.0],steps,height);
}
}

module ArchitectsDaughter_contour00x30_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 3], [5, 4], [3.5, 6.5],steps,height);
	BezConic([3.5, 6.5], [2, 9], [2.0, 11.5],steps,height);
	BezConic([2.0, 11.5], [2, 14], [3.0, 17.0],steps,height);
	BezConic([5.0, 23.0], [6, 26], [8.0, 29.0],steps,height);
	BezConic([8.0, 29.0], [10, 32], [12, 34],steps,height);
	BezConic([12, 34], [16, 38], [22, 38],steps,height);
	BezConic([22, 38], [30, 38], [35, 33],steps,height);
	BezConic([35, 33], [38, 27], [38, 19],steps,height);
	BezConic([38, 19], [38, 10], [33, 5],steps,height);
	BezConic([33, 5], [27, 0], [17, 0],steps,height);
	BezConic([17, 0], [12, 0], [7, 3],steps,height);
}
}

module ArchitectsDaughter_contour00x30(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x30_skeleton(height);
			ArchitectsDaughter_contour00x30_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x30_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x30_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[6, 11], [6, 3], [18, 3], 
		[27, 3], [31.0, 7.5], [35, 12], 
		[35, 20], [35, 20], [35, 21], 
		[35, 28], [31.5, 31.5], [28, 35], 
		[22, 35], [21, 35], [20.5, 35.0], 
		[20, 35], [20, 35], [17, 35], 
		[13, 31], [10, 27], [8, 20], 
		[6, 14], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[6, 11], [6, 3], [18, 3], 
		[27, 3], [31.0, 7.5], [35, 12], 
		[35, 20], [35, 20], [35, 21], 
		[35, 28], [31.5, 31.5], [28, 35], 
		[22, 35], [21, 35], [20.5, 35.0], 
		[20, 35], [20, 35], [17, 35], 
		[13, 31], [10, 27], [8, 20], 
		[6, 14], ]);
}}}

module ArchitectsDaughter_contour10x30_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6, 11], [6, 3], [18, 3],steps,height);
	BezConic([18, 3], [27, 3], [31.0, 7.5],steps,height);
	BezConic([31.0, 7.5], [35, 12], [35, 20],steps,height);
	BezConic([35, 20], [35, 20], [35, 21],steps,height);
	BezConic([35, 21], [35, 28], [31.5, 31.5],steps,height);
	BezConic([31.5, 31.5], [28, 35], [22, 35],steps,height);
	BezConic([22, 35], [21, 35], [20.5, 35.0],steps,height);
	BezConic([20.5, 35.0], [20, 35], [20, 35],steps,height);
	BezConic([20, 35], [17, 35], [13, 31],steps,height);
	BezConic([13, 31], [10, 27], [8, 20],steps,height);
	BezConic([8, 20], [6, 14], [6, 11],steps,height);
}
}

module ArchitectsDaughter_contour10x30_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x30(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x30_skeleton(height);
			ArchitectsDaughter_contour10x30_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x30_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x30(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x30(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x30(steps, height);
	}
}

ArchitectsDaughter_bbox0x30=[[2, 0], [38, 38]];

module ArchitectsDaughter_letter0x30(steps=2, height) {
	ArchitectsDaughter_chunk10x30(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x31_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 1], [2, 2], [2.0, 4.5], 
		[2, 7], [2.0, 10.5], [2, 14], 
		[2.0, 17.5], [2, 21], [2.5, 24.0], 
		[3, 27], [3.0, 29.5], [3, 32], 
		[3, 33], [3, 35], [3.5, 35.0], 
		[4, 35], [4.5, 35.0], [5, 35], 
		[6.0, 35.0], [7, 35], [7, 34], 
		[6.5, 18.0], [6, 2], [6, 1], 
		[4.5, 0.5],[3, 0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 1], [2, 2], [2.0, 4.5], 
		[2, 7], [2.0, 10.5], [2, 14], 
		[2.0, 17.5], [2, 21], [2.5, 24.0], 
		[3, 27], [3.0, 29.5], [3, 32], 
		[3, 33], [3, 35], [3.5, 35.0], 
		[4, 35], [4.5, 35.0], [5, 35], 
		[6.0, 35.0], [7, 35], [7, 34], 
		[6.5, 18.0], [6, 2], [6, 1], 
		[4.5, 0.5],[3, 0], ]);
}}}

module ArchitectsDaughter_contour00x31_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 1], [2, 2], [2.0, 4.5],steps,height);
	BezConic([2.0, 4.5], [2, 7], [2.0, 10.5],steps,height);
	BezConic([2.0, 10.5], [2, 14], [2.0, 17.5],steps,height);
	BezConic([2.5, 24.0], [3, 27], [3.0, 29.5],steps,height);
	BezConic([3.0, 29.5], [3, 32], [3, 33],steps,height);
	BezConic([3.5, 35.0], [4, 35], [4.5, 35.0],steps,height);
	BezConic([4.5, 35.0], [5, 35], [6.0, 35.0],steps,height);
}
}

module ArchitectsDaughter_contour00x31_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2.0, 17.5], [2, 21], [2.5, 24.0],steps,height);
	BezConic([3, 33], [3, 35], [3.5, 35.0],steps,height);
	BezConic([6.0, 35.0], [7, 35], [7, 34],steps,height);
	BezConic([6, 2], [6, 1], [4.5, 0.5],steps,height);
	BezConic([4.5, 0.5], [3, 0], [2, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x31(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x31_skeleton(height);
			ArchitectsDaughter_contour00x31_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x31_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x31(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x31(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x31=[[2, 0], [7, 35]];

module ArchitectsDaughter_letter0x31(steps=2, height) {
	ArchitectsDaughter_chunk10x31(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x32_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[34, 10], [36, 10], [36.0, 8.5], 
		[36, 7], [34.5, 6.5], [33, 6], 
		[31.5, 5.5], [30, 5], [28.5, 5.0], 
		[27, 5], [26.5, 5.0], [26, 5], 
		[24.5, 4.5], [23, 4], [21.0, 3.5], 
		[19, 3], [17, 3], [10, 1], 
		[6, 1], [3, 1], [2.5, 1.5], 
		[2, 2], [2, 3], [7, 7], 
		[12, 14], [20, 23], [20, 29], 
		[20, 30], [19, 31], [19, 33], 
		[16, 33], [13, 33], [11.5, 32.0], 
		[10, 31], [8.5, 29.5], [7, 28], 
		[5.0, 27.0], [3, 26], [1, 26], 
		[1, 28], [3, 30], [6, 34], 
		[12, 36], [14, 37], [15.5, 37.0], 
		[17, 37], [17, 37], [20, 36], 
		[21.5, 34.5], [23, 33], [23, 30], 
		[23, 21], [15, 11], [13, 8], 
		[11, 5], [11, 5], [12.5, 5.0], 
		[14, 5], [16.5, 6.0], [19, 7], 
		[22.0, 8.0], [25, 9], [28.0, 9.5], 
		[31, 10], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[34, 10], [36, 10], [36.0, 8.5], 
		[36, 7], [34.5, 6.5], [33, 6], 
		[31.5, 5.5], [30, 5], [28.5, 5.0], 
		[27, 5], [26.5, 5.0], [26, 5], 
		[24.5, 4.5], [23, 4], [21.0, 3.5], 
		[19, 3], [17, 3], [10, 1], 
		[6, 1], [3, 1], [2.5, 1.5], 
		[2, 2], [2, 3], [7, 7], 
		[12, 14], [20, 23], [20, 29], 
		[20, 30], [19, 31], [19, 33], 
		[16, 33], [13, 33], [11.5, 32.0], 
		[10, 31], [8.5, 29.5], [7, 28], 
		[5.0, 27.0], [3, 26], [1, 26], 
		[1, 28], [3, 30], [6, 34], 
		[12, 36], [14, 37], [15.5, 37.0], 
		[17, 37], [17, 37], [20, 36], 
		[21.5, 34.5], [23, 33], [23, 30], 
		[23, 21], [15, 11], [13, 8], 
		[11, 5], [11, 5], [12.5, 5.0], 
		[14, 5], [16.5, 6.0], [19, 7], 
		[22.0, 8.0], [25, 9], [28.0, 9.5], 
		[31, 10], ]);
}}}

module ArchitectsDaughter_contour00x32_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([34.5, 6.5], [33, 6], [31.5, 5.5],steps,height);
	BezConic([28.5, 5.0], [27, 5], [26.5, 5.0],steps,height);
	BezConic([26.5, 5.0], [26, 5], [24.5, 4.5],steps,height);
	BezConic([2, 3], [7, 7], [12, 14],steps,height);
	BezConic([12, 14], [20, 23], [20, 29],steps,height);
	BezConic([20, 29], [20, 30], [19, 31],steps,height);
	BezConic([19, 31], [19, 33], [16, 33],steps,height);
	BezConic([16, 33], [13, 33], [11.5, 32.0],steps,height);
	BezConic([11.5, 32.0], [10, 31], [8.5, 29.5],steps,height);
	BezConic([15.5, 37.0], [17, 37], [17, 37],steps,height);
	BezConic([11, 5], [11, 5], [12.5, 5.0],steps,height);
	BezConic([12.5, 5.0], [14, 5], [16.5, 6.0],steps,height);
}
}

module ArchitectsDaughter_contour00x32_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([34, 10], [36, 10], [36.0, 8.5],steps,height);
	BezConic([36.0, 8.5], [36, 7], [34.5, 6.5],steps,height);
	BezConic([31.5, 5.5], [30, 5], [28.5, 5.0],steps,height);
	BezConic([24.5, 4.5], [23, 4], [21.0, 3.5],steps,height);
	BezConic([21.0, 3.5], [19, 3], [17, 3],steps,height);
	BezConic([17, 3], [10, 1], [6, 1],steps,height);
	BezConic([6, 1], [3, 1], [2.5, 1.5],steps,height);
	BezConic([2.5, 1.5], [2, 2], [2, 3],steps,height);
	BezConic([8.5, 29.5], [7, 28], [5.0, 27.0],steps,height);
	BezConic([5.0, 27.0], [3, 26], [1, 26],steps,height);
	BezConic([1, 26], [1, 28], [3, 30],steps,height);
	BezConic([3, 30], [6, 34], [12, 36],steps,height);
	BezConic([12, 36], [14, 37], [15.5, 37.0],steps,height);
	BezConic([17, 37], [20, 36], [21.5, 34.5],steps,height);
	BezConic([21.5, 34.5], [23, 33], [23, 30],steps,height);
	BezConic([23, 30], [23, 21], [15, 11],steps,height);
	BezConic([15, 11], [13, 8], [11, 5],steps,height);
	BezConic([16.5, 6.0], [19, 7], [22.0, 8.0],steps,height);
	BezConic([22.0, 8.0], [25, 9], [28.0, 9.5],steps,height);
	BezConic([28.0, 9.5], [31, 10], [34, 10],steps,height);
}
}

module ArchitectsDaughter_contour00x32(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x32_skeleton(height);
			ArchitectsDaughter_contour00x32_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x32_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x32(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x32(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x32=[[1, 1], [36, 37]];

module ArchitectsDaughter_letter0x32(steps=2, height) {
	ArchitectsDaughter_chunk10x32(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x33_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[30, 32], [30, 28], [24, 23], 
		[23, 22], [22, 21], [29, 21], 
		[31, 17], [31, 16], [31.0, 15.5], 
		[31, 15], [30.5, 13.5], [30, 12], 
		[28.5, 10.0], [27, 8], [25, 6], 
		[21, 2], [16, 0], [14, 0], 
		[13.0, 0.0], [12, 0], [11.5, 0.0], 
		[11, 0], [10.0, 0.5], [9, 1], 
		[9, 2], [14, 3], [17.5, 5.0], 
		[21, 7], [23, 10], [26, 12], 
		[26.0, 14.0], [26, 16], [24.5, 17.0], 
		[23, 18], [21, 18], [17, 18], 
		[8, 14], [7.0, 15.5], [6, 17], 
		[25, 25], [25, 29], [25, 31], 
		[22, 31], [18, 31], [13.0, 30.0], 
		[8, 29], [5.5, 28.5], [3, 28], 
		[1, 28], [1, 31], [2, 31], 
		[5, 32], [8, 33], [17, 35], 
		[23.0, 35.0],[29, 35], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[30, 32], [30, 28], [24, 23], 
		[23, 22], [22, 21], [29, 21], 
		[31, 17], [31, 16], [31.0, 15.5], 
		[31, 15], [30.5, 13.5], [30, 12], 
		[28.5, 10.0], [27, 8], [25, 6], 
		[21, 2], [16, 0], [14, 0], 
		[13.0, 0.0], [12, 0], [11.5, 0.0], 
		[11, 0], [10.0, 0.5], [9, 1], 
		[9, 2], [14, 3], [17.5, 5.0], 
		[21, 7], [23, 10], [26, 12], 
		[26.0, 14.0], [26, 16], [24.5, 17.0], 
		[23, 18], [21, 18], [17, 18], 
		[8, 14], [7.0, 15.5], [6, 17], 
		[25, 25], [25, 29], [25, 31], 
		[22, 31], [18, 31], [13.0, 30.0], 
		[8, 29], [5.5, 28.5], [3, 28], 
		[1, 28], [1, 31], [2, 31], 
		[5, 32], [8, 33], [17, 35], 
		[23.0, 35.0],[29, 35], ]);
}}}

module ArchitectsDaughter_contour00x33_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([24, 23], [23, 22], [22, 21],steps,height);
	BezConic([31, 17], [31, 16], [31.0, 15.5],steps,height);
	BezConic([16, 0], [14, 0], [13.0, 0.0],steps,height);
	BezConic([13.0, 0.0], [12, 0], [11.5, 0.0],steps,height);
	BezConic([9, 2], [14, 3], [17.5, 5.0],steps,height);
	BezConic([17.5, 5.0], [21, 7], [23, 10],steps,height);
	BezConic([23, 10], [26, 12], [26.0, 14.0],steps,height);
	BezConic([26.0, 14.0], [26, 16], [24.5, 17.0],steps,height);
	BezConic([24.5, 17.0], [23, 18], [21, 18],steps,height);
	BezConic([21, 18], [17, 18], [8, 14],steps,height);
	BezConic([6, 17], [25, 25], [25, 29],steps,height);
	BezConic([25, 29], [25, 31], [22, 31],steps,height);
	BezConic([22, 31], [18, 31], [13.0, 30.0],steps,height);
	BezConic([13.0, 30.0], [8, 29], [5.5, 28.5],steps,height);
	BezConic([2, 31], [5, 32], [8, 33],steps,height);
}
}

module ArchitectsDaughter_contour00x33_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([30, 32], [30, 28], [24, 23],steps,height);
	BezConic([22, 21], [29, 21], [31, 17],steps,height);
	BezConic([31.0, 15.5], [31, 15], [30.5, 13.5],steps,height);
	BezConic([30.5, 13.5], [30, 12], [28.5, 10.0],steps,height);
	BezConic([28.5, 10.0], [27, 8], [25, 6],steps,height);
	BezConic([25, 6], [21, 2], [16, 0],steps,height);
	BezConic([11.5, 0.0], [11, 0], [10.0, 0.5],steps,height);
	BezConic([10.0, 0.5], [9, 1], [9, 2],steps,height);
	BezConic([5.5, 28.5], [3, 28], [1, 28],steps,height);
	BezConic([1, 28], [1, 31], [2, 31],steps,height);
	BezConic([8, 33], [17, 35], [23.0, 35.0],steps,height);
	BezConic([23.0, 35.0], [29, 35], [30, 32],steps,height);
}
}

module ArchitectsDaughter_contour00x33(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x33_skeleton(height);
			ArchitectsDaughter_contour00x33_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x33_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x33(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x33(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x33=[[1, 0], [31, 35]];

module ArchitectsDaughter_letter0x33(steps=2, height) {
	ArchitectsDaughter_chunk10x33(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x34_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[25, -1], [24, -1], [23, 0], 
		[23.5, 6.0], [24, 12], [21.5, 12.0], 
		[19, 12], [15.5, 12.0], [12, 12], 
		[9.5, 12.0], [7, 12], [6, 12], 
		[5.5, 12.5], [5, 13], [5, 14], 
		[8, 18], [11, 22], [21, 36], 
		[25, 36], [29, 36], [29, 21], 
		[29, 20], [29, 17], [36.0, 17.5], 
		[43, 18], [43, 16], [42.5, 15.5], 
		[42, 15], [41, 14], [35.5, 14.0], 
		[30, 14], [29, 11], [29, 8], 
		[28, 3], [28, 0], [26.5, -0.5], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[25, -1], [24, -1], [23, 0], 
		[23.5, 6.0], [24, 12], [21.5, 12.0], 
		[19, 12], [15.5, 12.0], [12, 12], 
		[9.5, 12.0], [7, 12], [6, 12], 
		[5.5, 12.5], [5, 13], [5, 14], 
		[8, 18], [11, 22], [21, 36], 
		[25, 36], [29, 36], [29, 21], 
		[29, 20], [29, 17], [36.0, 17.5], 
		[43, 18], [43, 16], [42.5, 15.5], 
		[42, 15], [41, 14], [35.5, 14.0], 
		[30, 14], [29, 11], [29, 8], 
		[28, 3], [28, 0], [26.5, -0.5], 
		 ]);
}}}

module ArchitectsDaughter_contour00x34_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 14], [8, 18], [11, 22],steps,height);
	BezConic([29, 21], [29, 20], [29, 17],steps,height);
	BezConic([42.5, 15.5], [42, 15], [41, 14],steps,height);
	BezConic([30, 14], [29, 11], [29, 8],steps,height);
	BezConic([29, 8], [28, 3], [28, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x34_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([25, -1], [24, -1], [23, 0],steps,height);
	BezConic([7, 12], [6, 12], [5.5, 12.5],steps,height);
	BezConic([5.5, 12.5], [5, 13], [5, 14],steps,height);
	BezConic([11, 22], [21, 36], [25, 36],steps,height);
	BezConic([25, 36], [29, 36], [29, 21],steps,height);
	BezConic([43, 18], [43, 16], [42.5, 15.5],steps,height);
}
}

module ArchitectsDaughter_contour00x34(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x34_skeleton(height);
			ArchitectsDaughter_contour00x34_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x34_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x34_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[24, 30], [22, 28], [20.0, 26.5], 
		[18, 25], [16.5, 23.0], [15, 21], 
		[13.5, 19.5], [12, 18], [11, 16], 
		[12, 16], [13.5, 16.0], [15, 16], 
		[17.5, 16.0], [20, 16], [24, 17], 
		[24.0, 23.5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[24, 30], [22, 28], [20.0, 26.5], 
		[18, 25], [16.5, 23.0], [15, 21], 
		[13.5, 19.5], [12, 18], [11, 16], 
		[12, 16], [13.5, 16.0], [15, 16], 
		[17.5, 16.0], [20, 16], [24, 17], 
		[24.0, 23.5], ]);
}}}

module ArchitectsDaughter_contour10x34_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([20.0, 26.5], [18, 25], [16.5, 23.0],steps,height);
	BezConic([13.5, 19.5], [12, 18], [11, 16],steps,height);
	BezConic([11, 16], [12, 16], [13.5, 16.0],steps,height);
	BezConic([13.5, 16.0], [15, 16], [17.5, 16.0],steps,height);
	BezConic([17.5, 16.0], [20, 16], [24, 17],steps,height);
}
}

module ArchitectsDaughter_contour10x34_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([24, 30], [22, 28], [20.0, 26.5],steps,height);
	BezConic([16.5, 23.0], [15, 21], [13.5, 19.5],steps,height);
}
}

module ArchitectsDaughter_contour10x34(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x34_skeleton(height);
			ArchitectsDaughter_contour10x34_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x34_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x34(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x34(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x34(steps, height);
	}
}

ArchitectsDaughter_bbox0x34=[[5, -1], [43, 36]];

module ArchitectsDaughter_letter0x34(steps=2, height) {
	ArchitectsDaughter_chunk10x34(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x35_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 18], [2.0, 20.0], [2, 22], 
		[3, 26], [3, 31], [3.5, 34.0], 
		[4, 37], [4, 38], [4.5, 38.0], 
		[5, 38], [6.0, 38.0], [7, 38], 
		[7.5, 38.0], [8, 38], [8.0, 37.0], 
		[8, 36], [8.0, 35.0], [8, 34], 
		[8, 34], [12, 34], [16.5, 34.5], 
		[21, 35], [25.0, 36.5], [29, 38], 
		[33.5, 39.0], [38, 40], [42, 40], 
		[43, 40], [43.5, 39.5], [44, 39], 
		[44, 38], [44, 38], [43.5, 37.5], 
		[43, 37], [41.5, 36.5], [40, 36], 
		[37.5, 35.5], [35, 35], [31.0, 34.0], 
		[27, 33], [21.5, 32.0], [16, 31], 
		[8, 29], [8.0, 25.0], [8, 21], 
		[10, 21], [13, 21], [17, 22], 
		[19.5, 22.0], [22, 22], [24.0, 22.0], 
		[26, 22], [28, 21], [32, 20], 
		[33, 14], [33, 10], [31.0, 7.5], 
		[29, 5], [25, 3], [19, 0], 
		[11, 0], [9, 0], [8.5, 0.5], 
		[8, 1], [8, 2], [8, 3], 
		[9.0, 4.5], [10, 6], [11, 6], 
		[11.0, 5.0], [11, 4], [18, 4], 
		[21.5, 5.0], [25, 6], [27.0, 8.0], 
		[29, 10], [29.0, 13.0], [29, 16], 
		[28.0, 17.0], [27, 18], [25, 19], 
		[22, 20], [19.0, 20.0], [16, 20], 
		[14.5, 19.5], [13, 19], [11, 18], 
		[7, 17], [5, 17], [4.5, 17.0], 
		[4, 17],[2, 17], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 18], [2.0, 20.0], [2, 22], 
		[3, 26], [3, 31], [3.5, 34.0], 
		[4, 37], [4, 38], [4.5, 38.0], 
		[5, 38], [6.0, 38.0], [7, 38], 
		[7.5, 38.0], [8, 38], [8.0, 37.0], 
		[8, 36], [8.0, 35.0], [8, 34], 
		[8, 34], [12, 34], [16.5, 34.5], 
		[21, 35], [25.0, 36.5], [29, 38], 
		[33.5, 39.0], [38, 40], [42, 40], 
		[43, 40], [43.5, 39.5], [44, 39], 
		[44, 38], [44, 38], [43.5, 37.5], 
		[43, 37], [41.5, 36.5], [40, 36], 
		[37.5, 35.5], [35, 35], [31.0, 34.0], 
		[27, 33], [21.5, 32.0], [16, 31], 
		[8, 29], [8.0, 25.0], [8, 21], 
		[10, 21], [13, 21], [17, 22], 
		[19.5, 22.0], [22, 22], [24.0, 22.0], 
		[26, 22], [28, 21], [32, 20], 
		[33, 14], [33, 10], [31.0, 7.5], 
		[29, 5], [25, 3], [19, 0], 
		[11, 0], [9, 0], [8.5, 0.5], 
		[8, 1], [8, 2], [8, 3], 
		[9.0, 4.5], [10, 6], [11, 6], 
		[11.0, 5.0], [11, 4], [18, 4], 
		[21.5, 5.0], [25, 6], [27.0, 8.0], 
		[29, 10], [29.0, 13.0], [29, 16], 
		[28.0, 17.0], [27, 18], [25, 19], 
		[22, 20], [19.0, 20.0], [16, 20], 
		[14.5, 19.5], [13, 19], [11, 18], 
		[7, 17], [5, 17], [4.5, 17.0], 
		[4, 17],[2, 17], ]);
}}}

module ArchitectsDaughter_contour00x35_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 22], [3, 26], [3, 31],steps,height);
	BezConic([4.5, 38.0], [5, 38], [6.0, 38.0],steps,height);
	BezConic([6.0, 38.0], [7, 38], [7.5, 38.0],steps,height);
	BezConic([8.0, 37.0], [8, 36], [8.0, 35.0],steps,height);
	BezConic([8.0, 35.0], [8, 34], [8, 34],steps,height);
	BezConic([8, 34], [12, 34], [16.5, 34.5],steps,height);
	BezConic([16.5, 34.5], [21, 35], [25.0, 36.5],steps,height);
	BezConic([37.5, 35.5], [35, 35], [31.0, 34.0],steps,height);
	BezConic([21.5, 32.0], [16, 31], [8, 29],steps,height);
	BezConic([8, 21], [10, 21], [13, 21],steps,height);
	BezConic([19.5, 22.0], [22, 22], [24.0, 22.0],steps,height);
	BezConic([11, 4], [18, 4], [21.5, 5.0],steps,height);
	BezConic([21.5, 5.0], [25, 6], [27.0, 8.0],steps,height);
	BezConic([27.0, 8.0], [29, 10], [29.0, 13.0],steps,height);
	BezConic([29.0, 13.0], [29, 16], [28.0, 17.0],steps,height);
	BezConic([28.0, 17.0], [27, 18], [25, 19],steps,height);
	BezConic([25, 19], [22, 20], [19.0, 20.0],steps,height);
	BezConic([19.0, 20.0], [16, 20], [14.5, 19.5],steps,height);
	BezConic([14.5, 19.5], [13, 19], [11, 18],steps,height);
}
}

module ArchitectsDaughter_contour00x35_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 37], [4, 38], [4.5, 38.0],steps,height);
	BezConic([7.5, 38.0], [8, 38], [8.0, 37.0],steps,height);
	BezConic([25.0, 36.5], [29, 38], [33.5, 39.0],steps,height);
	BezConic([33.5, 39.0], [38, 40], [42, 40],steps,height);
	BezConic([42, 40], [43, 40], [43.5, 39.5],steps,height);
	BezConic([43.5, 39.5], [44, 39], [44, 38],steps,height);
	BezConic([44, 38], [44, 38], [43.5, 37.5],steps,height);
	BezConic([43.5, 37.5], [43, 37], [41.5, 36.5],steps,height);
	BezConic([41.5, 36.5], [40, 36], [37.5, 35.5],steps,height);
	BezConic([31.0, 34.0], [27, 33], [21.5, 32.0],steps,height);
	BezConic([13, 21], [17, 22], [19.5, 22.0],steps,height);
	BezConic([24.0, 22.0], [26, 22], [28, 21],steps,height);
	BezConic([28, 21], [32, 20], [33, 14],steps,height);
	BezConic([33, 14], [33, 10], [31.0, 7.5],steps,height);
	BezConic([31.0, 7.5], [29, 5], [25, 3],steps,height);
	BezConic([25, 3], [19, 0], [11, 0],steps,height);
	BezConic([11, 0], [9, 0], [8.5, 0.5],steps,height);
	BezConic([8.5, 0.5], [8, 1], [8, 2],steps,height);
	BezConic([8, 2], [8, 3], [9.0, 4.5],steps,height);
	BezConic([9.0, 4.5], [10, 6], [11, 6],steps,height);
	BezConic([11, 18], [7, 17], [5, 17],steps,height);
	BezConic([4, 17], [2, 17], [2, 18],steps,height);
}
}

module ArchitectsDaughter_contour00x35(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x35_skeleton(height);
			ArchitectsDaughter_contour00x35_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x35_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x35(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x35(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x35=[[2, 0], [44, 40]];

module ArchitectsDaughter_letter0x35(steps=2, height) {
	ArchitectsDaughter_chunk10x35(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x36_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[1, 18], [1, 18], [1.0, 19.5], 
		[1, 21], [2.0, 23.5], [3, 26], 
		[4.5, 28.5], [6, 31], [8.0, 33.5], 
		[10, 36], [12, 38], [17, 42], 
		[22, 42], [23, 42], [23.5, 41.5], 
		[24, 41], [24.0, 40.5], [24, 40], 
		[24, 39], [17, 38], [12, 32], 
		[7, 25], [7, 18], [7, 15], 
		[8.0, 12.5], [9, 10], [10.0, 8.5], 
		[11, 7], [12, 7], [13, 8], 
		[14.5, 9.5], [16, 11], [17.5, 12.5], 
		[19, 14], [21.0, 15.5], [23, 17], 
		[25, 18], [30, 21], [34, 21], 
		[36, 21], [38, 19], [39, 17], 
		[39, 15], [38, 7], [32, 3], 
		[27, 0], [20, 0], [16, 0], 
		[13, 1], [6, 4], [3, 11], 
		[1, 14], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[1, 18], [1, 18], [1.0, 19.5], 
		[1, 21], [2.0, 23.5], [3, 26], 
		[4.5, 28.5], [6, 31], [8.0, 33.5], 
		[10, 36], [12, 38], [17, 42], 
		[22, 42], [23, 42], [23.5, 41.5], 
		[24, 41], [24.0, 40.5], [24, 40], 
		[24, 39], [17, 38], [12, 32], 
		[7, 25], [7, 18], [7, 15], 
		[8.0, 12.5], [9, 10], [10.0, 8.5], 
		[11, 7], [12, 7], [13, 8], 
		[14.5, 9.5], [16, 11], [17.5, 12.5], 
		[19, 14], [21.0, 15.5], [23, 17], 
		[25, 18], [30, 21], [34, 21], 
		[36, 21], [38, 19], [39, 17], 
		[39, 15], [38, 7], [32, 3], 
		[27, 0], [20, 0], [16, 0], 
		[13, 1], [6, 4], [3, 11], 
		[1, 14], ]);
}}}

module ArchitectsDaughter_contour00x36_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([1, 18], [1, 18], [1.0, 19.5],steps,height);
	BezConic([24.0, 40.5], [24, 40], [24, 39],steps,height);
	BezConic([24, 39], [17, 38], [12, 32],steps,height);
	BezConic([12, 32], [7, 25], [7, 18],steps,height);
	BezConic([7, 18], [7, 15], [8.0, 12.5],steps,height);
	BezConic([8.0, 12.5], [9, 10], [10.0, 8.5],steps,height);
	BezConic([10.0, 8.5], [11, 7], [12, 7],steps,height);
	BezConic([12, 7], [13, 8], [14.5, 9.5],steps,height);
	BezConic([14.5, 9.5], [16, 11], [17.5, 12.5],steps,height);
}
}

module ArchitectsDaughter_contour00x36_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([1.0, 19.5], [1, 21], [2.0, 23.5],steps,height);
	BezConic([2.0, 23.5], [3, 26], [4.5, 28.5],steps,height);
	BezConic([4.5, 28.5], [6, 31], [8.0, 33.5],steps,height);
	BezConic([8.0, 33.5], [10, 36], [12, 38],steps,height);
	BezConic([12, 38], [17, 42], [22, 42],steps,height);
	BezConic([22, 42], [23, 42], [23.5, 41.5],steps,height);
	BezConic([23.5, 41.5], [24, 41], [24.0, 40.5],steps,height);
	BezConic([17.5, 12.5], [19, 14], [21.0, 15.5],steps,height);
	BezConic([21.0, 15.5], [23, 17], [25, 18],steps,height);
	BezConic([25, 18], [30, 21], [34, 21],steps,height);
	BezConic([34, 21], [36, 21], [38, 19],steps,height);
	BezConic([38, 19], [39, 17], [39, 15],steps,height);
	BezConic([39, 15], [38, 7], [32, 3],steps,height);
	BezConic([32, 3], [27, 0], [20, 0],steps,height);
	BezConic([20, 0], [16, 0], [13, 1],steps,height);
	BezConic([13, 1], [6, 4], [3, 11],steps,height);
	BezConic([3, 11], [1, 14], [1, 18],steps,height);
}
}

module ArchitectsDaughter_contour00x36(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x36_skeleton(height);
			ArchitectsDaughter_contour00x36_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x36_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x36_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[35, 15], [35, 17], [33.0, 17.0], 
		[31, 17], [28.5, 15.5], [26, 14], 
		[24, 12], [21, 9], [16, 5], 
		[18, 5], [19.0, 5.0], [20, 5], 
		[22.5, 5.0], [25, 5], [27.5, 6.5], 
		[30, 8], [32.0, 10.0], [34, 12], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[35, 15], [35, 17], [33.0, 17.0], 
		[31, 17], [28.5, 15.5], [26, 14], 
		[24, 12], [21, 9], [16, 5], 
		[18, 5], [19.0, 5.0], [20, 5], 
		[22.5, 5.0], [25, 5], [27.5, 6.5], 
		[30, 8], [32.0, 10.0], [34, 12], 
		 ]);
}}}

module ArchitectsDaughter_contour10x36_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([35, 15], [35, 17], [33.0, 17.0],steps,height);
	BezConic([33.0, 17.0], [31, 17], [28.5, 15.5],steps,height);
	BezConic([28.5, 15.5], [26, 14], [24, 12],steps,height);
	BezConic([16, 5], [18, 5], [19.0, 5.0],steps,height);
	BezConic([19.0, 5.0], [20, 5], [22.5, 5.0],steps,height);
	BezConic([22.5, 5.0], [25, 5], [27.5, 6.5],steps,height);
	BezConic([27.5, 6.5], [30, 8], [32.0, 10.0],steps,height);
	BezConic([32.0, 10.0], [34, 12], [35, 15],steps,height);
}
}

module ArchitectsDaughter_contour10x36_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([24, 12], [21, 9], [16, 5],steps,height);
}
}

module ArchitectsDaughter_contour10x36(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x36_skeleton(height);
			ArchitectsDaughter_contour10x36_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x36_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x36(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x36(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x36(steps, height);
	}
}

ArchitectsDaughter_bbox0x36=[[1, 0], [39, 42]];

module ArchitectsDaughter_letter0x36(steps=2, height) {
	ArchitectsDaughter_chunk10x36(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x37_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[19, 0], [19.0, 2.0], [19, 4], 
		[19, 4], [19, 4], [19, 10], 
		[23, 18], [25, 21], [26.5, 24.0], 
		[28, 27], [29, 30], [25, 30], 
		[22, 30], [10, 29], [7.0, 29.0], 
		[4, 29], [2, 29], [1, 29], 
		[1.0, 29.5], [1, 30], [1, 31], 
		[1, 31], [1.0, 31.5], [1, 32], 
		[2, 32], [3, 32], [5.0, 32.0], 
		[7, 32], [11.0, 32.5], [15, 33], 
		[19.0, 33.5], [23, 34], [27.5, 34.5], 
		[32, 35], [36, 35], [37, 35], 
		[37.5, 34.5], [38, 34], [38.0, 33.5], 
		[38, 33], [38, 33], [27, 21], 
		[25, 10], [24, 7], [24.0, 5.0], 
		[24, 3], [25, 1], [22.0, 0.5], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[19, 0], [19.0, 2.0], [19, 4], 
		[19, 4], [19, 4], [19, 10], 
		[23, 18], [25, 21], [26.5, 24.0], 
		[28, 27], [29, 30], [25, 30], 
		[22, 30], [10, 29], [7.0, 29.0], 
		[4, 29], [2, 29], [1, 29], 
		[1.0, 29.5], [1, 30], [1, 31], 
		[1, 31], [1.0, 31.5], [1, 32], 
		[2, 32], [3, 32], [5.0, 32.0], 
		[7, 32], [11.0, 32.5], [15, 33], 
		[19.0, 33.5], [23, 34], [27.5, 34.5], 
		[32, 35], [36, 35], [37, 35], 
		[37.5, 34.5], [38, 34], [38.0, 33.5], 
		[38, 33], [38, 33], [27, 21], 
		[25, 10], [24, 7], [24.0, 5.0], 
		[24, 3], [25, 1], [22.0, 0.5], 
		 ]);
}}}

module ArchitectsDaughter_contour00x37_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([19, 4], [19, 4], [19, 4],steps,height);
	BezConic([23, 18], [25, 21], [26.5, 24.0],steps,height);
	BezConic([26.5, 24.0], [28, 27], [29, 30],steps,height);
	BezConic([29, 30], [25, 30], [22, 30],steps,height);
	BezConic([7.0, 29.0], [4, 29], [2, 29],steps,height);
	BezConic([1.0, 29.5], [1, 30], [1, 31],steps,height);
	BezConic([1, 31], [1, 31], [1.0, 31.5],steps,height);
	BezConic([2, 32], [3, 32], [5.0, 32.0],steps,height);
	BezConic([5.0, 32.0], [7, 32], [11.0, 32.5],steps,height);
	BezConic([11.0, 32.5], [15, 33], [19.0, 33.5],steps,height);
	BezConic([38.0, 33.5], [38, 33], [38, 33],steps,height);
	BezConic([38, 33], [27, 21], [25, 10],steps,height);
	BezConic([25, 10], [24, 7], [24.0, 5.0],steps,height);
	BezConic([24.0, 5.0], [24, 3], [25, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x37_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([19, 4], [19, 10], [23, 18],steps,height);
	BezConic([22, 30], [10, 29], [7.0, 29.0],steps,height);
	BezConic([2, 29], [1, 29], [1.0, 29.5],steps,height);
	BezConic([1.0, 31.5], [1, 32], [2, 32],steps,height);
	BezConic([19.0, 33.5], [23, 34], [27.5, 34.5],steps,height);
	BezConic([27.5, 34.5], [32, 35], [36, 35],steps,height);
	BezConic([36, 35], [37, 35], [37.5, 34.5],steps,height);
	BezConic([37.5, 34.5], [38, 34], [38.0, 33.5],steps,height);
}
}

module ArchitectsDaughter_contour00x37(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x37_skeleton(height);
			ArchitectsDaughter_contour00x37_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x37_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x37(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x37(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x37=[[1, 0], [38, 35]];

module ArchitectsDaughter_letter0x37(steps=2, height) {
	ArchitectsDaughter_chunk10x37(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x38_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[32.5, 37.0], [34, 36], [35.5, 35.0], 
		[37, 34], [37.0, 31.0], [37, 28], 
		[34, 25], [37, 23], [38.0, 22.0], 
		[39, 21], [39.5, 20.0], [40, 19], 
		[40, 17], [40, 12], [37.5, 9.0], 
		[35, 6], [32.0, 4.0], [29, 2], 
		[25.0, 1.0], [21, 0], [18.0, 0.0], 
		[15, 0], [12.0, 0.5], [9, 1], 
		[7, 2], [1, 4], [1, 9], 
		[1, 11], [2.0, 12.5], [3, 14], 
		[4.5, 15.5], [6, 17], [7.0, 18.0], 
		[8, 19], [8.0, 20.0], [8, 21], 
		[7.5, 21.5], [7, 22], [7, 23], 
		[5, 24], [5.0, 26.0], [5, 28], 
		[6.0, 29.5], [7, 31], [9.0, 32.5], 
		[11, 34], [13.0, 35.0], [15, 36], 
		[17, 36], [21, 38], [25, 38], 
		[31, 38], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[32.5, 37.0], [34, 36], [35.5, 35.0], 
		[37, 34], [37.0, 31.0], [37, 28], 
		[34, 25], [37, 23], [38.0, 22.0], 
		[39, 21], [39.5, 20.0], [40, 19], 
		[40, 17], [40, 12], [37.5, 9.0], 
		[35, 6], [32.0, 4.0], [29, 2], 
		[25.0, 1.0], [21, 0], [18.0, 0.0], 
		[15, 0], [12.0, 0.5], [9, 1], 
		[7, 2], [1, 4], [1, 9], 
		[1, 11], [2.0, 12.5], [3, 14], 
		[4.5, 15.5], [6, 17], [7.0, 18.0], 
		[8, 19], [8.0, 20.0], [8, 21], 
		[7.5, 21.5], [7, 22], [7, 23], 
		[5, 24], [5.0, 26.0], [5, 28], 
		[6.0, 29.5], [7, 31], [9.0, 32.5], 
		[11, 34], [13.0, 35.0], [15, 36], 
		[17, 36], [21, 38], [25, 38], 
		[31, 38], ]);
}}}

module ArchitectsDaughter_contour00x38_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([32.5, 37.0], [34, 36], [35.5, 35.0],steps,height);
	BezConic([4.5, 15.5], [6, 17], [7.0, 18.0],steps,height);
	BezConic([7.0, 18.0], [8, 19], [8.0, 20.0],steps,height);
	BezConic([8.0, 20.0], [8, 21], [7.5, 21.5],steps,height);
}
}

module ArchitectsDaughter_contour00x38_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([35.5, 35.0], [37, 34], [37.0, 31.0],steps,height);
	BezConic([37.0, 31.0], [37, 28], [34, 25],steps,height);
	BezConic([34, 25], [37, 23], [38.0, 22.0],steps,height);
	BezConic([38.0, 22.0], [39, 21], [39.5, 20.0],steps,height);
	BezConic([39.5, 20.0], [40, 19], [40, 17],steps,height);
	BezConic([40, 17], [40, 12], [37.5, 9.0],steps,height);
	BezConic([37.5, 9.0], [35, 6], [32.0, 4.0],steps,height);
	BezConic([32.0, 4.0], [29, 2], [25.0, 1.0],steps,height);
	BezConic([25.0, 1.0], [21, 0], [18.0, 0.0],steps,height);
	BezConic([18.0, 0.0], [15, 0], [12.0, 0.5],steps,height);
	BezConic([12.0, 0.5], [9, 1], [7, 2],steps,height);
	BezConic([7, 2], [1, 4], [1, 9],steps,height);
	BezConic([1, 9], [1, 11], [2.0, 12.5],steps,height);
	BezConic([2.0, 12.5], [3, 14], [4.5, 15.5],steps,height);
	BezConic([7.5, 21.5], [7, 22], [7, 23],steps,height);
	BezConic([7, 23], [5, 24], [5.0, 26.0],steps,height);
	BezConic([5.0, 26.0], [5, 28], [6.0, 29.5],steps,height);
	BezConic([6.0, 29.5], [7, 31], [9.0, 32.5],steps,height);
	BezConic([9.0, 32.5], [11, 34], [13.0, 35.0],steps,height);
	BezConic([13.0, 35.0], [15, 36], [17, 36],steps,height);
	BezConic([17, 36], [21, 38], [25, 38],steps,height);
	BezConic([25, 38], [31, 38], [32.5, 37.0],steps,height);
}
}

module ArchitectsDaughter_contour00x38(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x38_skeleton(height);
			ArchitectsDaughter_contour00x38_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x38_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x38_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[6, 10], [6, 6], [11, 4], 
		[14, 3], [18.0, 3.0], [22, 3], 
		[25.0, 4.0], [28, 5], [31, 7], 
		[36, 10], [36, 17], [34, 22], 
		[26, 22], [21, 22], [15, 19], 
		[10, 17], [8, 14], [7, 12], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[6, 10], [6, 6], [11, 4], 
		[14, 3], [18.0, 3.0], [22, 3], 
		[25.0, 4.0], [28, 5], [31, 7], 
		[36, 10], [36, 17], [34, 22], 
		[26, 22], [21, 22], [15, 19], 
		[10, 17], [8, 14], [7, 12], 
		 ]);
}}}

module ArchitectsDaughter_contour10x38_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6, 10], [6, 6], [11, 4],steps,height);
	BezConic([11, 4], [14, 3], [18.0, 3.0],steps,height);
	BezConic([18.0, 3.0], [22, 3], [25.0, 4.0],steps,height);
	BezConic([25.0, 4.0], [28, 5], [31, 7],steps,height);
	BezConic([31, 7], [36, 10], [36, 17],steps,height);
	BezConic([36, 17], [34, 22], [26, 22],steps,height);
	BezConic([26, 22], [21, 22], [15, 19],steps,height);
	BezConic([15, 19], [10, 17], [8, 14],steps,height);
	BezConic([8, 14], [7, 12], [6, 10],steps,height);
}
}

module ArchitectsDaughter_contour10x38_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x38(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x38_skeleton(height);
			ArchitectsDaughter_contour10x38_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x38_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour20x38_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[32, 33], [29, 35], [25, 35], 
		[16, 35], [12, 30], [11, 29], 
		[11, 27], [11, 25], [12.0, 24.0], 
		[13, 23], [15, 23], [15, 23], 
		[16.0, 23.0], [17, 23], [18.5, 23.0], 
		[20, 23], [22.0, 23.5], [24, 24], 
		[26.0, 25.0], [28, 26], [29, 27], 
		[33, 29], [34, 31], [34, 32], 
		[33.5, 32.5],[33, 33], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[32, 33], [29, 35], [25, 35], 
		[16, 35], [12, 30], [11, 29], 
		[11, 27], [11, 25], [12.0, 24.0], 
		[13, 23], [15, 23], [15, 23], 
		[16.0, 23.0], [17, 23], [18.5, 23.0], 
		[20, 23], [22.0, 23.5], [24, 24], 
		[26.0, 25.0], [28, 26], [29, 27], 
		[33, 29], [34, 31], [34, 32], 
		[33.5, 32.5],[33, 33], ]);
}}}

module ArchitectsDaughter_contour20x38_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([32, 33], [29, 35], [25, 35],steps,height);
	BezConic([25, 35], [16, 35], [12, 30],steps,height);
	BezConic([12, 30], [11, 29], [11, 27],steps,height);
	BezConic([11, 27], [11, 25], [12.0, 24.0],steps,height);
	BezConic([12.0, 24.0], [13, 23], [15, 23],steps,height);
	BezConic([15, 23], [15, 23], [16.0, 23.0],steps,height);
	BezConic([16.0, 23.0], [17, 23], [18.5, 23.0],steps,height);
	BezConic([18.5, 23.0], [20, 23], [22.0, 23.5],steps,height);
	BezConic([22.0, 23.5], [24, 24], [26.0, 25.0],steps,height);
	BezConic([26.0, 25.0], [28, 26], [29, 27],steps,height);
	BezConic([29, 27], [33, 29], [34, 31],steps,height);
	BezConic([34, 31], [34, 32], [33.5, 32.5],steps,height);
	BezConic([33.5, 32.5], [33, 33], [32, 33],steps,height);
}
}

module ArchitectsDaughter_contour20x38_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour20x38(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour20x38_skeleton(height);
			ArchitectsDaughter_contour20x38_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x38_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x38(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x38(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x38(steps, height);
	translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x38(steps, height);
	}
}

ArchitectsDaughter_bbox0x38=[[1, 0], [40, 38]];

module ArchitectsDaughter_letter0x38(steps=2, height) {
	ArchitectsDaughter_chunk10x38(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x39_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[15, 0], [15, 0], [14.0, 1.0], 
		[13, 2], [13, 3], [19, 6], 
		[22.0, 9.0], [25, 12], [26.0, 14.5], 
		[27, 17], [28, 21], [27, 21], 
		[26.0, 21.0], [25, 21], [23.0, 20.5], 
		[21, 20], [19, 20], [14, 19], 
		[12.5, 19.0], [11, 19], [9.5, 19.0], 
		[8, 19], [6.0, 20.0], [4, 21], 
		[3, 22], [2, 24], [2, 25], 
		[2, 29], [8, 34], [13, 37], 
		[18, 38], [20, 39], [21.0, 39.0], 
		[22, 39], [23, 38], [30, 36], 
		[32, 30], [33, 27], [33.0, 25.5], 
		[33, 24], [33.0, 22.0], [33, 20], 
		[32.0, 17.0], [31, 14], [29.0, 11.0], 
		[27, 8], [25, 5], [20, 0], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[15, 0], [15, 0], [14.0, 1.0], 
		[13, 2], [13, 3], [19, 6], 
		[22.0, 9.0], [25, 12], [26.0, 14.5], 
		[27, 17], [28, 21], [27, 21], 
		[26.0, 21.0], [25, 21], [23.0, 20.5], 
		[21, 20], [19, 20], [14, 19], 
		[12.5, 19.0], [11, 19], [9.5, 19.0], 
		[8, 19], [6.0, 20.0], [4, 21], 
		[3, 22], [2, 24], [2, 25], 
		[2, 29], [8, 34], [13, 37], 
		[18, 38], [20, 39], [21.0, 39.0], 
		[22, 39], [23, 38], [30, 36], 
		[32, 30], [33, 27], [33.0, 25.5], 
		[33, 24], [33.0, 22.0], [33, 20], 
		[32.0, 17.0], [31, 14], [29.0, 11.0], 
		[27, 8], [25, 5], [20, 0], 
		 ]);
}}}

module ArchitectsDaughter_contour00x39_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([15, 0], [15, 0], [14.0, 1.0],steps,height);
	BezConic([13, 3], [19, 6], [22.0, 9.0],steps,height);
	BezConic([22.0, 9.0], [25, 12], [26.0, 14.5],steps,height);
	BezConic([26.0, 14.5], [27, 17], [28, 21],steps,height);
	BezConic([28, 21], [27, 21], [26.0, 21.0],steps,height);
	BezConic([26.0, 21.0], [25, 21], [23.0, 20.5],steps,height);
	BezConic([12.5, 19.0], [11, 19], [9.5, 19.0],steps,height);
	BezConic([33.0, 25.5], [33, 24], [33.0, 22.0],steps,height);
	BezConic([29.0, 11.0], [27, 8], [25, 5],steps,height);
}
}

module ArchitectsDaughter_contour00x39_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([14.0, 1.0], [13, 2], [13, 3],steps,height);
	BezConic([23.0, 20.5], [21, 20], [19, 20],steps,height);
	BezConic([19, 20], [14, 19], [12.5, 19.0],steps,height);
	BezConic([9.5, 19.0], [8, 19], [6.0, 20.0],steps,height);
	BezConic([6.0, 20.0], [4, 21], [3, 22],steps,height);
	BezConic([3, 22], [2, 24], [2, 25],steps,height);
	BezConic([2, 25], [2, 29], [8, 34],steps,height);
	BezConic([8, 34], [13, 37], [18, 38],steps,height);
	BezConic([18, 38], [20, 39], [21.0, 39.0],steps,height);
	BezConic([21.0, 39.0], [22, 39], [23, 38],steps,height);
	BezConic([23, 38], [30, 36], [32, 30],steps,height);
	BezConic([32, 30], [33, 27], [33.0, 25.5],steps,height);
	BezConic([33.0, 22.0], [33, 20], [32.0, 17.0],steps,height);
	BezConic([32.0, 17.0], [31, 14], [29.0, 11.0],steps,height);
	BezConic([25, 5], [20, 0], [15, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x39(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x39_skeleton(height);
			ArchitectsDaughter_contour00x39_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x39_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x39_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[8, 24], [11, 23], [15, 23], 
		[21, 23], [27, 25], [28, 27], 
		[28.0, 27.5], [28, 28], [27.5, 29.0], 
		[27, 30], [27, 31], [25, 34], 
		[21, 34], [12, 34], [9, 29], 
		[8, 27], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[8, 24], [11, 23], [15, 23], 
		[21, 23], [27, 25], [28, 27], 
		[28.0, 27.5], [28, 28], [27.5, 29.0], 
		[27, 30], [27, 31], [25, 34], 
		[21, 34], [12, 34], [9, 29], 
		[8, 27], ]);
}}}

module ArchitectsDaughter_contour10x39_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8, 24], [11, 23], [15, 23],steps,height);
	BezConic([15, 23], [21, 23], [27, 25],steps,height);
	BezConic([27, 25], [28, 27], [28.0, 27.5],steps,height);
	BezConic([28.0, 27.5], [28, 28], [27.5, 29.0],steps,height);
	BezConic([27, 31], [25, 34], [21, 34],steps,height);
	BezConic([21, 34], [12, 34], [9, 29],steps,height);
	BezConic([9, 29], [8, 27], [8, 24],steps,height);
}
}

module ArchitectsDaughter_contour10x39_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([27.5, 29.0], [27, 30], [27, 31],steps,height);
}
}

module ArchitectsDaughter_contour10x39(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x39_skeleton(height);
			ArchitectsDaughter_contour10x39_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x39_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x39(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x39(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x39(steps, height);
	}
}

ArchitectsDaughter_bbox0x39=[[2, 0], [33, 39]];

module ArchitectsDaughter_letter0x39(steps=2, height) {
	ArchitectsDaughter_chunk10x39(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x3a_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 8], [5, 9], [6.0, 10.0], 
		[7, 11], [8.0, 11.0], [9, 11], 
		[9.5, 10.0], [10, 9], [10.0, 8.5], 
		[10, 8], [9.5, 7.0], [9, 6], 
		[8.5, 6.0], [8, 6], [7.5, 6.0], 
		[7, 6], [6.0, 6.5], [5, 7], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 8], [5, 9], [6.0, 10.0], 
		[7, 11], [8.0, 11.0], [9, 11], 
		[9.5, 10.0], [10, 9], [10.0, 8.5], 
		[10, 8], [9.5, 7.0], [9, 6], 
		[8.5, 6.0], [8, 6], [7.5, 6.0], 
		[7, 6], [6.0, 6.5], [5, 7], 
		 ]);
}}}

module ArchitectsDaughter_contour00x3a_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8.5, 6.0], [8, 6], [7.5, 6.0],steps,height);
}
}

module ArchitectsDaughter_contour00x3a_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 8], [5, 9], [6.0, 10.0],steps,height);
	BezConic([6.0, 10.0], [7, 11], [8.0, 11.0],steps,height);
	BezConic([8.0, 11.0], [9, 11], [9.5, 10.0],steps,height);
	BezConic([9.5, 10.0], [10, 9], [10.0, 8.5],steps,height);
	BezConic([10.0, 8.5], [10, 8], [9.5, 7.0],steps,height);
	BezConic([9.5, 7.0], [9, 6], [8.5, 6.0],steps,height);
	BezConic([7.5, 6.0], [7, 6], [6.0, 6.5],steps,height);
	BezConic([6.0, 6.5], [5, 7], [5, 8],steps,height);
}
}

module ArchitectsDaughter_contour00x3a(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x3a_skeleton(height);
			ArchitectsDaughter_contour00x3a_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x3a_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x3a_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3, 20], [2, 20], [2, 21], 
		[2, 22], [3.0, 22.5], [4, 23], 
		[4, 23], [6, 23], [6.5, 22.0], 
		[7, 21], [7, 21], [7, 20], 
		[6, 19], [6, 19], [5.0, 19.0], 
		[4, 19], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3, 20], [2, 20], [2, 21], 
		[2, 22], [3.0, 22.5], [4, 23], 
		[4, 23], [6, 23], [6.5, 22.0], 
		[7, 21], [7, 21], [7, 20], 
		[6, 19], [6, 19], [5.0, 19.0], 
		[4, 19], ]);
}}}

module ArchitectsDaughter_contour10x3a_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.0, 22.5], [4, 23], [4, 23],steps,height);
	BezConic([6.5, 22.0], [7, 21], [7, 21],steps,height);
	BezConic([6, 19], [6, 19], [5.0, 19.0],steps,height);
}
}

module ArchitectsDaughter_contour10x3a_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 20], [2, 20], [2, 21],steps,height);
	BezConic([2, 21], [2, 22], [3.0, 22.5],steps,height);
	BezConic([4, 23], [6, 23], [6.5, 22.0],steps,height);
	BezConic([7, 21], [7, 20], [6, 19],steps,height);
	BezConic([5.0, 19.0], [4, 19], [3, 20],steps,height);
}
}

module ArchitectsDaughter_contour10x3a(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x3a_skeleton(height);
			ArchitectsDaughter_contour10x3a_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x3a_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x3a(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x3a(steps, height);
		
	}
}

module ArchitectsDaughter_chunk20x3a(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour10x3a(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x3a=[[2, 6], [10, 23]];

module ArchitectsDaughter_letter0x3a(steps=2, height) {
	ArchitectsDaughter_chunk10x3a(steps, height);
	ArchitectsDaughter_chunk20x3a(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x3b_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[4, 7], [6, 7], [6.0, 5.0], 
		[6, 3], [6.0, 1.0], [6, -1], 
		[5, -4], [3, -9], [-1, -10], 
		[4, 7], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[4, 7], [6, 7], [6.0, 5.0], 
		[6, 3], [6.0, 1.0], [6, -1], 
		[5, -4], [3, -9], [-1, -10], 
		[4, 7], ]);
}}}

module ArchitectsDaughter_contour00x3b_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6.0, 5.0], [6, 3], [6.0, 1.0],steps,height);
	BezConic([-1, -10], [4, 7], [4, 7],steps,height);
}
}

module ArchitectsDaughter_contour00x3b_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 7], [6, 7], [6.0, 5.0],steps,height);
	BezConic([6.0, 1.0], [6, -1], [5, -4],steps,height);
	BezConic([5, -4], [3, -9], [-1, -10],steps,height);
}
}

module ArchitectsDaughter_contour00x3b(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x3b_skeleton(height);
			ArchitectsDaughter_contour00x3b_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x3b_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x3b_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 19], [2, 20], [2.0, 20.5], 
		[2, 21], [2.5, 21.5], [3, 22], 
		[4.0, 22.0], [5, 22], [5.5, 21.5], 
		[6, 21], [6, 21], [6, 19], 
		[5, 19],[3, 19], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 19], [2, 20], [2.0, 20.5], 
		[2, 21], [2.5, 21.5], [3, 22], 
		[4.0, 22.0], [5, 22], [5.5, 21.5], 
		[6, 21], [6, 21], [6, 19], 
		[5, 19],[3, 19], ]);
}}}

module ArchitectsDaughter_contour10x3b_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 19], [2, 20], [2.0, 20.5],steps,height);
	BezConic([5.5, 21.5], [6, 21], [6, 21],steps,height);
	BezConic([5, 19], [3, 19], [2, 19],steps,height);
}
}

module ArchitectsDaughter_contour10x3b_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2.0, 20.5], [2, 21], [2.5, 21.5],steps,height);
	BezConic([2.5, 21.5], [3, 22], [4.0, 22.0],steps,height);
	BezConic([4.0, 22.0], [5, 22], [5.5, 21.5],steps,height);
	BezConic([6, 21], [6, 19], [5, 19],steps,height);
}
}

module ArchitectsDaughter_contour10x3b(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x3b_skeleton(height);
			ArchitectsDaughter_contour10x3b_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x3b_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x3b(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x3b(steps, height);
		
	}
}

module ArchitectsDaughter_chunk20x3b(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour10x3b(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x3b=[[-1, -10], [6, 22]];

module ArchitectsDaughter_letter0x3b(steps=2, height) {
	ArchitectsDaughter_chunk10x3b(steps, height);
	ArchitectsDaughter_chunk20x3b(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x3c_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 14], [7, 16], [10.0, 18.0], 
		[13, 20], [15, 22], [22, 28], 
		[25, 29], [26, 29], [26, 28], 
		[26, 27], [26.0, 26.5], [26, 26], 
		[26, 26], [19.0, 20.5], [12, 15], 
		[12, 14], [14.0, 13.5], [16, 13], 
		[18, 11], [23, 9], [27, 6], 
		[27, 6], [27.0, 6.0], [27, 6], 
		[26, 5], [26, 4], [26, 4], 
		[24, 5], [20.5, 6.0], [17, 7], 
		[14.5, 8.0], [12, 9], [11, 10], 
		[6, 12], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 14], [7, 16], [10.0, 18.0], 
		[13, 20], [15, 22], [22, 28], 
		[25, 29], [26, 29], [26, 28], 
		[26, 27], [26.0, 26.5], [26, 26], 
		[26, 26], [19.0, 20.5], [12, 15], 
		[12, 14], [14.0, 13.5], [16, 13], 
		[18, 11], [23, 9], [27, 6], 
		[27, 6], [27.0, 6.0], [27, 6], 
		[26, 5], [26, 4], [26, 4], 
		[24, 5], [20.5, 6.0], [17, 7], 
		[14.5, 8.0], [12, 9], [11, 10], 
		[6, 12], ]);
}}}

module ArchitectsDaughter_contour00x3c_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([10.0, 18.0], [13, 20], [15, 22],steps,height);
	BezConic([26, 28], [26, 27], [26.0, 26.5],steps,height);
	BezConic([26.0, 26.5], [26, 26], [26, 26],steps,height);
	BezConic([12, 15], [12, 14], [14.0, 13.5],steps,height);
	BezConic([27, 6], [27, 6], [27.0, 6.0],steps,height);
	BezConic([26, 5], [26, 4], [26, 4],steps,height);
	BezConic([26, 4], [24, 5], [20.5, 6.0],steps,height);
}
}

module ArchitectsDaughter_contour00x3c_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 14], [7, 16], [10.0, 18.0],steps,height);
	BezConic([15, 22], [22, 28], [25, 29],steps,height);
	BezConic([25, 29], [26, 29], [26, 28],steps,height);
	BezConic([14.0, 13.5], [16, 13], [18, 11],steps,height);
	BezConic([18, 11], [23, 9], [27, 6],steps,height);
	BezConic([27.0, 6.0], [27, 6], [26, 5],steps,height);
	BezConic([20.5, 6.0], [17, 7], [14.5, 8.0],steps,height);
	BezConic([14.5, 8.0], [12, 9], [11, 10],steps,height);
	BezConic([11, 10], [6, 12], [5, 14],steps,height);
}
}

module ArchitectsDaughter_contour00x3c(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x3c_skeleton(height);
			ArchitectsDaughter_contour00x3c_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x3c_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x3c(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x3c(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x3c=[[5, 4], [27, 29]];

module ArchitectsDaughter_letter0x3c(steps=2, height) {
	ArchitectsDaughter_chunk10x3c(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x3d_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[6, 9], [4, 9], [4, 11], 
		[4, 11], [4.5, 11.5], [5, 12], 
		[5, 12], [10, 13], [14, 13], 
		[22, 14], [27, 15], [29, 15], 
		[29, 13], [29, 12], [29, 12], 
		[25, 12], [22.5, 11.5], [20, 11], 
		[17, 10],[11, 9], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[6, 9], [4, 9], [4, 11], 
		[4, 11], [4.5, 11.5], [5, 12], 
		[5, 12], [10, 13], [14, 13], 
		[22, 14], [27, 15], [29, 15], 
		[29, 13], [29, 12], [29, 12], 
		[25, 12], [22.5, 11.5], [20, 11], 
		[17, 10],[11, 9], ]);
}}}

module ArchitectsDaughter_contour00x3d_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 11], [4, 11], [4.5, 11.5],steps,height);
	BezConic([4.5, 11.5], [5, 12], [5, 12],steps,height);
	BezConic([14, 13], [22, 14], [27, 15],steps,height);
	BezConic([29, 13], [29, 12], [29, 12],steps,height);
	BezConic([29, 12], [25, 12], [22.5, 11.5],steps,height);
	BezConic([22.5, 11.5], [20, 11], [17, 10],steps,height);
}
}

module ArchitectsDaughter_contour00x3d_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6, 9], [4, 9], [4, 11],steps,height);
	BezConic([5, 12], [10, 13], [14, 13],steps,height);
	BezConic([27, 15], [29, 15], [29, 13],steps,height);
	BezConic([17, 10], [11, 9], [6, 9],steps,height);
}
}

module ArchitectsDaughter_contour00x3d(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x3d_skeleton(height);
			ArchitectsDaughter_contour00x3d_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x3d_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x3d_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 17], [6.5, 17.0], [6, 17], 
		[4, 17], [4, 18], [4.5, 19.0], 
		[5, 20], [5, 20], [10, 21], 
		[21, 22], [23.0, 22.5], [25, 23], 
		[25.0, 23.0], [25, 23], [25.5, 22.5], 
		[26, 22], [26, 22], [26, 20], 
		[25, 19],[16.0, 18.0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 17], [6.5, 17.0], [6, 17], 
		[4, 17], [4, 18], [4.5, 19.0], 
		[5, 20], [5, 20], [10, 21], 
		[21, 22], [23.0, 22.5], [25, 23], 
		[25.0, 23.0], [25, 23], [25.5, 22.5], 
		[26, 22], [26, 22], [26, 20], 
		[25, 19],[16.0, 18.0], ]);
}}}

module ArchitectsDaughter_contour10x3d_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 20], [5, 20], [10, 21],steps,height);
	BezConic([10, 21], [21, 22], [23.0, 22.5],steps,height);
	BezConic([23.0, 22.5], [25, 23], [25.0, 23.0],steps,height);
	BezConic([25.5, 22.5], [26, 22], [26, 22],steps,height);
}
}

module ArchitectsDaughter_contour10x3d_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6, 17], [4, 17], [4, 18],steps,height);
	BezConic([25.0, 23.0], [25, 23], [25.5, 22.5],steps,height);
	BezConic([26, 22], [26, 20], [25, 19],steps,height);
}
}

module ArchitectsDaughter_contour10x3d(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x3d_skeleton(height);
			ArchitectsDaughter_contour10x3d_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x3d_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk00x3d(steps=2, height) {
	difference() {
		
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x3d(steps, height);
	}
}

module ArchitectsDaughter_chunk10x3d(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour10x3d(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x3d=[[4, 9], [29, 23]];

module ArchitectsDaughter_letter0x3d(steps=2, height) {
	ArchitectsDaughter_chunk00x3d(steps, height);
	ArchitectsDaughter_chunk10x3d(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x3e_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 3], [5, 4], [4, 5], 
		[4, 6], [4, 6], [4, 8], 
		[9, 10], [15, 14], [17.0, 15.5], 
		[19, 17], [20, 19], [11.5, 22.0], 
		[3, 25], [4.5, 26.5], [6, 28], 
		[9, 26], [12.0, 25.0], [15, 24], 
		[17.0, 23.5], [19, 23], [21.5, 22.0], 
		[24, 21], [27, 19], [25, 18], 
		[22.5, 16.0], [20, 14], [17.5, 11.5], 
		[15, 9], [12.0, 7.0], [9, 5], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 3], [5, 4], [4, 5], 
		[4, 6], [4, 6], [4, 8], 
		[9, 10], [15, 14], [17.0, 15.5], 
		[19, 17], [20, 19], [11.5, 22.0], 
		[3, 25], [4.5, 26.5], [6, 28], 
		[9, 26], [12.0, 25.0], [15, 24], 
		[17.0, 23.5], [19, 23], [21.5, 22.0], 
		[24, 21], [27, 19], [25, 18], 
		[22.5, 16.0], [20, 14], [17.5, 11.5], 
		[15, 9], [12.0, 7.0], [9, 5], 
		 ]);
}}}

module ArchitectsDaughter_contour00x3e_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 5], [4, 6], [4, 6],steps,height);
	BezConic([9, 10], [15, 14], [17.0, 15.5],steps,height);
	BezConic([17.0, 15.5], [19, 17], [20, 19],steps,height);
	BezConic([6, 28], [9, 26], [12.0, 25.0],steps,height);
	BezConic([12.0, 25.0], [15, 24], [17.0, 23.5],steps,height);
	BezConic([27, 19], [25, 18], [22.5, 16.0],steps,height);
	BezConic([22.5, 16.0], [20, 14], [17.5, 11.5],steps,height);
	BezConic([12.0, 7.0], [9, 5], [7, 3],steps,height);
}
}

module ArchitectsDaughter_contour00x3e_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 3], [5, 4], [4, 5],steps,height);
	BezConic([4, 6], [4, 8], [9, 10],steps,height);
	BezConic([17.0, 23.5], [19, 23], [21.5, 22.0],steps,height);
	BezConic([21.5, 22.0], [24, 21], [27, 19],steps,height);
	BezConic([17.5, 11.5], [15, 9], [12.0, 7.0],steps,height);
}
}

module ArchitectsDaughter_contour00x3e(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x3e_skeleton(height);
			ArchitectsDaughter_contour00x3e_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x3e_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x3e(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x3e(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x3e=[[3, 3], [27, 28]];

module ArchitectsDaughter_letter0x3e(steps=2, height) {
	ArchitectsDaughter_chunk10x3e(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x3f_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[17, 0], [15, 0], [15.0, 2.0], 
		[15, 4], [17, 4], [18, 4], 
		[18.5, 4.0], [19, 4], [19.5, 3.5], 
		[20, 3], [20.0, 2.0], [20, 1], 
		[19.5, 0.5], [19, 0], [18.5, 0.0], 
		[18, 0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[17, 0], [15, 0], [15.0, 2.0], 
		[15, 4], [17, 4], [18, 4], 
		[18.5, 4.0], [19, 4], [19.5, 3.5], 
		[20, 3], [20.0, 2.0], [20, 1], 
		[19.5, 0.5], [19, 0], [18.5, 0.0], 
		[18, 0], ]);
}}}

module ArchitectsDaughter_contour00x3f_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([17, 4], [18, 4], [18.5, 4.0],steps,height);
	BezConic([18.5, 0.0], [18, 0], [17, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x3f_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([17, 0], [15, 0], [15.0, 2.0],steps,height);
	BezConic([15.0, 2.0], [15, 4], [17, 4],steps,height);
	BezConic([18.5, 4.0], [19, 4], [19.5, 3.5],steps,height);
	BezConic([19.5, 3.5], [20, 3], [20.0, 2.0],steps,height);
	BezConic([20.0, 2.0], [20, 1], [19.5, 0.5],steps,height);
	BezConic([19.5, 0.5], [19, 0], [18.5, 0.0],steps,height);
}
}

module ArchitectsDaughter_contour00x3f(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x3f_skeleton(height);
			ArchitectsDaughter_contour00x3f_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x3f_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x3f_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[18, 17], [8, 17], [8, 20], 
		[8, 21], [8, 21], [16, 26], 
		[19, 28], [27, 33], [27, 36], 
		[27, 39], [20, 41], [18, 41], 
		[14.0, 40.0], [10, 39], [7.5, 38.5], 
		[5, 38], [3, 38], [3, 38], 
		[2.0, 39.0], [1, 40], [1, 41], 
		[9, 44], [16, 44], [21, 44], 
		[24, 43], [31, 40], [31, 36], 
		[31, 31], [24, 26], [20, 24], 
		[14, 21], [17.5, 20.0], [21, 19], 
		[21.0, 18.0], [21, 17], [20, 17], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[18, 17], [8, 17], [8, 20], 
		[8, 21], [8, 21], [16, 26], 
		[19, 28], [27, 33], [27, 36], 
		[27, 39], [20, 41], [18, 41], 
		[14.0, 40.0], [10, 39], [7.5, 38.5], 
		[5, 38], [3, 38], [3, 38], 
		[2.0, 39.0], [1, 40], [1, 41], 
		[9, 44], [16, 44], [21, 44], 
		[24, 43], [31, 40], [31, 36], 
		[31, 31], [24, 26], [20, 24], 
		[14, 21], [17.5, 20.0], [21, 19], 
		[21.0, 18.0], [21, 17], [20, 17], 
		 ]);
}}}

module ArchitectsDaughter_contour10x3f_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8, 20], [8, 21], [8, 21],steps,height);
	BezConic([8, 21], [16, 26], [19, 28],steps,height);
	BezConic([19, 28], [27, 33], [27, 36],steps,height);
	BezConic([27, 36], [27, 39], [20, 41],steps,height);
	BezConic([20, 41], [18, 41], [14.0, 40.0],steps,height);
	BezConic([3, 38], [3, 38], [2.0, 39.0],steps,height);
	BezConic([24, 26], [20, 24], [14, 21],steps,height);
	BezConic([21, 17], [20, 17], [18, 17],steps,height);
}
}

module ArchitectsDaughter_contour10x3f_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([18, 17], [8, 17], [8, 20],steps,height);
	BezConic([14.0, 40.0], [10, 39], [7.5, 38.5],steps,height);
	BezConic([7.5, 38.5], [5, 38], [3, 38],steps,height);
	BezConic([2.0, 39.0], [1, 40], [1, 41],steps,height);
	BezConic([1, 41], [9, 44], [16, 44],steps,height);
	BezConic([16, 44], [21, 44], [24, 43],steps,height);
	BezConic([24, 43], [31, 40], [31, 36],steps,height);
	BezConic([31, 36], [31, 31], [24, 26],steps,height);
}
}

module ArchitectsDaughter_contour10x3f(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x3f_skeleton(height);
			ArchitectsDaughter_contour10x3f_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x3f_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x3f(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x3f(steps, height);
		
	}
}

module ArchitectsDaughter_chunk20x3f(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour10x3f(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x3f=[[1, 0], [31, 44]];

module ArchitectsDaughter_letter0x3f(steps=2, height) {
	ArchitectsDaughter_chunk10x3f(steps, height);
	ArchitectsDaughter_chunk20x3f(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x40_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[37, 21], [30, 16], [26, 16], 
		[23, 16], [22, 17], [21, 18], 
		[21.0, 20.0], [21, 22], [21, 24], 
		[23, 28], [29, 30], [32, 31], 
		[37, 31], [37, 31], [37.5, 31.0], 
		[38, 31], [38.5, 31.0], [39, 31], 
		[40.0, 30.5], [41, 30], [41.5, 29.5], 
		[42, 29], [42.0, 28.0], [42, 27], 
		[43, 26], [43, 24], [46, 24], 
		[51, 24], [51, 27], [50, 32], 
		[44, 36], [39, 39], [33, 40], 
		[28, 40], [23.5, 38.0], [19, 36], 
		[15.0, 32.5], [11, 29], [9.0, 24.5], 
		[7, 20], [7, 14], [9, 8], 
		[16, 5], [20, 4], [27, 3], 
		[32, 3], [37.0, 4.0], [42, 5], 
		[46, 6], [55, 9], [62, 16], 
		[62, 16], [62.5, 16.0], [63, 16], 
		[64.0, 15.5], [65, 15], [65, 14], 
		[65, 9], [56, 5], [48, 2], 
		[38, 1], [32, 0], [29.0, 0.0], 
		[26, 0], [26, 0], [17, 0], 
		[11, 2], [5, 4], [3, 8], 
		[2, 10], [2, 13], [2, 19], 
		[4.5, 24.5], [7, 30], [11.0, 34.0], 
		[15, 38], [20.5, 40.5], [26, 43], 
		[32, 43], [41, 43], [47, 39], 
		[50, 37], [52.0, 34.0], [54, 31], 
		[54.0, 27.5], [54, 24], [52, 22], 
		[49, 19], [44.5, 19.0], [40, 19], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[37, 21], [30, 16], [26, 16], 
		[23, 16], [22, 17], [21, 18], 
		[21.0, 20.0], [21, 22], [21, 24], 
		[23, 28], [29, 30], [32, 31], 
		[37, 31], [37, 31], [37.5, 31.0], 
		[38, 31], [38.5, 31.0], [39, 31], 
		[40.0, 30.5], [41, 30], [41.5, 29.5], 
		[42, 29], [42.0, 28.0], [42, 27], 
		[43, 26], [43, 24], [46, 24], 
		[51, 24], [51, 27], [50, 32], 
		[44, 36], [39, 39], [33, 40], 
		[28, 40], [23.5, 38.0], [19, 36], 
		[15.0, 32.5], [11, 29], [9.0, 24.5], 
		[7, 20], [7, 14], [9, 8], 
		[16, 5], [20, 4], [27, 3], 
		[32, 3], [37.0, 4.0], [42, 5], 
		[46, 6], [55, 9], [62, 16], 
		[62, 16], [62.5, 16.0], [63, 16], 
		[64.0, 15.5], [65, 15], [65, 14], 
		[65, 9], [56, 5], [48, 2], 
		[38, 1], [32, 0], [29.0, 0.0], 
		[26, 0], [26, 0], [17, 0], 
		[11, 2], [5, 4], [3, 8], 
		[2, 10], [2, 13], [2, 19], 
		[4.5, 24.5], [7, 30], [11.0, 34.0], 
		[15, 38], [20.5, 40.5], [26, 43], 
		[32, 43], [41, 43], [47, 39], 
		[50, 37], [52.0, 34.0], [54, 31], 
		[54.0, 27.5], [54, 24], [52, 22], 
		[49, 19], [44.5, 19.0], [40, 19], 
		 ]);
}}}

module ArchitectsDaughter_contour00x40_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([21.0, 20.0], [21, 22], [21, 24],steps,height);
	BezConic([37, 31], [37, 31], [37.5, 31.0],steps,height);
	BezConic([37.5, 31.0], [38, 31], [38.5, 31.0],steps,height);
	BezConic([42.0, 28.0], [42, 27], [43, 26],steps,height);
	BezConic([43, 26], [43, 24], [46, 24],steps,height);
	BezConic([46, 24], [51, 24], [51, 27],steps,height);
	BezConic([51, 27], [50, 32], [44, 36],steps,height);
	BezConic([44, 36], [39, 39], [33, 40],steps,height);
	BezConic([33, 40], [28, 40], [23.5, 38.0],steps,height);
	BezConic([23.5, 38.0], [19, 36], [15.0, 32.5],steps,height);
	BezConic([15.0, 32.5], [11, 29], [9.0, 24.5],steps,height);
	BezConic([9.0, 24.5], [7, 20], [7, 14],steps,height);
	BezConic([7, 14], [9, 8], [16, 5],steps,height);
	BezConic([16, 5], [20, 4], [27, 3],steps,height);
	BezConic([27, 3], [32, 3], [37.0, 4.0],steps,height);
	BezConic([37.0, 4.0], [42, 5], [46, 6],steps,height);
	BezConic([46, 6], [55, 9], [62, 16],steps,height);
	BezConic([62, 16], [62, 16], [62.5, 16.0],steps,height);
	BezConic([29.0, 0.0], [26, 0], [26, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x40_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([37, 21], [30, 16], [26, 16],steps,height);
	BezConic([26, 16], [23, 16], [22, 17],steps,height);
	BezConic([22, 17], [21, 18], [21.0, 20.0],steps,height);
	BezConic([21, 24], [23, 28], [29, 30],steps,height);
	BezConic([29, 30], [32, 31], [37, 31],steps,height);
	BezConic([38.5, 31.0], [39, 31], [40.0, 30.5],steps,height);
	BezConic([40.0, 30.5], [41, 30], [41.5, 29.5],steps,height);
	BezConic([41.5, 29.5], [42, 29], [42.0, 28.0],steps,height);
	BezConic([62.5, 16.0], [63, 16], [64.0, 15.5],steps,height);
	BezConic([64.0, 15.5], [65, 15], [65, 14],steps,height);
	BezConic([65, 14], [65, 9], [56, 5],steps,height);
	BezConic([56, 5], [48, 2], [38, 1],steps,height);
	BezConic([38, 1], [32, 0], [29.0, 0.0],steps,height);
	BezConic([26, 0], [17, 0], [11, 2],steps,height);
	BezConic([11, 2], [5, 4], [3, 8],steps,height);
	BezConic([3, 8], [2, 10], [2, 13],steps,height);
	BezConic([2, 13], [2, 19], [4.5, 24.5],steps,height);
	BezConic([4.5, 24.5], [7, 30], [11.0, 34.0],steps,height);
	BezConic([11.0, 34.0], [15, 38], [20.5, 40.5],steps,height);
	BezConic([20.5, 40.5], [26, 43], [32, 43],steps,height);
	BezConic([32, 43], [41, 43], [47, 39],steps,height);
	BezConic([47, 39], [50, 37], [52.0, 34.0],steps,height);
	BezConic([52.0, 34.0], [54, 31], [54.0, 27.5],steps,height);
	BezConic([54.0, 27.5], [54, 24], [52, 22],steps,height);
	BezConic([52, 22], [49, 19], [44.5, 19.0],steps,height);
	BezConic([44.5, 19.0], [40, 19], [37, 21],steps,height);
}
}

module ArchitectsDaughter_contour00x40(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x40_skeleton(height);
			ArchitectsDaughter_contour00x40_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x40_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x40_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[36, 26], [36, 28], [34, 28], 
		[32, 28], [29, 26], [25, 24], 
		[24, 22], [24, 21], [24.0, 20.5], 
		[24, 20], [24, 20], [24, 19], 
		[25.0, 19.0], [26, 19], [27.0, 19.5], 
		[28, 20], [30, 21], [35, 23], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[36, 26], [36, 28], [34, 28], 
		[32, 28], [29, 26], [25, 24], 
		[24, 22], [24, 21], [24.0, 20.5], 
		[24, 20], [24, 20], [24, 19], 
		[25.0, 19.0], [26, 19], [27.0, 19.5], 
		[28, 20], [30, 21], [35, 23], 
		 ]);
}}}

module ArchitectsDaughter_contour10x40_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([36, 26], [36, 28], [34, 28],steps,height);
	BezConic([34, 28], [32, 28], [29, 26],steps,height);
	BezConic([29, 26], [25, 24], [24, 22],steps,height);
	BezConic([24, 22], [24, 21], [24.0, 20.5],steps,height);
	BezConic([24.0, 20.5], [24, 20], [24, 20],steps,height);
	BezConic([24, 20], [24, 19], [25.0, 19.0],steps,height);
	BezConic([25.0, 19.0], [26, 19], [27.0, 19.5],steps,height);
	BezConic([30, 21], [35, 23], [36, 26],steps,height);
}
}

module ArchitectsDaughter_contour10x40_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([27.0, 19.5], [28, 20], [30, 21],steps,height);
}
}

module ArchitectsDaughter_contour10x40(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x40_skeleton(height);
			ArchitectsDaughter_contour10x40_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x40_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x40(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x40(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x40(steps, height);
	}
}

ArchitectsDaughter_bbox0x40=[[2, 0], [65, 43]];

module ArchitectsDaughter_letter0x40(steps=2, height) {
	ArchitectsDaughter_chunk10x40(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x41_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[34, 23], [35.0, 23.0], [36, 23], 
		[37, 23], [38.0, 23.0], [39, 23], 
		[39, 21], [40, 19], [36, 19], 
		[35, 19], [34.5, 19.0], [34, 19], 
		[33.5, 19.0], [33, 19], [33, 19], 
		[33, 17], [34.0, 14.5], [35, 12], 
		[36, 10], [38, 5], [40, 2], 
		[39, 1], [37.5, 0.0], [36, -1], 
		[36.0, -1.0], [36, -1], [36, -1], 
		[31.5, 8.5], [27, 18], [18.5, 16.0], 
		[10, 14], [9.5, 12.5], [9, 11], 
		[7, 4], [5, 1], [5, 0], 
		[4, 1], [2, 2], [2, 2], 
		[2, 2], [3.0, 5.5], [4, 9], 
		[5.5, 12.5], [7, 16], [8.5, 20.0], 
		[10, 24], [11.5, 27.5], [13, 31], 
		[14.0, 34.0], [15, 37], [15.5, 38.5], 
		[16, 40], [16.0, 41.0], [16, 42], 
		[16, 42], [17, 44], [19, 44], 
		[22, 42], [23.5, 39.5], [25, 37], 
		[26.0, 34.5], [27, 32], [28.0, 29.0], 
		[29, 26], [31, 24], [31, 23], 
		[32.0, 23.0],[33, 23], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[34, 23], [35.0, 23.0], [36, 23], 
		[37, 23], [38.0, 23.0], [39, 23], 
		[39, 21], [40, 19], [36, 19], 
		[35, 19], [34.5, 19.0], [34, 19], 
		[33.5, 19.0], [33, 19], [33, 19], 
		[33, 17], [34.0, 14.5], [35, 12], 
		[36, 10], [38, 5], [40, 2], 
		[39, 1], [37.5, 0.0], [36, -1], 
		[36.0, -1.0], [36, -1], [36, -1], 
		[31.5, 8.5], [27, 18], [18.5, 16.0], 
		[10, 14], [9.5, 12.5], [9, 11], 
		[7, 4], [5, 1], [5, 0], 
		[4, 1], [2, 2], [2, 2], 
		[2, 2], [3.0, 5.5], [4, 9], 
		[5.5, 12.5], [7, 16], [8.5, 20.0], 
		[10, 24], [11.5, 27.5], [13, 31], 
		[14.0, 34.0], [15, 37], [15.5, 38.5], 
		[16, 40], [16.0, 41.0], [16, 42], 
		[16, 42], [17, 44], [19, 44], 
		[22, 42], [23.5, 39.5], [25, 37], 
		[26.0, 34.5], [27, 32], [28.0, 29.0], 
		[29, 26], [31, 24], [31, 23], 
		[32.0, 23.0],[33, 23], ]);
}}}

module ArchitectsDaughter_contour00x41_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([36, 23], [37, 23], [38.0, 23.0],steps,height);
	BezConic([36, 19], [35, 19], [34.5, 19.0],steps,height);
	BezConic([34.5, 19.0], [34, 19], [33.5, 19.0],steps,height);
	BezConic([33.5, 19.0], [33, 19], [33, 19],steps,height);
	BezConic([33, 19], [33, 17], [34.0, 14.5],steps,height);
	BezConic([34.0, 14.5], [35, 12], [36, 10],steps,height);
	BezConic([36, 10], [38, 5], [40, 2],steps,height);
	BezConic([37.5, 0.0], [36, -1], [36.0, -1.0],steps,height);
	BezConic([36.0, -1.0], [36, -1], [36, -1],steps,height);
	BezConic([4, 1], [2, 2], [2, 2],steps,height);
	BezConic([2, 2], [2, 2], [3.0, 5.5],steps,height);
	BezConic([5.5, 12.5], [7, 16], [8.5, 20.0],steps,height);
	BezConic([11.5, 27.5], [13, 31], [14.0, 34.0],steps,height);
	BezConic([14.0, 34.0], [15, 37], [15.5, 38.5],steps,height);
	BezConic([15.5, 38.5], [16, 40], [16.0, 41.0],steps,height);
	BezConic([16.0, 41.0], [16, 42], [16, 42],steps,height);
	BezConic([28.0, 29.0], [29, 26], [31, 24],steps,height);
	BezConic([31, 24], [31, 23], [32.0, 23.0],steps,height);
	BezConic([32.0, 23.0], [33, 23], [34, 23],steps,height);
}
}

module ArchitectsDaughter_contour00x41_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([38.0, 23.0], [39, 23], [39, 21],steps,height);
	BezConic([39, 21], [40, 19], [36, 19],steps,height);
	BezConic([40, 2], [39, 1], [37.5, 0.0],steps,height);
	BezConic([9, 11], [7, 4], [5, 1],steps,height);
	BezConic([5, 1], [5, 0], [4, 1],steps,height);
	BezConic([3.0, 5.5], [4, 9], [5.5, 12.5],steps,height);
	BezConic([8.5, 20.0], [10, 24], [11.5, 27.5],steps,height);
	BezConic([16, 42], [17, 44], [19, 44],steps,height);
	BezConic([19, 44], [22, 42], [23.5, 39.5],steps,height);
	BezConic([23.5, 39.5], [25, 37], [26.0, 34.5],steps,height);
	BezConic([26.0, 34.5], [27, 32], [28.0, 29.0],steps,height);
}
}

module ArchitectsDaughter_contour00x41(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x41_skeleton(height);
			ArchitectsDaughter_contour00x41_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x41_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x41_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[19, 36], [18, 33], [16.5, 29.0], 
		[15, 25], [14.0, 22.5], [13, 20], 
		[12, 18], [16, 18], [22, 21], 
		[24, 21], [25, 22], [22, 35], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[19, 36], [18, 33], [16.5, 29.0], 
		[15, 25], [14.0, 22.5], [13, 20], 
		[12, 18], [16, 18], [22, 21], 
		[24, 21], [25, 22], [22, 35], 
		 ]);
}}}

module ArchitectsDaughter_contour10x41_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([12, 18], [16, 18], [22, 21],steps,height);
	BezConic([22, 21], [24, 21], [25, 22],steps,height);
	BezConic([25, 22], [22, 35], [19, 36],steps,height);
}
}

module ArchitectsDaughter_contour10x41_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([19, 36], [18, 33], [16.5, 29.0],steps,height);
	BezConic([16.5, 29.0], [15, 25], [14.0, 22.5],steps,height);
	BezConic([14.0, 22.5], [13, 20], [12, 18],steps,height);
}
}

module ArchitectsDaughter_contour10x41(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x41_skeleton(height);
			ArchitectsDaughter_contour10x41_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x41_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x41(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x41(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x41(steps, height);
	}
}

ArchitectsDaughter_bbox0x41=[[2, -1], [40, 44]];

module ArchitectsDaughter_letter0x41(steps=2, height) {
	ArchitectsDaughter_chunk10x41(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x42_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[4, 42], [9, 43], [13.0, 43.0], 
		[17, 43], [20.0, 42.5], [23, 42], 
		[27, 41], [34, 39], [35, 36], 
		[36, 35], [36, 34], [36, 31], 
		[31, 28], [28, 26], [22, 24], 
		[36, 23], [41, 20], [44, 18], 
		[44, 15], [44, 12], [40, 8], 
		[34, 5], [26, 2], [19, 0], 
		[12, 0], [8, 0], [4, 1], 
		[4, 5], [4, 9], [3, 19], 
		[3.0, 25.5], [3, 32], [4, 39], 
		[3, 39], [2.5, 39.0], [2, 39], 
		[2, 40],[2, 42], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[4, 42], [9, 43], [13.0, 43.0], 
		[17, 43], [20.0, 42.5], [23, 42], 
		[27, 41], [34, 39], [35, 36], 
		[36, 35], [36, 34], [36, 31], 
		[31, 28], [28, 26], [22, 24], 
		[36, 23], [41, 20], [44, 18], 
		[44, 15], [44, 12], [40, 8], 
		[34, 5], [26, 2], [19, 0], 
		[12, 0], [8, 0], [4, 1], 
		[4, 5], [4, 9], [3, 19], 
		[3.0, 25.5], [3, 32], [4, 39], 
		[3, 39], [2.5, 39.0], [2, 39], 
		[2, 40],[2, 42], ]);
}}}

module ArchitectsDaughter_contour00x42_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 1], [4, 5], [4, 9],steps,height);
	BezConic([4, 39], [3, 39], [2.5, 39.0],steps,height);
}
}

module ArchitectsDaughter_contour00x42_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 42], [9, 43], [13.0, 43.0],steps,height);
	BezConic([13.0, 43.0], [17, 43], [20.0, 42.5],steps,height);
	BezConic([20.0, 42.5], [23, 42], [27, 41],steps,height);
	BezConic([27, 41], [34, 39], [35, 36],steps,height);
	BezConic([35, 36], [36, 35], [36, 34],steps,height);
	BezConic([36, 34], [36, 31], [31, 28],steps,height);
	BezConic([31, 28], [28, 26], [22, 24],steps,height);
	BezConic([22, 24], [36, 23], [41, 20],steps,height);
	BezConic([41, 20], [44, 18], [44, 15],steps,height);
	BezConic([44, 15], [44, 12], [40, 8],steps,height);
	BezConic([40, 8], [34, 5], [26, 2],steps,height);
	BezConic([26, 2], [19, 0], [12, 0],steps,height);
	BezConic([12, 0], [8, 0], [4, 1],steps,height);
	BezConic([4, 9], [3, 19], [3.0, 25.5],steps,height);
	BezConic([3.0, 25.5], [3, 32], [4, 39],steps,height);
	BezConic([2.5, 39.0], [2, 39], [2, 40],steps,height);
	BezConic([2, 40], [2, 42], [4, 42],steps,height);
}
}

module ArchitectsDaughter_contour00x42(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x42_skeleton(height);
			ArchitectsDaughter_contour00x42_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x42_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x42_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[10, 4], [20, 5], [26.5, 6.5], 
		[33, 8], [35.5, 10.5], [38, 13], 
		[38, 15], [38, 17], [35, 19], 
		[31, 21], [24.0, 21.0], [17, 21], 
		[8, 19],[9.0, 11.5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[10, 4], [20, 5], [26.5, 6.5], 
		[33, 8], [35.5, 10.5], [38, 13], 
		[38, 15], [38, 17], [35, 19], 
		[31, 21], [24.0, 21.0], [17, 21], 
		[8, 19],[9.0, 11.5], ]);
}}}

module ArchitectsDaughter_contour10x42_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([10, 4], [20, 5], [26.5, 6.5],steps,height);
	BezConic([26.5, 6.5], [33, 8], [35.5, 10.5],steps,height);
	BezConic([35.5, 10.5], [38, 13], [38, 15],steps,height);
	BezConic([38, 15], [38, 17], [35, 19],steps,height);
	BezConic([35, 19], [31, 21], [24.0, 21.0],steps,height);
	BezConic([24.0, 21.0], [17, 21], [8, 19],steps,height);
}
}

module ArchitectsDaughter_contour10x42_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x42(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x42_skeleton(height);
			ArchitectsDaughter_contour10x42_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x42_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour20x42_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[16, 38], [15.0, 38.0], [14, 38], 
		[9, 38], [8, 37], [8.0, 31.0], 
		[8, 25], [13, 25], [21, 28], 
		[27, 29], [29, 32], [30, 33], 
		[30.0, 34.0], [30, 35], [29.0, 36.0], 
		[28, 37], [27.0, 37.5], [26, 38], 
		[24.0, 38.0], [22, 38], [21, 38], 
		[18, 38], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[16, 38], [15.0, 38.0], [14, 38], 
		[9, 38], [8, 37], [8.0, 31.0], 
		[8, 25], [13, 25], [21, 28], 
		[27, 29], [29, 32], [30, 33], 
		[30.0, 34.0], [30, 35], [29.0, 36.0], 
		[28, 37], [27.0, 37.5], [26, 38], 
		[24.0, 38.0], [22, 38], [21, 38], 
		[18, 38], ]);
}}}

module ArchitectsDaughter_contour20x42_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([14, 38], [9, 38], [8, 37],steps,height);
	BezConic([8, 25], [13, 25], [21, 28],steps,height);
	BezConic([21, 28], [27, 29], [29, 32],steps,height);
	BezConic([29, 32], [30, 33], [30.0, 34.0],steps,height);
	BezConic([30.0, 34.0], [30, 35], [29.0, 36.0],steps,height);
	BezConic([29.0, 36.0], [28, 37], [27.0, 37.5],steps,height);
	BezConic([27.0, 37.5], [26, 38], [24.0, 38.0],steps,height);
	BezConic([24.0, 38.0], [22, 38], [21, 38],steps,height);
	BezConic([21, 38], [18, 38], [16, 38],steps,height);
}
}

module ArchitectsDaughter_contour20x42_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour20x42(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour20x42_skeleton(height);
			ArchitectsDaughter_contour20x42_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x42_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x42(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x42(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x42(steps, height);
	translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour20x42(steps, height);
	}
}

ArchitectsDaughter_bbox0x42=[[2, 0], [44, 43]];

module ArchitectsDaughter_letter0x42(steps=2, height) {
	ArchitectsDaughter_chunk10x42(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x43_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[33, 35], [29, 39], [24, 39], 
		[19, 39], [15, 35], [9, 31], 
		[7, 24], [6, 21], [6.0, 19.5], 
		[6, 18], [7, 17], [7, 10], 
		[11, 7], [15, 4], [21, 4], 
		[29, 5], [37, 11], [39, 12], 
		[41, 14], [42, 14], [43.0, 13.5], 
		[44, 13], [44, 12], [38, 7], 
		[34, 4], [26, 0], [19, 0], 
		[19, 0], [19, 0], [12, 0], 
		[7, 4], [1, 9], [1, 16], 
		[1, 21], [3.0, 25.5], [5, 30], 
		[8.5, 33.5], [12, 37], [16.0, 39.5], 
		[20, 42], [25, 42], [30, 42], 
		[31, 40],[33, 39], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[33, 35], [29, 39], [24, 39], 
		[19, 39], [15, 35], [9, 31], 
		[7, 24], [6, 21], [6.0, 19.5], 
		[6, 18], [7, 17], [7, 10], 
		[11, 7], [15, 4], [21, 4], 
		[29, 5], [37, 11], [39, 12], 
		[41, 14], [42, 14], [43.0, 13.5], 
		[44, 13], [44, 12], [38, 7], 
		[34, 4], [26, 0], [19, 0], 
		[19, 0], [19, 0], [12, 0], 
		[7, 4], [1, 9], [1, 16], 
		[1, 21], [3.0, 25.5], [5, 30], 
		[8.5, 33.5], [12, 37], [16.0, 39.5], 
		[20, 42], [25, 42], [30, 42], 
		[31, 40],[33, 39], ]);
}}}

module ArchitectsDaughter_contour00x43_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([33, 35], [29, 39], [24, 39],steps,height);
	BezConic([24, 39], [19, 39], [15, 35],steps,height);
	BezConic([15, 35], [9, 31], [7, 24],steps,height);
	BezConic([7, 24], [6, 21], [6.0, 19.5],steps,height);
	BezConic([6.0, 19.5], [6, 18], [7, 17],steps,height);
	BezConic([7, 17], [7, 10], [11, 7],steps,height);
	BezConic([11, 7], [15, 4], [21, 4],steps,height);
	BezConic([21, 4], [29, 5], [37, 11],steps,height);
	BezConic([37, 11], [39, 12], [41, 14],steps,height);
	BezConic([19, 0], [19, 0], [19, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x43_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([41, 14], [42, 14], [43.0, 13.5],steps,height);
	BezConic([43.0, 13.5], [44, 13], [44, 12],steps,height);
	BezConic([44, 12], [38, 7], [34, 4],steps,height);
	BezConic([34, 4], [26, 0], [19, 0],steps,height);
	BezConic([19, 0], [12, 0], [7, 4],steps,height);
	BezConic([7, 4], [1, 9], [1, 16],steps,height);
	BezConic([1, 16], [1, 21], [3.0, 25.5],steps,height);
	BezConic([3.0, 25.5], [5, 30], [8.5, 33.5],steps,height);
	BezConic([8.5, 33.5], [12, 37], [16.0, 39.5],steps,height);
	BezConic([16.0, 39.5], [20, 42], [25, 42],steps,height);
	BezConic([25, 42], [30, 42], [31, 40],steps,height);
	BezConic([31, 40], [33, 39], [33, 35],steps,height);
}
}

module ArchitectsDaughter_contour00x43(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x43_skeleton(height);
			ArchitectsDaughter_contour00x43_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x43_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x43(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x43(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x43=[[1, 0], [44, 42]];

module ArchitectsDaughter_letter0x43(steps=2, height) {
	ArchitectsDaughter_chunk10x43(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x44_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 38], [11, 40], [19, 40], 
		[33, 40], [38, 33], [40, 31], 
		[40, 26], [40, 26], [40, 25], 
		[40, 19], [33, 13], [26, 7], 
		[16, 3], [10, 0], [5, 0], 
		[4, 0], [2, 1], [2.0, 20.5], 
		[2, 40], [2.5, 40.0], [3, 40], 
		[5, 40], [5.5, 39.5], [6, 39], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 38], [11, 40], [19, 40], 
		[33, 40], [38, 33], [40, 31], 
		[40, 26], [40, 26], [40, 25], 
		[40, 19], [33, 13], [26, 7], 
		[16, 3], [10, 0], [5, 0], 
		[4, 0], [2, 1], [2.0, 20.5], 
		[2, 40], [2.5, 40.0], [3, 40], 
		[5, 40], [5.5, 39.5], [6, 39], 
		 ]);
}}}

module ArchitectsDaughter_contour00x44_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5.5, 39.5], [6, 39], [7, 38],steps,height);
}
}

module ArchitectsDaughter_contour00x44_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 38], [11, 40], [19, 40],steps,height);
	BezConic([19, 40], [33, 40], [38, 33],steps,height);
	BezConic([38, 33], [40, 31], [40, 26],steps,height);
	BezConic([40, 26], [40, 26], [40, 25],steps,height);
	BezConic([40, 25], [40, 19], [33, 13],steps,height);
	BezConic([33, 13], [26, 7], [16, 3],steps,height);
	BezConic([16, 3], [10, 0], [5, 0],steps,height);
	BezConic([5, 0], [4, 0], [2, 1],steps,height);
	BezConic([3, 40], [5, 40], [5.5, 39.5],steps,height);
}
}

module ArchitectsDaughter_contour00x44(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x44_skeleton(height);
			ArchitectsDaughter_contour00x44_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x44_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x44_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[36, 26], [35, 32], [30, 34], 
		[25, 36], [19, 36], [18.5, 36.0], 
		[18, 36], [12, 36], [8, 34], 
		[8.0, 19.0], [8, 4], [12, 4], 
		[19, 8], [30, 13], [34, 21], 
		[36, 23], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[36, 26], [35, 32], [30, 34], 
		[25, 36], [19, 36], [18.5, 36.0], 
		[18, 36], [12, 36], [8, 34], 
		[8.0, 19.0], [8, 4], [12, 4], 
		[19, 8], [30, 13], [34, 21], 
		[36, 23], ]);
}}}

module ArchitectsDaughter_contour10x44_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([36, 26], [35, 32], [30, 34],steps,height);
	BezConic([30, 34], [25, 36], [19, 36],steps,height);
	BezConic([18, 36], [12, 36], [8, 34],steps,height);
	BezConic([8, 4], [12, 4], [19, 8],steps,height);
	BezConic([19, 8], [30, 13], [34, 21],steps,height);
	BezConic([34, 21], [36, 23], [36, 26],steps,height);
}
}

module ArchitectsDaughter_contour10x44_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x44(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x44_skeleton(height);
			ArchitectsDaughter_contour10x44_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x44_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x44(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x44(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x44(steps, height);
	}
}

ArchitectsDaughter_bbox0x44=[[2, 0], [40, 40]];

module ArchitectsDaughter_letter0x44(steps=2, height) {
	ArchitectsDaughter_chunk10x44(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x45_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[22, 40], [28, 40], [30, 39], 
		[30.0, 37.5], [30, 36], [29, 36], 
		[26.0, 36.0], [23, 36], [20, 35], 
		[10, 35], [7, 35], [6, 30], 
		[6.0, 28.0], [6, 26], [6, 25], 
		[6, 22], [6, 19], [11, 19], 
		[16.0, 20.0], [21, 21], [24.0, 21.0], 
		[27, 21], [31, 21], [31.0, 19.5], 
		[31, 18], [19.0, 16.5], [7, 15], 
		[7.0, 10.0], [7, 5], [13, 5], 
		[19.5, 5.5], [26, 6], [29.5, 6.0], 
		[33, 6], [37, 6], [37, 5], 
		[36, 4], [34, 2], [33, 3], 
		[22, 2], [13.5, 1.0], [5, 0], 
		[2, 0], [2.0, 20.0], [2, 40], 
		[4, 39], [8, 39], [15.0, 39.5], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[22, 40], [28, 40], [30, 39], 
		[30.0, 37.5], [30, 36], [29, 36], 
		[26.0, 36.0], [23, 36], [20, 35], 
		[10, 35], [7, 35], [6, 30], 
		[6.0, 28.0], [6, 26], [6, 25], 
		[6, 22], [6, 19], [11, 19], 
		[16.0, 20.0], [21, 21], [24.0, 21.0], 
		[27, 21], [31, 21], [31.0, 19.5], 
		[31, 18], [19.0, 16.5], [7, 15], 
		[7.0, 10.0], [7, 5], [13, 5], 
		[19.5, 5.5], [26, 6], [29.5, 6.0], 
		[33, 6], [37, 6], [37, 5], 
		[36, 4], [34, 2], [33, 3], 
		[22, 2], [13.5, 1.0], [5, 0], 
		[2, 0], [2.0, 20.0], [2, 40], 
		[4, 39], [8, 39], [15.0, 39.5], 
		 ]);
}}}

module ArchitectsDaughter_contour00x45_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([30, 36], [29, 36], [26.0, 36.0],steps,height);
	BezConic([26.0, 36.0], [23, 36], [20, 35],steps,height);
	BezConic([20, 35], [10, 35], [7, 35],steps,height);
	BezConic([7, 35], [6, 30], [6.0, 28.0],steps,height);
	BezConic([6.0, 28.0], [6, 26], [6, 25],steps,height);
	BezConic([6, 19], [11, 19], [16.0, 20.0],steps,height);
	BezConic([24.0, 21.0], [27, 21], [31, 21],steps,height);
	BezConic([7, 5], [13, 5], [19.5, 5.5],steps,height);
	BezConic([29.5, 6.0], [33, 6], [37, 6],steps,height);
	BezConic([33, 3], [22, 2], [13.5, 1.0],steps,height);
	BezConic([2, 40], [4, 39], [8, 39],steps,height);
}
}

module ArchitectsDaughter_contour00x45_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([22, 40], [28, 40], [30, 39],steps,height);
	BezConic([6, 25], [6, 22], [6, 19],steps,height);
	BezConic([16.0, 20.0], [21, 21], [24.0, 21.0],steps,height);
	BezConic([19.5, 5.5], [26, 6], [29.5, 6.0],steps,height);
	BezConic([37, 6], [37, 5], [36, 4],steps,height);
	BezConic([36, 4], [34, 2], [33, 3],steps,height);
	BezConic([13.5, 1.0], [5, 0], [2, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x45(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x45_skeleton(height);
			ArchitectsDaughter_contour00x45_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x45_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x45(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x45(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x45=[[2, 0], [37, 40]];

module ArchitectsDaughter_letter0x45(steps=2, height) {
	ArchitectsDaughter_chunk10x45(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x46_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[6, 10], [2, 11], [2, 12], 
		[2, 13], [3.5, 14.0], [5, 15], 
		[6, 16], [6, 20], [5.0, 24.5], 
		[4, 29], [3.5, 31.5], [3, 34], 
		[3.0, 36.5], [3, 39], [3.5, 39.5], 
		[4, 40], [5.5, 40.0], [7, 40], 
		[7.0, 39.5], [7, 39], [7.5, 38.5], 
		[8, 38], [8.0, 37.5], [8, 37], 
		[8, 36], [8, 35], [10, 35], 
		[14, 35], [18.0, 36.0], [22, 37], 
		[26, 37], [35, 39], [38.0, 39.0], 
		[41, 39], [43, 38], [43, 37], 
		[43.5, 36.0], [44, 35], [44, 35], 
		[44, 34], [42, 34], [9, 33], 
		[9, 29], [9, 25], [9.5, 22.0], 
		[10, 19], [10.5, 18.5], [11, 18], 
		[11, 18], [15, 18], [18.5, 18.5], 
		[22, 19], [25.5, 20.0], [29, 21], 
		[33.0, 21.5], [37, 22], [40, 22], 
		[40, 22], [40.0, 21.5], [40, 21], 
		[40, 20], [40, 19], [40, 19], 
		[37, 17], [30, 16], [27, 16], 
		[24.0, 15.5], [21, 15], [18, 15], 
		[12, 14], [11, 12], [10.5, 6.0], 
		[10, 0], [10, -1], [9, -1], 
		[8.0, -0.5], [7, 0], [6, 0], 
		[6, 0],[6.0, 5.0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[6, 10], [2, 11], [2, 12], 
		[2, 13], [3.5, 14.0], [5, 15], 
		[6, 16], [6, 20], [5.0, 24.5], 
		[4, 29], [3.5, 31.5], [3, 34], 
		[3.0, 36.5], [3, 39], [3.5, 39.5], 
		[4, 40], [5.5, 40.0], [7, 40], 
		[7.0, 39.5], [7, 39], [7.5, 38.5], 
		[8, 38], [8.0, 37.5], [8, 37], 
		[8, 36], [8, 35], [10, 35], 
		[14, 35], [18.0, 36.0], [22, 37], 
		[26, 37], [35, 39], [38.0, 39.0], 
		[41, 39], [43, 38], [43, 37], 
		[43.5, 36.0], [44, 35], [44, 35], 
		[44, 34], [42, 34], [9, 33], 
		[9, 29], [9, 25], [9.5, 22.0], 
		[10, 19], [10.5, 18.5], [11, 18], 
		[11, 18], [15, 18], [18.5, 18.5], 
		[22, 19], [25.5, 20.0], [29, 21], 
		[33.0, 21.5], [37, 22], [40, 22], 
		[40, 22], [40.0, 21.5], [40, 21], 
		[40, 20], [40, 19], [40, 19], 
		[37, 17], [30, 16], [27, 16], 
		[24.0, 15.5], [21, 15], [18, 15], 
		[12, 14], [11, 12], [10.5, 6.0], 
		[10, 0], [10, -1], [9, -1], 
		[8.0, -0.5], [7, 0], [6, 0], 
		[6, 0],[6.0, 5.0], ]);
}}}

module ArchitectsDaughter_contour00x46_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.5, 14.0], [5, 15], [6, 16],steps,height);
	BezConic([6, 16], [6, 20], [5.0, 24.5],steps,height);
	BezConic([7.0, 39.5], [7, 39], [7.5, 38.5],steps,height);
	BezConic([8.0, 37.5], [8, 37], [8, 36],steps,height);
	BezConic([8, 36], [8, 35], [10, 35],steps,height);
	BezConic([10, 35], [14, 35], [18.0, 36.0],steps,height);
	BezConic([43, 38], [43, 37], [43.5, 36.0],steps,height);
	BezConic([43.5, 36.0], [44, 35], [44, 35],steps,height);
	BezConic([42, 34], [9, 33], [9, 29],steps,height);
	BezConic([9, 29], [9, 25], [9.5, 22.0],steps,height);
	BezConic([9.5, 22.0], [10, 19], [10.5, 18.5],steps,height);
	BezConic([10.5, 18.5], [11, 18], [11, 18],steps,height);
	BezConic([11, 18], [15, 18], [18.5, 18.5],steps,height);
	BezConic([18.5, 18.5], [22, 19], [25.5, 20.0],steps,height);
	BezConic([40.0, 21.5], [40, 21], [40, 20],steps,height);
	BezConic([40, 20], [40, 19], [40, 19],steps,height);
	BezConic([30, 16], [27, 16], [24.0, 15.5],steps,height);
	BezConic([18, 15], [12, 14], [11, 12],steps,height);
	BezConic([7, 0], [6, 0], [6, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x46_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6, 10], [2, 11], [2, 12],steps,height);
	BezConic([2, 12], [2, 13], [3.5, 14.0],steps,height);
	BezConic([5.0, 24.5], [4, 29], [3.5, 31.5],steps,height);
	BezConic([3.5, 31.5], [3, 34], [3.0, 36.5],steps,height);
	BezConic([3.0, 36.5], [3, 39], [3.5, 39.5],steps,height);
	BezConic([3.5, 39.5], [4, 40], [5.5, 40.0],steps,height);
	BezConic([5.5, 40.0], [7, 40], [7.0, 39.5],steps,height);
	BezConic([7.5, 38.5], [8, 38], [8.0, 37.5],steps,height);
	BezConic([18.0, 36.0], [22, 37], [26, 37],steps,height);
	BezConic([26, 37], [35, 39], [38.0, 39.0],steps,height);
	BezConic([38.0, 39.0], [41, 39], [43, 38],steps,height);
	BezConic([44, 35], [44, 34], [42, 34],steps,height);
	BezConic([25.5, 20.0], [29, 21], [33.0, 21.5],steps,height);
	BezConic([33.0, 21.5], [37, 22], [40, 22],steps,height);
	BezConic([40, 22], [40, 22], [40.0, 21.5],steps,height);
	BezConic([40, 19], [37, 17], [30, 16],steps,height);
	BezConic([24.0, 15.5], [21, 15], [18, 15],steps,height);
	BezConic([10, 0], [10, -1], [9, -1],steps,height);
}
}

module ArchitectsDaughter_contour00x46(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x46_skeleton(height);
			ArchitectsDaughter_contour00x46_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x46_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x46(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x46(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x46=[[2, -1], [44, 40]];

module ArchitectsDaughter_letter0x46(steps=2, height) {
	ArchitectsDaughter_chunk10x46(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x47_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[31, -3], [31.0, 2.5], [31, 8], 
		[25, 4], [23, 3], [17, 0], 
		[13, 0], [8, 0], [5, 4], 
		[1, 7], [1, 12], [2, 17], 
		[4, 22], [7, 33], [16, 38], 
		[20, 41], [26, 41], [26, 41], 
		[26, 41], [27.0, 41.0], [28, 41], 
		[31, 41], [30, 39], [25, 38], 
		[21.0, 36.0], [17, 34], [13.5, 30.5], 
		[10, 27], [8.5, 22.5], [7, 18], 
		[7.0, 13.0], [7, 8], [9.5, 6.0], 
		[12, 4], [16, 4], [19, 4], 
		[25, 7], [29, 9], [31, 11], 
		[32, 12], [32, 14], [32.0, 18.5], 
		[32, 23], [30, 23], [23.0, 21.5], 
		[16, 20], [15, 20], [15, 20], 
		[14.5, 20.0], [14, 20], [14, 21], 
		[14, 22], [16, 24], [17, 24], 
		[24.5, 25.0], [32, 26], [34.0, 26.5], 
		[36, 27], [38, 27], [38, 27], 
		[39.0, 27.0], [40, 27], [41, 27], 
		[43, 27], [43, 25], [40.5, 24.0], 
		[38, 23], [37, 19], [37, 9], 
		[37.0, 4.0], [37, -1], [37, -2], 
		[37, -3], [35, -4], [33.0, -4.0], 
		[31, -4], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[31, -3], [31.0, 2.5], [31, 8], 
		[25, 4], [23, 3], [17, 0], 
		[13, 0], [8, 0], [5, 4], 
		[1, 7], [1, 12], [2, 17], 
		[4, 22], [7, 33], [16, 38], 
		[20, 41], [26, 41], [26, 41], 
		[26, 41], [27.0, 41.0], [28, 41], 
		[31, 41], [30, 39], [25, 38], 
		[21.0, 36.0], [17, 34], [13.5, 30.5], 
		[10, 27], [8.5, 22.5], [7, 18], 
		[7.0, 13.0], [7, 8], [9.5, 6.0], 
		[12, 4], [16, 4], [19, 4], 
		[25, 7], [29, 9], [31, 11], 
		[32, 12], [32, 14], [32.0, 18.5], 
		[32, 23], [30, 23], [23.0, 21.5], 
		[16, 20], [15, 20], [15, 20], 
		[14.5, 20.0], [14, 20], [14, 21], 
		[14, 22], [16, 24], [17, 24], 
		[24.5, 25.0], [32, 26], [34.0, 26.5], 
		[36, 27], [38, 27], [38, 27], 
		[39.0, 27.0], [40, 27], [41, 27], 
		[43, 27], [43, 25], [40.5, 24.0], 
		[38, 23], [37, 19], [37, 9], 
		[37.0, 4.0], [37, -1], [37, -2], 
		[37, -3], [35, -4], [33.0, -4.0], 
		[31, -4], ]);
}}}

module ArchitectsDaughter_contour00x47_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 41], [26, 41], [26, 41],steps,height);
	BezConic([30, 39], [25, 38], [21.0, 36.0],steps,height);
	BezConic([21.0, 36.0], [17, 34], [13.5, 30.5],steps,height);
	BezConic([13.5, 30.5], [10, 27], [8.5, 22.5],steps,height);
	BezConic([8.5, 22.5], [7, 18], [7.0, 13.0],steps,height);
	BezConic([7.0, 13.0], [7, 8], [9.5, 6.0],steps,height);
	BezConic([9.5, 6.0], [12, 4], [16, 4],steps,height);
	BezConic([16, 4], [19, 4], [25, 7],steps,height);
	BezConic([25, 7], [29, 9], [31, 11],steps,height);
	BezConic([31, 11], [32, 12], [32, 14],steps,height);
	BezConic([32, 23], [30, 23], [23.0, 21.5],steps,height);
	BezConic([15, 20], [15, 20], [14.5, 20.0],steps,height);
	BezConic([16, 24], [17, 24], [24.5, 25.0],steps,height);
	BezConic([24.5, 25.0], [32, 26], [34.0, 26.5],steps,height);
	BezConic([38, 27], [38, 27], [39.0, 27.0],steps,height);
	BezConic([39.0, 27.0], [40, 27], [41, 27],steps,height);
	BezConic([38, 23], [37, 19], [37, 9],steps,height);
	BezConic([37, -1], [37, -2], [37, -3],steps,height);
}
}

module ArchitectsDaughter_contour00x47_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([31, 8], [25, 4], [23, 3],steps,height);
	BezConic([23, 3], [17, 0], [13, 0],steps,height);
	BezConic([13, 0], [8, 0], [5, 4],steps,height);
	BezConic([5, 4], [1, 7], [1, 12],steps,height);
	BezConic([1, 12], [2, 17], [4, 22],steps,height);
	BezConic([4, 22], [7, 33], [16, 38],steps,height);
	BezConic([16, 38], [20, 41], [26, 41],steps,height);
	BezConic([28, 41], [31, 41], [30, 39],steps,height);
	BezConic([23.0, 21.5], [16, 20], [15, 20],steps,height);
	BezConic([14.5, 20.0], [14, 20], [14, 21],steps,height);
	BezConic([14, 21], [14, 22], [16, 24],steps,height);
	BezConic([34.0, 26.5], [36, 27], [38, 27],steps,height);
	BezConic([41, 27], [43, 27], [43, 25],steps,height);
	BezConic([37, -3], [35, -4], [33.0, -4.0],steps,height);
	BezConic([33.0, -4.0], [31, -4], [31, -3],steps,height);
}
}

module ArchitectsDaughter_contour00x47(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x47_skeleton(height);
			ArchitectsDaughter_contour00x47_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x47_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x47(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x47(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x47=[[1, -4], [43, 41]];

module ArchitectsDaughter_letter0x47(steps=2, height) {
	ArchitectsDaughter_chunk10x47(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x48_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[10, 18], [10, 16], [10.0, 12.0], 
		[10, 8], [11, 2], [8.5, 1.0], 
		[6, 0], [5.0, 8.5], [4, 17], 
		[1, 17], [1, 18], [1, 19], 
		[2.0, 20.0], [3, 21], [3.5, 22.0], 
		[4, 23], [4.5, 24.0], [5, 25], 
		[5.0, 27.5], [5, 30], [5.0, 33.0], 
		[5, 36], [5.5, 38.5], [6, 41], 
		[6, 42], [7, 43], [8, 43], 
		[9, 44], [10, 43], [9.5, 33.0], 
		[9, 23], [25, 23], [28, 25], 
		[28.0, 35.0], [28, 45], [28, 46], 
		[31, 46], [32, 46], [33, 46], 
		[33, 44], [33.0, 42.0], [33, 40], 
		[33.0, 37.0], [33, 34], [33.0, 30.5], 
		[33, 27], [33, 24], [33, 17], 
		[34, 14], [34, 7], [37, 2], 
		[34, 1], [30, 1], [28, 8], 
		[27, 20], [23, 20], [21.5, 20.0], 
		[20, 20], [18, 20], [15, 19], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[10, 18], [10, 16], [10.0, 12.0], 
		[10, 8], [11, 2], [8.5, 1.0], 
		[6, 0], [5.0, 8.5], [4, 17], 
		[1, 17], [1, 18], [1, 19], 
		[2.0, 20.0], [3, 21], [3.5, 22.0], 
		[4, 23], [4.5, 24.0], [5, 25], 
		[5.0, 27.5], [5, 30], [5.0, 33.0], 
		[5, 36], [5.5, 38.5], [6, 41], 
		[6, 42], [7, 43], [8, 43], 
		[9, 44], [10, 43], [9.5, 33.0], 
		[9, 23], [25, 23], [28, 25], 
		[28.0, 35.0], [28, 45], [28, 46], 
		[31, 46], [32, 46], [33, 46], 
		[33, 44], [33.0, 42.0], [33, 40], 
		[33.0, 37.0], [33, 34], [33.0, 30.5], 
		[33, 27], [33, 24], [33, 17], 
		[34, 14], [34, 7], [37, 2], 
		[34, 1], [30, 1], [28, 8], 
		[27, 20], [23, 20], [21.5, 20.0], 
		[20, 20], [18, 20], [15, 19], 
		 ]);
}}}

module ArchitectsDaughter_contour00x48_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([10.0, 12.0], [10, 8], [11, 2],steps,height);
	BezConic([2.0, 20.0], [3, 21], [3.5, 22.0],steps,height);
	BezConic([3.5, 22.0], [4, 23], [4.5, 24.0],steps,height);
	BezConic([4.5, 24.0], [5, 25], [5.0, 27.5],steps,height);
	BezConic([5.0, 27.5], [5, 30], [5.0, 33.0],steps,height);
	BezConic([5.5, 38.5], [6, 41], [6, 42],steps,height);
	BezConic([9, 23], [25, 23], [28, 25],steps,height);
	BezConic([31, 46], [32, 46], [33, 46],steps,height);
	BezConic([33, 46], [33, 44], [33.0, 42.0],steps,height);
	BezConic([33.0, 42.0], [33, 40], [33.0, 37.0],steps,height);
	BezConic([33.0, 37.0], [33, 34], [33.0, 30.5],steps,height);
	BezConic([33.0, 30.5], [33, 27], [33, 24],steps,height);
	BezConic([33, 24], [33, 17], [34, 14],steps,height);
	BezConic([34, 14], [34, 7], [37, 2],steps,height);
	BezConic([27, 20], [23, 20], [21.5, 20.0],steps,height);
	BezConic([21.5, 20.0], [20, 20], [18, 20],steps,height);
}
}

module ArchitectsDaughter_contour00x48_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([10, 18], [10, 16], [10.0, 12.0],steps,height);
	BezConic([4, 17], [1, 17], [1, 18],steps,height);
	BezConic([1, 18], [1, 19], [2.0, 20.0],steps,height);
	BezConic([5.0, 33.0], [5, 36], [5.5, 38.5],steps,height);
	BezConic([6, 42], [7, 43], [8, 43],steps,height);
	BezConic([8, 43], [9, 44], [10, 43],steps,height);
	BezConic([28, 45], [28, 46], [31, 46],steps,height);
	BezConic([37, 2], [34, 1], [30, 1],steps,height);
	BezConic([30, 1], [28, 8], [27, 20],steps,height);
	BezConic([18, 20], [15, 19], [10, 18],steps,height);
}
}

module ArchitectsDaughter_contour00x48(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x48_skeleton(height);
			ArchitectsDaughter_contour00x48_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x48_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x48(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x48(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x48=[[1, 0], [37, 46]];

module ArchitectsDaughter_letter0x48(steps=2, height) {
	ArchitectsDaughter_chunk10x48(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x49_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 1], [7, 0], [5, 0], 
		[4, 0], [2, 1], [2, 3], 
		[2.0, 9.0], [2, 15], [2.0, 19.5], 
		[2, 24], [2, 27], [2, 35], 
		[2, 35], [4, 36], [5.5, 36.0], 
		[7, 36], [7, 35], [7.0, 18.0], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 1], [7, 0], [5, 0], 
		[4, 0], [2, 1], [2, 3], 
		[2.0, 9.0], [2, 15], [2.0, 19.5], 
		[2, 24], [2, 27], [2, 35], 
		[2, 35], [4, 36], [5.5, 36.0], 
		[7, 36], [7, 35], [7.0, 18.0], 
		 ]);
}}}

module ArchitectsDaughter_contour00x49_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 1], [2, 3], [2.0, 9.0],steps,height);
	BezConic([2.0, 9.0], [2, 15], [2.0, 19.5],steps,height);
	BezConic([2.0, 19.5], [2, 24], [2, 27],steps,height);
	BezConic([2, 27], [2, 35], [2, 35],steps,height);
}
}

module ArchitectsDaughter_contour00x49_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 1], [7, 0], [5, 0],steps,height);
	BezConic([5, 0], [4, 0], [2, 1],steps,height);
	BezConic([2, 35], [4, 36], [5.5, 36.0],steps,height);
	BezConic([5.5, 36.0], [7, 36], [7, 35],steps,height);
}
}

module ArchitectsDaughter_contour00x49(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x49_skeleton(height);
			ArchitectsDaughter_contour00x49_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x49_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x49(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x49(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x49=[[2, 0], [7, 36]];

module ArchitectsDaughter_letter0x49(steps=2, height) {
	ArchitectsDaughter_chunk10x49(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x4a_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[27, 20], [27.0, 26.0], [27, 32], 
		[27, 35], [27.0, 37.0], [27, 39], 
		[28, 39], [30.0, 39.0], [32, 39], 
		[32, 38], [32.0, 35.5], [32, 33], 
		[32.0, 30.0], [32, 27], [32.0, 25.0], 
		[32, 23], [32.0, 19.5], [32, 16], 
		[32, 12], [30, 3], [27, 1], 
		[24, -1], [18, 0], [12, 1], 
		[7, 4], [1, 7], [1, 11], 
		[1, 13], [2, 14], [3, 16], 
		[5, 16], [5, 12], [7, 10], 
		[11, 5], [21, 5], [22, 5], 
		[24, 5],[27, 7], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[27, 20], [27.0, 26.0], [27, 32], 
		[27, 35], [27.0, 37.0], [27, 39], 
		[28, 39], [30.0, 39.0], [32, 39], 
		[32, 38], [32.0, 35.5], [32, 33], 
		[32.0, 30.0], [32, 27], [32.0, 25.0], 
		[32, 23], [32.0, 19.5], [32, 16], 
		[32, 12], [30, 3], [27, 1], 
		[24, -1], [18, 0], [12, 1], 
		[7, 4], [1, 7], [1, 11], 
		[1, 13], [2, 14], [3, 16], 
		[5, 16], [5, 12], [7, 10], 
		[11, 5], [21, 5], [22, 5], 
		[24, 5],[27, 7], ]);
}}}

module ArchitectsDaughter_contour00x4a_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([27, 32], [27, 35], [27.0, 37.0],steps,height);
	BezConic([32, 39], [32, 38], [32.0, 35.5],steps,height);
	BezConic([32.0, 35.5], [32, 33], [32.0, 30.0],steps,height);
	BezConic([32.0, 30.0], [32, 27], [32.0, 25.0],steps,height);
	BezConic([32.0, 25.0], [32, 23], [32.0, 19.5],steps,height);
	BezConic([32.0, 19.5], [32, 16], [32, 12],steps,height);
	BezConic([5, 16], [5, 12], [7, 10],steps,height);
	BezConic([7, 10], [11, 5], [21, 5],steps,height);
	BezConic([21, 5], [22, 5], [24, 5],steps,height);
	BezConic([24, 5], [27, 7], [27, 20],steps,height);
}
}

module ArchitectsDaughter_contour00x4a_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([27.0, 37.0], [27, 39], [28, 39],steps,height);
	BezConic([32, 12], [30, 3], [27, 1],steps,height);
	BezConic([27, 1], [24, -1], [18, 0],steps,height);
	BezConic([18, 0], [12, 1], [7, 4],steps,height);
	BezConic([7, 4], [1, 7], [1, 11],steps,height);
	BezConic([1, 11], [1, 13], [2, 14],steps,height);
	BezConic([2, 14], [3, 16], [5, 16],steps,height);
}
}

module ArchitectsDaughter_contour00x4a(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x4a_skeleton(height);
			ArchitectsDaughter_contour00x4a_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x4a_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x4a(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x4a(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x4a=[[1, -1], [32, 39]];

module ArchitectsDaughter_letter0x4a(steps=2, height) {
	ArchitectsDaughter_chunk10x4a(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x4b_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3, 1], [3, 1], [3.0, 1.5], 
		[3, 2], [3.0, 4.0], [3, 6], 
		[3.5, 9.0], [4, 12], [4.0, 15.5], 
		[4, 19], [4.0, 22.5], [4, 26], 
		[4.0, 29.5], [4, 33], [4, 36], 
		[5, 42], [6, 44], [6, 45], 
		[9, 45], [9, 45], [10, 45], 
		[10, 43], [9.5, 35.0], [9, 27], 
		[9, 26], [13, 28], [17.0, 30.5], 
		[21, 33], [24.0, 35.0], [27, 37], 
		[30.0, 38.5], [33, 40], [34, 40], 
		[36, 40], [36, 38], [36, 37], 
		[34.0, 35.0], [32, 33], [29.0, 31.5], 
		[26, 30], [22.5, 28.0], [19, 26], 
		[16.0, 24.5], [13, 23], [11.0, 21.5], 
		[9, 20], [9, 19], [10, 19], 
		[12.5, 17.5], [15, 16], [18.5, 14.5], 
		[22, 13], [25.5, 11.5], [29, 10], 
		[32, 8], [38, 5], [38, 2], 
		[38, 1], [37, 1], [37, 1], 
		[36, 1], [36.0, 1.0], [36, 1], 
		[33, 1], [30.0, 2.5], [27, 4], 
		[24.0, 6.0], [21, 8], [17.5, 10.0], 
		[14, 12], [9, 14], [9.0, 7.5], 
		[9, 1], [8, 1], [7, 0], 
		[6, 0], [4.5, 0.0], [3, 0], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3, 1], [3, 1], [3.0, 1.5], 
		[3, 2], [3.0, 4.0], [3, 6], 
		[3.5, 9.0], [4, 12], [4.0, 15.5], 
		[4, 19], [4.0, 22.5], [4, 26], 
		[4.0, 29.5], [4, 33], [4, 36], 
		[5, 42], [6, 44], [6, 45], 
		[9, 45], [9, 45], [10, 45], 
		[10, 43], [9.5, 35.0], [9, 27], 
		[9, 26], [13, 28], [17.0, 30.5], 
		[21, 33], [24.0, 35.0], [27, 37], 
		[30.0, 38.5], [33, 40], [34, 40], 
		[36, 40], [36, 38], [36, 37], 
		[34.0, 35.0], [32, 33], [29.0, 31.5], 
		[26, 30], [22.5, 28.0], [19, 26], 
		[16.0, 24.5], [13, 23], [11.0, 21.5], 
		[9, 20], [9, 19], [10, 19], 
		[12.5, 17.5], [15, 16], [18.5, 14.5], 
		[22, 13], [25.5, 11.5], [29, 10], 
		[32, 8], [38, 5], [38, 2], 
		[38, 1], [37, 1], [37, 1], 
		[36, 1], [36.0, 1.0], [36, 1], 
		[33, 1], [30.0, 2.5], [27, 4], 
		[24.0, 6.0], [21, 8], [17.5, 10.0], 
		[14, 12], [9, 14], [9.0, 7.5], 
		[9, 1], [8, 1], [7, 0], 
		[6, 0], [4.5, 0.0], [3, 0], 
		 ]);
}}}

module ArchitectsDaughter_contour00x4b_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 1], [3, 1], [3.0, 1.5],steps,height);
	BezConic([3.0, 1.5], [3, 2], [3.0, 4.0],steps,height);
	BezConic([3.5, 9.0], [4, 12], [4.0, 15.5],steps,height);
	BezConic([4.0, 15.5], [4, 19], [4.0, 22.5],steps,height);
	BezConic([4.0, 22.5], [4, 26], [4.0, 29.5],steps,height);
	BezConic([4.0, 29.5], [4, 33], [4, 36],steps,height);
	BezConic([9, 45], [9, 45], [10, 45],steps,height);
	BezConic([9.5, 35.0], [9, 27], [9, 26],steps,height);
	BezConic([9, 26], [13, 28], [17.0, 30.5],steps,height);
	BezConic([17.0, 30.5], [21, 33], [24.0, 35.0],steps,height);
	BezConic([29.0, 31.5], [26, 30], [22.5, 28.0],steps,height);
	BezConic([16.0, 24.5], [13, 23], [11.0, 21.5],steps,height);
	BezConic([11.0, 21.5], [9, 20], [9, 19],steps,height);
	BezConic([12.5, 17.5], [15, 16], [18.5, 14.5],steps,height);
	BezConic([18.5, 14.5], [22, 13], [25.5, 11.5],steps,height);
	BezConic([37, 1], [37, 1], [36, 1],steps,height);
	BezConic([24.0, 6.0], [21, 8], [17.5, 10.0],steps,height);
	BezConic([17.5, 10.0], [14, 12], [9, 14],steps,height);
	BezConic([9, 1], [8, 1], [7, 0],steps,height);
	BezConic([7, 0], [6, 0], [4.5, 0.0],steps,height);
}
}

module ArchitectsDaughter_contour00x4b_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.0, 4.0], [3, 6], [3.5, 9.0],steps,height);
	BezConic([4, 36], [5, 42], [6, 44],steps,height);
	BezConic([6, 44], [6, 45], [9, 45],steps,height);
	BezConic([10, 45], [10, 43], [9.5, 35.0],steps,height);
	BezConic([24.0, 35.0], [27, 37], [30.0, 38.5],steps,height);
	BezConic([30.0, 38.5], [33, 40], [34, 40],steps,height);
	BezConic([34, 40], [36, 40], [36, 38],steps,height);
	BezConic([36, 38], [36, 37], [34.0, 35.0],steps,height);
	BezConic([34.0, 35.0], [32, 33], [29.0, 31.5],steps,height);
	BezConic([22.5, 28.0], [19, 26], [16.0, 24.5],steps,height);
	BezConic([9, 19], [10, 19], [12.5, 17.5],steps,height);
	BezConic([25.5, 11.5], [29, 10], [32, 8],steps,height);
	BezConic([32, 8], [38, 5], [38, 2],steps,height);
	BezConic([38, 2], [38, 1], [37, 1],steps,height);
	BezConic([36, 1], [33, 1], [30.0, 2.5],steps,height);
	BezConic([30.0, 2.5], [27, 4], [24.0, 6.0],steps,height);
	BezConic([4.5, 0.0], [3, 0], [3, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x4b(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x4b_skeleton(height);
			ArchitectsDaughter_contour00x4b_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x4b_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x4b(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x4b(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x4b=[[3, 0], [38, 45]];

module ArchitectsDaughter_letter0x4b(steps=2, height) {
	ArchitectsDaughter_chunk10x4b(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x4c_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 27], [5.0, 35.0], [5, 43], 
		[7.5, 43.0], [10, 43], [9.5, 24.5], 
		[9, 6], [25.5, 5.5], [42, 5], 
		[43, 5], [43.0, 4.0], [43, 3], 
		[42, 3], [41, 1], [38, 1], 
		[38, 1], [37, 1], [20.0, 1.0], 
		[3, 1],[5, 7], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 27], [5.0, 35.0], [5, 43], 
		[7.5, 43.0], [10, 43], [9.5, 24.5], 
		[9, 6], [25.5, 5.5], [42, 5], 
		[43, 5], [43.0, 4.0], [43, 3], 
		[42, 3], [41, 1], [38, 1], 
		[38, 1], [37, 1], [20.0, 1.0], 
		[3, 1],[5, 7], ]);
}}}

module ArchitectsDaughter_contour00x4c_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([38, 1], [38, 1], [37, 1],steps,height);
	BezConic([3, 1], [5, 7], [5, 27],steps,height);
}
}

module ArchitectsDaughter_contour00x4c_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([42, 5], [43, 5], [43.0, 4.0],steps,height);
	BezConic([43.0, 4.0], [43, 3], [42, 3],steps,height);
	BezConic([42, 3], [41, 1], [38, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x4c(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x4c_skeleton(height);
			ArchitectsDaughter_contour00x4c_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x4c_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x4c(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x4c(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x4c=[[3, 1], [43, 43]];

module ArchitectsDaughter_letter0x4c(steps=2, height) {
	ArchitectsDaughter_chunk10x4c(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x4d_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[8, 10], [8.0, 8.0], [8, 6], 
		[8, 6], [8.0, 5.0], [8, 4], 
		[7.0, 3.0], [6, 2], [5.0, 2.0], 
		[4, 2], [4, 2], [2, 2], 
		[2, 4], [2, 5], [3.5, 16.0], 
		[5, 27], [5.0, 30.0], [5, 33], 
		[5.5, 35.0], [6, 37], [6.0, 38.0], 
		[6, 39], [6.5, 40.0], [7, 41], 
		[7, 41], [8, 43], [11, 43], 
		[15, 40], [20, 30], [23, 22], 
		[24.5, 20.0], [26, 18], [27, 18], 
		[33.0, 28.5], [39, 39], [40, 40], 
		[41, 40], [43, 40], [44.0, 38.5], 
		[45, 37], [46.0, 34.5], [47, 32], 
		[47.5, 28.5], [48, 25], [48.5, 21.5], 
		[49, 18], [49, 15], [50, 7], 
		[50.5, 5.0], [51, 3], [51.0, 2.5], 
		[51, 2], [50.5, 1.0], [50, 0], 
		[49.0, 0.0], [48, 0], [47.0, 1.0], 
		[46, 2], [45.5, 3.0], [45, 4], 
		[45.0, 6.0], [45, 8], [44.5, 10.0], 
		[44, 12], [44.0, 15.0], [44, 18], 
		[43.5, 20.0], [43, 22], [42.5, 24.0], 
		[42, 26], [42, 27], [42, 28], 
		[42.0, 29.0], [42, 30], [41.5, 30.5], 
		[41, 31], [40.0, 30.0], [39, 29], 
		[38, 27], [34, 21], [28, 8], 
		[27, 7], [25, 8], [24, 9], 
		[23, 12], [17.0, 24.5], [11, 37], 
		[10, 34], [8, 17], [8, 15], 
		[8, 14],[8, 12], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[8, 10], [8.0, 8.0], [8, 6], 
		[8, 6], [8.0, 5.0], [8, 4], 
		[7.0, 3.0], [6, 2], [5.0, 2.0], 
		[4, 2], [4, 2], [2, 2], 
		[2, 4], [2, 5], [3.5, 16.0], 
		[5, 27], [5.0, 30.0], [5, 33], 
		[5.5, 35.0], [6, 37], [6.0, 38.0], 
		[6, 39], [6.5, 40.0], [7, 41], 
		[7, 41], [8, 43], [11, 43], 
		[15, 40], [20, 30], [23, 22], 
		[24.5, 20.0], [26, 18], [27, 18], 
		[33.0, 28.5], [39, 39], [40, 40], 
		[41, 40], [43, 40], [44.0, 38.5], 
		[45, 37], [46.0, 34.5], [47, 32], 
		[47.5, 28.5], [48, 25], [48.5, 21.5], 
		[49, 18], [49, 15], [50, 7], 
		[50.5, 5.0], [51, 3], [51.0, 2.5], 
		[51, 2], [50.5, 1.0], [50, 0], 
		[49.0, 0.0], [48, 0], [47.0, 1.0], 
		[46, 2], [45.5, 3.0], [45, 4], 
		[45.0, 6.0], [45, 8], [44.5, 10.0], 
		[44, 12], [44.0, 15.0], [44, 18], 
		[43.5, 20.0], [43, 22], [42.5, 24.0], 
		[42, 26], [42, 27], [42, 28], 
		[42.0, 29.0], [42, 30], [41.5, 30.5], 
		[41, 31], [40.0, 30.0], [39, 29], 
		[38, 27], [34, 21], [28, 8], 
		[27, 7], [25, 8], [24, 9], 
		[23, 12], [17.0, 24.5], [11, 37], 
		[10, 34], [8, 17], [8, 15], 
		[8, 14],[8, 12], ]);
}}}

module ArchitectsDaughter_contour00x4d_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5.0, 2.0], [4, 2], [4, 2],steps,height);
	BezConic([3.5, 16.0], [5, 27], [5.0, 30.0],steps,height);
	BezConic([5.5, 35.0], [6, 37], [6.0, 38.0],steps,height);
	BezConic([6.5, 40.0], [7, 41], [7, 41],steps,height);
	BezConic([20, 30], [23, 22], [24.5, 20.0],steps,height);
	BezConic([24.5, 20.0], [26, 18], [27, 18],steps,height);
	BezConic([49, 15], [50, 7], [50.5, 5.0],steps,height);
	BezConic([45.0, 6.0], [45, 8], [44.5, 10.0],steps,height);
	BezConic([44.0, 15.0], [44, 18], [43.5, 20.0],steps,height);
	BezConic([43.5, 20.0], [43, 22], [42.5, 24.0],steps,height);
	BezConic([42, 27], [42, 28], [42.0, 29.0],steps,height);
	BezConic([42.0, 29.0], [42, 30], [41.5, 30.5],steps,height);
	BezConic([41.5, 30.5], [41, 31], [40.0, 30.0],steps,height);
	BezConic([40.0, 30.0], [39, 29], [38, 27],steps,height);
	BezConic([38, 27], [34, 21], [28, 8],steps,height);
	BezConic([11, 37], [10, 34], [8, 17],steps,height);
	BezConic([8, 14], [8, 12], [8, 10],steps,height);
}
}

module ArchitectsDaughter_contour00x4d_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8, 6], [8, 6], [8.0, 5.0],steps,height);
	BezConic([8.0, 5.0], [8, 4], [7.0, 3.0],steps,height);
	BezConic([7.0, 3.0], [6, 2], [5.0, 2.0],steps,height);
	BezConic([4, 2], [2, 2], [2, 4],steps,height);
	BezConic([2, 4], [2, 5], [3.5, 16.0],steps,height);
	BezConic([5.0, 30.0], [5, 33], [5.5, 35.0],steps,height);
	BezConic([6.0, 38.0], [6, 39], [6.5, 40.0],steps,height);
	BezConic([7, 41], [8, 43], [11, 43],steps,height);
	BezConic([11, 43], [15, 40], [20, 30],steps,height);
	BezConic([39, 39], [40, 40], [41, 40],steps,height);
	BezConic([41, 40], [43, 40], [44.0, 38.5],steps,height);
	BezConic([44.0, 38.5], [45, 37], [46.0, 34.5],steps,height);
	BezConic([46.0, 34.5], [47, 32], [47.5, 28.5],steps,height);
	BezConic([47.5, 28.5], [48, 25], [48.5, 21.5],steps,height);
	BezConic([48.5, 21.5], [49, 18], [49, 15],steps,height);
	BezConic([50.5, 5.0], [51, 3], [51.0, 2.5],steps,height);
	BezConic([51.0, 2.5], [51, 2], [50.5, 1.0],steps,height);
	BezConic([50.5, 1.0], [50, 0], [49.0, 0.0],steps,height);
	BezConic([49.0, 0.0], [48, 0], [47.0, 1.0],steps,height);
	BezConic([47.0, 1.0], [46, 2], [45.5, 3.0],steps,height);
	BezConic([45.5, 3.0], [45, 4], [45.0, 6.0],steps,height);
	BezConic([44.5, 10.0], [44, 12], [44.0, 15.0],steps,height);
	BezConic([42.5, 24.0], [42, 26], [42, 27],steps,height);
	BezConic([28, 8], [27, 7], [25, 8],steps,height);
	BezConic([25, 8], [24, 9], [23, 12],steps,height);
	BezConic([8, 17], [8, 15], [8, 14],steps,height);
}
}

module ArchitectsDaughter_contour00x4d(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x4d_skeleton(height);
			ArchitectsDaughter_contour00x4d_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x4d_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x4d(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x4d(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x4d=[[2, 0], [51, 43]];

module ArchitectsDaughter_letter0x4d(steps=2, height) {
	ArchitectsDaughter_chunk10x4d(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x4e_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[38, 22], [38, 3], [36, 0], 
		[34.0, 0.0], [32, 0], [28, 6], 
		[20, 17], [17, 21], [14.0, 25.5], 
		[11, 30], [8, 34], [7, 28], 
		[7, 11], [7, 5], [7, 1], 
		[6, -1], [4.5, -1.0], [3, -1], 
		[2.5, -0.5], [2, 0], [2.0, 0.5], 
		[2, 1], [2.0, 2.5], [2, 4], 
		[2.0, 7.5], [2, 11], [3, 15], 
		[3, 24], [3.0, 31.0], [3, 38], 
		[3, 43], [4, 44], [5.0, 44.5], 
		[6, 45], [7.0, 44.5], [8, 44], 
		[9.5, 42.0], [11, 40], [13, 36], 
		[22, 23], [31, 11], [32.0, 27.0], 
		[33, 43], [33, 44], [34.0, 44.5], 
		[35, 45], [36, 45], [38, 45], 
		[38, 41], [38.0, 39.5], [38, 38], 
		[38.0, 30.0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[38, 22], [38, 3], [36, 0], 
		[34.0, 0.0], [32, 0], [28, 6], 
		[20, 17], [17, 21], [14.0, 25.5], 
		[11, 30], [8, 34], [7, 28], 
		[7, 11], [7, 5], [7, 1], 
		[6, -1], [4.5, -1.0], [3, -1], 
		[2.5, -0.5], [2, 0], [2.0, 0.5], 
		[2, 1], [2.0, 2.5], [2, 4], 
		[2.0, 7.5], [2, 11], [3, 15], 
		[3, 24], [3.0, 31.0], [3, 38], 
		[3, 43], [4, 44], [5.0, 44.5], 
		[6, 45], [7.0, 44.5], [8, 44], 
		[9.5, 42.0], [11, 40], [13, 36], 
		[22, 23], [31, 11], [32.0, 27.0], 
		[33, 43], [33, 44], [34.0, 44.5], 
		[35, 45], [36, 45], [38, 45], 
		[38, 41], [38.0, 39.5], [38, 38], 
		[38.0, 30.0], ]);
}}}

module ArchitectsDaughter_contour00x4e_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([32, 0], [28, 6], [20, 17],steps,height);
	BezConic([14.0, 25.5], [11, 30], [8, 34],steps,height);
	BezConic([8, 34], [7, 28], [7, 11],steps,height);
	BezConic([7, 11], [7, 5], [7, 1],steps,height);
	BezConic([2.0, 0.5], [2, 1], [2.0, 2.5],steps,height);
	BezConic([2.0, 2.5], [2, 4], [2.0, 7.5],steps,height);
	BezConic([3, 15], [3, 24], [3.0, 31.0],steps,height);
	BezConic([3.0, 31.0], [3, 38], [3, 43],steps,height);
	BezConic([13, 36], [22, 23], [31, 11],steps,height);
}
}

module ArchitectsDaughter_contour00x4e_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([38, 22], [38, 3], [36, 0],steps,height);
	BezConic([20, 17], [17, 21], [14.0, 25.5],steps,height);
	BezConic([7, 1], [6, -1], [4.5, -1.0],steps,height);
	BezConic([4.5, -1.0], [3, -1], [2.5, -0.5],steps,height);
	BezConic([2.5, -0.5], [2, 0], [2.0, 0.5],steps,height);
	BezConic([2.0, 7.5], [2, 11], [3, 15],steps,height);
	BezConic([3, 43], [4, 44], [5.0, 44.5],steps,height);
	BezConic([5.0, 44.5], [6, 45], [7.0, 44.5],steps,height);
	BezConic([7.0, 44.5], [8, 44], [9.5, 42.0],steps,height);
	BezConic([9.5, 42.0], [11, 40], [13, 36],steps,height);
	BezConic([33, 43], [33, 44], [34.0, 44.5],steps,height);
	BezConic([34.0, 44.5], [35, 45], [36, 45],steps,height);
	BezConic([36, 45], [38, 45], [38, 41],steps,height);
}
}

module ArchitectsDaughter_contour00x4e(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x4e_skeleton(height);
			ArchitectsDaughter_contour00x4e_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x4e_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x4e(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x4e(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x4e=[[2, -1], [38, 45]];

module ArchitectsDaughter_letter0x4e(steps=2, height) {
	ArchitectsDaughter_chunk10x4e(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x4f_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3, 11], [1, 14], [1.0, 18.5], 
		[1, 23], [2.5, 26.5], [4, 30], 
		[7, 33], [12, 38], [21, 38], 
		[29, 38], [35, 34], [41, 30], 
		[41, 21], [41, 11], [36.0, 6.0], 
		[31, 1], [21, 1], [7, 1], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3, 11], [1, 14], [1.0, 18.5], 
		[1, 23], [2.5, 26.5], [4, 30], 
		[7, 33], [12, 38], [21, 38], 
		[29, 38], [35, 34], [41, 30], 
		[41, 21], [41, 11], [36.0, 6.0], 
		[31, 1], [21, 1], [7, 1], 
		 ]);
}}}

module ArchitectsDaughter_contour00x4f_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour00x4f_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 11], [1, 14], [1.0, 18.5],steps,height);
	BezConic([1.0, 18.5], [1, 23], [2.5, 26.5],steps,height);
	BezConic([2.5, 26.5], [4, 30], [7, 33],steps,height);
	BezConic([7, 33], [12, 38], [21, 38],steps,height);
	BezConic([21, 38], [29, 38], [35, 34],steps,height);
	BezConic([35, 34], [41, 30], [41, 21],steps,height);
	BezConic([41, 21], [41, 11], [36.0, 6.0],steps,height);
	BezConic([36.0, 6.0], [31, 1], [21, 1],steps,height);
	BezConic([21, 1], [7, 1], [3, 11],steps,height);
}
}

module ArchitectsDaughter_contour00x4f(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x4f_skeleton(height);
			ArchitectsDaughter_contour00x4f_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x4f_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x4f_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 20], [7, 5], [21, 5], 
		[29, 5], [33, 9], [38, 14], 
		[38, 21], [38, 27], [32, 31], 
		[28, 34], [21, 34], [15, 34], 
		[11, 30],[7, 26], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 20], [7, 5], [21, 5], 
		[29, 5], [33, 9], [38, 14], 
		[38, 21], [38, 27], [32, 31], 
		[28, 34], [21, 34], [15, 34], 
		[11, 30],[7, 26], ]);
}}}

module ArchitectsDaughter_contour10x4f_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 20], [7, 5], [21, 5],steps,height);
	BezConic([21, 5], [29, 5], [33, 9],steps,height);
	BezConic([33, 9], [38, 14], [38, 21],steps,height);
	BezConic([38, 21], [38, 27], [32, 31],steps,height);
	BezConic([32, 31], [28, 34], [21, 34],steps,height);
	BezConic([21, 34], [15, 34], [11, 30],steps,height);
	BezConic([11, 30], [7, 26], [7, 20],steps,height);
}
}

module ArchitectsDaughter_contour10x4f_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x4f(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x4f_skeleton(height);
			ArchitectsDaughter_contour10x4f_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x4f_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x4f(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x4f(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x4f(steps, height);
	}
}

ArchitectsDaughter_bbox0x4f=[[1, 1], [41, 38]];

module ArchitectsDaughter_letter0x4f(steps=2, height) {
	ArchitectsDaughter_chunk10x4f(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x50_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 0], [3.5, 0.0], [2, 0], 
		[2.0, 7.5], [2, 15], [3, 19], 
		[3.0, 23.0], [3, 27], [3.5, 29.5], 
		[4, 32], [5.0, 33.5], [6, 35], 
		[9, 36], [13, 38], [24, 38], 
		[28, 38], [31.5, 37.5], [35, 37], 
		[36, 36], [40, 34], [40.0, 31.0], 
		[40, 28], [38.0, 25.5], [36, 23], 
		[33.5, 21.0], [31, 19], [27.0, 18.0], 
		[23, 17], [20, 16], [14, 15], 
		[8, 15], [7.5, 8.0], [7, 1], 
		[7, 0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 0], [3.5, 0.0], [2, 0], 
		[2.0, 7.5], [2, 15], [3, 19], 
		[3.0, 23.0], [3, 27], [3.5, 29.5], 
		[4, 32], [5.0, 33.5], [6, 35], 
		[9, 36], [13, 38], [24, 38], 
		[28, 38], [31.5, 37.5], [35, 37], 
		[36, 36], [40, 34], [40.0, 31.0], 
		[40, 28], [38.0, 25.5], [36, 23], 
		[33.5, 21.0], [31, 19], [27.0, 18.0], 
		[23, 17], [20, 16], [14, 15], 
		[8, 15], [7.5, 8.0], [7, 1], 
		[7, 0], ]);
}}}

module ArchitectsDaughter_contour00x50_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 15], [3, 19], [3.0, 23.0],steps,height);
	BezConic([27.0, 18.0], [23, 17], [20, 16],steps,height);
}
}

module ArchitectsDaughter_contour00x50_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.0, 23.0], [3, 27], [3.5, 29.5],steps,height);
	BezConic([3.5, 29.5], [4, 32], [5.0, 33.5],steps,height);
	BezConic([5.0, 33.5], [6, 35], [9, 36],steps,height);
	BezConic([9, 36], [13, 38], [24, 38],steps,height);
	BezConic([24, 38], [28, 38], [31.5, 37.5],steps,height);
	BezConic([31.5, 37.5], [35, 37], [36, 36],steps,height);
	BezConic([36, 36], [40, 34], [40.0, 31.0],steps,height);
	BezConic([40.0, 31.0], [40, 28], [38.0, 25.5],steps,height);
	BezConic([38.0, 25.5], [36, 23], [33.5, 21.0],steps,height);
	BezConic([33.5, 21.0], [31, 19], [27.0, 18.0],steps,height);
	BezConic([20, 16], [14, 15], [8, 15],steps,height);
	BezConic([7, 1], [7, 0], [5, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x50(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x50_skeleton(height);
			ArchitectsDaughter_contour00x50_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x50_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x50_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[8, 22], [8, 19], [10, 19], 
		[11, 19], [12.0, 19.0], [13, 19], 
		[15.0, 19.0], [17, 19], [19.5, 19.5], 
		[22, 20], [25.0, 20.5], [28, 21], 
		[30, 23], [35, 25], [35, 29], 
		[34, 33], [27, 34], [25, 35], 
		[23.5, 35.0], [22, 35], [20.0, 34.5], 
		[18, 34], [15.5, 33.5], [13, 33], 
		[11.0, 31.5], [9, 30], [9, 28], 
		[9, 28], [8, 27], [8, 23], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[8, 22], [8, 19], [10, 19], 
		[11, 19], [12.0, 19.0], [13, 19], 
		[15.0, 19.0], [17, 19], [19.5, 19.5], 
		[22, 20], [25.0, 20.5], [28, 21], 
		[30, 23], [35, 25], [35, 29], 
		[34, 33], [27, 34], [25, 35], 
		[23.5, 35.0], [22, 35], [20.0, 34.5], 
		[18, 34], [15.5, 33.5], [13, 33], 
		[11.0, 31.5], [9, 30], [9, 28], 
		[9, 28], [8, 27], [8, 23], 
		 ]);
}}}

module ArchitectsDaughter_contour10x50_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8, 22], [8, 19], [10, 19],steps,height);
	BezConic([10, 19], [11, 19], [12.0, 19.0],steps,height);
	BezConic([12.0, 19.0], [13, 19], [15.0, 19.0],steps,height);
	BezConic([15.0, 19.0], [17, 19], [19.5, 19.5],steps,height);
	BezConic([25.0, 20.5], [28, 21], [30, 23],steps,height);
	BezConic([30, 23], [35, 25], [35, 29],steps,height);
	BezConic([35, 29], [34, 33], [27, 34],steps,height);
	BezConic([27, 34], [25, 35], [23.5, 35.0],steps,height);
	BezConic([23.5, 35.0], [22, 35], [20.0, 34.5],steps,height);
	BezConic([15.5, 33.5], [13, 33], [11.0, 31.5],steps,height);
	BezConic([11.0, 31.5], [9, 30], [9, 28],steps,height);
	BezConic([8, 27], [8, 23], [8, 22],steps,height);
}
}

module ArchitectsDaughter_contour10x50_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([19.5, 19.5], [22, 20], [25.0, 20.5],steps,height);
	BezConic([20.0, 34.5], [18, 34], [15.5, 33.5],steps,height);
	BezConic([9, 28], [9, 28], [8, 27],steps,height);
}
}

module ArchitectsDaughter_contour10x50(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x50_skeleton(height);
			ArchitectsDaughter_contour10x50_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x50_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x50(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x50(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x50(steps, height);
	}
}

ArchitectsDaughter_bbox0x50=[[2, 0], [40, 38]];

module ArchitectsDaughter_letter0x50(steps=2, height) {
	ArchitectsDaughter_chunk10x50(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x51_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 15], [2, 19], [3.0, 23.5], 
		[4, 28], [7.0, 31.5], [10, 35], 
		[14.0, 37.5], [18, 40], [23, 40], 
		[24, 40], [24, 40], [32, 40], 
		[37, 35], [41, 30], [41, 23], 
		[41, 16], [37, 10], [37, 10], 
		[37.0, 9.0], [37, 8], [38.0, 7.5], 
		[39, 7], [40.0, 6.5], [41, 6], 
		[42.0, 5.5], [43, 5], [43.0, 4.0], 
		[43, 3], [43, 3], [43, 3], 
		[41.5, 2.5], [40, 2], [39.5, 2.0], 
		[39, 2], [38.5, 2.5], [38, 3], 
		[37, 4], [36, 5], [34, 5], 
		[32, 3], [27, 1], [15, -3], 
		[7, 4],[2, 8], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 15], [2, 19], [3.0, 23.5], 
		[4, 28], [7.0, 31.5], [10, 35], 
		[14.0, 37.5], [18, 40], [23, 40], 
		[24, 40], [24, 40], [32, 40], 
		[37, 35], [41, 30], [41, 23], 
		[41, 16], [37, 10], [37, 10], 
		[37.0, 9.0], [37, 8], [38.0, 7.5], 
		[39, 7], [40.0, 6.5], [41, 6], 
		[42.0, 5.5], [43, 5], [43.0, 4.0], 
		[43, 3], [43, 3], [43, 3], 
		[41.5, 2.5], [40, 2], [39.5, 2.0], 
		[39, 2], [38.5, 2.5], [38, 3], 
		[37, 4], [36, 5], [34, 5], 
		[32, 3], [27, 1], [15, -3], 
		[7, 4],[2, 8], ]);
}}}

module ArchitectsDaughter_contour00x51_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([23, 40], [24, 40], [24, 40],steps,height);
	BezConic([37.0, 9.0], [37, 8], [38.0, 7.5],steps,height);
	BezConic([38.0, 7.5], [39, 7], [40.0, 6.5],steps,height);
	BezConic([43.0, 4.0], [43, 3], [43, 3],steps,height);
	BezConic([38.5, 2.5], [38, 3], [37, 4],steps,height);
	BezConic([37, 4], [36, 5], [34, 5],steps,height);
}
}

module ArchitectsDaughter_contour00x51_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 15], [2, 19], [3.0, 23.5],steps,height);
	BezConic([3.0, 23.5], [4, 28], [7.0, 31.5],steps,height);
	BezConic([7.0, 31.5], [10, 35], [14.0, 37.5],steps,height);
	BezConic([14.0, 37.5], [18, 40], [23, 40],steps,height);
	BezConic([24, 40], [32, 40], [37, 35],steps,height);
	BezConic([37, 35], [41, 30], [41, 23],steps,height);
	BezConic([41, 23], [41, 16], [37, 10],steps,height);
	BezConic([37, 10], [37, 10], [37.0, 9.0],steps,height);
	BezConic([40.0, 6.5], [41, 6], [42.0, 5.5],steps,height);
	BezConic([42.0, 5.5], [43, 5], [43.0, 4.0],steps,height);
	BezConic([43, 3], [43, 3], [41.5, 2.5],steps,height);
	BezConic([41.5, 2.5], [40, 2], [39.5, 2.0],steps,height);
	BezConic([39.5, 2.0], [39, 2], [38.5, 2.5],steps,height);
	BezConic([34, 5], [32, 3], [27, 1],steps,height);
	BezConic([27, 1], [15, -3], [7, 4],steps,height);
	BezConic([7, 4], [2, 8], [2, 15],steps,height);
}
}

module ArchitectsDaughter_contour00x51(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x51_skeleton(height);
			ArchitectsDaughter_contour00x51_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x51_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x51_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[21, 4], [25, 4], [26, 4], 
		[30, 5], [31, 7], [25.0, 12.5], 
		[19, 18], [19, 18], [19, 18], 
		[19.0, 18.0], [19, 18], [19, 19], 
		[20.0, 19.5], [21, 20], [22.5, 20.0], 
		[24, 20], [25.5, 19.0], [27, 18], 
		[28.5, 16.5], [30, 15], [31.0, 13.5], 
		[32, 12], [34, 11], [37, 16], 
		[37, 22], [37, 24], [37, 26], 
		[37, 28], [36, 30], [35, 34], 
		[29, 35], [26, 36], [23.0, 36.0], 
		[20, 36], [20, 36], [16, 36], 
		[13, 32], [10, 29], [8, 24], 
		[7, 20], [7, 16], [7, 10], 
		[10.5, 7.0],[14, 4], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[21, 4], [25, 4], [26, 4], 
		[30, 5], [31, 7], [25.0, 12.5], 
		[19, 18], [19, 18], [19, 18], 
		[19.0, 18.0], [19, 18], [19, 19], 
		[20.0, 19.5], [21, 20], [22.5, 20.0], 
		[24, 20], [25.5, 19.0], [27, 18], 
		[28.5, 16.5], [30, 15], [31.0, 13.5], 
		[32, 12], [34, 11], [37, 16], 
		[37, 22], [37, 24], [37, 26], 
		[37, 28], [36, 30], [35, 34], 
		[29, 35], [26, 36], [23.0, 36.0], 
		[20, 36], [20, 36], [16, 36], 
		[13, 32], [10, 29], [8, 24], 
		[7, 20], [7, 16], [7, 10], 
		[10.5, 7.0],[14, 4], ]);
}}}

module ArchitectsDaughter_contour10x51_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([21, 4], [25, 4], [26, 4],steps,height);
	BezConic([26, 4], [30, 5], [31, 7],steps,height);
	BezConic([19, 18], [19, 18], [19, 18],steps,height);
	BezConic([31.0, 13.5], [32, 12], [34, 11],steps,height);
	BezConic([34, 11], [37, 16], [37, 22],steps,height);
	BezConic([37, 22], [37, 24], [37, 26],steps,height);
	BezConic([37, 26], [37, 28], [36, 30],steps,height);
	BezConic([36, 30], [35, 34], [29, 35],steps,height);
	BezConic([29, 35], [26, 36], [23.0, 36.0],steps,height);
	BezConic([23.0, 36.0], [20, 36], [20, 36],steps,height);
	BezConic([20, 36], [16, 36], [13, 32],steps,height);
	BezConic([13, 32], [10, 29], [8, 24],steps,height);
	BezConic([8, 24], [7, 20], [7, 16],steps,height);
	BezConic([7, 16], [7, 10], [10.5, 7.0],steps,height);
	BezConic([10.5, 7.0], [14, 4], [21, 4],steps,height);
}
}

module ArchitectsDaughter_contour10x51_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([19, 18], [19, 19], [20.0, 19.5],steps,height);
	BezConic([20.0, 19.5], [21, 20], [22.5, 20.0],steps,height);
	BezConic([22.5, 20.0], [24, 20], [25.5, 19.0],steps,height);
	BezConic([25.5, 19.0], [27, 18], [28.5, 16.5],steps,height);
	BezConic([28.5, 16.5], [30, 15], [31.0, 13.5],steps,height);
}
}

module ArchitectsDaughter_contour10x51(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x51_skeleton(height);
			ArchitectsDaughter_contour10x51_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x51_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x51(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x51(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x51(steps, height);
	}
}

ArchitectsDaughter_bbox0x51=[[2, -3], [43, 40]];

module ArchitectsDaughter_letter0x51(steps=2, height) {
	ArchitectsDaughter_chunk10x51(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x52_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 37], [11, 40], [20, 40], 
		[25, 40], [29.0, 39.0], [33, 38], 
		[35.0, 37.0], [37, 36], [37, 34], 
		[37, 31], [29, 27], [28, 27], 
		[23.0, 25.0], [18, 23], [16, 23], 
		[12, 21], [11, 21], [11, 20], 
		[11.0, 20.0], [11, 20], [12.0, 19.5], 
		[13, 19], [15.0, 18.0], [17, 17], 
		[20, 15], [30, 10], [41, 3], 
		[41, 3], [42.0, 2.5], [43, 2], 
		[43.0, 1.0], [43, 0], [42.5, 0.0], 
		[42, 0], [41.0, -0.5], [40, -1], 
		[40, -1], [39.0, -1.0], [38, -1], 
		[37, -1], [33.0, 2.0], [29, 5], 
		[26.0, 7.0], [23, 9], [20, 11], 
		[13, 15], [9, 16], [9.0, 9.0], 
		[9, 2], [9, 1], [7, 1], 
		[6.5, 1.0], [6, 1], [5, 1], 
		[4, 2], [4, 4], [4, 10], 
		[4.0, 16.0], [4, 22], [4, 31], 
		[3, 38], [4, 41], [7, 38], 
		[7, 38], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 37], [11, 40], [20, 40], 
		[25, 40], [29.0, 39.0], [33, 38], 
		[35.0, 37.0], [37, 36], [37, 34], 
		[37, 31], [29, 27], [28, 27], 
		[23.0, 25.0], [18, 23], [16, 23], 
		[12, 21], [11, 21], [11, 20], 
		[11.0, 20.0], [11, 20], [12.0, 19.5], 
		[13, 19], [15.0, 18.0], [17, 17], 
		[20, 15], [30, 10], [41, 3], 
		[41, 3], [42.0, 2.5], [43, 2], 
		[43.0, 1.0], [43, 0], [42.5, 0.0], 
		[42, 0], [41.0, -0.5], [40, -1], 
		[40, -1], [39.0, -1.0], [38, -1], 
		[37, -1], [33.0, 2.0], [29, 5], 
		[26.0, 7.0], [23, 9], [20, 11], 
		[13, 15], [9, 16], [9.0, 9.0], 
		[9, 2], [9, 1], [7, 1], 
		[6.5, 1.0], [6, 1], [5, 1], 
		[4, 2], [4, 4], [4, 10], 
		[4.0, 16.0], [4, 22], [4, 31], 
		[3, 38], [4, 41], [7, 38], 
		[7, 38], ]);
}}}

module ArchitectsDaughter_contour00x52_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([29, 27], [28, 27], [23.0, 25.0],steps,height);
	BezConic([11, 21], [11, 20], [11.0, 20.0],steps,height);
	BezConic([12.0, 19.5], [13, 19], [15.0, 18.0],steps,height);
	BezConic([42.5, 0.0], [42, 0], [41.0, -0.5],steps,height);
	BezConic([41.0, -0.5], [40, -1], [40, -1],steps,height);
	BezConic([33.0, 2.0], [29, 5], [26.0, 7.0],steps,height);
	BezConic([20, 11], [13, 15], [9, 16],steps,height);
	BezConic([4, 2], [4, 4], [4, 10],steps,height);
	BezConic([4, 22], [4, 31], [3, 38],steps,height);
}
}

module ArchitectsDaughter_contour00x52_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 37], [11, 40], [20, 40],steps,height);
	BezConic([20, 40], [25, 40], [29.0, 39.0],steps,height);
	BezConic([29.0, 39.0], [33, 38], [35.0, 37.0],steps,height);
	BezConic([35.0, 37.0], [37, 36], [37, 34],steps,height);
	BezConic([37, 34], [37, 31], [29, 27],steps,height);
	BezConic([23.0, 25.0], [18, 23], [16, 23],steps,height);
	BezConic([16, 23], [12, 21], [11, 21],steps,height);
	BezConic([11.0, 20.0], [11, 20], [12.0, 19.5],steps,height);
	BezConic([15.0, 18.0], [17, 17], [20, 15],steps,height);
	BezConic([20, 15], [30, 10], [41, 3],steps,height);
	BezConic([41, 3], [41, 3], [42.0, 2.5],steps,height);
	BezConic([42.0, 2.5], [43, 2], [43.0, 1.0],steps,height);
	BezConic([43.0, 1.0], [43, 0], [42.5, 0.0],steps,height);
	BezConic([38, -1], [37, -1], [33.0, 2.0],steps,height);
	BezConic([26.0, 7.0], [23, 9], [20, 11],steps,height);
	BezConic([9, 2], [9, 1], [7, 1],steps,height);
	BezConic([6, 1], [5, 1], [4, 2],steps,height);
	BezConic([3, 38], [4, 41], [7, 38],steps,height);
	BezConic([7, 38], [7, 38], [7, 37],steps,height);
}
}

module ArchitectsDaughter_contour00x52(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x52_skeleton(height);
			ArchitectsDaughter_contour00x52_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x52_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x52_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[29, 36], [26.5, 36.0], [24, 36], 
		[10, 36], [8, 33], [8, 32], 
		[8.0, 31.0], [8, 30], [8, 29], 
		[8, 26], [9, 25], [9, 25], 
		[9.5, 25.0], [10, 25], [11.5, 25.0], 
		[13, 25], [15.0, 26.0], [17, 27], 
		[19.5, 28.0], [22, 29], [24, 30], 
		[31, 33], [31, 35], [31, 36], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[29, 36], [26.5, 36.0], [24, 36], 
		[10, 36], [8, 33], [8, 32], 
		[8.0, 31.0], [8, 30], [8, 29], 
		[8, 26], [9, 25], [9, 25], 
		[9.5, 25.0], [10, 25], [11.5, 25.0], 
		[13, 25], [15.0, 26.0], [17, 27], 
		[19.5, 28.0], [22, 29], [24, 30], 
		[31, 33], [31, 35], [31, 36], 
		 ]);
}}}

module ArchitectsDaughter_contour10x52_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([24, 36], [10, 36], [8, 33],steps,height);
	BezConic([8, 33], [8, 32], [8.0, 31.0],steps,height);
	BezConic([8.0, 31.0], [8, 30], [8, 29],steps,height);
	BezConic([8, 29], [8, 26], [9, 25],steps,height);
	BezConic([9, 25], [9, 25], [9.5, 25.0],steps,height);
	BezConic([9.5, 25.0], [10, 25], [11.5, 25.0],steps,height);
	BezConic([11.5, 25.0], [13, 25], [15.0, 26.0],steps,height);
	BezConic([19.5, 28.0], [22, 29], [24, 30],steps,height);
	BezConic([24, 30], [31, 33], [31, 35],steps,height);
	BezConic([31, 35], [31, 36], [29, 36],steps,height);
}
}

module ArchitectsDaughter_contour10x52_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([15.0, 26.0], [17, 27], [19.5, 28.0],steps,height);
}
}

module ArchitectsDaughter_contour10x52(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x52_skeleton(height);
			ArchitectsDaughter_contour10x52_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x52_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x52(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x52(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x52(steps, height);
	}
}

ArchitectsDaughter_bbox0x52=[[3, -1], [43, 41]];

module ArchitectsDaughter_letter0x52(steps=2, height) {
	ArchitectsDaughter_chunk10x52(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x53_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[1.0, 5.5], [1, 7], [2.0, 7.5], 
		[3, 8], [3.5, 8.5], [4, 9], 
		[4, 9], [4, 4], [12, 4], 
		[18, 4], [25, 7], [31, 10], 
		[33, 12], [33, 13], [33.0, 13.5], 
		[33, 14], [33, 15], [20.0, 17.5], 
		[7, 20], [6, 21], [5, 21], 
		[3, 23], [3, 24], [3, 28], 
		[9, 32], [16, 36], [27, 38], 
		[30, 38], [31, 38], [32, 38], 
		[32.5, 38.0], [33, 38], [34, 38], 
		[36, 37], [36, 36], [36, 34], 
		[27, 33], [17, 31], [14.5, 30.0], 
		[12, 29], [10.5, 28.0], [9, 27], 
		[9, 25], [9, 25], [10.5, 24.5], 
		[12, 24], [14.0, 23.5], [16, 23], 
		[19, 22], [27, 20], [38, 17], 
		[39, 15], [39, 14], [39, 11], 
		[35, 8], [31, 4], [23, 2], 
		[17, 0], [13, 0], [10, 0], 
		[7.0, 1.0], [4, 2], [2.5, 3.0], 
		[1, 4], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[1.0, 5.5], [1, 7], [2.0, 7.5], 
		[3, 8], [3.5, 8.5], [4, 9], 
		[4, 9], [4, 4], [12, 4], 
		[18, 4], [25, 7], [31, 10], 
		[33, 12], [33, 13], [33.0, 13.5], 
		[33, 14], [33, 15], [20.0, 17.5], 
		[7, 20], [6, 21], [5, 21], 
		[3, 23], [3, 24], [3, 28], 
		[9, 32], [16, 36], [27, 38], 
		[30, 38], [31, 38], [32, 38], 
		[32.5, 38.0], [33, 38], [34, 38], 
		[36, 37], [36, 36], [36, 34], 
		[27, 33], [17, 31], [14.5, 30.0], 
		[12, 29], [10.5, 28.0], [9, 27], 
		[9, 25], [9, 25], [10.5, 24.5], 
		[12, 24], [14.0, 23.5], [16, 23], 
		[19, 22], [27, 20], [38, 17], 
		[39, 15], [39, 14], [39, 11], 
		[35, 8], [31, 4], [23, 2], 
		[17, 0], [13, 0], [10, 0], 
		[7.0, 1.0], [4, 2], [2.5, 3.0], 
		[1, 4], ]);
}}}

module ArchitectsDaughter_contour00x53_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2.0, 7.5], [3, 8], [3.5, 8.5],steps,height);
	BezConic([3.5, 8.5], [4, 9], [4, 9],steps,height);
	BezConic([4, 9], [4, 4], [12, 4],steps,height);
	BezConic([12, 4], [18, 4], [25, 7],steps,height);
	BezConic([25, 7], [31, 10], [33, 12],steps,height);
	BezConic([33, 12], [33, 13], [33.0, 13.5],steps,height);
	BezConic([33.0, 13.5], [33, 14], [33, 15],steps,height);
	BezConic([7, 20], [6, 21], [5, 21],steps,height);
	BezConic([27, 38], [30, 38], [31, 38],steps,height);
	BezConic([31, 38], [32, 38], [32.5, 38.0],steps,height);
	BezConic([32.5, 38.0], [33, 38], [34, 38],steps,height);
	BezConic([27, 33], [17, 31], [14.5, 30.0],steps,height);
	BezConic([14.5, 30.0], [12, 29], [10.5, 28.0],steps,height);
	BezConic([10.5, 28.0], [9, 27], [9, 25],steps,height);
	BezConic([10.5, 24.5], [12, 24], [14.0, 23.5],steps,height);
}
}

module ArchitectsDaughter_contour00x53_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([1.0, 5.5], [1, 7], [2.0, 7.5],steps,height);
	BezConic([5, 21], [3, 23], [3, 24],steps,height);
	BezConic([3, 24], [3, 28], [9, 32],steps,height);
	BezConic([9, 32], [16, 36], [27, 38],steps,height);
	BezConic([34, 38], [36, 37], [36, 36],steps,height);
	BezConic([36, 36], [36, 34], [27, 33],steps,height);
	BezConic([9, 25], [9, 25], [10.5, 24.5],steps,height);
	BezConic([14.0, 23.5], [16, 23], [19, 22],steps,height);
	BezConic([19, 22], [27, 20], [38, 17],steps,height);
	BezConic([38, 17], [39, 15], [39, 14],steps,height);
	BezConic([39, 14], [39, 11], [35, 8],steps,height);
	BezConic([35, 8], [31, 4], [23, 2],steps,height);
	BezConic([23, 2], [17, 0], [13, 0],steps,height);
	BezConic([13, 0], [10, 0], [7.0, 1.0],steps,height);
	BezConic([7.0, 1.0], [4, 2], [2.5, 3.0],steps,height);
	BezConic([2.5, 3.0], [1, 4], [1.0, 5.5],steps,height);
}
}

module ArchitectsDaughter_contour00x53(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x53_skeleton(height);
			ArchitectsDaughter_contour00x53_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x53_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x53(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x53(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x53=[[1, 0], [39, 38]];

module ArchitectsDaughter_letter0x53(steps=2, height) {
	ArchitectsDaughter_chunk10x53(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x54_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[31, 31], [28.0, 31.0], [25, 31], 
		[23, 31], [20, 30], [20, 28], 
		[20, 24], [18, 10], [18.0, 6.0], 
		[18, 2], [18, 0], [15.0, 0.0], 
		[12, 0], [13.0, 15.5], [14, 31], 
		[7.5, 31.5], [1, 32], [1, 32], 
		[0.5, 32.5], [0, 33], [0.0, 34.0], 
		[0, 35], [0.5, 35.5], [1, 36], 
		[2, 36], [6, 36], [11, 36], 
		[20, 35], [26, 35], [28.0, 35.0], 
		[30, 35], [34, 35], [39, 36], 
		[40, 36], [40, 33], [40, 32], 
		[40, 32],[36, 31], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[31, 31], [28.0, 31.0], [25, 31], 
		[23, 31], [20, 30], [20, 28], 
		[20, 24], [18, 10], [18.0, 6.0], 
		[18, 2], [18, 0], [15.0, 0.0], 
		[12, 0], [13.0, 15.5], [14, 31], 
		[7.5, 31.5], [1, 32], [1, 32], 
		[0.5, 32.5], [0, 33], [0.0, 34.0], 
		[0, 35], [0.5, 35.5], [1, 36], 
		[2, 36], [6, 36], [11, 36], 
		[20, 35], [26, 35], [28.0, 35.0], 
		[30, 35], [34, 35], [39, 36], 
		[40, 36], [40, 33], [40, 32], 
		[40, 32],[36, 31], ]);
}}}

module ArchitectsDaughter_contour00x54_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([25, 31], [23, 31], [20, 30],steps,height);
	BezConic([20, 30], [20, 28], [20, 24],steps,height);
	BezConic([20, 24], [18, 10], [18.0, 6.0],steps,height);
	BezConic([18.0, 6.0], [18, 2], [18, 0],steps,height);
	BezConic([1, 32], [1, 32], [0.5, 32.5],steps,height);
	BezConic([2, 36], [6, 36], [11, 36],steps,height);
	BezConic([11, 36], [20, 35], [26, 35],steps,height);
	BezConic([30, 35], [34, 35], [39, 36],steps,height);
	BezConic([40, 33], [40, 32], [40, 32],steps,height);
}
}

module ArchitectsDaughter_contour00x54_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([0.5, 32.5], [0, 33], [0.0, 34.0],steps,height);
	BezConic([0.0, 34.0], [0, 35], [0.5, 35.5],steps,height);
	BezConic([0.5, 35.5], [1, 36], [2, 36],steps,height);
	BezConic([39, 36], [40, 36], [40, 33],steps,height);
	BezConic([40, 32], [36, 31], [31, 31],steps,height);
}
}

module ArchitectsDaughter_contour00x54(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x54_skeleton(height);
			ArchitectsDaughter_contour00x54_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x54_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x54(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x54(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x54=[[0, 0], [40, 36]];

module ArchitectsDaughter_letter0x54(steps=2, height) {
	ArchitectsDaughter_chunk10x54(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x55_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[33, 1], [33, 0], [31, 0], 
		[30, 0], [29.0, 0.0], [28, 0], 
		[28, 1], [28.5, 5.0], [29, 9], 
		[23, 4], [21, 2], [16, 0], 
		[12, 0], [11, 0], [10, 0], 
		[1, 1], [1, 12], [1, 17], 
		[4, 29], [5, 32], [5, 35], 
		[5, 35], [6, 35], [6, 35], 
		[6, 35], [7, 35], [7, 35], 
		[9, 35], [9, 32], [9, 30], 
		[8, 27], [6, 17], [6, 13], 
		[6, 9], [8, 7], [9, 6], 
		[12, 5], [12, 5], [13, 5], 
		[23, 5], [26, 15], [28, 21], 
		[28, 29], [29, 33], [29, 36], 
		[29, 38], [31, 38], [32, 38], 
		[33, 37], [33, 34], [33, 30], 
		[33.0, 18.0], [33, 6], [33, 4], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[33, 1], [33, 0], [31, 0], 
		[30, 0], [29.0, 0.0], [28, 0], 
		[28, 1], [28.5, 5.0], [29, 9], 
		[23, 4], [21, 2], [16, 0], 
		[12, 0], [11, 0], [10, 0], 
		[1, 1], [1, 12], [1, 17], 
		[4, 29], [5, 32], [5, 35], 
		[5, 35], [6, 35], [6, 35], 
		[6, 35], [7, 35], [7, 35], 
		[9, 35], [9, 32], [9, 30], 
		[8, 27], [6, 17], [6, 13], 
		[6, 9], [8, 7], [9, 6], 
		[12, 5], [12, 5], [13, 5], 
		[23, 5], [26, 15], [28, 21], 
		[28, 29], [29, 33], [29, 36], 
		[29, 38], [31, 38], [32, 38], 
		[33, 37], [33, 34], [33, 30], 
		[33.0, 18.0], [33, 6], [33, 4], 
		 ]);
}}}

module ArchitectsDaughter_contour00x55_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([31, 0], [30, 0], [29.0, 0.0],steps,height);
	BezConic([29, 9], [23, 4], [21, 2],steps,height);
	BezConic([12, 0], [11, 0], [10, 0],steps,height);
	BezConic([4, 29], [5, 32], [5, 35],steps,height);
	BezConic([5, 35], [5, 35], [6, 35],steps,height);
	BezConic([6, 35], [6, 35], [6, 35],steps,height);
	BezConic([6, 35], [7, 35], [7, 35],steps,height);
	BezConic([8, 27], [6, 17], [6, 13],steps,height);
	BezConic([6, 13], [6, 9], [8, 7],steps,height);
	BezConic([8, 7], [9, 6], [12, 5],steps,height);
	BezConic([12, 5], [12, 5], [13, 5],steps,height);
	BezConic([13, 5], [23, 5], [26, 15],steps,height);
	BezConic([26, 15], [28, 21], [28, 29],steps,height);
	BezConic([28, 29], [29, 33], [29, 36],steps,height);
	BezConic([33, 37], [33, 34], [33, 30],steps,height);
	BezConic([33, 6], [33, 4], [33, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x55_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([33, 1], [33, 0], [31, 0],steps,height);
	BezConic([29.0, 0.0], [28, 0], [28, 1],steps,height);
	BezConic([21, 2], [16, 0], [12, 0],steps,height);
	BezConic([10, 0], [1, 1], [1, 12],steps,height);
	BezConic([1, 12], [1, 17], [4, 29],steps,height);
	BezConic([7, 35], [9, 35], [9, 32],steps,height);
	BezConic([9, 32], [9, 30], [8, 27],steps,height);
	BezConic([29, 36], [29, 38], [31, 38],steps,height);
	BezConic([31, 38], [32, 38], [33, 37],steps,height);
}
}

module ArchitectsDaughter_contour00x55(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x55_skeleton(height);
			ArchitectsDaughter_contour00x55_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x55_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x55(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x55(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x55=[[1, 0], [33, 38]];

module ArchitectsDaughter_letter0x55(steps=2, height) {
	ArchitectsDaughter_chunk10x55(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x56_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[16, 1], [15, 6], [10.5, 14.5], 
		[6, 23], [4, 26], [1, 33], 
		[1, 34], [1, 35], [4, 36], 
		[6, 32], [8.0, 28.0], [10, 24], 
		[12, 21], [16, 12], [19, 9], 
		[20, 10], [24, 17], [26.5, 22.5], 
		[29, 28], [33, 37], [34, 39], 
		[36, 42], [38, 42], [39, 42], 
		[39, 39], [30.0, 19.5], [21, 0], 
		[20, 0], [18.5, 0.0], [17, 0], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[16, 1], [15, 6], [10.5, 14.5], 
		[6, 23], [4, 26], [1, 33], 
		[1, 34], [1, 35], [4, 36], 
		[6, 32], [8.0, 28.0], [10, 24], 
		[12, 21], [16, 12], [19, 9], 
		[20, 10], [24, 17], [26.5, 22.5], 
		[29, 28], [33, 37], [34, 39], 
		[36, 42], [38, 42], [39, 42], 
		[39, 39], [30.0, 19.5], [21, 0], 
		[20, 0], [18.5, 0.0], [17, 0], 
		 ]);
}}}

module ArchitectsDaughter_contour00x56_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([16, 1], [15, 6], [10.5, 14.5],steps,height);
	BezConic([10.5, 14.5], [6, 23], [4, 26],steps,height);
	BezConic([4, 36], [6, 32], [8.0, 28.0],steps,height);
	BezConic([8.0, 28.0], [10, 24], [12, 21],steps,height);
	BezConic([12, 21], [16, 12], [19, 9],steps,height);
	BezConic([19, 9], [20, 10], [24, 17],steps,height);
	BezConic([21, 0], [20, 0], [18.5, 0.0],steps,height);
}
}

module ArchitectsDaughter_contour00x56_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 26], [1, 33], [1, 34],steps,height);
	BezConic([1, 34], [1, 35], [4, 36],steps,height);
	BezConic([29, 28], [33, 37], [34, 39],steps,height);
	BezConic([34, 39], [36, 42], [38, 42],steps,height);
	BezConic([38, 42], [39, 42], [39, 39],steps,height);
	BezConic([18.5, 0.0], [17, 0], [16, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x56(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x56_skeleton(height);
			ArchitectsDaughter_contour00x56_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x56_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x56(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x56(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x56=[[1, 0], [39, 42]];

module ArchitectsDaughter_letter0x56(steps=2, height) {
	ArchitectsDaughter_chunk10x56(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x57_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[48, 10], [51, 21], [55, 47], 
		[59, 47], [59, 45], [59, 44], 
		[59.0, 44.0], [59, 44], [59.0, 42.0], 
		[59, 40], [58.5, 36.5], [58, 33], 
		[57.0, 29.0], [56, 25], [56, 20], 
		[53, 9], [51, 1], [49, -1], 
		[48, 0], [47, 1], [46.5, 2.0], 
		[46, 3], [46, 4], [45, 5], 
		[42.5, 9.5], [40, 14], [39.0, 17.0], 
		[38, 20], [37, 22], [34, 27], 
		[32, 28], [29, 25], [24, 9], 
		[23, 6], [22.0, 3.5], [21, 1], 
		[21, 0], [19.0, 0.0], [17, 0], 
		[9.0, 18.0], [1, 36], [1, 37], 
		[1.0, 37.0], [1, 37], [1.0, 37.5], 
		[1, 38], [2, 38], [3, 39], 
		[4.0, 39.0], [5, 39], [5.5, 38.5], 
		[6, 38], [6.5, 37.0], [7, 36], 
		[7.0, 35.5], [7, 35], [7.5, 34.0], 
		[8, 33], [9.0, 30.5], [10, 28], 
		[11.0, 25.5], [12, 23], [13.5, 20.5], 
		[15, 18], [16, 16], [18, 11], 
		[19, 10], [26, 28], [27.5, 31.5], 
		[29, 35], [30, 36], [30, 37], 
		[31, 37], [34, 37], [40, 25], 
		[42, 22], [43, 19], [47, 12], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[48, 10], [51, 21], [55, 47], 
		[59, 47], [59, 45], [59, 44], 
		[59.0, 44.0], [59, 44], [59.0, 42.0], 
		[59, 40], [58.5, 36.5], [58, 33], 
		[57.0, 29.0], [56, 25], [56, 20], 
		[53, 9], [51, 1], [49, -1], 
		[48, 0], [47, 1], [46.5, 2.0], 
		[46, 3], [46, 4], [45, 5], 
		[42.5, 9.5], [40, 14], [39.0, 17.0], 
		[38, 20], [37, 22], [34, 27], 
		[32, 28], [29, 25], [24, 9], 
		[23, 6], [22.0, 3.5], [21, 1], 
		[21, 0], [19.0, 0.0], [17, 0], 
		[9.0, 18.0], [1, 36], [1, 37], 
		[1.0, 37.0], [1, 37], [1.0, 37.5], 
		[1, 38], [2, 38], [3, 39], 
		[4.0, 39.0], [5, 39], [5.5, 38.5], 
		[6, 38], [6.5, 37.0], [7, 36], 
		[7.0, 35.5], [7, 35], [7.5, 34.0], 
		[8, 33], [9.0, 30.5], [10, 28], 
		[11.0, 25.5], [12, 23], [13.5, 20.5], 
		[15, 18], [16, 16], [18, 11], 
		[19, 10], [26, 28], [27.5, 31.5], 
		[29, 35], [30, 36], [30, 37], 
		[31, 37], [34, 37], [40, 25], 
		[42, 22], [43, 19], [47, 12], 
		 ]);
}}}

module ArchitectsDaughter_contour00x57_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([48, 10], [51, 21], [55, 47],steps,height);
	BezConic([59, 45], [59, 44], [59.0, 44.0],steps,height);
	BezConic([57.0, 29.0], [56, 25], [56, 20],steps,height);
	BezConic([56, 20], [53, 9], [51, 1],steps,height);
	BezConic([39.0, 17.0], [38, 20], [37, 22],steps,height);
	BezConic([37, 22], [34, 27], [32, 28],steps,height);
	BezConic([32, 28], [29, 25], [24, 9],steps,height);
	BezConic([22.0, 3.5], [21, 1], [21, 0],steps,height);
	BezConic([1, 36], [1, 37], [1.0, 37.0],steps,height);
	BezConic([1.0, 37.0], [1, 37], [1.0, 37.5],steps,height);
	BezConic([7.0, 35.5], [7, 35], [7.5, 34.0],steps,height);
	BezConic([9.0, 30.5], [10, 28], [11.0, 25.5],steps,height);
	BezConic([11.0, 25.5], [12, 23], [13.5, 20.5],steps,height);
	BezConic([16, 16], [18, 11], [19, 10],steps,height);
}
}

module ArchitectsDaughter_contour00x57_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([55, 47], [59, 47], [59, 45],steps,height);
	BezConic([59.0, 44.0], [59, 44], [59.0, 42.0],steps,height);
	BezConic([59.0, 42.0], [59, 40], [58.5, 36.5],steps,height);
	BezConic([58.5, 36.5], [58, 33], [57.0, 29.0],steps,height);
	BezConic([51, 1], [49, -1], [48, 0],steps,height);
	BezConic([48, 0], [47, 1], [46.5, 2.0],steps,height);
	BezConic([46.5, 2.0], [46, 3], [46, 4],steps,height);
	BezConic([46, 4], [45, 5], [42.5, 9.5],steps,height);
	BezConic([42.5, 9.5], [40, 14], [39.0, 17.0],steps,height);
	BezConic([24, 9], [23, 6], [22.0, 3.5],steps,height);
	BezConic([1.0, 37.5], [1, 38], [2, 38],steps,height);
	BezConic([2, 38], [3, 39], [4.0, 39.0],steps,height);
	BezConic([4.0, 39.0], [5, 39], [5.5, 38.5],steps,height);
	BezConic([5.5, 38.5], [6, 38], [6.5, 37.0],steps,height);
	BezConic([6.5, 37.0], [7, 36], [7.0, 35.5],steps,height);
	BezConic([7.5, 34.0], [8, 33], [9.0, 30.5],steps,height);
	BezConic([13.5, 20.5], [15, 18], [16, 16],steps,height);
	BezConic([19, 10], [26, 28], [27.5, 31.5],steps,height);
	BezConic([27.5, 31.5], [29, 35], [30, 36],steps,height);
	BezConic([30, 36], [30, 37], [31, 37],steps,height);
	BezConic([31, 37], [34, 37], [40, 25],steps,height);
	BezConic([40, 25], [42, 22], [43, 19],steps,height);
	BezConic([43, 19], [47, 12], [48, 10],steps,height);
}
}

module ArchitectsDaughter_contour00x57(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x57_skeleton(height);
			ArchitectsDaughter_contour00x57_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x57_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x57(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x57(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x57=[[1, -1], [59, 47]];

module ArchitectsDaughter_letter0x57(steps=2, height) {
	ArchitectsDaughter_chunk10x57(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x58_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[19, 14], [17, 13], [15.5, 10.5], 
		[14, 8], [12.5, 6.0], [11, 4], 
		[9.5, 2.5], [8, 1], [6.0, 1.0], 
		[4, 1], [3.5, 1.5], [3, 2], 
		[3.0, 3.0], [3, 4], [3, 4], 
		[9.0, 11.0], [15, 18], [11, 22], 
		[9.0, 25.0], [7, 28], [5.5, 29.5], 
		[4, 31], [3.5, 32.5], [3, 34], 
		[2.5, 34.0], [2, 34], [2, 35], 
		[2, 36], [3, 36], [5, 37], 
		[6, 36], [12.0, 29.0], [18, 22], 
		[25.5, 30.5], [33, 39], [34.5, 38.0], 
		[36, 37], [28.5, 28.0], [21, 19], 
		[24, 16], [26.5, 14.0], [29, 12], 
		[31.5, 10.0], [34, 8], [35.5, 6.5], 
		[37, 5], [37, 2], [37, 1], 
		[36, 0], [35, 0], [34.5, 0.0], 
		[34, 0], [33, 1], [26.0, 7.5], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[19, 14], [17, 13], [15.5, 10.5], 
		[14, 8], [12.5, 6.0], [11, 4], 
		[9.5, 2.5], [8, 1], [6.0, 1.0], 
		[4, 1], [3.5, 1.5], [3, 2], 
		[3.0, 3.0], [3, 4], [3, 4], 
		[9.0, 11.0], [15, 18], [11, 22], 
		[9.0, 25.0], [7, 28], [5.5, 29.5], 
		[4, 31], [3.5, 32.5], [3, 34], 
		[2.5, 34.0], [2, 34], [2, 35], 
		[2, 36], [3, 36], [5, 37], 
		[6, 36], [12.0, 29.0], [18, 22], 
		[25.5, 30.5], [33, 39], [34.5, 38.0], 
		[36, 37], [28.5, 28.0], [21, 19], 
		[24, 16], [26.5, 14.0], [29, 12], 
		[31.5, 10.0], [34, 8], [35.5, 6.5], 
		[37, 5], [37, 2], [37, 1], 
		[36, 0], [35, 0], [34.5, 0.0], 
		[34, 0], [33, 1], [26.0, 7.5], 
		 ]);
}}}

module ArchitectsDaughter_contour00x58_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([19, 14], [17, 13], [15.5, 10.5],steps,height);
	BezConic([3.0, 3.0], [3, 4], [3, 4],steps,height);
	BezConic([9.0, 25.0], [7, 28], [5.5, 29.5],steps,height);
	BezConic([3.5, 32.5], [3, 34], [2.5, 34.0],steps,height);
	BezConic([21, 19], [24, 16], [26.5, 14.0],steps,height);
	BezConic([36, 0], [35, 0], [34.5, 0.0],steps,height);
}
}

module ArchitectsDaughter_contour00x58_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([15.5, 10.5], [14, 8], [12.5, 6.0],steps,height);
	BezConic([12.5, 6.0], [11, 4], [9.5, 2.5],steps,height);
	BezConic([9.5, 2.5], [8, 1], [6.0, 1.0],steps,height);
	BezConic([6.0, 1.0], [4, 1], [3.5, 1.5],steps,height);
	BezConic([3.5, 1.5], [3, 2], [3.0, 3.0],steps,height);
	BezConic([15, 18], [11, 22], [9.0, 25.0],steps,height);
	BezConic([5.5, 29.5], [4, 31], [3.5, 32.5],steps,height);
	BezConic([2.5, 34.0], [2, 34], [2, 35],steps,height);
	BezConic([2, 35], [2, 36], [3, 36],steps,height);
	BezConic([3, 36], [5, 37], [6, 36],steps,height);
	BezConic([26.5, 14.0], [29, 12], [31.5, 10.0],steps,height);
	BezConic([31.5, 10.0], [34, 8], [35.5, 6.5],steps,height);
	BezConic([35.5, 6.5], [37, 5], [37, 2],steps,height);
	BezConic([37, 2], [37, 1], [36, 0],steps,height);
	BezConic([34.5, 0.0], [34, 0], [33, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x58(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x58_skeleton(height);
			ArchitectsDaughter_contour00x58_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x58_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x58(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x58(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x58=[[2, 0], [37, 39]];

module ArchitectsDaughter_letter0x58(steps=2, height) {
	ArchitectsDaughter_chunk10x58(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x59_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[17, -1], [16, -1], [15, -1], 
		[13, 1], [14, 2], [14, 3], 
		[15, 7], [16.0, 10.0], [17, 13], 
		[18, 15], [19, 19], [10.5, 27.5], 
		[2, 36], [2, 36], [2.0, 36.5], 
		[2, 37], [2, 37], [3, 38], 
		[4.0, 38.0], [5, 38], [6.5, 37.5], 
		[8, 37], [10, 35], [13, 32], 
		[21, 23], [25, 34], [26.5, 37.0], 
		[28, 40], [29.0, 41.0], [30, 42], 
		[31.0, 42.0], [32, 42], [32.5, 41.5], 
		[33, 41], [33, 41], [31, 37], 
		[29.5, 31.5], [28, 26], [26, 21], 
		[21, 6], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[17, -1], [16, -1], [15, -1], 
		[13, 1], [14, 2], [14, 3], 
		[15, 7], [16.0, 10.0], [17, 13], 
		[18, 15], [19, 19], [10.5, 27.5], 
		[2, 36], [2, 36], [2.0, 36.5], 
		[2, 37], [2, 37], [3, 38], 
		[4.0, 38.0], [5, 38], [6.5, 37.5], 
		[8, 37], [10, 35], [13, 32], 
		[21, 23], [25, 34], [26.5, 37.0], 
		[28, 40], [29.0, 41.0], [30, 42], 
		[31.0, 42.0], [32, 42], [32.5, 41.5], 
		[33, 41], [33, 41], [31, 37], 
		[29.5, 31.5], [28, 26], [26, 21], 
		[21, 6], ]);
}}}

module ArchitectsDaughter_contour00x59_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([17, -1], [16, -1], [15, -1],steps,height);
	BezConic([17, 13], [18, 15], [19, 19],steps,height);
	BezConic([2, 36], [2, 36], [2.0, 36.5],steps,height);
	BezConic([2.0, 36.5], [2, 37], [2, 37],steps,height);
	BezConic([32.5, 41.5], [33, 41], [33, 41],steps,height);
	BezConic([33, 41], [31, 37], [29.5, 31.5],steps,height);
}
}

module ArchitectsDaughter_contour00x59_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([15, -1], [13, 1], [14, 2],steps,height);
	BezConic([14, 2], [14, 3], [15, 7],steps,height);
	BezConic([2, 37], [3, 38], [4.0, 38.0],steps,height);
	BezConic([4.0, 38.0], [5, 38], [6.5, 37.5],steps,height);
	BezConic([6.5, 37.5], [8, 37], [10, 35],steps,height);
	BezConic([10, 35], [13, 32], [21, 23],steps,height);
	BezConic([21, 23], [25, 34], [26.5, 37.0],steps,height);
	BezConic([26.5, 37.0], [28, 40], [29.0, 41.0],steps,height);
	BezConic([29.0, 41.0], [30, 42], [31.0, 42.0],steps,height);
	BezConic([31.0, 42.0], [32, 42], [32.5, 41.5],steps,height);
	BezConic([29.5, 31.5], [28, 26], [26, 21],steps,height);
	BezConic([26, 21], [21, 6], [17, -1],steps,height);
}
}

module ArchitectsDaughter_contour00x59(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x59_skeleton(height);
			ArchitectsDaughter_contour00x59_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x59_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x59(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x59(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x59=[[2, -1], [33, 42]];

module ArchitectsDaughter_letter0x59(steps=2, height) {
	ArchitectsDaughter_chunk10x59(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x5a_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[48, 1], [33, 0], [20, 0], 
		[2, 0], [2, 2], [2, 3], 
		[2, 3], [15.5, 18.0], [29, 33], 
		[27, 33], [25.5, 33.0], [24, 33], 
		[22.0, 33.0], [20, 33], [17, 33], 
		[7, 32], [4, 32], [3, 32], 
		[3.0, 32.5], [3, 33], [2, 35], 
		[16, 37], [34, 37], [35, 37], 
		[36.0, 37.0], [37, 37], [37, 36], 
		[35, 31], [25, 20], [13, 7], 
		[11, 5], [14, 4], [18.5, 4.0], 
		[23, 4], [28.0, 4.0], [33, 4], 
		[38.0, 4.5], [43, 5], [48, 6], 
		[48.0, 3.5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[48, 1], [33, 0], [20, 0], 
		[2, 0], [2, 2], [2, 3], 
		[2, 3], [15.5, 18.0], [29, 33], 
		[27, 33], [25.5, 33.0], [24, 33], 
		[22.0, 33.0], [20, 33], [17, 33], 
		[7, 32], [4, 32], [3, 32], 
		[3.0, 32.5], [3, 33], [2, 35], 
		[16, 37], [34, 37], [35, 37], 
		[36.0, 37.0], [37, 37], [37, 36], 
		[35, 31], [25, 20], [13, 7], 
		[11, 5], [14, 4], [18.5, 4.0], 
		[23, 4], [28.0, 4.0], [33, 4], 
		[38.0, 4.5], [43, 5], [48, 6], 
		[48.0, 3.5], ]);
}}}

module ArchitectsDaughter_contour00x5a_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 2], [2, 3], [2, 3],steps,height);
	BezConic([29, 33], [27, 33], [25.5, 33.0],steps,height);
	BezConic([25.5, 33.0], [24, 33], [22.0, 33.0],steps,height);
	BezConic([22.0, 33.0], [20, 33], [17, 33],steps,height);
	BezConic([3.0, 32.5], [3, 33], [2, 35],steps,height);
	BezConic([34, 37], [35, 37], [36.0, 37.0],steps,height);
	BezConic([11, 5], [14, 4], [18.5, 4.0],steps,height);
	BezConic([18.5, 4.0], [23, 4], [28.0, 4.0],steps,height);
	BezConic([28.0, 4.0], [33, 4], [38.0, 4.5],steps,height);
	BezConic([38.0, 4.5], [43, 5], [48, 6],steps,height);
}
}

module ArchitectsDaughter_contour00x5a_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([48, 1], [33, 0], [20, 0],steps,height);
	BezConic([20, 0], [2, 0], [2, 2],steps,height);
	BezConic([17, 33], [7, 32], [4, 32],steps,height);
	BezConic([4, 32], [3, 32], [3.0, 32.5],steps,height);
	BezConic([2, 35], [16, 37], [34, 37],steps,height);
	BezConic([36.0, 37.0], [37, 37], [37, 36],steps,height);
	BezConic([37, 36], [35, 31], [25, 20],steps,height);
	BezConic([25, 20], [13, 7], [11, 5],steps,height);
}
}

module ArchitectsDaughter_contour00x5a(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x5a_skeleton(height);
			ArchitectsDaughter_contour00x5a_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x5a_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x5a(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x5a(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x5a=[[2, 0], [48, 37]];

module ArchitectsDaughter_letter0x5a(steps=2, height) {
	ArchitectsDaughter_chunk10x5a(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x5b_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 49], [4, 49], [6.5, 49.5], 
		[9, 50], [12, 51], [18, 52], 
		[21, 52], [21, 51], [21.0, 50.5], 
		[21, 50], [21, 49], [19, 49], 
		[17.0, 48.5], [15, 48], [13, 48], 
		[7, 46], [6, 45], [6, 43], 
		[6.0, 40.0], [6, 37], [6.5, 32.5], 
		[7, 28], [7.5, 22.5], [8, 17], 
		[8.5, 11.5], [9, 6], [9, 0], 
		[17.0, 1.5], [25, 3], [25, 2], 
		[25.0, 1.5], [25, 1], [25.0, 0.0], 
		[25, -1], [25.0, -1.5], [25, -2], 
		[25, -2], [14.5, -3.5], [4, -5], 
		[3.0, 22.0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 49], [4, 49], [6.5, 49.5], 
		[9, 50], [12, 51], [18, 52], 
		[21, 52], [21, 51], [21.0, 50.5], 
		[21, 50], [21, 49], [19, 49], 
		[17.0, 48.5], [15, 48], [13, 48], 
		[7, 46], [6, 45], [6, 43], 
		[6.0, 40.0], [6, 37], [6.5, 32.5], 
		[7, 28], [7.5, 22.5], [8, 17], 
		[8.5, 11.5], [9, 6], [9, 0], 
		[17.0, 1.5], [25, 3], [25, 2], 
		[25.0, 1.5], [25, 1], [25.0, 0.0], 
		[25, -1], [25.0, -1.5], [25, -2], 
		[25, -2], [14.5, -3.5], [4, -5], 
		[3.0, 22.0], ]);
}}}

module ArchitectsDaughter_contour00x5b_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 49], [4, 49], [6.5, 49.5],steps,height);
	BezConic([6.5, 49.5], [9, 50], [12, 51],steps,height);
	BezConic([21, 52], [21, 51], [21.0, 50.5],steps,height);
	BezConic([21.0, 50.5], [21, 50], [21, 49],steps,height);
	BezConic([21, 49], [19, 49], [17.0, 48.5],steps,height);
	BezConic([13, 48], [7, 46], [6, 45],steps,height);
	BezConic([6, 45], [6, 43], [6.0, 40.0],steps,height);
	BezConic([6.0, 40.0], [6, 37], [6.5, 32.5],steps,height);
	BezConic([7.5, 22.5], [8, 17], [8.5, 11.5],steps,height);
	BezConic([25, 3], [25, 2], [25.0, 1.5],steps,height);
	BezConic([25.0, 1.5], [25, 1], [25.0, 0.0],steps,height);
	BezConic([25.0, 0.0], [25, -1], [25.0, -1.5],steps,height);
	BezConic([25.0, -1.5], [25, -2], [25, -2],steps,height);
}
}

module ArchitectsDaughter_contour00x5b_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([12, 51], [18, 52], [21, 52],steps,height);
	BezConic([17.0, 48.5], [15, 48], [13, 48],steps,height);
	BezConic([6.5, 32.5], [7, 28], [7.5, 22.5],steps,height);
	BezConic([8.5, 11.5], [9, 6], [9, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x5b(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x5b_skeleton(height);
			ArchitectsDaughter_contour00x5b_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x5b_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x5b(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x5b(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x5b=[[2, -5], [25, 52]];

module ArchitectsDaughter_letter0x5b(steps=2, height) {
	ArchitectsDaughter_chunk10x5b(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x5c_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[28, 0], [13, 17], [2, 34], 
		[0, 37], [0, 37], [0, 37], 
		[1, 36], [1, 37], [1.5, 37.5], 
		[2, 38], [3, 38], [7, 34], 
		[10.0, 29.5], [13, 25], [16.5, 20.0], 
		[20, 15], [23.5, 10.5], [27, 6], 
		[31, 3], [31, 1], [30.0, 0.5], 
		[29, 0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[28, 0], [13, 17], [2, 34], 
		[0, 37], [0, 37], [0, 37], 
		[1, 36], [1, 37], [1.5, 37.5], 
		[2, 38], [3, 38], [7, 34], 
		[10.0, 29.5], [13, 25], [16.5, 20.0], 
		[20, 15], [23.5, 10.5], [27, 6], 
		[31, 3], [31, 1], [30.0, 0.5], 
		[29, 0], ]);
}}}

module ArchitectsDaughter_contour00x5c_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 34], [0, 37], [0, 37],steps,height);
	BezConic([10.0, 29.5], [13, 25], [16.5, 20.0],steps,height);
	BezConic([16.5, 20.0], [20, 15], [23.5, 10.5],steps,height);
	BezConic([23.5, 10.5], [27, 6], [31, 3],steps,height);
}
}

module ArchitectsDaughter_contour00x5c_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([28, 0], [13, 17], [2, 34],steps,height);
	BezConic([0, 37], [0, 37], [1, 36],steps,height);
	BezConic([1, 36], [1, 37], [1.5, 37.5],steps,height);
	BezConic([1.5, 37.5], [2, 38], [3, 38],steps,height);
	BezConic([3, 38], [7, 34], [10.0, 29.5],steps,height);
	BezConic([31, 3], [31, 1], [30.0, 0.5],steps,height);
	BezConic([30.0, 0.5], [29, 0], [28, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x5c(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x5c_skeleton(height);
			ArchitectsDaughter_contour00x5c_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x5c_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x5c(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x5c(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x5c=[[0, 0], [31, 38]];

module ArchitectsDaughter_letter0x5c(steps=2, height) {
	ArchitectsDaughter_chunk10x5c(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x5d_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[26, 41], [26, 22], [29, -4], 
		[28, -4], [26.5, -4.5], [25, -5], 
		[22.5, -5.0], [20, -5], [17.0, -5.5], 
		[14, -6], [12, -6], [7, -6], 
		[5, -6], [5, -6], [5, -3], 
		[8, -2], [11, -2], [11.5, -2.5], 
		[12, -3], [19, -3], [22, 1], 
		[23, 2], [23.0, 6.5], [23, 11], 
		[23.0, 16.0], [23, 21], [22, 26], 
		[21, 37], [20, 47], [19, 47], 
		[18.0, 47.0], [17, 47], [15.0, 46.5], 
		[13, 46], [11, 46], [5, 44], 
		[2, 44], [2, 44], [1, 44], 
		[0, 45], [0.0, 46.0], [0, 47], 
		[1, 48], [1, 48], [8.5, 49.0], 
		[16, 50], [18.5, 50.5], [21, 51], 
		[22, 51], [23.0, 51.0], [24, 51], 
		[26, 51], [26, 50], [26, 46], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[26, 41], [26, 22], [29, -4], 
		[28, -4], [26.5, -4.5], [25, -5], 
		[22.5, -5.0], [20, -5], [17.0, -5.5], 
		[14, -6], [12, -6], [7, -6], 
		[5, -6], [5, -6], [5, -3], 
		[8, -2], [11, -2], [11.5, -2.5], 
		[12, -3], [19, -3], [22, 1], 
		[23, 2], [23.0, 6.5], [23, 11], 
		[23.0, 16.0], [23, 21], [22, 26], 
		[21, 37], [20, 47], [19, 47], 
		[18.0, 47.0], [17, 47], [15.0, 46.5], 
		[13, 46], [11, 46], [5, 44], 
		[2, 44], [2, 44], [1, 44], 
		[0, 45], [0.0, 46.0], [0, 47], 
		[1, 48], [1, 48], [8.5, 49.0], 
		[16, 50], [18.5, 50.5], [21, 51], 
		[22, 51], [23.0, 51.0], [24, 51], 
		[26, 51], [26, 50], [26, 46], 
		 ]);
}}}

module ArchitectsDaughter_contour00x5d_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 41], [26, 22], [29, -4],steps,height);
	BezConic([29, -4], [28, -4], [26.5, -4.5],steps,height);
	BezConic([22.5, -5.0], [20, -5], [17.0, -5.5],steps,height);
	BezConic([12, -6], [7, -6], [5, -6],steps,height);
	BezConic([5, -6], [5, -6], [5, -3],steps,height);
	BezConic([12, -3], [19, -3], [22, 1],steps,height);
	BezConic([22, 1], [23, 2], [23.0, 6.5],steps,height);
	BezConic([23.0, 6.5], [23, 11], [23.0, 16.0],steps,height);
	BezConic([23.0, 16.0], [23, 21], [22, 26],steps,height);
	BezConic([22, 26], [21, 37], [20, 47],steps,height);
	BezConic([20, 47], [19, 47], [18.0, 47.0],steps,height);
	BezConic([18.0, 47.0], [17, 47], [15.0, 46.5],steps,height);
	BezConic([2, 44], [2, 44], [1, 44],steps,height);
	BezConic([1, 48], [1, 48], [8.5, 49.0],steps,height);
	BezConic([8.5, 49.0], [16, 50], [18.5, 50.5],steps,height);
	BezConic([26, 50], [26, 46], [26, 41],steps,height);
}
}

module ArchitectsDaughter_contour00x5d_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26.5, -4.5], [25, -5], [22.5, -5.0],steps,height);
	BezConic([17.0, -5.5], [14, -6], [12, -6],steps,height);
	BezConic([5, -3], [8, -2], [11, -2],steps,height);
	BezConic([15.0, 46.5], [13, 46], [11, 46],steps,height);
	BezConic([11, 46], [5, 44], [2, 44],steps,height);
	BezConic([1, 44], [0, 45], [0.0, 46.0],steps,height);
	BezConic([0.0, 46.0], [0, 47], [1, 48],steps,height);
	BezConic([18.5, 50.5], [21, 51], [22, 51],steps,height);
	BezConic([24, 51], [26, 51], [26, 50],steps,height);
}
}

module ArchitectsDaughter_contour00x5d(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x5d_skeleton(height);
			ArchitectsDaughter_contour00x5d_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x5d_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk00x5d(steps=2, height) {
	difference() {
		
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x5d(steps, height);
	}
}

ArchitectsDaughter_bbox0x5d=[[0, -6], [29, 51]];

module ArchitectsDaughter_letter0x5d(steps=2, height) {
	ArchitectsDaughter_chunk00x5d(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x5e_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[4, 32], [3, 32], [2.0, 32.5], 
		[1, 33], [1.0, 34.0], [1, 35], 
		[1.5, 36.0], [2, 37], [4, 38], 
		[6, 41], [10, 43], [13, 41], 
		[14, 40], [16, 38], [18, 35], 
		[19, 34], [19.0, 33.5], [19, 33], 
		[19, 33], [18, 32], [16, 32], 
		[14, 34], [13.5, 34.5], [13, 35], 
		[12.5, 36.0], [12, 37], [10, 38], 
		[6, 36], [5, 34], [4, 33], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[4, 32], [3, 32], [2.0, 32.5], 
		[1, 33], [1.0, 34.0], [1, 35], 
		[1.5, 36.0], [2, 37], [4, 38], 
		[6, 41], [10, 43], [13, 41], 
		[14, 40], [16, 38], [18, 35], 
		[19, 34], [19.0, 33.5], [19, 33], 
		[19, 33], [18, 32], [16, 32], 
		[14, 34], [13.5, 34.5], [13, 35], 
		[12.5, 36.0], [12, 37], [10, 38], 
		[6, 36], [5, 34], [4, 33], 
		 ]);
}}}

module ArchitectsDaughter_contour00x5e_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([19.0, 33.5], [19, 33], [19, 33],steps,height);
	BezConic([16, 32], [14, 34], [13.5, 34.5],steps,height);
	BezConic([12.5, 36.0], [12, 37], [10, 38],steps,height);
	BezConic([10, 38], [6, 36], [5, 34],steps,height);
	BezConic([5, 34], [4, 33], [4, 32],steps,height);
}
}

module ArchitectsDaughter_contour00x5e_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4, 32], [3, 32], [2.0, 32.5],steps,height);
	BezConic([2.0, 32.5], [1, 33], [1.0, 34.0],steps,height);
	BezConic([1.0, 34.0], [1, 35], [1.5, 36.0],steps,height);
	BezConic([1.5, 36.0], [2, 37], [4, 38],steps,height);
	BezConic([4, 38], [6, 41], [10, 43],steps,height);
	BezConic([10, 43], [13, 41], [14, 40],steps,height);
	BezConic([14, 40], [16, 38], [18, 35],steps,height);
	BezConic([18, 35], [19, 34], [19.0, 33.5],steps,height);
	BezConic([19, 33], [18, 32], [16, 32],steps,height);
	BezConic([13.5, 34.5], [13, 35], [12.5, 36.0],steps,height);
}
}

module ArchitectsDaughter_contour00x5e(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x5e_skeleton(height);
			ArchitectsDaughter_contour00x5e_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x5e_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x5e(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x5e(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x5e=[[1, 32], [19, 43]];

module ArchitectsDaughter_letter0x5e(steps=2, height) {
	ArchitectsDaughter_chunk10x5e(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x5f_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 0], [2.0, 0.5], [2, 1], 
		[2.0, 1.5], [2, 2], [8, 5], 
		[20, 5], [33, 6], [39, 7], 
		[40, 7], [41.0, 7.0], [42, 7], 
		[42, 6], [42, 5], [40, 3], 
		[19, 3], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 0], [2.0, 0.5], [2, 1], 
		[2.0, 1.5], [2, 2], [8, 5], 
		[20, 5], [33, 6], [39, 7], 
		[40, 7], [41.0, 7.0], [42, 7], 
		[42, 6], [42, 5], [40, 3], 
		[19, 3], ]);
}}}

module ArchitectsDaughter_contour00x5f_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([20, 5], [33, 6], [39, 7],steps,height);
	BezConic([39, 7], [40, 7], [41.0, 7.0],steps,height);
	BezConic([40, 3], [19, 3], [2, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x5f_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 2], [8, 5], [20, 5],steps,height);
	BezConic([41.0, 7.0], [42, 7], [42, 6],steps,height);
	BezConic([42, 6], [42, 5], [40, 3],steps,height);
}
}

module ArchitectsDaughter_contour00x5f(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x5f_skeleton(height);
			ArchitectsDaughter_contour00x5f_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x5f_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x5f(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x5f(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x5f=[[2, 0], [42, 7]];

module ArchitectsDaughter_letter0x5f(steps=2, height) {
	ArchitectsDaughter_chunk10x5f(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x60_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3, 37], [3, 39], [4, 39], 
		[4, 39], [5, 38], [7.0, 36.0], 
		[9, 34], [8.5, 32.5], [8, 31], 
		[4, 34], [4, 35], [3, 35], 
		[3.0, 35.5],[3, 36], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3, 37], [3, 39], [4, 39], 
		[4, 39], [5, 38], [7.0, 36.0], 
		[9, 34], [8.5, 32.5], [8, 31], 
		[4, 34], [4, 35], [3, 35], 
		[3.0, 35.5],[3, 36], ]);
}}}

module ArchitectsDaughter_contour00x60_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.0, 35.5], [3, 36], [3, 37],steps,height);
}
}

module ArchitectsDaughter_contour00x60_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 37], [3, 39], [4, 39],steps,height);
	BezConic([4, 39], [4, 39], [5, 38],steps,height);
	BezConic([8, 31], [4, 34], [4, 35],steps,height);
	BezConic([4, 35], [3, 35], [3.0, 35.5],steps,height);
}
}

module ArchitectsDaughter_contour00x60(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x60_skeleton(height);
			ArchitectsDaughter_contour00x60_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x60_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x60(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x60(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x60=[[3, 31], [9, 39]];

module ArchitectsDaughter_letter0x60(steps=2, height) {
	ArchitectsDaughter_chunk10x60(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x61_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[26, 10], [22, 3], [14, 1], 
		[12, 1], [10.5, 1.0], [9, 1], 
		[8.0, 1.0], [7, 1], [6.0, 1.0], 
		[5, 1], [4, 2], [1, 3], 
		[1, 6], [1, 7], [1.0, 8.5], 
		[1, 10], [1.5, 12.0], [2, 14], 
		[4.0, 17.0], [6, 20], [8, 22], 
		[13, 27], [19, 28], [20, 28], 
		[21.5, 28.0], [23, 28], [24, 28], 
		[28, 28], [29, 23], [30, 20], 
		[30.0, 14.5], [30, 9], [30.5, 6.0], 
		[31, 3], [31, 0], [29.5, 0.0], 
		[28, 0], [27, 2], [27.0, 3.5], 
		[27, 5], [27, 6], [27, 8], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[26, 10], [22, 3], [14, 1], 
		[12, 1], [10.5, 1.0], [9, 1], 
		[8.0, 1.0], [7, 1], [6.0, 1.0], 
		[5, 1], [4, 2], [1, 3], 
		[1, 6], [1, 7], [1.0, 8.5], 
		[1, 10], [1.5, 12.0], [2, 14], 
		[4.0, 17.0], [6, 20], [8, 22], 
		[13, 27], [19, 28], [20, 28], 
		[21.5, 28.0], [23, 28], [24, 28], 
		[28, 28], [29, 23], [30, 20], 
		[30.0, 14.5], [30, 9], [30.5, 6.0], 
		[31, 3], [31, 0], [29.5, 0.0], 
		[28, 0], [27, 2], [27.0, 3.5], 
		[27, 5], [27, 6], [27, 8], 
		 ]);
}}}

module ArchitectsDaughter_contour00x61_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([14, 1], [12, 1], [10.5, 1.0],steps,height);
	BezConic([10.5, 1.0], [9, 1], [8.0, 1.0],steps,height);
	BezConic([8.0, 1.0], [7, 1], [6.0, 1.0],steps,height);
	BezConic([1, 6], [1, 7], [1.0, 8.5],steps,height);
	BezConic([19, 28], [20, 28], [21.5, 28.0],steps,height);
	BezConic([21.5, 28.0], [23, 28], [24, 28],steps,height);
	BezConic([30.0, 14.5], [30, 9], [30.5, 6.0],steps,height);
	BezConic([27.0, 3.5], [27, 5], [27, 6],steps,height);
	BezConic([27, 6], [27, 8], [26, 10],steps,height);
}
}

module ArchitectsDaughter_contour00x61_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 10], [22, 3], [14, 1],steps,height);
	BezConic([6.0, 1.0], [5, 1], [4, 2],steps,height);
	BezConic([4, 2], [1, 3], [1, 6],steps,height);
	BezConic([1.0, 8.5], [1, 10], [1.5, 12.0],steps,height);
	BezConic([1.5, 12.0], [2, 14], [4.0, 17.0],steps,height);
	BezConic([4.0, 17.0], [6, 20], [8, 22],steps,height);
	BezConic([8, 22], [13, 27], [19, 28],steps,height);
	BezConic([24, 28], [28, 28], [29, 23],steps,height);
	BezConic([29, 23], [30, 20], [30.0, 14.5],steps,height);
	BezConic([30.5, 6.0], [31, 3], [31, 0],steps,height);
	BezConic([28, 0], [27, 2], [27.0, 3.5],steps,height);
}
}

module ArchitectsDaughter_contour00x61(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x61_skeleton(height);
			ArchitectsDaughter_contour00x61_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x61_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x61_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[26, 20], [26, 24], [22, 24], 
		[22, 24], [22, 24], [17, 24], 
		[12, 19], [10, 17], [8, 15], 
		[5, 11], [5, 9], [5, 5], 
		[10, 4], [15, 4], [20, 9], 
		[23, 11], [24, 14], [26, 17], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[26, 20], [26, 24], [22, 24], 
		[22, 24], [22, 24], [17, 24], 
		[12, 19], [10, 17], [8, 15], 
		[5, 11], [5, 9], [5, 5], 
		[10, 4], [15, 4], [20, 9], 
		[23, 11], [24, 14], [26, 17], 
		 ]);
}}}

module ArchitectsDaughter_contour10x61_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 20], [26, 24], [22, 24],steps,height);
	BezConic([22, 24], [22, 24], [22, 24],steps,height);
	BezConic([22, 24], [17, 24], [12, 19],steps,height);
	BezConic([12, 19], [10, 17], [8, 15],steps,height);
	BezConic([8, 15], [5, 11], [5, 9],steps,height);
	BezConic([5, 9], [5, 5], [10, 4],steps,height);
	BezConic([10, 4], [15, 4], [20, 9],steps,height);
	BezConic([20, 9], [23, 11], [24, 14],steps,height);
	BezConic([24, 14], [26, 17], [26, 20],steps,height);
}
}

module ArchitectsDaughter_contour10x61_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x61(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x61_skeleton(height);
			ArchitectsDaughter_contour10x61_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x61_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x61(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x61(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x61(steps, height);
	}
}

ArchitectsDaughter_bbox0x61=[[1, 0], [31, 28]];

module ArchitectsDaughter_letter0x61(steps=2, height) {
	ArchitectsDaughter_chunk10x61(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x62_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 36], [2.0, 40.0], [2, 44], 
		[2, 45], [2.5, 45.5], [3, 46], 
		[4.0, 46.0], [5, 46], [6.0, 45.5], 
		[7, 45], [7, 44], [7.0, 30.5], 
		[7, 17], [11, 23], [18, 26], 
		[23, 29], [28, 29], [31, 29], 
		[33, 27], [35, 25], [35.0, 22.0], 
		[35, 19], [33.5, 16.5], [32, 14], 
		[30.5, 12.0], [29, 10], [26.5, 8.0], 
		[24, 6], [21, 5], [17, 2], 
		[12, 0], [12, 1], [11.0, 0.5], 
		[10, 0], [9, 0], [5, 0], 
		[3, 1], [2, 7], [2, 19], 
		[2.0, 27.5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 36], [2.0, 40.0], [2, 44], 
		[2, 45], [2.5, 45.5], [3, 46], 
		[4.0, 46.0], [5, 46], [6.0, 45.5], 
		[7, 45], [7, 44], [7.0, 30.5], 
		[7, 17], [11, 23], [18, 26], 
		[23, 29], [28, 29], [31, 29], 
		[33, 27], [35, 25], [35.0, 22.0], 
		[35, 19], [33.5, 16.5], [32, 14], 
		[30.5, 12.0], [29, 10], [26.5, 8.0], 
		[24, 6], [21, 5], [17, 2], 
		[12, 0], [12, 1], [11.0, 0.5], 
		[10, 0], [9, 0], [5, 0], 
		[3, 1], [2, 7], [2, 19], 
		[2.0, 27.5], ]);
}}}

module ArchitectsDaughter_contour00x62_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([12, 0], [12, 1], [11.0, 0.5],steps,height);
}
}

module ArchitectsDaughter_contour00x62_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 44], [2, 45], [2.5, 45.5],steps,height);
	BezConic([2.5, 45.5], [3, 46], [4.0, 46.0],steps,height);
	BezConic([4.0, 46.0], [5, 46], [6.0, 45.5],steps,height);
	BezConic([6.0, 45.5], [7, 45], [7, 44],steps,height);
	BezConic([7, 17], [11, 23], [18, 26],steps,height);
	BezConic([18, 26], [23, 29], [28, 29],steps,height);
	BezConic([28, 29], [31, 29], [33, 27],steps,height);
	BezConic([33, 27], [35, 25], [35.0, 22.0],steps,height);
	BezConic([35.0, 22.0], [35, 19], [33.5, 16.5],steps,height);
	BezConic([33.5, 16.5], [32, 14], [30.5, 12.0],steps,height);
	BezConic([30.5, 12.0], [29, 10], [26.5, 8.0],steps,height);
	BezConic([26.5, 8.0], [24, 6], [21, 5],steps,height);
	BezConic([21, 5], [17, 2], [12, 0],steps,height);
	BezConic([11.0, 0.5], [10, 0], [9, 0],steps,height);
	BezConic([9, 0], [5, 0], [3, 1],steps,height);
	BezConic([3, 1], [2, 7], [2, 19],steps,height);
}
}

module ArchitectsDaughter_contour00x62(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x62_skeleton(height);
			ArchitectsDaughter_contour00x62_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x62_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x62_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 6], [7, 5], [8.5, 5.0], 
		[10, 5], [12.0, 5.5], [14, 6], 
		[16.5, 7.0], [19, 8], [22, 10], 
		[28, 15], [31, 21], [30, 24], 
		[26, 24], [23, 24], [18, 22], 
		[11, 18], [9, 12], [7, 9], 
		[7, 7], [7, 6], [7.0, 6.0], 
		[7, 6], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 6], [7, 5], [8.5, 5.0], 
		[10, 5], [12.0, 5.5], [14, 6], 
		[16.5, 7.0], [19, 8], [22, 10], 
		[28, 15], [31, 21], [30, 24], 
		[26, 24], [23, 24], [18, 22], 
		[11, 18], [9, 12], [7, 9], 
		[7, 7], [7, 6], [7.0, 6.0], 
		[7, 6], ]);
}}}

module ArchitectsDaughter_contour10x62_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 6], [7, 5], [8.5, 5.0],steps,height);
	BezConic([8.5, 5.0], [10, 5], [12.0, 5.5],steps,height);
	BezConic([12.0, 5.5], [14, 6], [16.5, 7.0],steps,height);
	BezConic([16.5, 7.0], [19, 8], [22, 10],steps,height);
	BezConic([22, 10], [28, 15], [31, 21],steps,height);
	BezConic([31, 21], [30, 24], [26, 24],steps,height);
	BezConic([26, 24], [23, 24], [18, 22],steps,height);
	BezConic([18, 22], [11, 18], [9, 12],steps,height);
	BezConic([9, 12], [7, 9], [7, 7],steps,height);
	BezConic([7, 7], [7, 6], [7.0, 6.0],steps,height);
	BezConic([7.0, 6.0], [7, 6], [7, 6],steps,height);
}
}

module ArchitectsDaughter_contour10x62_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x62(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x62_skeleton(height);
			ArchitectsDaughter_contour10x62_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x62_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x62(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x62(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x62(steps, height);
	}
}

ArchitectsDaughter_bbox0x62=[[2, 0], [35, 46]];

module ArchitectsDaughter_letter0x62(steps=2, height) {
	ArchitectsDaughter_chunk10x62(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x63_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[27.0, 7.0], [30, 8], [32.0, 8.5], 
		[34, 9], [36.5, 9.0], [39, 9], 
		[39, 8], [39, 8], [39.0, 7.0], 
		[39, 6], [37.0, 5.5], [35, 5], 
		[33.0, 4.0], [31, 3], [28.5, 2.5], 
		[26, 2], [23, 1], [18, 0], 
		[16.0, 0.0], [14, 0], [11.5, 0.5], 
		[9, 1], [6, 2], [1, 5], 
		[1, 10], [1, 10], [1.0, 11.5], 
		[1, 13], [2.0, 15.0], [3, 17], 
		[5.0, 19.0], [7, 21], [10, 23], 
		[15, 26], [21, 28], [23, 28], 
		[24.0, 28.0], [25, 28], [26.0, 28.0], 
		[27, 28], [28.0, 28.0], [29, 28], 
		[30, 27], [31, 27], [31, 24], 
		[31, 23], [29, 21], [28, 21], 
		[28, 21], [28, 22], [27.5, 23.0], 
		[27, 24], [25, 24], [18, 22], 
		[12, 19], [6, 16], [6, 12], 
		[6, 11], [6, 11], [6, 7], 
		[9, 5], [12, 4], [15.5, 4.0], 
		[19, 4], [21.5, 5.0], [24, 6], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[27.0, 7.0], [30, 8], [32.0, 8.5], 
		[34, 9], [36.5, 9.0], [39, 9], 
		[39, 8], [39, 8], [39.0, 7.0], 
		[39, 6], [37.0, 5.5], [35, 5], 
		[33.0, 4.0], [31, 3], [28.5, 2.5], 
		[26, 2], [23, 1], [18, 0], 
		[16.0, 0.0], [14, 0], [11.5, 0.5], 
		[9, 1], [6, 2], [1, 5], 
		[1, 10], [1, 10], [1.0, 11.5], 
		[1, 13], [2.0, 15.0], [3, 17], 
		[5.0, 19.0], [7, 21], [10, 23], 
		[15, 26], [21, 28], [23, 28], 
		[24.0, 28.0], [25, 28], [26.0, 28.0], 
		[27, 28], [28.0, 28.0], [29, 28], 
		[30, 27], [31, 27], [31, 24], 
		[31, 23], [29, 21], [28, 21], 
		[28, 21], [28, 22], [27.5, 23.0], 
		[27, 24], [25, 24], [18, 22], 
		[12, 19], [6, 16], [6, 12], 
		[6, 11], [6, 11], [6, 7], 
		[9, 5], [12, 4], [15.5, 4.0], 
		[19, 4], [21.5, 5.0], [24, 6], 
		 ]);
}}}

module ArchitectsDaughter_contour00x63_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([37.0, 5.5], [35, 5], [33.0, 4.0],steps,height);
	BezConic([28.5, 2.5], [26, 2], [23, 1],steps,height);
	BezConic([1, 10], [1, 10], [1.0, 11.5],steps,height);
	BezConic([21, 28], [23, 28], [24.0, 28.0],steps,height);
	BezConic([24.0, 28.0], [25, 28], [26.0, 28.0],steps,height);
	BezConic([26.0, 28.0], [27, 28], [28.0, 28.0],steps,height);
	BezConic([29, 21], [28, 21], [28, 21],steps,height);
	BezConic([28, 21], [28, 22], [27.5, 23.0],steps,height);
	BezConic([27.5, 23.0], [27, 24], [25, 24],steps,height);
	BezConic([25, 24], [18, 22], [12, 19],steps,height);
	BezConic([12, 19], [6, 16], [6, 12],steps,height);
	BezConic([6, 12], [6, 11], [6, 11],steps,height);
	BezConic([6, 11], [6, 7], [9, 5],steps,height);
	BezConic([9, 5], [12, 4], [15.5, 4.0],steps,height);
	BezConic([15.5, 4.0], [19, 4], [21.5, 5.0],steps,height);
}
}

module ArchitectsDaughter_contour00x63_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([27.0, 7.0], [30, 8], [32.0, 8.5],steps,height);
	BezConic([32.0, 8.5], [34, 9], [36.5, 9.0],steps,height);
	BezConic([36.5, 9.0], [39, 9], [39, 8],steps,height);
	BezConic([39, 8], [39, 8], [39.0, 7.0],steps,height);
	BezConic([39.0, 7.0], [39, 6], [37.0, 5.5],steps,height);
	BezConic([33.0, 4.0], [31, 3], [28.5, 2.5],steps,height);
	BezConic([23, 1], [18, 0], [16.0, 0.0],steps,height);
	BezConic([16.0, 0.0], [14, 0], [11.5, 0.5],steps,height);
	BezConic([11.5, 0.5], [9, 1], [6, 2],steps,height);
	BezConic([6, 2], [1, 5], [1, 10],steps,height);
	BezConic([1.0, 11.5], [1, 13], [2.0, 15.0],steps,height);
	BezConic([2.0, 15.0], [3, 17], [5.0, 19.0],steps,height);
	BezConic([5.0, 19.0], [7, 21], [10, 23],steps,height);
	BezConic([10, 23], [15, 26], [21, 28],steps,height);
	BezConic([28.0, 28.0], [29, 28], [30, 27],steps,height);
	BezConic([30, 27], [31, 27], [31, 24],steps,height);
	BezConic([31, 24], [31, 23], [29, 21],steps,height);
	BezConic([21.5, 5.0], [24, 6], [27.0, 7.0],steps,height);
}
}

module ArchitectsDaughter_contour00x63(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x63_skeleton(height);
			ArchitectsDaughter_contour00x63_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x63_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x63(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x63(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x63=[[1, 0], [39, 28]];

module ArchitectsDaughter_letter0x63(steps=2, height) {
	ArchitectsDaughter_chunk10x63(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x64_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[31, 50], [31, 44], [31.0, 38.5], 
		[31, 33], [30.5, 27.5], [30, 22], 
		[30.0, 16.0], [30, 10], [31, 3], 
		[31, 1], [30.5, 0.5], [30, 0], 
		[29, 0], [26, 0], [26, 5], 
		[26.0, 6.0], [26, 7], [17, 0], 
		[11, 0], [8, 0], [5.5, 1.5], 
		[3, 3], [1, 6], [1, 8], 
		[1.0, 9.5], [1, 11], [1.5, 13.0], 
		[2, 15], [3.5, 17.5], [5, 20], 
		[8, 22], [14, 26], [21, 26], 
		[23, 26], [26, 25], [26, 26], 
		[26.0, 29.0], [26, 32], [27, 35], 
		[27, 43], [27.0, 44.5], [27, 46], 
		[27.5, 47.0], [28, 48], [28, 49], 
		[29, 50], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[31, 50], [31, 44], [31.0, 38.5], 
		[31, 33], [30.5, 27.5], [30, 22], 
		[30.0, 16.0], [30, 10], [31, 3], 
		[31, 1], [30.5, 0.5], [30, 0], 
		[29, 0], [26, 0], [26, 5], 
		[26.0, 6.0], [26, 7], [17, 0], 
		[11, 0], [8, 0], [5.5, 1.5], 
		[3, 3], [1, 6], [1, 8], 
		[1.0, 9.5], [1, 11], [1.5, 13.0], 
		[2, 15], [3.5, 17.5], [5, 20], 
		[8, 22], [14, 26], [21, 26], 
		[23, 26], [26, 25], [26, 26], 
		[26.0, 29.0], [26, 32], [27, 35], 
		[27, 43], [27.0, 44.5], [27, 46], 
		[27.5, 47.0], [28, 48], [28, 49], 
		[29, 50], ]);
}}}

module ArchitectsDaughter_contour00x64_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([31, 50], [31, 44], [31.0, 38.5],steps,height);
	BezConic([30.5, 27.5], [30, 22], [30.0, 16.0],steps,height);
	BezConic([30.0, 16.0], [30, 10], [31, 3],steps,height);
	BezConic([1, 6], [1, 8], [1.0, 9.5],steps,height);
	BezConic([26, 25], [26, 26], [26.0, 29.0],steps,height);
	BezConic([27, 35], [27, 43], [27.0, 44.5],steps,height);
	BezConic([27.5, 47.0], [28, 48], [28, 49],steps,height);
}
}

module ArchitectsDaughter_contour00x64_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([31.0, 38.5], [31, 33], [30.5, 27.5],steps,height);
	BezConic([31, 3], [31, 1], [30.5, 0.5],steps,height);
	BezConic([30.5, 0.5], [30, 0], [29, 0],steps,height);
	BezConic([29, 0], [26, 0], [26, 5],steps,height);
	BezConic([26, 7], [17, 0], [11, 0],steps,height);
	BezConic([11, 0], [8, 0], [5.5, 1.5],steps,height);
	BezConic([5.5, 1.5], [3, 3], [1, 6],steps,height);
	BezConic([1.0, 9.5], [1, 11], [1.5, 13.0],steps,height);
	BezConic([1.5, 13.0], [2, 15], [3.5, 17.5],steps,height);
	BezConic([3.5, 17.5], [5, 20], [8, 22],steps,height);
	BezConic([8, 22], [14, 26], [21, 26],steps,height);
	BezConic([21, 26], [23, 26], [26, 25],steps,height);
	BezConic([26.0, 29.0], [26, 32], [27, 35],steps,height);
	BezConic([27.0, 44.5], [27, 46], [27.5, 47.0],steps,height);
	BezConic([28, 49], [29, 50], [31, 50],steps,height);
}
}

module ArchitectsDaughter_contour00x64(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x64_skeleton(height);
			ArchitectsDaughter_contour00x64_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x64_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x64_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[5, 10], [5, 5], [9, 5], 
		[9, 5], [10, 5], [13, 5], 
		[16, 7], [23, 9], [25, 11], 
		[25.0, 15.5], [25, 20], [25, 22], 
		[21, 22], [21, 22], [20.5, 22.0], 
		[20, 22], [18.5, 21.5], [17, 21], 
		[15.0, 20.5], [13, 20], [11, 19], 
		[7, 16], [6, 13], [5, 11], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[5, 10], [5, 5], [9, 5], 
		[9, 5], [10, 5], [13, 5], 
		[16, 7], [23, 9], [25, 11], 
		[25.0, 15.5], [25, 20], [25, 22], 
		[21, 22], [21, 22], [20.5, 22.0], 
		[20, 22], [18.5, 21.5], [17, 21], 
		[15.0, 20.5], [13, 20], [11, 19], 
		[7, 16], [6, 13], [5, 11], 
		 ]);
}}}

module ArchitectsDaughter_contour10x64_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, 10], [5, 5], [9, 5],steps,height);
	BezConic([9, 5], [9, 5], [10, 5],steps,height);
	BezConic([10, 5], [13, 5], [16, 7],steps,height);
	BezConic([16, 7], [23, 9], [25, 11],steps,height);
	BezConic([25, 20], [25, 22], [21, 22],steps,height);
	BezConic([21, 22], [21, 22], [20.5, 22.0],steps,height);
	BezConic([20.5, 22.0], [20, 22], [18.5, 21.5],steps,height);
	BezConic([15.0, 20.5], [13, 20], [11, 19],steps,height);
	BezConic([11, 19], [7, 16], [6, 13],steps,height);
	BezConic([6, 13], [5, 11], [5, 10],steps,height);
}
}

module ArchitectsDaughter_contour10x64_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([18.5, 21.5], [17, 21], [15.0, 20.5],steps,height);
}
}

module ArchitectsDaughter_contour10x64(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x64_skeleton(height);
			ArchitectsDaughter_contour10x64_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x64_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x64(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x64(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x64(steps, height);
	}
}

ArchitectsDaughter_bbox0x64=[[1, 0], [31, 50]];

module ArchitectsDaughter_letter0x64(steps=2, height) {
	ArchitectsDaughter_chunk10x64(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x65_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[14, 4], [20, 4], [31, 9], 
		[32, 9], [32.5, 8.5], [33, 8], 
		[33, 8], [30, 4], [23.0, 1.5], 
		[16, -1], [10, 0], [3, 2], 
		[1, 8], [1, 9], [1.0, 11.0], 
		[1, 13], [2.0, 16.5], [3, 20], 
		[5.5, 23.0], [8, 26], [11.5, 27.5], 
		[15, 29], [19, 29], [23, 29], 
		[27, 27], [29, 26], [30.5, 24.5], 
		[32, 23], [32, 21], [32, 21], 
		[32, 20], [31, 16], [28, 15], 
		[26, 15], [24, 15], [19.5, 15.0], 
		[15, 15], [11, 15], [8, 13], 
		[7, 12], [6, 10], [8, 4], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[14, 4], [20, 4], [31, 9], 
		[32, 9], [32.5, 8.5], [33, 8], 
		[33, 8], [30, 4], [23.0, 1.5], 
		[16, -1], [10, 0], [3, 2], 
		[1, 8], [1, 9], [1.0, 11.0], 
		[1, 13], [2.0, 16.5], [3, 20], 
		[5.5, 23.0], [8, 26], [11.5, 27.5], 
		[15, 29], [19, 29], [23, 29], 
		[27, 27], [29, 26], [30.5, 24.5], 
		[32, 23], [32, 21], [32, 21], 
		[32, 20], [31, 16], [28, 15], 
		[26, 15], [24, 15], [19.5, 15.0], 
		[15, 15], [11, 15], [8, 13], 
		[7, 12], [6, 10], [8, 4], 
		 ]);
}}}

module ArchitectsDaughter_contour00x65_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([14, 4], [20, 4], [31, 9],steps,height);
	BezConic([32.5, 8.5], [33, 8], [33, 8],steps,height);
	BezConic([1, 8], [1, 9], [1.0, 11.0],steps,height);
	BezConic([28, 15], [26, 15], [24, 15],steps,height);
	BezConic([15, 15], [11, 15], [8, 13],steps,height);
	BezConic([8, 13], [7, 12], [6, 10],steps,height);
	BezConic([6, 10], [8, 4], [14, 4],steps,height);
}
}

module ArchitectsDaughter_contour00x65_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([31, 9], [32, 9], [32.5, 8.5],steps,height);
	BezConic([33, 8], [30, 4], [23.0, 1.5],steps,height);
	BezConic([23.0, 1.5], [16, -1], [10, 0],steps,height);
	BezConic([10, 0], [3, 2], [1, 8],steps,height);
	BezConic([1.0, 11.0], [1, 13], [2.0, 16.5],steps,height);
	BezConic([2.0, 16.5], [3, 20], [5.5, 23.0],steps,height);
	BezConic([5.5, 23.0], [8, 26], [11.5, 27.5],steps,height);
	BezConic([11.5, 27.5], [15, 29], [19, 29],steps,height);
	BezConic([19, 29], [23, 29], [27, 27],steps,height);
	BezConic([27, 27], [29, 26], [30.5, 24.5],steps,height);
	BezConic([30.5, 24.5], [32, 23], [32, 21],steps,height);
	BezConic([32, 21], [32, 21], [32, 20],steps,height);
	BezConic([32, 20], [31, 16], [28, 15],steps,height);
}
}

module ArchitectsDaughter_contour00x65(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x65_skeleton(height);
			ArchitectsDaughter_contour00x65_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x65_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x65_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[25.5, 24.0], [24, 25], [22.5, 25.5], 
		[21, 26], [20.0, 26.0], [19, 26], 
		[17.0, 25.0], [15, 24], [13, 23], 
		[9, 21], [9, 19], [14, 19], 
		[16, 19], [23, 19], [26, 20], 
		[27, 21], [27, 22], [27, 23], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[25.5, 24.0], [24, 25], [22.5, 25.5], 
		[21, 26], [20.0, 26.0], [19, 26], 
		[17.0, 25.0], [15, 24], [13, 23], 
		[9, 21], [9, 19], [14, 19], 
		[16, 19], [23, 19], [26, 20], 
		[27, 21], [27, 22], [27, 23], 
		 ]);
}}}

module ArchitectsDaughter_contour10x65_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([25.5, 24.0], [24, 25], [22.5, 25.5],steps,height);
	BezConic([22.5, 25.5], [21, 26], [20.0, 26.0],steps,height);
	BezConic([20.0, 26.0], [19, 26], [17.0, 25.0],steps,height);
	BezConic([17.0, 25.0], [15, 24], [13, 23],steps,height);
	BezConic([13, 23], [9, 21], [9, 19],steps,height);
	BezConic([9, 19], [14, 19], [16, 19],steps,height);
	BezConic([16, 19], [23, 19], [26, 20],steps,height);
	BezConic([26, 20], [27, 21], [27, 22],steps,height);
	BezConic([27, 22], [27, 23], [25.5, 24.0],steps,height);
}
}

module ArchitectsDaughter_contour10x65_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x65(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x65_skeleton(height);
			ArchitectsDaughter_contour10x65_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x65_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x65(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x65(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x65(steps, height);
	}
}

ArchitectsDaughter_bbox0x65=[[1, -1], [33, 29]];

module ArchitectsDaughter_letter0x65(steps=2, height) {
	ArchitectsDaughter_chunk10x65(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x66_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[38, 21], [38, 21], [38.0, 19.5], 
		[38, 18], [38, 17], [27.5, 15.5], 
		[17, 14], [17.5, 7.0], [18, 0], 
		[15.5, 0.5], [13, 1], [13, 6], 
		[11, 14], [7.0, 12.0], [3, 10], 
		[2, 10], [2, 11], [1, 13], 
		[1, 14], [5.5, 16.0], [10, 18], 
		[9, 28], [9.0, 35.0], [9, 42], 
		[10.0, 45.5], [11, 49], [13.5, 50.5], 
		[16, 52], [18.5, 52.0], [21, 52], 
		[23.5, 51.0], [26, 50], [28.0, 48.5], 
		[30, 47], [32.0, 44.5], [34, 42], 
		[34, 41], [34, 39], [33, 38], 
		[31, 42], [27, 45], [23, 48], 
		[19, 48], [16, 48], [14, 43], 
		[14, 40], [14.0, 35.5], [14, 31], 
		[14.0, 27.0], [14, 23], [16, 19], 
		[19, 19], [24, 19], [34, 21], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[38, 21], [38, 21], [38.0, 19.5], 
		[38, 18], [38, 17], [27.5, 15.5], 
		[17, 14], [17.5, 7.0], [18, 0], 
		[15.5, 0.5], [13, 1], [13, 6], 
		[11, 14], [7.0, 12.0], [3, 10], 
		[2, 10], [2, 11], [1, 13], 
		[1, 14], [5.5, 16.0], [10, 18], 
		[9, 28], [9.0, 35.0], [9, 42], 
		[10.0, 45.5], [11, 49], [13.5, 50.5], 
		[16, 52], [18.5, 52.0], [21, 52], 
		[23.5, 51.0], [26, 50], [28.0, 48.5], 
		[30, 47], [32.0, 44.5], [34, 42], 
		[34, 41], [34, 39], [33, 38], 
		[31, 42], [27, 45], [23, 48], 
		[19, 48], [16, 48], [14, 43], 
		[14, 40], [14.0, 35.5], [14, 31], 
		[14.0, 27.0], [14, 23], [16, 19], 
		[19, 19], [24, 19], [34, 21], 
		 ]);
}}}

module ArchitectsDaughter_contour00x66_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([38.0, 19.5], [38, 18], [38, 17],steps,height);
	BezConic([13, 1], [13, 6], [11, 14],steps,height);
	BezConic([33, 38], [31, 42], [27, 45],steps,height);
	BezConic([27, 45], [23, 48], [19, 48],steps,height);
	BezConic([19, 48], [16, 48], [14, 43],steps,height);
	BezConic([14, 43], [14, 40], [14.0, 35.5],steps,height);
	BezConic([14.0, 35.5], [14, 31], [14.0, 27.0],steps,height);
	BezConic([14.0, 27.0], [14, 23], [16, 19],steps,height);
	BezConic([16, 19], [19, 19], [24, 19],steps,height);
}
}

module ArchitectsDaughter_contour00x66_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([38, 21], [38, 21], [38.0, 19.5],steps,height);
	BezConic([3, 10], [2, 10], [2, 11],steps,height);
	BezConic([2, 11], [1, 13], [1, 14],steps,height);
	BezConic([10, 18], [9, 28], [9.0, 35.0],steps,height);
	BezConic([9.0, 35.0], [9, 42], [10.0, 45.5],steps,height);
	BezConic([10.0, 45.5], [11, 49], [13.5, 50.5],steps,height);
	BezConic([13.5, 50.5], [16, 52], [18.5, 52.0],steps,height);
	BezConic([18.5, 52.0], [21, 52], [23.5, 51.0],steps,height);
	BezConic([23.5, 51.0], [26, 50], [28.0, 48.5],steps,height);
	BezConic([28.0, 48.5], [30, 47], [32.0, 44.5],steps,height);
	BezConic([32.0, 44.5], [34, 42], [34, 41],steps,height);
	BezConic([34, 41], [34, 39], [33, 38],steps,height);
	BezConic([24, 19], [34, 21], [38, 21],steps,height);
}
}

module ArchitectsDaughter_contour00x66(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x66_skeleton(height);
			ArchitectsDaughter_contour00x66_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x66_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x66(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x66(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x66=[[1, 0], [38, 52]];

module ArchitectsDaughter_letter0x66(steps=2, height) {
	ArchitectsDaughter_chunk10x66(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x67_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[20, -27], [19.5, -27.0], [19, -27], 
		[17, -27], [15, -27], [14.0, -27.0], 
		[13, -27], [9, -27], [7, -26], 
		[6, -25], [6, -23], [13.0, -23.0], 
		[20, -23], [27, -22], [27, -15], 
		[27, -15], [27.0, -14.5], [27, -14], 
		[27, -12], [27.0, -2.0], [27, 8], 
		[27, 9], [27, 10], [17, 0], 
		[7, 0], [6, 0], [6, 1], 
		[1, 1], [1, 4], [2, 7], 
		[3.5, 10.5], [5, 14], [7.5, 17.0], 
		[10, 20], [13, 23], [18, 27], 
		[22, 27], [27, 27], [31, 21], 
		[32, 7], [32.0, 0.5], [32, -6], 
		[31.5, -10.0], [31, -14], [30.5, -17.5], 
		[30, -21], [29.0, -23.0], [28, -25], 
		[26, -25],[24, -27], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[20, -27], [19.5, -27.0], [19, -27], 
		[17, -27], [15, -27], [14.0, -27.0], 
		[13, -27], [9, -27], [7, -26], 
		[6, -25], [6, -23], [13.0, -23.0], 
		[20, -23], [27, -22], [27, -15], 
		[27, -15], [27.0, -14.5], [27, -14], 
		[27, -12], [27.0, -2.0], [27, 8], 
		[27, 9], [27, 10], [17, 0], 
		[7, 0], [6, 0], [6, 1], 
		[1, 1], [1, 4], [2, 7], 
		[3.5, 10.5], [5, 14], [7.5, 17.0], 
		[10, 20], [13, 23], [18, 27], 
		[22, 27], [27, 27], [31, 21], 
		[32, 7], [32.0, 0.5], [32, -6], 
		[31.5, -10.0], [31, -14], [30.5, -17.5], 
		[30, -21], [29.0, -23.0], [28, -25], 
		[26, -25],[24, -27], ]);
}}}

module ArchitectsDaughter_contour00x67_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([19, -27], [17, -27], [15, -27],steps,height);
	BezConic([20, -23], [27, -22], [27, -15],steps,height);
	BezConic([27, -15], [27, -15], [27.0, -14.5],steps,height);
	BezConic([27.0, -14.5], [27, -14], [27, -12],steps,height);
	BezConic([27, 8], [27, 9], [27, 10],steps,height);
}
}

module ArchitectsDaughter_contour00x67_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([13, -27], [9, -27], [7, -26],steps,height);
	BezConic([7, -26], [6, -25], [6, -23],steps,height);
	BezConic([27, 10], [17, 0], [7, 0],steps,height);
	BezConic([7, 0], [6, 0], [6, 1],steps,height);
	BezConic([6, 1], [1, 1], [1, 4],steps,height);
	BezConic([1, 4], [2, 7], [3.5, 10.5],steps,height);
	BezConic([3.5, 10.5], [5, 14], [7.5, 17.0],steps,height);
	BezConic([7.5, 17.0], [10, 20], [13, 23],steps,height);
	BezConic([13, 23], [18, 27], [22, 27],steps,height);
	BezConic([22, 27], [27, 27], [31, 21],steps,height);
	BezConic([31, 21], [32, 7], [32.0, 0.5],steps,height);
	BezConic([32.0, 0.5], [32, -6], [31.5, -10.0],steps,height);
	BezConic([31.5, -10.0], [31, -14], [30.5, -17.5],steps,height);
	BezConic([30.5, -17.5], [30, -21], [29.0, -23.0],steps,height);
	BezConic([29.0, -23.0], [28, -25], [26, -25],steps,height);
	BezConic([26, -25], [24, -27], [20, -27],steps,height);
}
}

module ArchitectsDaughter_contour00x67(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x67_skeleton(height);
			ArchitectsDaughter_contour00x67_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x67_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x67_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[24, 22], [23, 23], [21.5, 23.0], 
		[20, 23], [18.0, 21.5], [16, 20], 
		[14.0, 18.5], [12, 17], [10, 15], 
		[6, 9], [6, 6], [6, 5], 
		[7, 5], [7, 4], [7.5, 4.0], 
		[8, 4], [9.5, 4.5], [11, 5], 
		[13.0, 6.0], [15, 7], [17.5, 8.0], 
		[20, 9], [22, 11], [26, 15], 
		[26, 19],[26, 21], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[24, 22], [23, 23], [21.5, 23.0], 
		[20, 23], [18.0, 21.5], [16, 20], 
		[14.0, 18.5], [12, 17], [10, 15], 
		[6, 9], [6, 6], [6, 5], 
		[7, 5], [7, 4], [7.5, 4.0], 
		[8, 4], [9.5, 4.5], [11, 5], 
		[13.0, 6.0], [15, 7], [17.5, 8.0], 
		[20, 9], [22, 11], [26, 15], 
		[26, 19],[26, 21], ]);
}}}

module ArchitectsDaughter_contour10x67_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([24, 22], [23, 23], [21.5, 23.0],steps,height);
	BezConic([21.5, 23.0], [20, 23], [18.0, 21.5],steps,height);
	BezConic([18.0, 21.5], [16, 20], [14.0, 18.5],steps,height);
	BezConic([14.0, 18.5], [12, 17], [10, 15],steps,height);
	BezConic([10, 15], [6, 9], [6, 6],steps,height);
	BezConic([6, 6], [6, 5], [7, 5],steps,height);
	BezConic([7, 5], [7, 4], [7.5, 4.0],steps,height);
	BezConic([7.5, 4.0], [8, 4], [9.5, 4.5],steps,height);
	BezConic([9.5, 4.5], [11, 5], [13.0, 6.0],steps,height);
	BezConic([17.5, 8.0], [20, 9], [22, 11],steps,height);
	BezConic([22, 11], [26, 15], [26, 19],steps,height);
	BezConic([26, 19], [26, 21], [24, 22],steps,height);
}
}

module ArchitectsDaughter_contour10x67_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([13.0, 6.0], [15, 7], [17.5, 8.0],steps,height);
}
}

module ArchitectsDaughter_contour10x67(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x67_skeleton(height);
			ArchitectsDaughter_contour10x67_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x67_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x67(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x67(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x67(steps, height);
	}
}

ArchitectsDaughter_bbox0x67=[[1, -27], [32, 27]];

module ArchitectsDaughter_letter0x67(steps=2, height) {
	ArchitectsDaughter_chunk10x67(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x68_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[31, 1], [31, 0], [28.5, 0.0], 
		[26, 0], [26, 2], [26, 9], 
		[26, 12], [25, 18], [23, 18], 
		[19, 19], [16.0, 19.0], [13, 19], 
		[11.0, 17.5], [9, 16], [8.0, 12.0], 
		[7, 8], [7, 0], [4.5, 0.0], 
		[2, 0], [2, 4], [2.0, 7.0], 
		[2, 10], [2.0, 14.5], [2, 19], 
		[2, 24], [1, 29], [1.0, 33.0], 
		[1, 37], [2, 41], [3, 42], 
		[4, 42], [5, 42], [6.0, 41.0], 
		[7, 40], [7, 39], [7.0, 34.0], 
		[7, 29], [7, 23], [7, 20], 
		[13, 24], [19, 24], [21, 24], 
		[23, 23], [28, 21], [29, 18], 
		[30, 17], [30.0, 15.0], [30, 13], 
		[30, 11],[31, 4], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[31, 1], [31, 0], [28.5, 0.0], 
		[26, 0], [26, 2], [26, 9], 
		[26, 12], [25, 18], [23, 18], 
		[19, 19], [16.0, 19.0], [13, 19], 
		[11.0, 17.5], [9, 16], [8.0, 12.0], 
		[7, 8], [7, 0], [4.5, 0.0], 
		[2, 0], [2, 4], [2.0, 7.0], 
		[2, 10], [2.0, 14.5], [2, 19], 
		[2, 24], [1, 29], [1.0, 33.0], 
		[1, 37], [2, 41], [3, 42], 
		[4, 42], [5, 42], [6.0, 41.0], 
		[7, 40], [7, 39], [7.0, 34.0], 
		[7, 29], [7, 23], [7, 20], 
		[13, 24], [19, 24], [21, 24], 
		[23, 23], [28, 21], [29, 18], 
		[30, 17], [30.0, 15.0], [30, 13], 
		[30, 11],[31, 4], ]);
}}}

module ArchitectsDaughter_contour00x68_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 2], [26, 9], [26, 12],steps,height);
	BezConic([26, 12], [25, 18], [23, 18],steps,height);
	BezConic([23, 18], [19, 19], [16.0, 19.0],steps,height);
	BezConic([16.0, 19.0], [13, 19], [11.0, 17.5],steps,height);
	BezConic([11.0, 17.5], [9, 16], [8.0, 12.0],steps,height);
	BezConic([8.0, 12.0], [7, 8], [7, 0],steps,height);
	BezConic([2, 0], [2, 4], [2.0, 7.0],steps,height);
	BezConic([2.0, 7.0], [2, 10], [2.0, 14.5],steps,height);
	BezConic([2.0, 14.5], [2, 19], [2, 24],steps,height);
	BezConic([30.0, 15.0], [30, 13], [30, 11],steps,height);
}
}

module ArchitectsDaughter_contour00x68_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([31, 1], [31, 0], [28.5, 0.0],steps,height);
	BezConic([28.5, 0.0], [26, 0], [26, 2],steps,height);
	BezConic([2, 24], [1, 29], [1.0, 33.0],steps,height);
	BezConic([1.0, 33.0], [1, 37], [2, 41],steps,height);
	BezConic([2, 41], [3, 42], [4, 42],steps,height);
	BezConic([4, 42], [5, 42], [6.0, 41.0],steps,height);
	BezConic([6.0, 41.0], [7, 40], [7, 39],steps,height);
	BezConic([7, 29], [7, 23], [7, 20],steps,height);
	BezConic([7, 20], [13, 24], [19, 24],steps,height);
	BezConic([19, 24], [21, 24], [23, 23],steps,height);
	BezConic([23, 23], [28, 21], [29, 18],steps,height);
	BezConic([29, 18], [30, 17], [30.0, 15.0],steps,height);
	BezConic([30, 11], [31, 4], [31, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x68(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x68_skeleton(height);
			ArchitectsDaughter_contour00x68_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x68_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x68(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x68(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x68=[[1, 0], [31, 42]];

module ArchitectsDaughter_letter0x68(steps=2, height) {
	ArchitectsDaughter_chunk10x68(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x69_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 29], [8, 18], [9, 2], 
		[8, 0], [6, 0], [5, 0], 
		[4.5, 0.5], [4, 1], [3, 1], 
		[3.0, 15.0], [3, 29], [5.0, 29.0], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 29], [8, 18], [9, 2], 
		[8, 0], [6, 0], [5, 0], 
		[4.5, 0.5], [4, 1], [3, 1], 
		[3.0, 15.0], [3, 29], [5.0, 29.0], 
		 ]);
}}}

module ArchitectsDaughter_contour00x69_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([4.5, 0.5], [4, 1], [3, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x69_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 29], [8, 18], [9, 2],steps,height);
	BezConic([9, 2], [8, 0], [6, 0],steps,height);
	BezConic([6, 0], [5, 0], [4.5, 0.5],steps,height);
}
}

module ArchitectsDaughter_contour00x69(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x69_skeleton(height);
			ArchitectsDaughter_contour00x69_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x69_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x69_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 38], [2, 40], [4, 40], 
		[6, 40], [7, 39], [7, 39], 
		[7.0, 38.0], [7, 37], [7, 37], 
		[6, 36], [5.0, 36.0], [4, 36], 
		[3.0, 36.5],[2, 37], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 38], [2, 40], [4, 40], 
		[6, 40], [7, 39], [7, 39], 
		[7.0, 38.0], [7, 37], [7, 37], 
		[6, 36], [5.0, 36.0], [4, 36], 
		[3.0, 36.5],[2, 37], ]);
}}}

module ArchitectsDaughter_contour10x69_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7.0, 38.0], [7, 37], [7, 37],steps,height);
}
}

module ArchitectsDaughter_contour10x69_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 38], [2, 40], [4, 40],steps,height);
	BezConic([4, 40], [6, 40], [7, 39],steps,height);
	BezConic([7, 39], [7, 39], [7.0, 38.0],steps,height);
	BezConic([7, 37], [6, 36], [5.0, 36.0],steps,height);
	BezConic([5.0, 36.0], [4, 36], [3.0, 36.5],steps,height);
	BezConic([3.0, 36.5], [2, 37], [2, 38],steps,height);
}
}

module ArchitectsDaughter_contour10x69(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x69_skeleton(height);
			ArchitectsDaughter_contour10x69_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x69_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x69(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x69(steps, height);
		
	}
}

module ArchitectsDaughter_chunk20x69(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour10x69(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x69=[[2, 0], [9, 40]];

module ArchitectsDaughter_letter0x69(steps=2, height) {
	ArchitectsDaughter_chunk10x69(steps, height);
	ArchitectsDaughter_chunk20x69(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x6a_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[11, -13], [11, -23], [5, -23], 
		[5, -23], [4.0, -23.0], [3, -23], 
		[1.5, -22.5], [0, -22], [-2, -22], 
		[-6, -21], [-7, -18], [-7, -18], 
		[-7, -17], [-6, -16], [-6, -16], 
		[-4, -17], [-1.5, -18.5], [1, -20], 
		[3, -20], [5, -20], [6, -17], 
		[7, -15], [7, -13], [7, -7], 
		[6, 3], [5, 18], [5.0, 22.0], 
		[5, 26], [5, 28], [5, 30], 
		[7, 30], [8, 31], [9, 31], 
		[9, 27], [9.0, 24.5], [9, 22], 
		[9.0, 20.0], [9, 18], [9.0, 13.0], 
		[9, 8], [10, 4], [11, -6], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[11, -13], [11, -23], [5, -23], 
		[5, -23], [4.0, -23.0], [3, -23], 
		[1.5, -22.5], [0, -22], [-2, -22], 
		[-6, -21], [-7, -18], [-7, -18], 
		[-7, -17], [-6, -16], [-6, -16], 
		[-4, -17], [-1.5, -18.5], [1, -20], 
		[3, -20], [5, -20], [6, -17], 
		[7, -15], [7, -13], [7, -7], 
		[6, 3], [5, 18], [5.0, 22.0], 
		[5, 26], [5, 28], [5, 30], 
		[7, 30], [8, 31], [9, 31], 
		[9, 27], [9.0, 24.5], [9, 22], 
		[9.0, 20.0], [9, 18], [9.0, 13.0], 
		[9, 8], [10, 4], [11, -6], 
		 ]);
}}}

module ArchitectsDaughter_contour00x6a_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, -23], [5, -23], [4.0, -23.0],steps,height);
	BezConic([1.5, -22.5], [0, -22], [-2, -22],steps,height);
	BezConic([-7, -18], [-7, -18], [-7, -17],steps,height);
	BezConic([-7, -17], [-6, -16], [-6, -16],steps,height);
	BezConic([-1.5, -18.5], [1, -20], [3, -20],steps,height);
	BezConic([3, -20], [5, -20], [6, -17],steps,height);
	BezConic([6, -17], [7, -15], [7, -13],steps,height);
	BezConic([7, -13], [7, -7], [6, 3],steps,height);
	BezConic([5.0, 22.0], [5, 26], [5, 28],steps,height);
	BezConic([9, 31], [9, 27], [9.0, 24.5],steps,height);
	BezConic([9.0, 24.5], [9, 22], [9.0, 20.0],steps,height);
	BezConic([9.0, 13.0], [9, 8], [10, 4],steps,height);
}
}

module ArchitectsDaughter_contour00x6a_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([11, -13], [11, -23], [5, -23],steps,height);
	BezConic([4.0, -23.0], [3, -23], [1.5, -22.5],steps,height);
	BezConic([-2, -22], [-6, -21], [-7, -18],steps,height);
	BezConic([-6, -16], [-4, -17], [-1.5, -18.5],steps,height);
	BezConic([6, 3], [5, 18], [5.0, 22.0],steps,height);
	BezConic([5, 28], [5, 30], [7, 30],steps,height);
	BezConic([7, 30], [8, 31], [9, 31],steps,height);
	BezConic([9.0, 20.0], [9, 18], [9.0, 13.0],steps,height);
	BezConic([10, 4], [11, -6], [11, -13],steps,height);
}
}

module ArchitectsDaughter_contour00x6a(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x6a_skeleton(height);
			ArchitectsDaughter_contour00x6a_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x6a_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x6a_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 44], [8, 44], [8, 42], 
		[8, 41], [7, 40], [7, 40], 
		[6.5, 40.0], [6, 40], [5, 41], 
		[5, 43], [6, 44], [6, 44], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 44], [8, 44], [8, 42], 
		[8, 41], [7, 40], [7, 40], 
		[6.5, 40.0], [6, 40], [5, 41], 
		[5, 43], [6, 44], [6, 44], 
		 ]);
}}}

module ArchitectsDaughter_contour10x6a_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 40], [7, 40], [6.5, 40.0],steps,height);
	BezConic([6, 44], [6, 44], [7, 44],steps,height);
}
}

module ArchitectsDaughter_contour10x6a_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 44], [8, 44], [8, 42],steps,height);
	BezConic([8, 42], [8, 41], [7, 40],steps,height);
	BezConic([6.5, 40.0], [6, 40], [5, 41],steps,height);
	BezConic([5, 41], [5, 43], [6, 44],steps,height);
}
}

module ArchitectsDaughter_contour10x6a(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x6a_skeleton(height);
			ArchitectsDaughter_contour10x6a_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x6a_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x6a(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x6a(steps, height);
		
	}
}

module ArchitectsDaughter_chunk20x6a(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour10x6a(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x6a=[[-7, -23], [11, 44]];

module ArchitectsDaughter_letter0x6a(steps=2, height) {
	ArchitectsDaughter_chunk10x6a(steps, height);
	ArchitectsDaughter_chunk20x6a(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x6b_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[8, 11], [8.0, 8.5], [8, 6], 
		[8, 1], [6, 0], [5, 0], 
		[4.5, 0.0], [4, 0], [3, 0], 
		[3.0, 11.5], [3, 23], [3, 28], 
		[2.5, 33.5], [2, 39], [2, 44], 
		[2, 46], [4, 46], [4.5, 46.0], 
		[5, 46], [5, 46], [5, 46], 
		[6, 42], [6, 36], [7, 24], 
		[8, 20], [9, 20], [12.5, 23.0], 
		[16, 26], [18.5, 27.5], [21, 29], 
		[23, 30], [27, 33], [28, 33], 
		[29, 33], [30, 32], [27, 28], 
		[20, 23], [17, 21], [14.5, 19.5], 
		[12, 18], [9, 16], [13, 14], 
		[17.0, 13.0], [21, 12], [24, 11], 
		[32, 9], [38, 8], [38, 7], 
		[38, 6], [37, 5], [36, 5], 
		[35.5, 5.0], [35, 5], [31, 6], 
		[25, 8],[13, 10], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[8, 11], [8.0, 8.5], [8, 6], 
		[8, 1], [6, 0], [5, 0], 
		[4.5, 0.0], [4, 0], [3, 0], 
		[3.0, 11.5], [3, 23], [3, 28], 
		[2.5, 33.5], [2, 39], [2, 44], 
		[2, 46], [4, 46], [4.5, 46.0], 
		[5, 46], [5, 46], [5, 46], 
		[6, 42], [6, 36], [7, 24], 
		[8, 20], [9, 20], [12.5, 23.0], 
		[16, 26], [18.5, 27.5], [21, 29], 
		[23, 30], [27, 33], [28, 33], 
		[29, 33], [30, 32], [27, 28], 
		[20, 23], [17, 21], [14.5, 19.5], 
		[12, 18], [9, 16], [13, 14], 
		[17.0, 13.0], [21, 12], [24, 11], 
		[32, 9], [38, 8], [38, 7], 
		[38, 6], [37, 5], [36, 5], 
		[35.5, 5.0], [35, 5], [31, 6], 
		[25, 8],[13, 10], ]);
}}}

module ArchitectsDaughter_contour00x6b_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([6, 0], [5, 0], [4.5, 0.0],steps,height);
	BezConic([4.5, 0.0], [4, 0], [3, 0],steps,height);
	BezConic([3, 23], [3, 28], [2.5, 33.5],steps,height);
	BezConic([5, 46], [5, 46], [5, 46],steps,height);
	BezConic([6, 36], [7, 24], [8, 20],steps,height);
	BezConic([8, 20], [9, 20], [12.5, 23.0],steps,height);
	BezConic([14.5, 19.5], [12, 18], [9, 16],steps,height);
	BezConic([9, 16], [13, 14], [17.0, 13.0],steps,height);
	BezConic([24, 11], [32, 9], [38, 8],steps,height);
	BezConic([38, 8], [38, 7], [38, 6],steps,height);
}
}

module ArchitectsDaughter_contour00x6b_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8, 6], [8, 1], [6, 0],steps,height);
	BezConic([2.5, 33.5], [2, 39], [2, 44],steps,height);
	BezConic([2, 44], [2, 46], [4, 46],steps,height);
	BezConic([5, 46], [6, 42], [6, 36],steps,height);
	BezConic([12.5, 23.0], [16, 26], [18.5, 27.5],steps,height);
	BezConic([18.5, 27.5], [21, 29], [23, 30],steps,height);
	BezConic([23, 30], [27, 33], [28, 33],steps,height);
	BezConic([28, 33], [29, 33], [30, 32],steps,height);
	BezConic([30, 32], [27, 28], [20, 23],steps,height);
	BezConic([20, 23], [17, 21], [14.5, 19.5],steps,height);
	BezConic([17.0, 13.0], [21, 12], [24, 11],steps,height);
	BezConic([38, 6], [37, 5], [36, 5],steps,height);
	BezConic([35, 5], [31, 6], [25, 8],steps,height);
	BezConic([25, 8], [13, 10], [8, 11],steps,height);
}
}

module ArchitectsDaughter_contour00x6b(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x6b_skeleton(height);
			ArchitectsDaughter_contour00x6b_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x6b_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x6b(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x6b(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x6b=[[2, 0], [38, 46]];

module ArchitectsDaughter_letter0x6b(steps=2, height) {
	ArchitectsDaughter_chunk10x6b(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x6c_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3.0, 24.5], [3, 28], [2.5, 30.5], 
		[2, 33], [2.0, 34.5], [2, 36], 
		[1, 41], [2, 41], [2.5, 42.0], 
		[3, 43], [4, 43], [6, 43], 
		[7, 24], [8, 14], [8, 3], 
		[8, 0], [4, 0], [4.0, 0.0], 
		[4, 0], [4, 3], [3.5, 8.0], 
		[3, 13], [3.0, 17.0], [3, 21], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3.0, 24.5], [3, 28], [2.5, 30.5], 
		[2, 33], [2.0, 34.5], [2, 36], 
		[1, 41], [2, 41], [2.5, 42.0], 
		[3, 43], [4, 43], [6, 43], 
		[7, 24], [8, 14], [8, 3], 
		[8, 0], [4, 0], [4.0, 0.0], 
		[4, 0], [4, 3], [3.5, 8.0], 
		[3, 13], [3.0, 17.0], [3, 21], 
		 ]);
}}}

module ArchitectsDaughter_contour00x6c_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.0, 24.5], [3, 28], [2.5, 30.5],steps,height);
	BezConic([2.0, 34.5], [2, 36], [1, 41],steps,height);
	BezConic([1, 41], [2, 41], [2.5, 42.0],steps,height);
	BezConic([4, 0], [4, 3], [3.5, 8.0],steps,height);
	BezConic([3.0, 17.0], [3, 21], [3.0, 24.5],steps,height);
}
}

module ArchitectsDaughter_contour00x6c_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2.5, 30.5], [2, 33], [2.0, 34.5],steps,height);
	BezConic([2.5, 42.0], [3, 43], [4, 43],steps,height);
	BezConic([4, 43], [6, 43], [7, 24],steps,height);
	BezConic([7, 24], [8, 14], [8, 3],steps,height);
	BezConic([8, 3], [8, 0], [4, 0],steps,height);
	BezConic([3.5, 8.0], [3, 13], [3.0, 17.0],steps,height);
}
}

module ArchitectsDaughter_contour00x6c(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x6c_skeleton(height);
			ArchitectsDaughter_contour00x6c_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x6c_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x6c(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x6c(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x6c=[[1, 0], [8, 43]];

module ArchitectsDaughter_letter0x6c(steps=2, height) {
	ArchitectsDaughter_chunk10x6c(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x6d_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[7, 1], [4, 0], [3.5, 0.0], 
		[3, 0], [2.5, 0.0], [2, 0], 
		[2, 1], [2, 3], [2.0, 6.0], 
		[2, 9], [2.0, 12.5], [2, 16], 
		[2.0, 20.0], [2, 24], [2, 27], 
		[2, 29], [5, 29], [5, 29], 
		[5.5, 26.5], [6, 24], [6.0, 23.0], 
		[6, 22], [6, 21], [8, 24], 
		[13, 26], [15, 27], [17.5, 27.0], 
		[20, 27], [21.5, 26.5], [23, 26], 
		[24.5, 24.5], [26, 23], [26, 20], 
		[27, 23], [33, 26], [38, 28], 
		[42, 28], [48, 28], [48, 24], 
		[48.5, 12.0], [49, 0], [49, 0], 
		[48, 0], [44, 0], [44, 1], 
		[44, 2], [44, 3], [44.0, 8.0], 
		[44, 13], [44, 20], [43, 24], 
		[39, 24], [36.5, 23.0], [34, 22], 
		[32.5, 20.5], [31, 19], [30, 16], 
		[27, 11], [27, 1], [26, 0], 
		[24, 0], [23, 0], [22.0, 0.5], 
		[21, 1], [21, 1], [23, 8], 
		[23, 11], [23, 14], [22.0, 17.0], 
		[21, 20], [21, 23], [12, 23], 
		[8, 16], [7, 13], [7.0, 10.0], 
		[7, 7], [7.0, 5.0], [7, 3], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[7, 1], [4, 0], [3.5, 0.0], 
		[3, 0], [2.5, 0.0], [2, 0], 
		[2, 1], [2, 3], [2.0, 6.0], 
		[2, 9], [2.0, 12.5], [2, 16], 
		[2.0, 20.0], [2, 24], [2, 27], 
		[2, 29], [5, 29], [5, 29], 
		[5.5, 26.5], [6, 24], [6.0, 23.0], 
		[6, 22], [6, 21], [8, 24], 
		[13, 26], [15, 27], [17.5, 27.0], 
		[20, 27], [21.5, 26.5], [23, 26], 
		[24.5, 24.5], [26, 23], [26, 20], 
		[27, 23], [33, 26], [38, 28], 
		[42, 28], [48, 28], [48, 24], 
		[48.5, 12.0], [49, 0], [49, 0], 
		[48, 0], [44, 0], [44, 1], 
		[44, 2], [44, 3], [44.0, 8.0], 
		[44, 13], [44, 20], [43, 24], 
		[39, 24], [36.5, 23.0], [34, 22], 
		[32.5, 20.5], [31, 19], [30, 16], 
		[27, 11], [27, 1], [26, 0], 
		[24, 0], [23, 0], [22.0, 0.5], 
		[21, 1], [21, 1], [23, 8], 
		[23, 11], [23, 14], [22.0, 17.0], 
		[21, 20], [21, 23], [12, 23], 
		[8, 16], [7, 13], [7.0, 10.0], 
		[7, 7], [7.0, 5.0], [7, 3], 
		 ]);
}}}

module ArchitectsDaughter_contour00x6d_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.5, 0.0], [3, 0], [2.5, 0.0],steps,height);
	BezConic([2, 1], [2, 3], [2.0, 6.0],steps,height);
	BezConic([2.0, 6.0], [2, 9], [2.0, 12.5],steps,height);
	BezConic([2.0, 12.5], [2, 16], [2.0, 20.0],steps,height);
	BezConic([2.0, 20.0], [2, 24], [2, 27],steps,height);
	BezConic([49, 0], [49, 0], [48, 0],steps,height);
	BezConic([44, 1], [44, 2], [44, 3],steps,height);
	BezConic([44, 13], [44, 20], [43, 24],steps,height);
	BezConic([43, 24], [39, 24], [36.5, 23.0],steps,height);
	BezConic([36.5, 23.0], [34, 22], [32.5, 20.5],steps,height);
	BezConic([32.5, 20.5], [31, 19], [30, 16],steps,height);
	BezConic([30, 16], [27, 11], [27, 1],steps,height);
	BezConic([22.0, 0.5], [21, 1], [21, 1],steps,height);
	BezConic([21, 1], [23, 8], [23, 11],steps,height);
	BezConic([23, 11], [23, 14], [22.0, 17.0],steps,height);
	BezConic([21, 23], [12, 23], [8, 16],steps,height);
	BezConic([8, 16], [7, 13], [7.0, 10.0],steps,height);
	BezConic([7.0, 10.0], [7, 7], [7.0, 5.0],steps,height);
	BezConic([7.0, 5.0], [7, 3], [7, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x6d_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([7, 1], [4, 0], [3.5, 0.0],steps,height);
	BezConic([2.5, 0.0], [2, 0], [2, 1],steps,height);
	BezConic([2, 27], [2, 29], [5, 29],steps,height);
	BezConic([5, 29], [5, 29], [5.5, 26.5],steps,height);
	BezConic([5.5, 26.5], [6, 24], [6.0, 23.0],steps,height);
	BezConic([6.0, 23.0], [6, 22], [6, 21],steps,height);
	BezConic([6, 21], [8, 24], [13, 26],steps,height);
	BezConic([13, 26], [15, 27], [17.5, 27.0],steps,height);
	BezConic([17.5, 27.0], [20, 27], [21.5, 26.5],steps,height);
	BezConic([21.5, 26.5], [23, 26], [24.5, 24.5],steps,height);
	BezConic([24.5, 24.5], [26, 23], [26, 20],steps,height);
	BezConic([26, 20], [27, 23], [33, 26],steps,height);
	BezConic([33, 26], [38, 28], [42, 28],steps,height);
	BezConic([42, 28], [48, 28], [48, 24],steps,height);
	BezConic([48, 0], [44, 0], [44, 1],steps,height);
	BezConic([27, 1], [26, 0], [24, 0],steps,height);
	BezConic([24, 0], [23, 0], [22.0, 0.5],steps,height);
	BezConic([22.0, 17.0], [21, 20], [21, 23],steps,height);
}
}

module ArchitectsDaughter_contour00x6d(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x6d_skeleton(height);
			ArchitectsDaughter_contour00x6d_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x6d_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk00x6d(steps=2, height) {
	difference() {
		
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x6d(steps, height);
	}
}

ArchitectsDaughter_bbox0x6d=[[2, 0], [49, 29]];

module ArchitectsDaughter_letter0x6d(steps=2, height) {
	ArchitectsDaughter_chunk00x6d(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x6e_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[26, 14], [26, 21], [25, 25], 
		[26, 26], [24, 26], [22, 26], 
		[18.5, 24.5], [15, 23], [13, 22], 
		[8, 20], [7, 18], [7.0, 9.5], 
		[7, 1], [5.0, 1.0], [3, 1], 
		[2, 3], [2, 13], [2, 21], 
		[2.5, 25.5], [3, 30], [3, 30], 
		[5, 31], [6, 31], [7, 31], 
		[7, 28], [7, 26], [7.0, 24.5], 
		[7, 23], [7, 23], [17, 30], 
		[23, 30], [29, 30], [30, 20], 
		[30, 17], [30, 10], [30.0, 7.5], 
		[30, 5], [30, 3], [30, 0], 
		[30, 0], [29, 0], [29, 0], 
		[28.5, 0.0], [28, 0], [27, 0], 
		[26, 3], [26.0, 5.5], [26, 8], 
		[26, 10],[26.0, 12.0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[26, 14], [26, 21], [25, 25], 
		[26, 26], [24, 26], [22, 26], 
		[18.5, 24.5], [15, 23], [13, 22], 
		[8, 20], [7, 18], [7.0, 9.5], 
		[7, 1], [5.0, 1.0], [3, 1], 
		[2, 3], [2, 13], [2, 21], 
		[2.5, 25.5], [3, 30], [3, 30], 
		[5, 31], [6, 31], [7, 31], 
		[7, 28], [7, 26], [7.0, 24.5], 
		[7, 23], [7, 23], [17, 30], 
		[23, 30], [29, 30], [30, 20], 
		[30, 17], [30, 10], [30.0, 7.5], 
		[30, 5], [30, 3], [30, 0], 
		[30, 0], [29, 0], [29, 0], 
		[28.5, 0.0], [28, 0], [27, 0], 
		[26, 3], [26.0, 5.5], [26, 8], 
		[26, 10],[26.0, 12.0], ]);
}}}

module ArchitectsDaughter_contour00x6e_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 14], [26, 21], [25, 25],steps,height);
	BezConic([25, 25], [26, 26], [24, 26],steps,height);
	BezConic([24, 26], [22, 26], [18.5, 24.5],steps,height);
	BezConic([18.5, 24.5], [15, 23], [13, 22],steps,height);
	BezConic([13, 22], [8, 20], [7, 18],steps,height);
	BezConic([2.5, 25.5], [3, 30], [3, 30],steps,height);
	BezConic([7, 28], [7, 26], [7.0, 24.5],steps,height);
	BezConic([7.0, 24.5], [7, 23], [7, 23],steps,height);
	BezConic([30, 20], [30, 17], [30, 10],steps,height);
	BezConic([30, 5], [30, 3], [30, 0],steps,height);
	BezConic([30, 0], [30, 0], [29, 0],steps,height);
	BezConic([29, 0], [29, 0], [28.5, 0.0],steps,height);
	BezConic([28.5, 0.0], [28, 0], [27, 0],steps,height);
	BezConic([26.0, 5.5], [26, 8], [26, 10],steps,height);
}
}

module ArchitectsDaughter_contour00x6e_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 1], [2, 3], [2, 13],steps,height);
	BezConic([2, 13], [2, 21], [2.5, 25.5],steps,height);
	BezConic([3, 30], [5, 31], [6, 31],steps,height);
	BezConic([6, 31], [7, 31], [7, 28],steps,height);
	BezConic([7, 23], [17, 30], [23, 30],steps,height);
	BezConic([23, 30], [29, 30], [30, 20],steps,height);
	BezConic([27, 0], [26, 3], [26.0, 5.5],steps,height);
}
}

module ArchitectsDaughter_contour00x6e(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x6e_skeleton(height);
			ArchitectsDaughter_contour00x6e_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x6e_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk00x6e(steps=2, height) {
	difference() {
		
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x6e(steps, height);
	}
}

ArchitectsDaughter_bbox0x6e=[[2, 0], [30, 31]];

module ArchitectsDaughter_letter0x6e(steps=2, height) {
	ArchitectsDaughter_chunk00x6e(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x6f_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[3, 12], [3, 19], [10, 24], 
		[15, 27], [22, 28], [22, 28], 
		[23.5, 28.0], [25, 28], [27, 27], 
		[32, 26], [34, 21], [35, 19], 
		[35.0, 18.0], [35, 17], [35, 16], 
		[35, 9], [29, 4], [24, 0], 
		[15, 0], [9, 0], [6.0, 2.5], 
		[3, 5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[3, 12], [3, 19], [10, 24], 
		[15, 27], [22, 28], [22, 28], 
		[23.5, 28.0], [25, 28], [27, 27], 
		[32, 26], [34, 21], [35, 19], 
		[35.0, 18.0], [35, 17], [35, 16], 
		[35, 9], [29, 4], [24, 0], 
		[15, 0], [9, 0], [6.0, 2.5], 
		[3, 5], ]);
}}}

module ArchitectsDaughter_contour00x6f_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([22, 28], [22, 28], [23.5, 28.0],steps,height);
	BezConic([35.0, 18.0], [35, 17], [35, 16],steps,height);
}
}

module ArchitectsDaughter_contour00x6f_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3, 12], [3, 19], [10, 24],steps,height);
	BezConic([10, 24], [15, 27], [22, 28],steps,height);
	BezConic([23.5, 28.0], [25, 28], [27, 27],steps,height);
	BezConic([27, 27], [32, 26], [34, 21],steps,height);
	BezConic([34, 21], [35, 19], [35.0, 18.0],steps,height);
	BezConic([35, 16], [35, 9], [29, 4],steps,height);
	BezConic([29, 4], [24, 0], [15, 0],steps,height);
	BezConic([15, 0], [9, 0], [6.0, 2.5],steps,height);
	BezConic([6.0, 2.5], [3, 5], [3, 12],steps,height);
}
}

module ArchitectsDaughter_contour00x6f(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x6f_skeleton(height);
			ArchitectsDaughter_contour00x6f_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x6f_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x6f_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[8, 10], [8, 7], [10, 5], 
		[11, 4], [15.0, 4.0], [19, 4], 
		[21.5, 4.5], [24, 5], [26, 7], 
		[31, 10], [31, 16], [31, 20], 
		[29, 22], [27, 25], [23, 25], 
		[21, 24], [18.5, 23.5], [16, 23], 
		[14, 22],[9, 19], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[8, 10], [8, 7], [10, 5], 
		[11, 4], [15.0, 4.0], [19, 4], 
		[21.5, 4.5], [24, 5], [26, 7], 
		[31, 10], [31, 16], [31, 20], 
		[29, 22], [27, 25], [23, 25], 
		[21, 24], [18.5, 23.5], [16, 23], 
		[14, 22],[9, 19], ]);
}}}

module ArchitectsDaughter_contour10x6f_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8, 10], [8, 7], [10, 5],steps,height);
	BezConic([10, 5], [11, 4], [15.0, 4.0],steps,height);
	BezConic([15.0, 4.0], [19, 4], [21.5, 4.5],steps,height);
	BezConic([21.5, 4.5], [24, 5], [26, 7],steps,height);
	BezConic([26, 7], [31, 10], [31, 16],steps,height);
	BezConic([31, 16], [31, 20], [29, 22],steps,height);
	BezConic([29, 22], [27, 25], [23, 25],steps,height);
	BezConic([18.5, 23.5], [16, 23], [14, 22],steps,height);
	BezConic([14, 22], [9, 19], [8, 10],steps,height);
}
}

module ArchitectsDaughter_contour10x6f_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([23, 25], [21, 24], [18.5, 23.5],steps,height);
}
}

module ArchitectsDaughter_contour10x6f(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x6f_skeleton(height);
			ArchitectsDaughter_contour10x6f_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x6f_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x6f(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x6f(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x6f(steps, height);
	}
}

ArchitectsDaughter_bbox0x6f=[[3, 0], [35, 28]];

module ArchitectsDaughter_letter0x6f(steps=2, height) {
	ArchitectsDaughter_chunk10x6f(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x70_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[8, 25], [16, 28], [22, 28], 
		[30, 28], [33, 24], [34, 22], 
		[34, 20], [34, 17], [32.0, 13.5], 
		[30, 10], [27, 7], [19, 1], 
		[9, 0], [9, -1], [9.0, -2.5], 
		[9, -4], [9.0, -6.0], [9, -8], 
		[9.0, -10.0], [9, -12], [9, -14], 
		[9, -19], [9.0, -19.5], [9, -20], 
		[9, -21], [9, -22], [8.0, -23.0], 
		[7, -24], [6, -24], [5, -24], 
		[5, -24], [4.5, 1.0], [4, 26], 
		[4, 27], [5.0, 27.0], [6, 27], 
		[6.5, 26.5],[7, 26], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[8, 25], [16, 28], [22, 28], 
		[30, 28], [33, 24], [34, 22], 
		[34, 20], [34, 17], [32.0, 13.5], 
		[30, 10], [27, 7], [19, 1], 
		[9, 0], [9, -1], [9.0, -2.5], 
		[9, -4], [9.0, -6.0], [9, -8], 
		[9.0, -10.0], [9, -12], [9, -14], 
		[9, -19], [9.0, -19.5], [9, -20], 
		[9, -21], [9, -22], [8.0, -23.0], 
		[7, -24], [6, -24], [5, -24], 
		[5, -24], [4.5, 1.0], [4, 26], 
		[4, 27], [5.0, 27.0], [6, 27], 
		[6.5, 26.5],[7, 26], ]);
}}}

module ArchitectsDaughter_contour00x70_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([9, 0], [9, -1], [9.0, -2.5],steps,height);
	BezConic([9.0, -2.5], [9, -4], [9.0, -6.0],steps,height);
	BezConic([9.0, -6.0], [9, -8], [9.0, -10.0],steps,height);
	BezConic([9.0, -10.0], [9, -12], [9, -14],steps,height);
	BezConic([9, -14], [9, -19], [9.0, -19.5],steps,height);
	BezConic([9.0, -19.5], [9, -20], [9, -21],steps,height);
	BezConic([6, -24], [5, -24], [5, -24],steps,height);
}
}

module ArchitectsDaughter_contour00x70_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8, 25], [16, 28], [22, 28],steps,height);
	BezConic([22, 28], [30, 28], [33, 24],steps,height);
	BezConic([33, 24], [34, 22], [34, 20],steps,height);
	BezConic([34, 20], [34, 17], [32.0, 13.5],steps,height);
	BezConic([32.0, 13.5], [30, 10], [27, 7],steps,height);
	BezConic([27, 7], [19, 1], [9, 0],steps,height);
	BezConic([9, -21], [9, -22], [8.0, -23.0],steps,height);
	BezConic([8.0, -23.0], [7, -24], [6, -24],steps,height);
	BezConic([4, 26], [4, 27], [5.0, 27.0],steps,height);
	BezConic([5.0, 27.0], [6, 27], [6.5, 26.5],steps,height);
	BezConic([6.5, 26.5], [7, 26], [8, 25],steps,height);
}
}

module ArchitectsDaughter_contour00x70(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x70_skeleton(height);
			ArchitectsDaughter_contour00x70_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x70_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x70_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[26, 23], [24, 24], [21.5, 24.0], 
		[19, 24], [17, 24], [12, 23], 
		[9, 19], [8, 17], [8, 15], 
		[8, 15], [8, 15], [8.0, 9.5], 
		[8, 4], [21, 7], [26, 12], 
		[29, 15], [29, 18], [29, 21], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[26, 23], [24, 24], [21.5, 24.0], 
		[19, 24], [17, 24], [12, 23], 
		[9, 19], [8, 17], [8, 15], 
		[8, 15], [8, 15], [8.0, 9.5], 
		[8, 4], [21, 7], [26, 12], 
		[29, 15], [29, 18], [29, 21], 
		 ]);
}}}

module ArchitectsDaughter_contour10x70_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 23], [24, 24], [21.5, 24.0],steps,height);
	BezConic([21.5, 24.0], [19, 24], [17, 24],steps,height);
	BezConic([17, 24], [12, 23], [9, 19],steps,height);
	BezConic([9, 19], [8, 17], [8, 15],steps,height);
	BezConic([8, 15], [8, 15], [8, 15],steps,height);
	BezConic([8, 4], [21, 7], [26, 12],steps,height);
	BezConic([26, 12], [29, 15], [29, 18],steps,height);
	BezConic([29, 18], [29, 21], [26, 23],steps,height);
}
}

module ArchitectsDaughter_contour10x70_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x70(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x70_skeleton(height);
			ArchitectsDaughter_contour10x70_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x70_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x70(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x70(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x70(steps, height);
	}
}

ArchitectsDaughter_bbox0x70=[[4, -24], [34, 28]];

module ArchitectsDaughter_letter0x70(steps=2, height) {
	ArchitectsDaughter_chunk10x70(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x71_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[30, -22], [29.5, -22.0], [29, -22], 
		[28.0, -22.0], [27, -22], [26.5, -8.5], 
		[26, 5], [24, 3], [19, 1], 
		[14, 0], [11, 0], [8, 0], 
		[6.0, 0.5], [4, 1], [3.0, 2.0], 
		[2, 3], [2.0, 4.5], [2, 6], 
		[2, 6], [2, 10], [4.0, 13.5], 
		[6, 17], [9.0, 19.5], [12, 22], 
		[16.0, 23.5], [20, 25], [24, 25], 
		[24.5, 25.0], [25, 25], [26, 25], 
		[27.5, 23.5], [29, 22], [30, 21], 
		[30, 10], [30.5, -0.5], [31, -11], 
		[31, -22],[30.5, -22.0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[30, -22], [29.5, -22.0], [29, -22], 
		[28.0, -22.0], [27, -22], [26.5, -8.5], 
		[26, 5], [24, 3], [19, 1], 
		[14, 0], [11, 0], [8, 0], 
		[6.0, 0.5], [4, 1], [3.0, 2.0], 
		[2, 3], [2.0, 4.5], [2, 6], 
		[2, 6], [2, 10], [4.0, 13.5], 
		[6, 17], [9.0, 19.5], [12, 22], 
		[16.0, 23.5], [20, 25], [24, 25], 
		[24.5, 25.0], [25, 25], [26, 25], 
		[27.5, 23.5], [29, 22], [30, 21], 
		[30, 10], [30.5, -0.5], [31, -11], 
		[31, -22],[30.5, -22.0], ]);
}}}

module ArchitectsDaughter_contour00x71_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2.0, 4.5], [2, 6], [2, 6],steps,height);
	BezConic([27.5, 23.5], [29, 22], [30, 21],steps,height);
	BezConic([30, 21], [30, 10], [30.5, -0.5],steps,height);
}
}

module ArchitectsDaughter_contour00x71_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([26, 5], [24, 3], [19, 1],steps,height);
	BezConic([19, 1], [14, 0], [11, 0],steps,height);
	BezConic([11, 0], [8, 0], [6.0, 0.5],steps,height);
	BezConic([6.0, 0.5], [4, 1], [3.0, 2.0],steps,height);
	BezConic([3.0, 2.0], [2, 3], [2.0, 4.5],steps,height);
	BezConic([2, 6], [2, 10], [4.0, 13.5],steps,height);
	BezConic([4.0, 13.5], [6, 17], [9.0, 19.5],steps,height);
	BezConic([9.0, 19.5], [12, 22], [16.0, 23.5],steps,height);
	BezConic([16.0, 23.5], [20, 25], [24, 25],steps,height);
	BezConic([25, 25], [26, 25], [27.5, 23.5],steps,height);
	BezConic([30.5, -0.5], [31, -11], [31, -22],steps,height);
}
}

module ArchitectsDaughter_contour00x71(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x71_skeleton(height);
			ArchitectsDaughter_contour00x71_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x71_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_contour10x71_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[25, 18], [25, 21], [24, 21], 
		[17, 21], [12, 17], [7, 13], 
		[7, 7], [7, 4], [10, 4], 
		[11, 4], [12.5, 4.0], [14, 4], 
		[16.5, 4.5], [19, 5], [21, 6], 
		[25, 8], [25, 13], [25.0, 15.5], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[25, 18], [25, 21], [24, 21], 
		[17, 21], [12, 17], [7, 13], 
		[7, 7], [7, 4], [10, 4], 
		[11, 4], [12.5, 4.0], [14, 4], 
		[16.5, 4.5], [19, 5], [21, 6], 
		[25, 8], [25, 13], [25.0, 15.5], 
		 ]);
}}}

module ArchitectsDaughter_contour10x71_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([25, 18], [25, 21], [24, 21],steps,height);
	BezConic([24, 21], [17, 21], [12, 17],steps,height);
	BezConic([12, 17], [7, 13], [7, 7],steps,height);
	BezConic([7, 7], [7, 4], [10, 4],steps,height);
	BezConic([10, 4], [11, 4], [12.5, 4.0],steps,height);
	BezConic([12.5, 4.0], [14, 4], [16.5, 4.5],steps,height);
	BezConic([16.5, 4.5], [19, 5], [21, 6],steps,height);
	BezConic([21, 6], [25, 8], [25, 13],steps,height);
}
}

module ArchitectsDaughter_contour10x71_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour10x71(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour10x71_skeleton(height);
			ArchitectsDaughter_contour10x71_subtractive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x71_additive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x71(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x71(steps, height);
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour10x71(steps, height);
	}
}

ArchitectsDaughter_bbox0x71=[[2, -22], [31, 25]];

module ArchitectsDaughter_letter0x71(steps=2, height) {
	ArchitectsDaughter_chunk10x71(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x72_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[32, 23], [30, 25], [26, 25], 
		[22, 25], [18, 23], [12, 21], 
		[10, 17], [9, 15], [9, 13], 
		[9, 12], [9.0, 10.5], [9, 9], 
		[9.5, 6.0], [10, 3], [10, 0], 
		[9, 0], [8.0, -0.5], [7, -1], 
		[6.5, -1.0], [6, -1], [5.5, -0.5], 
		[5, 0], [5, 2], [5, 2], 
		[4.5, 4.0], [4, 6], [4.0, 8.5], 
		[4, 11], [3.5, 14.0], [3, 17], 
		[3, 19], [2, 26], [2, 29], 
		[2, 30], [4, 30], [5, 30], 
		[6.0, 29.0], [7, 28], [7.5, 26.5], 
		[8, 25], [8.0, 23.5], [8, 22], 
		[8, 22], [16, 29], [29, 29], 
		[30, 29], [31, 29], [32, 29], 
		[32.5, 29.0], [33, 29], [33, 28], 
		[34, 28], [34, 26], [34, 23], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[32, 23], [30, 25], [26, 25], 
		[22, 25], [18, 23], [12, 21], 
		[10, 17], [9, 15], [9, 13], 
		[9, 12], [9.0, 10.5], [9, 9], 
		[9.5, 6.0], [10, 3], [10, 0], 
		[9, 0], [8.0, -0.5], [7, -1], 
		[6.5, -1.0], [6, -1], [5.5, -0.5], 
		[5, 0], [5, 2], [5, 2], 
		[4.5, 4.0], [4, 6], [4.0, 8.5], 
		[4, 11], [3.5, 14.0], [3, 17], 
		[3, 19], [2, 26], [2, 29], 
		[2, 30], [4, 30], [5, 30], 
		[6.0, 29.0], [7, 28], [7.5, 26.5], 
		[8, 25], [8.0, 23.5], [8, 22], 
		[8, 22], [16, 29], [29, 29], 
		[30, 29], [31, 29], [32, 29], 
		[32.5, 29.0], [33, 29], [33, 28], 
		[34, 28], [34, 26], [34, 23], 
		 ]);
}}}

module ArchitectsDaughter_contour00x72_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([32, 23], [30, 25], [26, 25],steps,height);
	BezConic([26, 25], [22, 25], [18, 23],steps,height);
	BezConic([18, 23], [12, 21], [10, 17],steps,height);
	BezConic([10, 17], [9, 15], [9, 13],steps,height);
	BezConic([9, 13], [9, 12], [9.0, 10.5],steps,height);
	BezConic([9.0, 10.5], [9, 9], [9.5, 6.0],steps,height);
	BezConic([10, 0], [9, 0], [8.0, -0.5],steps,height);
	BezConic([5, 2], [5, 2], [4.5, 4.0],steps,height);
	BezConic([4.0, 8.5], [4, 11], [3.5, 14.0],steps,height);
	BezConic([8.0, 23.5], [8, 22], [8, 22],steps,height);
	BezConic([29, 29], [30, 29], [31, 29],steps,height);
	BezConic([31, 29], [32, 29], [32.5, 29.0],steps,height);
}
}

module ArchitectsDaughter_contour00x72_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([9.5, 6.0], [10, 3], [10, 0],steps,height);
	BezConic([8.0, -0.5], [7, -1], [6.5, -1.0],steps,height);
	BezConic([6.5, -1.0], [6, -1], [5.5, -0.5],steps,height);
	BezConic([5.5, -0.5], [5, 0], [5, 2],steps,height);
	BezConic([4.5, 4.0], [4, 6], [4.0, 8.5],steps,height);
	BezConic([3.5, 14.0], [3, 17], [3, 19],steps,height);
	BezConic([3, 19], [2, 26], [2, 29],steps,height);
	BezConic([2, 29], [2, 30], [4, 30],steps,height);
	BezConic([4, 30], [5, 30], [6.0, 29.0],steps,height);
	BezConic([6.0, 29.0], [7, 28], [7.5, 26.5],steps,height);
	BezConic([7.5, 26.5], [8, 25], [8.0, 23.5],steps,height);
	BezConic([8, 22], [16, 29], [29, 29],steps,height);
	BezConic([32.5, 29.0], [33, 29], [33, 28],steps,height);
	BezConic([33, 28], [34, 28], [34, 26],steps,height);
	BezConic([34, 26], [34, 23], [32, 23],steps,height);
}
}

module ArchitectsDaughter_contour00x72(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x72_skeleton(height);
			ArchitectsDaughter_contour00x72_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x72_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x72(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x72(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x72=[[2, -1], [34, 30]];

module ArchitectsDaughter_letter0x72(steps=2, height) {
	ArchitectsDaughter_chunk10x72(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x73_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[23, 16], [30, 16], [30, 13], 
		[30, 10], [26, 7], [20, 1], 
		[11, -2], [10, -2], [9.5, -1.0], 
		[9, 0], [9.0, 0.5], [9, 1], 
		[9, 1], [16, 3], [20, 7], 
		[24, 9], [24.0, 10.5], [24, 12], 
		[20.0, 12.0], [16, 12], [9, 10], 
		[6, 10], [3, 12], [1, 14], 
		[1.0, 16.0], [1, 18], [2.5, 20.0], 
		[4, 22], [5.5, 23.5], [7, 25], 
		[10, 26], [16, 29], [23, 29], 
		[25, 29], [26, 28], [28, 28], 
		[28.0, 27.0], [28, 26], [28, 23], 
		[25, 24], [20, 24], [14, 24], 
		[11, 22], [7, 20], [7, 16], 
		[7, 14], [9, 14], [11.5, 14.5], 
		[14, 15],[20, 16], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[23, 16], [30, 16], [30, 13], 
		[30, 10], [26, 7], [20, 1], 
		[11, -2], [10, -2], [9.5, -1.0], 
		[9, 0], [9.0, 0.5], [9, 1], 
		[9, 1], [16, 3], [20, 7], 
		[24, 9], [24.0, 10.5], [24, 12], 
		[20.0, 12.0], [16, 12], [9, 10], 
		[6, 10], [3, 12], [1, 14], 
		[1.0, 16.0], [1, 18], [2.5, 20.0], 
		[4, 22], [5.5, 23.5], [7, 25], 
		[10, 26], [16, 29], [23, 29], 
		[25, 29], [26, 28], [28, 28], 
		[28.0, 27.0], [28, 26], [28, 23], 
		[25, 24], [20, 24], [14, 24], 
		[11, 22], [7, 20], [7, 16], 
		[7, 14], [9, 14], [11.5, 14.5], 
		[14, 15],[20, 16], ]);
}}}

module ArchitectsDaughter_contour00x73_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([9.0, 0.5], [9, 1], [9, 1],steps,height);
	BezConic([9, 1], [16, 3], [20, 7],steps,height);
	BezConic([20, 7], [24, 9], [24.0, 10.5],steps,height);
	BezConic([24.0, 10.5], [24, 12], [20.0, 12.0],steps,height);
	BezConic([20.0, 12.0], [16, 12], [9, 10],steps,height);
	BezConic([28.0, 27.0], [28, 26], [28, 23],steps,height);
	BezConic([28, 23], [25, 24], [20, 24],steps,height);
	BezConic([20, 24], [14, 24], [11, 22],steps,height);
	BezConic([11, 22], [7, 20], [7, 16],steps,height);
	BezConic([7, 16], [7, 14], [9, 14],steps,height);
}
}

module ArchitectsDaughter_contour00x73_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([23, 16], [30, 16], [30, 13],steps,height);
	BezConic([30, 13], [30, 10], [26, 7],steps,height);
	BezConic([26, 7], [20, 1], [11, -2],steps,height);
	BezConic([11, -2], [10, -2], [9.5, -1.0],steps,height);
	BezConic([9.5, -1.0], [9, 0], [9.0, 0.5],steps,height);
	BezConic([9, 10], [6, 10], [3, 12],steps,height);
	BezConic([3, 12], [1, 14], [1.0, 16.0],steps,height);
	BezConic([1.0, 16.0], [1, 18], [2.5, 20.0],steps,height);
	BezConic([2.5, 20.0], [4, 22], [5.5, 23.5],steps,height);
	BezConic([5.5, 23.5], [7, 25], [10, 26],steps,height);
	BezConic([10, 26], [16, 29], [23, 29],steps,height);
	BezConic([23, 29], [25, 29], [26, 28],steps,height);
	BezConic([26, 28], [28, 28], [28.0, 27.0],steps,height);
	BezConic([14, 15], [20, 16], [23, 16],steps,height);
}
}

module ArchitectsDaughter_contour00x73(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x73_skeleton(height);
			ArchitectsDaughter_contour00x73_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x73_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x73(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x73(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x73=[[1, -2], [30, 29]];

module ArchitectsDaughter_letter0x73(steps=2, height) {
	ArchitectsDaughter_chunk10x73(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x74_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[11, 6], [11.0, 11.0], [11, 16], 
		[11, 18], [11, 20], [6.0, 20.0], 
		[1, 20], [1.0, 22.0], [1, 24], 
		[5.5, 24.0], [10, 24], [10.0, 32.5], 
		[10, 41], [11, 41], [11, 42], 
		[12, 43], [12.5, 43.0], [13, 43], 
		[13.5, 42.5], [14, 42], [15, 42], 
		[16, 37], [16, 29], [16, 27], 
		[16, 25], [18, 25], [20, 25], 
		[20, 25], [23, 25], [24, 25], 
		[25, 25], [25.0, 23.0], [25, 21], 
		[20.5, 21.0], [16, 21], [16.0, 10.5], 
		[16, 0], [15, -1], [14, -1], 
		[11, -1], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[11, 6], [11.0, 11.0], [11, 16], 
		[11, 18], [11, 20], [6.0, 20.0], 
		[1, 20], [1.0, 22.0], [1, 24], 
		[5.5, 24.0], [10, 24], [10.0, 32.5], 
		[10, 41], [11, 41], [11, 42], 
		[12, 43], [12.5, 43.0], [13, 43], 
		[13.5, 42.5], [14, 42], [15, 42], 
		[16, 37], [16, 29], [16, 27], 
		[16, 25], [18, 25], [20, 25], 
		[20, 25], [23, 25], [24, 25], 
		[25, 25], [25.0, 23.0], [25, 21], 
		[20.5, 21.0], [16, 21], [16.0, 10.5], 
		[16, 0], [15, -1], [14, -1], 
		[11, -1], ]);
}}}

module ArchitectsDaughter_contour00x74_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([11, 16], [11, 18], [11, 20],steps,height);
	BezConic([10, 41], [11, 41], [11, 42],steps,height);
	BezConic([13.5, 42.5], [14, 42], [15, 42],steps,height);
	BezConic([16, 29], [16, 27], [16, 25],steps,height);
	BezConic([16, 25], [18, 25], [20, 25],steps,height);
	BezConic([20, 25], [20, 25], [23, 25],steps,height);
	BezConic([23, 25], [24, 25], [25, 25],steps,height);
}
}

module ArchitectsDaughter_contour00x74_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([11, 42], [12, 43], [12.5, 43.0],steps,height);
	BezConic([12.5, 43.0], [13, 43], [13.5, 42.5],steps,height);
	BezConic([15, 42], [16, 37], [16, 29],steps,height);
	BezConic([16, 0], [15, -1], [14, -1],steps,height);
	BezConic([14, -1], [11, -1], [11, 6],steps,height);
}
}

module ArchitectsDaughter_contour00x74(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x74_skeleton(height);
			ArchitectsDaughter_contour00x74_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x74_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x74(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x74(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x74=[[1, -1], [25, 43]];

module ArchitectsDaughter_letter0x74(steps=2, height) {
	ArchitectsDaughter_chunk10x74(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x75_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[1, 8], [1, 9], [1.0, 11.0], 
		[1, 13], [1.0, 15.0], [1, 17], 
		[1.0, 19.5], [1, 22], [1, 23], 
		[2, 27], [5, 27], [6, 27], 
		[7.0, 26.0], [8, 25], [8.0, 24.0], 
		[8, 23], [7, 22], [5, 16], 
		[5, 12], [5, 10], [5, 9], 
		[6, 5], [12, 5], [15, 5], 
		[18, 6], [23, 8], [25, 10], 
		[25, 13], [25.0, 15.0], [25, 17], 
		[25.0, 19.0], [25, 21], [25.0, 23.0], 
		[25, 25], [25, 27], [25, 28], 
		[26.0, 28.0], [27, 28], [28.0, 27.0], 
		[29, 26], [29.5, 23.5], [30, 21], 
		[30.0, 18.0], [30, 15], [30.0, 12.0], 
		[30, 9], [30.0, 6.0], [30, 3], 
		[31, 1], [30, 0], [29, 0], 
		[27, 0], [25, 5], [25, 4], 
		[23, 3], [19, 1], [13, 0], 
		[12, 0], [10.5, 0.0], [9, 0], 
		[7.0, 0.5], [5, 1], [3.5, 3.0], 
		[2, 5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[1, 8], [1, 9], [1.0, 11.0], 
		[1, 13], [1.0, 15.0], [1, 17], 
		[1.0, 19.5], [1, 22], [1, 23], 
		[2, 27], [5, 27], [6, 27], 
		[7.0, 26.0], [8, 25], [8.0, 24.0], 
		[8, 23], [7, 22], [5, 16], 
		[5, 12], [5, 10], [5, 9], 
		[6, 5], [12, 5], [15, 5], 
		[18, 6], [23, 8], [25, 10], 
		[25, 13], [25.0, 15.0], [25, 17], 
		[25.0, 19.0], [25, 21], [25.0, 23.0], 
		[25, 25], [25, 27], [25, 28], 
		[26.0, 28.0], [27, 28], [28.0, 27.0], 
		[29, 26], [29.5, 23.5], [30, 21], 
		[30.0, 18.0], [30, 15], [30.0, 12.0], 
		[30, 9], [30.0, 6.0], [30, 3], 
		[31, 1], [30, 0], [29, 0], 
		[27, 0], [25, 5], [25, 4], 
		[23, 3], [19, 1], [13, 0], 
		[12, 0], [10.5, 0.0], [9, 0], 
		[7.0, 0.5], [5, 1], [3.5, 3.0], 
		[2, 5], ]);
}}}

module ArchitectsDaughter_contour00x75_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([1, 8], [1, 9], [1.0, 11.0],steps,height);
	BezConic([1.0, 11.0], [1, 13], [1.0, 15.0],steps,height);
	BezConic([1.0, 15.0], [1, 17], [1.0, 19.5],steps,height);
	BezConic([1.0, 19.5], [1, 22], [1, 23],steps,height);
	BezConic([7, 22], [5, 16], [5, 12],steps,height);
	BezConic([5, 12], [5, 10], [5, 9],steps,height);
	BezConic([5, 9], [6, 5], [12, 5],steps,height);
	BezConic([12, 5], [15, 5], [18, 6],steps,height);
	BezConic([18, 6], [23, 8], [25, 10],steps,height);
	BezConic([25, 10], [25, 13], [25.0, 15.0],steps,height);
	BezConic([25.0, 15.0], [25, 17], [25.0, 19.0],steps,height);
	BezConic([25.0, 19.0], [25, 21], [25.0, 23.0],steps,height);
	BezConic([25.0, 23.0], [25, 25], [25, 27],steps,height);
	BezConic([30.0, 18.0], [30, 15], [30.0, 12.0],steps,height);
	BezConic([30.0, 12.0], [30, 9], [30.0, 6.0],steps,height);
	BezConic([30.0, 6.0], [30, 3], [31, 1],steps,height);
	BezConic([13, 0], [12, 0], [10.5, 0.0],steps,height);
}
}

module ArchitectsDaughter_contour00x75_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([1, 23], [2, 27], [5, 27],steps,height);
	BezConic([5, 27], [6, 27], [7.0, 26.0],steps,height);
	BezConic([7.0, 26.0], [8, 25], [8.0, 24.0],steps,height);
	BezConic([8.0, 24.0], [8, 23], [7, 22],steps,height);
	BezConic([25, 27], [25, 28], [26.0, 28.0],steps,height);
	BezConic([26.0, 28.0], [27, 28], [28.0, 27.0],steps,height);
	BezConic([28.0, 27.0], [29, 26], [29.5, 23.5],steps,height);
	BezConic([29.5, 23.5], [30, 21], [30.0, 18.0],steps,height);
	BezConic([31, 1], [30, 0], [29, 0],steps,height);
	BezConic([29, 0], [27, 0], [25, 5],steps,height);
	BezConic([25, 5], [25, 4], [23, 3],steps,height);
	BezConic([23, 3], [19, 1], [13, 0],steps,height);
	BezConic([10.5, 0.0], [9, 0], [7.0, 0.5],steps,height);
	BezConic([7.0, 0.5], [5, 1], [3.5, 3.0],steps,height);
	BezConic([3.5, 3.0], [2, 5], [1, 8],steps,height);
}
}

module ArchitectsDaughter_contour00x75(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x75_skeleton(height);
			ArchitectsDaughter_contour00x75_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x75_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x75(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x75(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x75=[[1, 0], [31, 28]];

module ArchitectsDaughter_letter0x75(steps=2, height) {
	ArchitectsDaughter_chunk10x75(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x76_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 24], [2, 25], [2.0, 25.0], 
		[2, 25], [2.5, 26.0], [3, 27], 
		[3.5, 27.5], [4, 28], [4.5, 28.0], 
		[5, 28], [6, 27], [11.0, 17.0], 
		[16, 7], [17, 8], [18.0, 10.0], 
		[19, 12], [20.5, 14.5], [22, 17], 
		[23.5, 20.0], [25, 23], [26, 25], 
		[29, 30], [30, 30], [31, 30], 
		[31.5, 29.0], [32, 28], [32.0, 27.5], 
		[32, 27], [32, 27], [29, 20], 
		[26.0, 13.5], [23, 7], [22.0, 5.0], 
		[21, 3], [20, 2], [19, 0], 
		[17.5, 0.0], [16, 0], [14.5, 2.0], 
		[13, 4], [11, 7], [7, 13], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 24], [2, 25], [2.0, 25.0], 
		[2, 25], [2.5, 26.0], [3, 27], 
		[3.5, 27.5], [4, 28], [4.5, 28.0], 
		[5, 28], [6, 27], [11.0, 17.0], 
		[16, 7], [17, 8], [18.0, 10.0], 
		[19, 12], [20.5, 14.5], [22, 17], 
		[23.5, 20.0], [25, 23], [26, 25], 
		[29, 30], [30, 30], [31, 30], 
		[31.5, 29.0], [32, 28], [32.0, 27.5], 
		[32, 27], [32, 27], [29, 20], 
		[26.0, 13.5], [23, 7], [22.0, 5.0], 
		[21, 3], [20, 2], [19, 0], 
		[17.5, 0.0], [16, 0], [14.5, 2.0], 
		[13, 4], [11, 7], [7, 13], 
		 ]);
}}}

module ArchitectsDaughter_contour00x76_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 24], [2, 25], [2.0, 25.0],steps,height);
	BezConic([2.0, 25.0], [2, 25], [2.5, 26.0],steps,height);
	BezConic([16, 7], [17, 8], [18.0, 10.0],steps,height);
	BezConic([20.5, 14.5], [22, 17], [23.5, 20.0],steps,height);
	BezConic([23.5, 20.0], [25, 23], [26, 25],steps,height);
	BezConic([32.0, 27.5], [32, 27], [32, 27],steps,height);
}
}

module ArchitectsDaughter_contour00x76_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2.5, 26.0], [3, 27], [3.5, 27.5],steps,height);
	BezConic([3.5, 27.5], [4, 28], [4.5, 28.0],steps,height);
	BezConic([4.5, 28.0], [5, 28], [6, 27],steps,height);
	BezConic([18.0, 10.0], [19, 12], [20.5, 14.5],steps,height);
	BezConic([26, 25], [29, 30], [30, 30],steps,height);
	BezConic([30, 30], [31, 30], [31.5, 29.0],steps,height);
	BezConic([31.5, 29.0], [32, 28], [32.0, 27.5],steps,height);
	BezConic([32, 27], [29, 20], [26.0, 13.5],steps,height);
	BezConic([26.0, 13.5], [23, 7], [22.0, 5.0],steps,height);
	BezConic([22.0, 5.0], [21, 3], [20, 2],steps,height);
	BezConic([20, 2], [19, 0], [17.5, 0.0],steps,height);
	BezConic([17.5, 0.0], [16, 0], [14.5, 2.0],steps,height);
	BezConic([14.5, 2.0], [13, 4], [11, 7],steps,height);
	BezConic([11, 7], [7, 13], [2, 24],steps,height);
}
}

module ArchitectsDaughter_contour00x76(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x76_skeleton(height);
			ArchitectsDaughter_contour00x76_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x76_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x76(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x76(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x76=[[2, 0], [32, 30]];

module ArchitectsDaughter_letter0x76(steps=2, height) {
	ArchitectsDaughter_chunk10x76(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x77_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[25, 17], [24, 13], [23.0, 9.0], 
		[22, 5], [21, 2], [20, -1], 
		[18, -1], [17, -1], [16, 0], 
		[13, 3], [8, 13], [3, 23], 
		[3, 26], [3, 27], [3.5, 27.5], 
		[4, 28], [5, 27], [7, 27], 
		[8, 25], [9, 25], [9, 23], 
		[10.0, 21.0], [11, 19], [13, 13], 
		[16, 7], [17, 10], [19, 13], 
		[20.0, 15.5], [21, 18], [23, 25], 
		[25, 25], [27, 26], [34, 14], 
		[38, 9], [39, 8], [39, 8], 
		[40.0, 12.0], [41, 16], [41.5, 18.5], 
		[42, 21], [43, 23], [45, 28], 
		[47, 28], [48, 28], [48.5, 27.5], 
		[49, 27], [49.0, 27.0], [49, 27], 
		[49, 26], [48, 24], [47.5, 21.5], 
		[47, 19], [46.0, 16.0], [45, 13], 
		[44.0, 10.5], [43, 8], [42, 5], 
		[40, 0], [39, 0], [38, -1], 
		[35, 2], [34, 4], [33.0, 6.0], 
		[32, 8], [31, 10], [27, 15], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[25, 17], [24, 13], [23.0, 9.0], 
		[22, 5], [21, 2], [20, -1], 
		[18, -1], [17, -1], [16, 0], 
		[13, 3], [8, 13], [3, 23], 
		[3, 26], [3, 27], [3.5, 27.5], 
		[4, 28], [5, 27], [7, 27], 
		[8, 25], [9, 25], [9, 23], 
		[10.0, 21.0], [11, 19], [13, 13], 
		[16, 7], [17, 10], [19, 13], 
		[20.0, 15.5], [21, 18], [23, 25], 
		[25, 25], [27, 26], [34, 14], 
		[38, 9], [39, 8], [39, 8], 
		[40.0, 12.0], [41, 16], [41.5, 18.5], 
		[42, 21], [43, 23], [45, 28], 
		[47, 28], [48, 28], [48.5, 27.5], 
		[49, 27], [49.0, 27.0], [49, 27], 
		[49, 26], [48, 24], [47.5, 21.5], 
		[47, 19], [46.0, 16.0], [45, 13], 
		[44.0, 10.5], [43, 8], [42, 5], 
		[40, 0], [39, 0], [38, -1], 
		[35, 2], [34, 4], [33.0, 6.0], 
		[32, 8], [31, 10], [27, 15], 
		 ]);
}}}

module ArchitectsDaughter_contour00x77_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([25, 17], [24, 13], [23.0, 9.0],steps,height);
	BezConic([11, 19], [13, 13], [16, 7],steps,height);
	BezConic([34, 14], [38, 9], [39, 8],steps,height);
	BezConic([39, 8], [39, 8], [40.0, 12.0],steps,height);
	BezConic([40.0, 12.0], [41, 16], [41.5, 18.5],steps,height);
	BezConic([48.5, 27.5], [49, 27], [49.0, 27.0],steps,height);
	BezConic([49, 26], [48, 24], [47.5, 21.5],steps,height);
	BezConic([44.0, 10.5], [43, 8], [42, 5],steps,height);
	BezConic([35, 2], [34, 4], [33.0, 6.0],steps,height);
	BezConic([33.0, 6.0], [32, 8], [31, 10],steps,height);
	BezConic([31, 10], [27, 15], [25, 17],steps,height);
}
}

module ArchitectsDaughter_contour00x77_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([23.0, 9.0], [22, 5], [21, 2],steps,height);
	BezConic([21, 2], [20, -1], [18, -1],steps,height);
	BezConic([18, -1], [17, -1], [16, 0],steps,height);
	BezConic([16, 0], [13, 3], [8, 13],steps,height);
	BezConic([8, 13], [3, 23], [3, 26],steps,height);
	BezConic([3, 26], [3, 27], [3.5, 27.5],steps,height);
	BezConic([3.5, 27.5], [4, 28], [5, 27],steps,height);
	BezConic([5, 27], [7, 27], [8, 25],steps,height);
	BezConic([8, 25], [9, 25], [9, 23],steps,height);
	BezConic([16, 7], [17, 10], [19, 13],steps,height);
	BezConic([21, 18], [23, 25], [25, 25],steps,height);
	BezConic([25, 25], [27, 26], [34, 14],steps,height);
	BezConic([41.5, 18.5], [42, 21], [43, 23],steps,height);
	BezConic([43, 23], [45, 28], [47, 28],steps,height);
	BezConic([47, 28], [48, 28], [48.5, 27.5],steps,height);
	BezConic([49.0, 27.0], [49, 27], [49, 26],steps,height);
	BezConic([47.5, 21.5], [47, 19], [46.0, 16.0],steps,height);
	BezConic([46.0, 16.0], [45, 13], [44.0, 10.5],steps,height);
	BezConic([42, 5], [40, 0], [39, 0],steps,height);
	BezConic([39, 0], [38, -1], [35, 2],steps,height);
}
}

module ArchitectsDaughter_contour00x77(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x77_skeleton(height);
			ArchitectsDaughter_contour00x77_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x77_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x77(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x77(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x77=[[3, -1], [49, 28]];

module ArchitectsDaughter_letter0x77(steps=2, height) {
	ArchitectsDaughter_chunk10x77(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x78_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, 2], [5, 5], [8.0, 9.0], 
		[11, 13], [12, 14], [9.0, 17.0], 
		[6, 20], [5, 21], [4.5, 22.0], 
		[4, 23], [3.0, 24.0], [2, 25], 
		[2, 25], [1.5, 25.5], [1, 26], 
		[3.0, 28.0], [5, 30], [8, 26], 
		[9.0, 24.5], [10, 23], [11, 22], 
		[12, 20], [15, 17], [16, 19], 
		[18, 22], [22, 27], [24, 30], 
		[26, 30], [26.5, 29.0], [27, 28], 
		[27, 27], [26, 24], [23, 20], 
		[22, 18], [21.0, 17.0], [20, 16], 
		[19, 14], [23, 12], [28, 5], 
		[29, 4], [30, 3], [30, 3], 
		[29, 2], [28, 0], [27, 0], 
		[26, 0], [25.0, 1.5], [24, 3], 
		[22.5, 5.0], [21, 7], [19.5, 8.5], 
		[18, 10], [16, 11], [15, 10], 
		[12, 7], [7, 1], [6, 0], 
		[5, 0], [2, 1], [2, 1], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, 2], [5, 5], [8.0, 9.0], 
		[11, 13], [12, 14], [9.0, 17.0], 
		[6, 20], [5, 21], [4.5, 22.0], 
		[4, 23], [3.0, 24.0], [2, 25], 
		[2, 25], [1.5, 25.5], [1, 26], 
		[3.0, 28.0], [5, 30], [8, 26], 
		[9.0, 24.5], [10, 23], [11, 22], 
		[12, 20], [15, 17], [16, 19], 
		[18, 22], [22, 27], [24, 30], 
		[26, 30], [26.5, 29.0], [27, 28], 
		[27, 27], [26, 24], [23, 20], 
		[22, 18], [21.0, 17.0], [20, 16], 
		[19, 14], [23, 12], [28, 5], 
		[29, 4], [30, 3], [30, 3], 
		[29, 2], [28, 0], [27, 0], 
		[26, 0], [25.0, 1.5], [24, 3], 
		[22.5, 5.0], [21, 7], [19.5, 8.5], 
		[18, 10], [16, 11], [15, 10], 
		[12, 7], [7, 1], [6, 0], 
		[5, 0], [2, 1], [2, 1], 
		 ]);
}}}

module ArchitectsDaughter_contour00x78_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, 2], [5, 5], [8.0, 9.0],steps,height);
	BezConic([4.5, 22.0], [4, 23], [3.0, 24.0],steps,height);
	BezConic([3.0, 24.0], [2, 25], [2, 25],steps,height);
	BezConic([9.0, 24.5], [10, 23], [11, 22],steps,height);
	BezConic([11, 22], [12, 20], [15, 17],steps,height);
	BezConic([18, 22], [22, 27], [24, 30],steps,height);
	BezConic([21.0, 17.0], [20, 16], [19, 14],steps,height);
	BezConic([25.0, 1.5], [24, 3], [22.5, 5.0],steps,height);
	BezConic([22.5, 5.0], [21, 7], [19.5, 8.5],steps,height);
	BezConic([19.5, 8.5], [18, 10], [16, 11],steps,height);
	BezConic([16, 11], [15, 10], [12, 7],steps,height);
	BezConic([2, 1], [2, 1], [2, 2],steps,height);
}
}

module ArchitectsDaughter_contour00x78_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([8.0, 9.0], [11, 13], [12, 14],steps,height);
	BezConic([6, 20], [5, 21], [4.5, 22.0],steps,height);
	BezConic([5, 30], [8, 26], [9.0, 24.5],steps,height);
	BezConic([15, 17], [16, 19], [18, 22],steps,height);
	BezConic([24, 30], [26, 30], [26.5, 29.0],steps,height);
	BezConic([26.5, 29.0], [27, 28], [27, 27],steps,height);
	BezConic([27, 27], [26, 24], [23, 20],steps,height);
	BezConic([23, 20], [22, 18], [21.0, 17.0],steps,height);
	BezConic([19, 14], [23, 12], [28, 5],steps,height);
	BezConic([28, 5], [29, 4], [30, 3],steps,height);
	BezConic([30, 3], [30, 3], [29, 2],steps,height);
	BezConic([29, 2], [28, 0], [27, 0],steps,height);
	BezConic([27, 0], [26, 0], [25.0, 1.5],steps,height);
	BezConic([12, 7], [7, 1], [6, 0],steps,height);
	BezConic([6, 0], [5, 0], [2, 1],steps,height);
}
}

module ArchitectsDaughter_contour00x78(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x78_skeleton(height);
			ArchitectsDaughter_contour00x78_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x78_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x78(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x78(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x78=[[1, 0], [30, 30]];

module ArchitectsDaughter_letter0x78(steps=2, height) {
	ArchitectsDaughter_chunk10x78(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x79_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[15, -24], [14, -27], [12, -27], 
		[11, -27], [10.5, -26.0], [10, -25], 
		[10, -24], [12, -18], [14.5, -10.5], 
		[17, -3], [18, -1], [16, 2], 
		[11, 8], [1, 22], [1, 23], 
		[1, 23], [1, 23], [2.5, 24.0], 
		[4, 25], [9, 21], [17, 10], 
		[19, 7], [20, 5], [21, 8], 
		[22.0, 10.0], [23, 12], [23.5, 13.0], 
		[24, 14], [24, 16], [27, 21], 
		[30, 29], [31, 29], [32, 29], 
		[33, 29], [34, 29], [34, 28], 
		[34.0, 28.0], [34, 28], [34, 27], 
		[24.5, 1.5], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[15, -24], [14, -27], [12, -27], 
		[11, -27], [10.5, -26.0], [10, -25], 
		[10, -24], [12, -18], [14.5, -10.5], 
		[17, -3], [18, -1], [16, 2], 
		[11, 8], [1, 22], [1, 23], 
		[1, 23], [1, 23], [2.5, 24.0], 
		[4, 25], [9, 21], [17, 10], 
		[19, 7], [20, 5], [21, 8], 
		[22.0, 10.0], [23, 12], [23.5, 13.0], 
		[24, 14], [24, 16], [27, 21], 
		[30, 29], [31, 29], [32, 29], 
		[33, 29], [34, 29], [34, 28], 
		[34.0, 28.0], [34, 28], [34, 27], 
		[24.5, 1.5], ]);
}}}

module ArchitectsDaughter_contour00x79_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([10, -24], [12, -18], [14.5, -10.5],steps,height);
	BezConic([18, -1], [16, 2], [11, 8],steps,height);
	BezConic([1, 23], [1, 23], [1, 23],steps,height);
	BezConic([22.0, 10.0], [23, 12], [23.5, 13.0],steps,height);
	BezConic([23.5, 13.0], [24, 14], [24, 16],steps,height);
	BezConic([24, 16], [27, 21], [30, 29],steps,height);
	BezConic([30, 29], [31, 29], [32, 29],steps,height);
	BezConic([32, 29], [33, 29], [34, 29],steps,height);
	BezConic([34, 29], [34, 28], [34.0, 28.0],steps,height);
}
}

module ArchitectsDaughter_contour00x79_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([15, -24], [14, -27], [12, -27],steps,height);
	BezConic([12, -27], [11, -27], [10.5, -26.0],steps,height);
	BezConic([10.5, -26.0], [10, -25], [10, -24],steps,height);
	BezConic([14.5, -10.5], [17, -3], [18, -1],steps,height);
	BezConic([11, 8], [1, 22], [1, 23],steps,height);
	BezConic([4, 25], [9, 21], [17, 10],steps,height);
	BezConic([17, 10], [19, 7], [20, 5],steps,height);
	BezConic([20, 5], [21, 8], [22.0, 10.0],steps,height);
	BezConic([34.0, 28.0], [34, 28], [34, 27],steps,height);
}
}

module ArchitectsDaughter_contour00x79(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x79_skeleton(height);
			ArchitectsDaughter_contour00x79_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x79_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x79(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x79(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x79=[[1, -27], [34, 29]];

module ArchitectsDaughter_letter0x79(steps=2, height) {
	ArchitectsDaughter_chunk10x79(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x7a_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[9, 0], [2, 0], [2, 3], 
		[2, 4], [5.0, 7.0], [8, 10], 
		[10.0, 11.5], [12, 13], [14, 15], 
		[18, 19], [21, 23], [21, 23], 
		[19.5, 23.0], [18, 23], [16.0, 22.5], 
		[14, 22], [12, 22], [5, 21], 
		[3.0, 21.0], [1, 21], [1, 22], 
		[1, 23], [2.5, 24.0], [4, 25], 
		[4.5, 25.0], [5, 25], [5.0, 25.0], 
		[5, 25], [6.0, 25.0], [7, 25], 
		[8.0, 25.5], [9, 26], [11, 26], 
		[16, 26], [25, 27], [28, 27], 
		[28, 25], [28, 23], [24, 18], 
		[20, 14], [15.5, 10.0], [11, 6], 
		[9, 5], [12, 4], [13, 4], 
		[18.5, 4.5], [24, 5], [26, 5], 
		[28.0, 4.5], [30, 4], [30, 4], 
		[31, 4], [31, 2], [31, 1], 
		[31, 1], [29, 1], [27.5, 1.0], 
		[26, 1], [23.5, 0.5], [21, 0], 
		[17, 0],[11, 0], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[9, 0], [2, 0], [2, 3], 
		[2, 4], [5.0, 7.0], [8, 10], 
		[10.0, 11.5], [12, 13], [14, 15], 
		[18, 19], [21, 23], [21, 23], 
		[19.5, 23.0], [18, 23], [16.0, 22.5], 
		[14, 22], [12, 22], [5, 21], 
		[3.0, 21.0], [1, 21], [1, 22], 
		[1, 23], [2.5, 24.0], [4, 25], 
		[4.5, 25.0], [5, 25], [5.0, 25.0], 
		[5, 25], [6.0, 25.0], [7, 25], 
		[8.0, 25.5], [9, 26], [11, 26], 
		[16, 26], [25, 27], [28, 27], 
		[28, 25], [28, 23], [24, 18], 
		[20, 14], [15.5, 10.0], [11, 6], 
		[9, 5], [12, 4], [13, 4], 
		[18.5, 4.5], [24, 5], [26, 5], 
		[28.0, 4.5], [30, 4], [30, 4], 
		[31, 4], [31, 2], [31, 1], 
		[31, 1], [29, 1], [27.5, 1.0], 
		[26, 1], [23.5, 0.5], [21, 0], 
		[17, 0],[11, 0], ]);
}}}

module ArchitectsDaughter_contour00x7a_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([10.0, 11.5], [12, 13], [14, 15],steps,height);
	BezConic([14, 15], [18, 19], [21, 23],steps,height);
	BezConic([21, 23], [21, 23], [19.5, 23.0],steps,height);
	BezConic([19.5, 23.0], [18, 23], [16.0, 22.5],steps,height);
	BezConic([4.5, 25.0], [5, 25], [5.0, 25.0],steps,height);
	BezConic([5.0, 25.0], [5, 25], [6.0, 25.0],steps,height);
	BezConic([6.0, 25.0], [7, 25], [8.0, 25.5],steps,height);
	BezConic([11, 26], [16, 26], [25, 27],steps,height);
	BezConic([9, 5], [12, 4], [13, 4],steps,height);
	BezConic([28.0, 4.5], [30, 4], [30, 4],steps,height);
	BezConic([31, 2], [31, 1], [31, 1],steps,height);
	BezConic([31, 1], [29, 1], [27.5, 1.0],steps,height);
	BezConic([27.5, 1.0], [26, 1], [23.5, 0.5],steps,height);
	BezConic([17, 0], [11, 0], [9, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x7a_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([9, 0], [2, 0], [2, 3],steps,height);
	BezConic([2, 3], [2, 4], [5.0, 7.0],steps,height);
	BezConic([5.0, 7.0], [8, 10], [10.0, 11.5],steps,height);
	BezConic([16.0, 22.5], [14, 22], [12, 22],steps,height);
	BezConic([12, 22], [5, 21], [3.0, 21.0],steps,height);
	BezConic([3.0, 21.0], [1, 21], [1, 22],steps,height);
	BezConic([1, 22], [1, 23], [2.5, 24.0],steps,height);
	BezConic([2.5, 24.0], [4, 25], [4.5, 25.0],steps,height);
	BezConic([8.0, 25.5], [9, 26], [11, 26],steps,height);
	BezConic([25, 27], [28, 27], [28, 25],steps,height);
	BezConic([28, 25], [28, 23], [24, 18],steps,height);
	BezConic([24, 18], [20, 14], [15.5, 10.0],steps,height);
	BezConic([15.5, 10.0], [11, 6], [9, 5],steps,height);
	BezConic([24, 5], [26, 5], [28.0, 4.5],steps,height);
	BezConic([30, 4], [31, 4], [31, 2],steps,height);
	BezConic([23.5, 0.5], [21, 0], [17, 0],steps,height);
}
}

module ArchitectsDaughter_contour00x7a(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x7a_skeleton(height);
			ArchitectsDaughter_contour00x7a_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x7a_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x7a(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x7a(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x7a=[[1, 0], [31, 27]];

module ArchitectsDaughter_letter0x7a(steps=2, height) {
	ArchitectsDaughter_chunk10x7a(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x7b_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[17.5, 59.0], [16, 58], [15.5, 56.5], 
		[15, 55], [14.5, 52.0], [14, 49], 
		[14.0, 44.5], [14, 40], [15, 33], 
		[15, 31], [14.0, 30.5], [13, 30], 
		[12.0, 29.0], [11, 28], [10.0, 27.5], 
		[9, 27], [9, 26], [9, 25], 
		[9.0, 24.5], [9, 24], [9, 23], 
		[11, 21], [14, 19], [15, 18], 
		[15.5, 18.0], [16, 18], [16, 18], 
		[16, 14], [16.0, 11.5], [16, 9], 
		[16.0, 6.5], [16, 4], [17.0, 1.5], 
		[18, -1], [19.5, -2.0], [21, -3], 
		[22.5, -3.5], [24, -4], [25.5, -4.0], 
		[27, -4], [27, -4], [27.0, -6.5], 
		[27, -9], [16, -8], [14, 0], 
		[12, 4], [12.0, 8.5], [12, 13], 
		[11, 16], [11, 17], [10.0, 18.0], 
		[9, 19], [7, 20], [4, 23], 
		[3, 25], [4, 28], [5.0, 29.0], 
		[6, 30], [7.0, 31.0], [8, 32], 
		[9.0, 32.5], [10, 33], [11, 35], 
		[11, 37], [10, 40], [10, 44], 
		[10.0, 47.0], [10, 50], [10.5, 53.0], 
		[11, 56], [12, 58], [15, 63], 
		[21, 63], [21.0, 61.5], [21, 60], 
		[19, 60], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[17.5, 59.0], [16, 58], [15.5, 56.5], 
		[15, 55], [14.5, 52.0], [14, 49], 
		[14.0, 44.5], [14, 40], [15, 33], 
		[15, 31], [14.0, 30.5], [13, 30], 
		[12.0, 29.0], [11, 28], [10.0, 27.5], 
		[9, 27], [9, 26], [9, 25], 
		[9.0, 24.5], [9, 24], [9, 23], 
		[11, 21], [14, 19], [15, 18], 
		[15.5, 18.0], [16, 18], [16, 18], 
		[16, 14], [16.0, 11.5], [16, 9], 
		[16.0, 6.5], [16, 4], [17.0, 1.5], 
		[18, -1], [19.5, -2.0], [21, -3], 
		[22.5, -3.5], [24, -4], [25.5, -4.0], 
		[27, -4], [27, -4], [27.0, -6.5], 
		[27, -9], [16, -8], [14, 0], 
		[12, 4], [12.0, 8.5], [12, 13], 
		[11, 16], [11, 17], [10.0, 18.0], 
		[9, 19], [7, 20], [4, 23], 
		[3, 25], [4, 28], [5.0, 29.0], 
		[6, 30], [7.0, 31.0], [8, 32], 
		[9.0, 32.5], [10, 33], [11, 35], 
		[11, 37], [10, 40], [10, 44], 
		[10.0, 47.0], [10, 50], [10.5, 53.0], 
		[11, 56], [12, 58], [15, 63], 
		[21, 63], [21.0, 61.5], [21, 60], 
		[19, 60], ]);
}}}

module ArchitectsDaughter_contour00x7b_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([17.5, 59.0], [16, 58], [15.5, 56.5],steps,height);
	BezConic([15.5, 56.5], [15, 55], [14.5, 52.0],steps,height);
	BezConic([14.5, 52.0], [14, 49], [14.0, 44.5],steps,height);
	BezConic([14.0, 44.5], [14, 40], [15, 33],steps,height);
	BezConic([14.0, 30.5], [13, 30], [12.0, 29.0],steps,height);
	BezConic([10.0, 27.5], [9, 27], [9, 26],steps,height);
	BezConic([9, 26], [9, 25], [9.0, 24.5],steps,height);
	BezConic([9.0, 24.5], [9, 24], [9, 23],steps,height);
	BezConic([9, 23], [11, 21], [14, 19],steps,height);
	BezConic([14, 19], [15, 18], [15.5, 18.0],steps,height);
	BezConic([15.5, 18.0], [16, 18], [16, 18],steps,height);
	BezConic([16, 18], [16, 14], [16.0, 11.5],steps,height);
	BezConic([16.0, 11.5], [16, 9], [16.0, 6.5],steps,height);
	BezConic([16.0, 6.5], [16, 4], [17.0, 1.5],steps,height);
	BezConic([17.0, 1.5], [18, -1], [19.5, -2.0],steps,height);
	BezConic([19.5, -2.0], [21, -3], [22.5, -3.5],steps,height);
	BezConic([22.5, -3.5], [24, -4], [25.5, -4.0],steps,height);
	BezConic([25.5, -4.0], [27, -4], [27, -4],steps,height);
	BezConic([12.0, 8.5], [12, 13], [11, 16],steps,height);
	BezConic([11, 16], [11, 17], [10.0, 18.0],steps,height);
	BezConic([10.0, 18.0], [9, 19], [7, 20],steps,height);
	BezConic([5.0, 29.0], [6, 30], [7.0, 31.0],steps,height);
	BezConic([9.0, 32.5], [10, 33], [11, 35],steps,height);
	BezConic([11, 35], [11, 37], [10, 40],steps,height);
	BezConic([10, 40], [10, 44], [10.0, 47.0],steps,height);
	BezConic([21, 60], [19, 60], [17.5, 59.0],steps,height);
}
}

module ArchitectsDaughter_contour00x7b_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([15, 33], [15, 31], [14.0, 30.5],steps,height);
	BezConic([12.0, 29.0], [11, 28], [10.0, 27.5],steps,height);
	BezConic([27, -9], [16, -8], [14, 0],steps,height);
	BezConic([14, 0], [12, 4], [12.0, 8.5],steps,height);
	BezConic([7, 20], [4, 23], [3, 25],steps,height);
	BezConic([3, 25], [4, 28], [5.0, 29.0],steps,height);
	BezConic([7.0, 31.0], [8, 32], [9.0, 32.5],steps,height);
	BezConic([10.0, 47.0], [10, 50], [10.5, 53.0],steps,height);
	BezConic([10.5, 53.0], [11, 56], [12, 58],steps,height);
	BezConic([12, 58], [15, 63], [21, 63],steps,height);
}
}

module ArchitectsDaughter_contour00x7b(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x7b_skeleton(height);
			ArchitectsDaughter_contour00x7b_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x7b_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x7b(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x7b(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x7b=[[3, -9], [27, 63]];

module ArchitectsDaughter_letter0x7b(steps=2, height) {
	ArchitectsDaughter_chunk10x7b(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x7c_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[6, -4], [5.5, -4.0], [5, -4], 
		[4, -4], [3, -4], [3.0, 28.5], 
		[3, 61], [5.0, 61.0], [7, 61], 
		[7.0, 28.5], [7, -4], [7, -4], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[6, -4], [5.5, -4.0], [5, -4], 
		[4, -4], [3, -4], [3.0, 28.5], 
		[3, 61], [5.0, 61.0], [7, 61], 
		[7.0, 28.5], [7, -4], [7, -4], 
		 ]);
}}}

module ArchitectsDaughter_contour00x7c_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([5, -4], [4, -4], [3, -4],steps,height);
	BezConic([7, -4], [7, -4], [6, -4],steps,height);
}
}

module ArchitectsDaughter_contour00x7c_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
}
}

module ArchitectsDaughter_contour00x7c(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x7c_skeleton(height);
			ArchitectsDaughter_contour00x7c_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x7c_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x7c(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x7c(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x7c=[[3, -4], [7, 61]];

module ArchitectsDaughter_letter0x7c(steps=2, height) {
	ArchitectsDaughter_chunk10x7c(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x7d_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[2, -14], [2.0, -11.5], [2, -9], 
		[2, -9], [3.5, -9.0], [5, -9], 
		[6.5, -8.5], [8, -8], [9, -7], 
		[14, -4], [14, 6], [14, 9], 
		[13, 13], [13, 13], [13.5, 13.0], 
		[14, 13], [15, 13], [19, 15], 
		[20, 18], [21, 19], [21.0, 19.5], 
		[21, 20], [21, 20], [21, 21], 
		[20.0, 22.0], [19, 23], [17.5, 23.5], 
		[16, 24], [15.0, 25.0], [14, 26], 
		[14.0, 27.5], [14, 29], [14.0, 32.0], 
		[14, 35], [14.0, 38.5], [14, 42], 
		[13.0, 45.0], [12, 48], [10.5, 49.5], 
		[9, 51], [7.5, 52.0], [6, 53], 
		[5.0, 53.0], [4, 53], [3, 54], 
		[3.0, 55.5], [3, 57], [10, 57], 
		[14, 52], [17, 48], [18, 41], 
		[19, 37], [19.0, 34.0], [19, 31], 
		[19, 29], [19, 28], [20.5, 27.0], 
		[22, 26], [23.0, 25.0], [24, 24], 
		[25.0, 23.0], [26, 22], [27, 20], 
		[26, 17], [23, 14], [21, 13], 
		[19.5, 12.0], [18, 11], [18, 11], 
		[18, 8], [17.5, 5.0], [17, 2], 
		[16.5, -0.5], [16, -3], [15.5, -5.5], 
		[15, -8], [13, -9], [9, -13], 
		 ]);
}else {	linear_extrude(height=height) polygon( points=[
		[2, -14], [2.0, -11.5], [2, -9], 
		[2, -9], [3.5, -9.0], [5, -9], 
		[6.5, -8.5], [8, -8], [9, -7], 
		[14, -4], [14, 6], [14, 9], 
		[13, 13], [13, 13], [13.5, 13.0], 
		[14, 13], [15, 13], [19, 15], 
		[20, 18], [21, 19], [21.0, 19.5], 
		[21, 20], [21, 20], [21, 21], 
		[20.0, 22.0], [19, 23], [17.5, 23.5], 
		[16, 24], [15.0, 25.0], [14, 26], 
		[14.0, 27.5], [14, 29], [14.0, 32.0], 
		[14, 35], [14.0, 38.5], [14, 42], 
		[13.0, 45.0], [12, 48], [10.5, 49.5], 
		[9, 51], [7.5, 52.0], [6, 53], 
		[5.0, 53.0], [4, 53], [3, 54], 
		[3.0, 55.5], [3, 57], [10, 57], 
		[14, 52], [17, 48], [18, 41], 
		[19, 37], [19.0, 34.0], [19, 31], 
		[19, 29], [19, 28], [20.5, 27.0], 
		[22, 26], [23.0, 25.0], [24, 24], 
		[25.0, 23.0], [26, 22], [27, 20], 
		[26, 17], [23, 14], [21, 13], 
		[19.5, 12.0], [18, 11], [18, 11], 
		[18, 8], [17.5, 5.0], [17, 2], 
		[16.5, -0.5], [16, -3], [15.5, -5.5], 
		[15, -8], [13, -9], [9, -13], 
		 ]);
}}}

module ArchitectsDaughter_contour00x7d_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([2, -9], [2, -9], [3.5, -9.0],steps,height);
	BezConic([3.5, -9.0], [5, -9], [6.5, -8.5],steps,height);
	BezConic([6.5, -8.5], [8, -8], [9, -7],steps,height);
	BezConic([9, -7], [14, -4], [14, 6],steps,height);
	BezConic([14, 6], [14, 9], [13, 13],steps,height);
	BezConic([13, 13], [13, 13], [13.5, 13.0],steps,height);
	BezConic([13.5, 13.0], [14, 13], [15, 13],steps,height);
	BezConic([15, 13], [19, 15], [20, 18],steps,height);
	BezConic([20, 18], [21, 19], [21.0, 19.5],steps,height);
	BezConic([21.0, 19.5], [21, 20], [21, 20],steps,height);
	BezConic([21, 20], [21, 21], [20.0, 22.0],steps,height);
	BezConic([20.0, 22.0], [19, 23], [17.5, 23.5],steps,height);
	BezConic([14.0, 27.5], [14, 29], [14.0, 32.0],steps,height);
	BezConic([14.0, 32.0], [14, 35], [14.0, 38.5],steps,height);
	BezConic([14.0, 38.5], [14, 42], [13.0, 45.0],steps,height);
	BezConic([13.0, 45.0], [12, 48], [10.5, 49.5],steps,height);
	BezConic([10.5, 49.5], [9, 51], [7.5, 52.0],steps,height);
	BezConic([7.5, 52.0], [6, 53], [5.0, 53.0],steps,height);
	BezConic([19, 29], [19, 28], [20.5, 27.0],steps,height);
	BezConic([23, 14], [21, 13], [19.5, 12.0],steps,height);
	BezConic([19.5, 12.0], [18, 11], [18, 11],steps,height);
	BezConic([16.5, -0.5], [16, -3], [15.5, -5.5],steps,height);
}
}

module ArchitectsDaughter_contour00x7d_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([17.5, 23.5], [16, 24], [15.0, 25.0],steps,height);
	BezConic([15.0, 25.0], [14, 26], [14.0, 27.5],steps,height);
	BezConic([5.0, 53.0], [4, 53], [3, 54],steps,height);
	BezConic([3, 57], [10, 57], [14, 52],steps,height);
	BezConic([14, 52], [17, 48], [18, 41],steps,height);
	BezConic([18, 41], [19, 37], [19.0, 34.0],steps,height);
	BezConic([19.0, 34.0], [19, 31], [19, 29],steps,height);
	BezConic([20.5, 27.0], [22, 26], [23.0, 25.0],steps,height);
	BezConic([23.0, 25.0], [24, 24], [25.0, 23.0],steps,height);
	BezConic([25.0, 23.0], [26, 22], [27, 20],steps,height);
	BezConic([27, 20], [26, 17], [23, 14],steps,height);
	BezConic([18, 11], [18, 8], [17.5, 5.0],steps,height);
	BezConic([17.5, 5.0], [17, 2], [16.5, -0.5],steps,height);
	BezConic([15.5, -5.5], [15, -8], [13, -9],steps,height);
	BezConic([13, -9], [9, -13], [2, -14],steps,height);
}
}

module ArchitectsDaughter_contour00x7d(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x7d_skeleton(height);
			ArchitectsDaughter_contour00x7d_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x7d_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x7d(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x7d(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x7d=[[2, -14], [27, 57]];

module ArchitectsDaughter_letter0x7d(steps=2, height) {
	ArchitectsDaughter_chunk10x7d(steps, height);
} //end skeleton

module ArchitectsDaughter_contour00x7e_skeleton(height) {
translate([0,0,-height/2]) {if(height == 0) {polygon( points=[
		[9, 35], [7, 35], [4, 30], 
		[4, 30], [3.0, 30.5], [2, 31], 
		[2, 32], [3, 35], [4.5, 37.0], 
		[6, 39], [8, 40], [9, 40], 
		[9.5, 40.0], [10, 40], [11.0, 39.5], 
		[12, 39], [13.0, 38.0], [14, 37], 
		[15.5, 36.0], [17, 35], [18.0, 35.0], 
		[19, 35], [20.0, 35.0], [21, 35], 
		[21.5, 36.0], [22, 37], [23.0, 38.0], 
		[24, 39], [25, 41], [26, 41], 
		[26.5, 40.5], [27, 40], [27.0, 39.5], 
		[27, 39], [27.0, 38.5], [27, 38], 
		[26.5, 36.5], [26, 35], [25, 34], 
		[22, 31], [18, 31], [15, 31], 
		[13, 33], [12, 34], [11.0, 34.5], 
		[10, 35], ]);
}else {	linear_extrude(height=height) polygon( points=[
		[9, 35], [7, 35], [4, 30], 
		[4, 30], [3.0, 30.5], [2, 31], 
		[2, 32], [3, 35], [4.5, 37.0], 
		[6, 39], [8, 40], [9, 40], 
		[9.5, 40.0], [10, 40], [11.0, 39.5], 
		[12, 39], [13.0, 38.0], [14, 37], 
		[15.5, 36.0], [17, 35], [18.0, 35.0], 
		[19, 35], [20.0, 35.0], [21, 35], 
		[21.5, 36.0], [22, 37], [23.0, 38.0], 
		[24, 39], [25, 41], [26, 41], 
		[26.5, 40.5], [27, 40], [27.0, 39.5], 
		[27, 39], [27.0, 38.5], [27, 38], 
		[26.5, 36.5], [26, 35], [25, 34], 
		[22, 31], [18, 31], [15, 31], 
		[13, 33], [12, 34], [11.0, 34.5], 
		[10, 35], ]);
}}}

module ArchitectsDaughter_contour00x7e_additive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([9, 35], [7, 35], [4, 30],steps,height);
	BezConic([4, 30], [4, 30], [3.0, 30.5],steps,height);
	BezConic([8, 40], [9, 40], [9.5, 40.0],steps,height);
	BezConic([13.0, 38.0], [14, 37], [15.5, 36.0],steps,height);
	BezConic([15.5, 36.0], [17, 35], [18.0, 35.0],steps,height);
	BezConic([18.0, 35.0], [19, 35], [20.0, 35.0],steps,height);
	BezConic([20.0, 35.0], [21, 35], [21.5, 36.0],steps,height);
	BezConic([23.0, 38.0], [24, 39], [25, 41],steps,height);
	BezConic([27.0, 39.5], [27, 39], [27.0, 38.5],steps,height);
	BezConic([13, 33], [12, 34], [11.0, 34.5],steps,height);
	BezConic([11.0, 34.5], [10, 35], [9, 35],steps,height);
}
}

module ArchitectsDaughter_contour00x7e_subtractive_curves(steps=2, height) {
translate([0,0,-height/2]){ 
	BezConic([3.0, 30.5], [2, 31], [2, 32],steps,height);
	BezConic([2, 32], [3, 35], [4.5, 37.0],steps,height);
	BezConic([4.5, 37.0], [6, 39], [8, 40],steps,height);
	BezConic([9.5, 40.0], [10, 40], [11.0, 39.5],steps,height);
	BezConic([11.0, 39.5], [12, 39], [13.0, 38.0],steps,height);
	BezConic([21.5, 36.0], [22, 37], [23.0, 38.0],steps,height);
	BezConic([25, 41], [26, 41], [26.5, 40.5],steps,height);
	BezConic([26.5, 40.5], [27, 40], [27.0, 39.5],steps,height);
	BezConic([27.0, 38.5], [27, 38], [26.5, 36.5],steps,height);
	BezConic([26.5, 36.5], [26, 35], [25, 34],steps,height);
	BezConic([25, 34], [22, 31], [18, 31],steps,height);
	BezConic([18, 31], [15, 31], [13, 33],steps,height);
}
}

module ArchitectsDaughter_contour00x7e(steps=2, height) {
	difference() {
		union() {
			ArchitectsDaughter_contour00x7e_skeleton(height);
			ArchitectsDaughter_contour00x7e_additive_curves(steps, height);
		}
		translate([0, 0, -0.1]) scale([1,1,1.1]) ArchitectsDaughter_contour00x7e_subtractive_curves(steps, height);
	}
}

module ArchitectsDaughter_chunk10x7e(steps=2, height) {
	difference() {
		ArchitectsDaughter_contour00x7e(steps, height);
		
	}
}

ArchitectsDaughter_bbox0x7e=[[2, 30], [27, 41]];

module ArchitectsDaughter_letter0x7e(steps=2, height) {
	ArchitectsDaughter_chunk10x7e(steps, height);
} //end skeleton



function ArchitectsDaughter_letter_space(char, extra) =
	char == "!" ? (8 + extra) : 
	char == "\"" ? (13 + extra) : 
	char == "#" ? (42 + extra) : 
	char == "$" ? (35 + extra) : 
	char == "%" ? (30 + extra) : 
	char == "&" ? (43 + extra) : 
	char == "'" ? (8 + extra) : 
	char == "(" ? (18 + extra) : 
	char == ")" ? (21 + extra) : 
	char == "*" ? (33 + extra) : 
	char == "+" ? (32 + extra) : 
	char == "," ? (7 + extra) : 
	char == "-" ? (19 + extra) : 
	char == "." ? (7 + extra) : 
	char == "/" ? (28 + extra) : 
	char == "0" ? (38 + extra) : 
	char == "1" ? (7 + extra) : 
	char == "2" ? (36 + extra) : 
	char == "3" ? (31 + extra) : 
	char == "4" ? (43 + extra) : 
	char == "5" ? (44 + extra) : 
	char == "6" ? (39 + extra) : 
	char == "7" ? (38 + extra) : 
	char == "8" ? (40 + extra) : 
	char == "9" ? (33 + extra) : 
	char == ":" ? (10 + extra) : 
	char == ";" ? (6 + extra) : 
	char == "<" ? (27 + extra) : 
	char == "=" ? (29 + extra) : 
	char == ">" ? (27 + extra) : 
	char == "?" ? (31 + extra) : 
	char == "@" ? (65 + extra) : 
	char == "A" ? (40 + extra) : 
	char == "B" ? (44 + extra) : 
	char == "C" ? (44 + extra) : 
	char == "D" ? (40 + extra) : 
	char == "E" ? (37 + extra) : 
	char == "F" ? (44 + extra) : 
	char == "G" ? (43 + extra) : 
	char == "H" ? (37 + extra) : 
	char == "I" ? (7 + extra) : 
	char == "J" ? (32 + extra) : 
	char == "K" ? (38 + extra) : 
	char == "L" ? (43 + extra) : 
	char == "M" ? (51 + extra) : 
	char == "N" ? (38 + extra) : 
	char == "O" ? (41 + extra) : 
	char == "P" ? (40 + extra) : 
	char == "Q" ? (43 + extra) : 
	char == "R" ? (43 + extra) : 
	char == "S" ? (39 + extra) : 
	char == "T" ? (40 + extra) : 
	char == "U" ? (33 + extra) : 
	char == "V" ? (39 + extra) : 
	char == "W" ? (59 + extra) : 
	char == "X" ? (37 + extra) : 
	char == "Y" ? (33 + extra) : 
	char == "Z" ? (48 + extra) : 
	char == "[" ? (25 + extra) : 
	char == "\\" ? (31 + extra) : 
	char == "]" ? (29 + extra) : 
	char == "^" ? (19 + extra) : 
	char == "_" ? (42 + extra) : 
	char == "`" ? (9 + extra) : 
	char == "a" ? (31 + extra) : 
	char == "b" ? (35 + extra) : 
	char == "c" ? (39 + extra) : 
	char == "d" ? (31 + extra) : 
	char == "e" ? (33 + extra) : 
	char == "f" ? (38 + extra) : 
	char == "g" ? (32 + extra) : 
	char == "h" ? (31 + extra) : 
	char == "i" ? (9 + extra) : 
	char == "j" ? (11 + extra) : 
	char == "k" ? (38 + extra) : 
	char == "l" ? (8 + extra) : 
	char == "m" ? (49 + extra) : 
	char == "n" ? (30 + extra) : 
	char == "o" ? (35 + extra) : 
	char == "p" ? (34 + extra) : 
	char == "q" ? (31 + extra) : 
	char == "r" ? (34 + extra) : 
	char == "s" ? (30 + extra) : 
	char == "t" ? (25 + extra) : 
	char == "u" ? (31 + extra) : 
	char == "v" ? (32 + extra) : 
	char == "w" ? (49 + extra) : 
	char == "x" ? (30 + extra) : 
	char == "y" ? (34 + extra) : 
	char == "z" ? (31 + extra) : 
	char == "{" ? (27 + extra) : 
	char == "|" ? (7 + extra) : 
	char == "}" ? (27 + extra) : 
	(27 + extra);

module ArchitectsDaughter_letter(char, steps, height) {
	if(char == "!") {
		ArchitectsDaughter_letter0x21(steps, height);
	}
	if(char == "\"") {
		ArchitectsDaughter_letter0x22(steps, height);
	}
	if(char == "#") {
		ArchitectsDaughter_letter0x23(steps, height);
	}
	if(char == "$") {
		ArchitectsDaughter_letter0x24(steps, height);
	}
	if(char == "%") {
		ArchitectsDaughter_letter0x25(steps, height);
	}
	if(char == "&") {
		ArchitectsDaughter_letter0x26(steps, height);
	}
	if(char == "'") {
		ArchitectsDaughter_letter0x27(steps, height);
	}
	if(char == "(") {
		ArchitectsDaughter_letter0x28(steps, height);
	}
	if(char == ")") {
		ArchitectsDaughter_letter0x29(steps, height);
	}
	if(char == "*") {
		ArchitectsDaughter_letter0x2a(steps, height);
	}
	if(char == "+") {
		ArchitectsDaughter_letter0x2b(steps, height);
	}
	if(char == ",") {
		ArchitectsDaughter_letter0x2c(steps, height);
	}
	if(char == "-") {
		ArchitectsDaughter_letter0x2d(steps, height);
	}
	if(char == ".") {
		ArchitectsDaughter_letter0x2e(steps, height);
	}
	if(char == "/") {
		ArchitectsDaughter_letter0x2f(steps, height);
	}
	if(char == "0") {
		ArchitectsDaughter_letter0x30(steps, height);
	}
	if(char == "1") {
		ArchitectsDaughter_letter0x31(steps, height);
	}
	if(char == "2") {
		ArchitectsDaughter_letter0x32(steps, height);
	}
	if(char == "3") {
		ArchitectsDaughter_letter0x33(steps, height);
	}
	if(char == "4") {
		ArchitectsDaughter_letter0x34(steps, height);
	}
	if(char == "5") {
		ArchitectsDaughter_letter0x35(steps, height);
	}
	if(char == "6") {
		ArchitectsDaughter_letter0x36(steps, height);
	}
	if(char == "7") {
		ArchitectsDaughter_letter0x37(steps, height);
	}
	if(char == "8") {
		ArchitectsDaughter_letter0x38(steps, height);
	}
	if(char == "9") {
		ArchitectsDaughter_letter0x39(steps, height);
	}
	if(char == ":") {
		ArchitectsDaughter_letter0x3a(steps, height);
	}
	if(char == ";") {
		ArchitectsDaughter_letter0x3b(steps, height);
	}
	if(char == "<") {
		ArchitectsDaughter_letter0x3c(steps, height);
	}
	if(char == "=") {
		ArchitectsDaughter_letter0x3d(steps, height);
	}
	if(char == ">") {
		ArchitectsDaughter_letter0x3e(steps, height);
	}
	if(char == "?") {
		ArchitectsDaughter_letter0x3f(steps, height);
	}
	if(char == "@") {
		ArchitectsDaughter_letter0x40(steps, height);
	}
	if(char == "A") {
		ArchitectsDaughter_letter0x41(steps, height);
	}
	if(char == "B") {
		ArchitectsDaughter_letter0x42(steps, height);
	}
	if(char == "C") {
		ArchitectsDaughter_letter0x43(steps, height);
	}
	if(char == "D") {
		ArchitectsDaughter_letter0x44(steps, height);
	}
	if(char == "E") {
		ArchitectsDaughter_letter0x45(steps, height);
	}
	if(char == "F") {
		ArchitectsDaughter_letter0x46(steps, height);
	}
	if(char == "G") {
		ArchitectsDaughter_letter0x47(steps, height);
	}
	if(char == "H") {
		ArchitectsDaughter_letter0x48(steps, height);
	}
	if(char == "I") {
		ArchitectsDaughter_letter0x49(steps, height);
	}
	if(char == "J") {
		ArchitectsDaughter_letter0x4a(steps, height);
	}
	if(char == "K") {
		ArchitectsDaughter_letter0x4b(steps, height);
	}
	if(char == "L") {
		ArchitectsDaughter_letter0x4c(steps, height);
	}
	if(char == "M") {
		ArchitectsDaughter_letter0x4d(steps, height);
	}
	if(char == "N") {
		ArchitectsDaughter_letter0x4e(steps, height);
	}
	if(char == "O") {
		ArchitectsDaughter_letter0x4f(steps, height);
	}
	if(char == "P") {
		ArchitectsDaughter_letter0x50(steps, height);
	}
	if(char == "Q") {
		ArchitectsDaughter_letter0x51(steps, height);
	}
	if(char == "R") {
		ArchitectsDaughter_letter0x52(steps, height);
	}
	if(char == "S") {
		ArchitectsDaughter_letter0x53(steps, height);
	}
	if(char == "T") {
		ArchitectsDaughter_letter0x54(steps, height);
	}
	if(char == "U") {
		ArchitectsDaughter_letter0x55(steps, height);
	}
	if(char == "V") {
		ArchitectsDaughter_letter0x56(steps, height);
	}
	if(char == "W") {
		ArchitectsDaughter_letter0x57(steps, height);
	}
	if(char == "X") {
		ArchitectsDaughter_letter0x58(steps, height);
	}
	if(char == "Y") {
		ArchitectsDaughter_letter0x59(steps, height);
	}
	if(char == "Z") {
		ArchitectsDaughter_letter0x5a(steps, height);
	}
	if(char == "[") {
		ArchitectsDaughter_letter0x5b(steps, height);
	}
	if(char == "\\") {
		ArchitectsDaughter_letter0x5c(steps, height);
	}
	if(char == "]") {
		ArchitectsDaughter_letter0x5d(steps, height);
	}
	if(char == "^") {
		ArchitectsDaughter_letter0x5e(steps, height);
	}
	if(char == "_") {
		ArchitectsDaughter_letter0x5f(steps, height);
	}
	if(char == "`") {
		ArchitectsDaughter_letter0x60(steps, height);
	}
	if(char == "a") {
		ArchitectsDaughter_letter0x61(steps, height);
	}
	if(char == "b") {
		ArchitectsDaughter_letter0x62(steps, height);
	}
	if(char == "c") {
		ArchitectsDaughter_letter0x63(steps, height);
	}
	if(char == "d") {
		ArchitectsDaughter_letter0x64(steps, height);
	}
	if(char == "e") {
		ArchitectsDaughter_letter0x65(steps, height);
	}
	if(char == "f") {
		ArchitectsDaughter_letter0x66(steps, height);
	}
	if(char == "g") {
		ArchitectsDaughter_letter0x67(steps, height);
	}
	if(char == "h") {
		ArchitectsDaughter_letter0x68(steps, height);
	}
	if(char == "i") {
		ArchitectsDaughter_letter0x69(steps, height);
	}
	if(char == "j") {
		ArchitectsDaughter_letter0x6a(steps, height);
	}
	if(char == "k") {
		ArchitectsDaughter_letter0x6b(steps, height);
	}
	if(char == "l") {
		ArchitectsDaughter_letter0x6c(steps, height);
	}
	if(char == "m") {
		ArchitectsDaughter_letter0x6d(steps, height);
	}
	if(char == "n") {
		ArchitectsDaughter_letter0x6e(steps, height);
	}
	if(char == "o") {
		ArchitectsDaughter_letter0x6f(steps, height);
	}
	if(char == "p") {
		ArchitectsDaughter_letter0x70(steps, height);
	}
	if(char == "q") {
		ArchitectsDaughter_letter0x71(steps, height);
	}
	if(char == "r") {
		ArchitectsDaughter_letter0x72(steps, height);
	}
	if(char == "s") {
		ArchitectsDaughter_letter0x73(steps, height);
	}
	if(char == "t") {
		ArchitectsDaughter_letter0x74(steps, height);
	}
	if(char == "u") {
		ArchitectsDaughter_letter0x75(steps, height);
	}
	if(char == "v") {
		ArchitectsDaughter_letter0x76(steps, height);
	}
	if(char == "w") {
		ArchitectsDaughter_letter0x77(steps, height);
	}
	if(char == "x") {
		ArchitectsDaughter_letter0x78(steps, height);
	}
	if(char == "y") {
		ArchitectsDaughter_letter0x79(steps, height);
	}
	if(char == "z") {
		ArchitectsDaughter_letter0x7a(steps, height);
	}
	if(char == "{") {
		ArchitectsDaughter_letter0x7b(steps, height);
	}
	if(char == "|") {
		ArchitectsDaughter_letter0x7c(steps, height);
	}
	if(char == "}") {
		ArchitectsDaughter_letter0x7d(steps, height);
	}
	if(char == "~") {
		ArchitectsDaughter_letter0x7e(steps, height);
	}
}

module ArchitectsDaughter(strArr, steps=2, center=false, extra = 0, height = 10) {
	if(center) {
		translate([-ArchitectsDaughter_width(strArr, extra)/2, 0, 0])
			ArchitectsDaughter_str(strArr, steps, extra, height);
	}
	else {
		ArchitectsDaughter_str(strArr, steps, extra, height);
	}
}

module ArchitectsDaughter_str(strArr, steps=2, extra, height = 10) {
	for(i = [0:len(strArr)-1]) {
		assign(char = strArr[i]) {
			if(i == 0) {
				translate([0, 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 1) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 2) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 3) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 4) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 5) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 6) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 7) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 8) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 9) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 10) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 11) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 12) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 13) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 14) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 15) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 16) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 17) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 18) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 19) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 20) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 21) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 22) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 23) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 24) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 25) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 26) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 27) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 28) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 29) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 30) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 31) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 32) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 33) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 34) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 35) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 36) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 37) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 38) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 39) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 40) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 41) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 42) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 43) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 44) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 45) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 46) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 47) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 48) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 49) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 50) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 51) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 52) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 53) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 54) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 55) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 56) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 57) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 58) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 59) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 60) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 61) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 62) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 63) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 64) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 65) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 66) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 67) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 68) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 69) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 70) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 71) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 72) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 73) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 74) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 75) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 76) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 77) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 78) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 79) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 80) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 81) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 82) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 83) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 84) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 85) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 86) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 87) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 88) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 89) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 90) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 91) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 92) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 93) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 94) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 95) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 96) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)+ArchitectsDaughter_letter_space(strArr[95], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 97) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)+ArchitectsDaughter_letter_space(strArr[95], extra)+ArchitectsDaughter_letter_space(strArr[96], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 98) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)+ArchitectsDaughter_letter_space(strArr[95], extra)+ArchitectsDaughter_letter_space(strArr[96], extra)+ArchitectsDaughter_letter_space(strArr[97], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			else if(i == 99) {
				translate([ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)+ArchitectsDaughter_letter_space(strArr[95], extra)+ArchitectsDaughter_letter_space(strArr[96], extra)+ArchitectsDaughter_letter_space(strArr[97], extra)+ArchitectsDaughter_letter_space(strArr[98], extra), 0, 0])
					ArchitectsDaughter_letter(char, steps, height);
			}
			}
		}
	}

function ArchitectsDaughter_width(strArr, extra = 0) =
	(len(strArr) == 0) ? (
		0) : (len(strArr) == 1) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)) : (len(strArr) == 2) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)) : (len(strArr) == 3) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)) : (len(strArr) == 4) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)) : (len(strArr) == 5) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)) : (len(strArr) == 6) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)) : (len(strArr) == 7) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)) : (len(strArr) == 8) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)) : (len(strArr) == 9) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)) : (len(strArr) == 10) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)) : (len(strArr) == 11) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)) : (len(strArr) == 12) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)) : (len(strArr) == 13) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)) : (len(strArr) == 14) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)) : (len(strArr) == 15) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)) : (len(strArr) == 16) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)) : (len(strArr) == 17) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)) : (len(strArr) == 18) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)) : (len(strArr) == 19) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)) : (len(strArr) == 20) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)) : (len(strArr) == 21) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)) : (len(strArr) == 22) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)) : (len(strArr) == 23) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)) : (len(strArr) == 24) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)) : (len(strArr) == 25) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)) : (len(strArr) == 26) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)) : (len(strArr) == 27) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)) : (len(strArr) == 28) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)) : (len(strArr) == 29) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)) : (len(strArr) == 30) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)) : (len(strArr) == 31) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)) : (len(strArr) == 32) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)) : (len(strArr) == 33) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)) : (len(strArr) == 34) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)) : (len(strArr) == 35) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)) : (len(strArr) == 36) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)) : (len(strArr) == 37) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)) : (len(strArr) == 38) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)) : (len(strArr) == 39) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)) : (len(strArr) == 40) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)) : (len(strArr) == 41) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)) : (len(strArr) == 42) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)) : (len(strArr) == 43) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)) : (len(strArr) == 44) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)) : (len(strArr) == 45) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)) : (len(strArr) == 46) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)) : (len(strArr) == 47) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)) : (len(strArr) == 48) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)) : (len(strArr) == 49) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)) : (len(strArr) == 50) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)) : (len(strArr) == 51) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)) : (len(strArr) == 52) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)) : (len(strArr) == 53) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)) : (len(strArr) == 54) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)) : (len(strArr) == 55) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)) : (len(strArr) == 56) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)) : (len(strArr) == 57) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)) : (len(strArr) == 58) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)) : (len(strArr) == 59) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)) : (len(strArr) == 60) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)) : (len(strArr) == 61) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)) : (len(strArr) == 62) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)) : (len(strArr) == 63) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)) : (len(strArr) == 64) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)) : (len(strArr) == 65) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)) : (len(strArr) == 66) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)) : (len(strArr) == 67) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)) : (len(strArr) == 68) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)) : (len(strArr) == 69) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)) : (len(strArr) == 70) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)) : (len(strArr) == 71) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)) : (len(strArr) == 72) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)) : (len(strArr) == 73) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)) : (len(strArr) == 74) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)) : (len(strArr) == 75) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)) : (len(strArr) == 76) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)) : (len(strArr) == 77) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)) : (len(strArr) == 78) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)) : (len(strArr) == 79) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)) : (len(strArr) == 80) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)) : (len(strArr) == 81) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)) : (len(strArr) == 82) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)) : (len(strArr) == 83) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)) : (len(strArr) == 84) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)) : (len(strArr) == 85) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)) : (len(strArr) == 86) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)) : (len(strArr) == 87) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)) : (len(strArr) == 88) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)) : (len(strArr) == 89) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)) : (len(strArr) == 90) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)) : (len(strArr) == 91) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)) : (len(strArr) == 92) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)) : (len(strArr) == 93) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)) : (len(strArr) == 94) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)) : (len(strArr) == 95) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)) : (len(strArr) == 96) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)+ArchitectsDaughter_letter_space(strArr[95], extra)) : (len(strArr) == 97) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)+ArchitectsDaughter_letter_space(strArr[95], extra)+ArchitectsDaughter_letter_space(strArr[96], extra)) : (len(strArr) == 98) ? (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)+ArchitectsDaughter_letter_space(strArr[95], extra)+ArchitectsDaughter_letter_space(strArr[96], extra)+ArchitectsDaughter_letter_space(strArr[97], extra)) : (
		ArchitectsDaughter_letter_space(strArr[0], extra)+ArchitectsDaughter_letter_space(strArr[1], extra)+ArchitectsDaughter_letter_space(strArr[2], extra)+ArchitectsDaughter_letter_space(strArr[3], extra)+ArchitectsDaughter_letter_space(strArr[4], extra)+ArchitectsDaughter_letter_space(strArr[5], extra)+ArchitectsDaughter_letter_space(strArr[6], extra)+ArchitectsDaughter_letter_space(strArr[7], extra)+ArchitectsDaughter_letter_space(strArr[8], extra)+ArchitectsDaughter_letter_space(strArr[9], extra)+ArchitectsDaughter_letter_space(strArr[10], extra)+ArchitectsDaughter_letter_space(strArr[11], extra)+ArchitectsDaughter_letter_space(strArr[12], extra)+ArchitectsDaughter_letter_space(strArr[13], extra)+ArchitectsDaughter_letter_space(strArr[14], extra)+ArchitectsDaughter_letter_space(strArr[15], extra)+ArchitectsDaughter_letter_space(strArr[16], extra)+ArchitectsDaughter_letter_space(strArr[17], extra)+ArchitectsDaughter_letter_space(strArr[18], extra)+ArchitectsDaughter_letter_space(strArr[19], extra)+ArchitectsDaughter_letter_space(strArr[20], extra)+ArchitectsDaughter_letter_space(strArr[21], extra)+ArchitectsDaughter_letter_space(strArr[22], extra)+ArchitectsDaughter_letter_space(strArr[23], extra)+ArchitectsDaughter_letter_space(strArr[24], extra)+ArchitectsDaughter_letter_space(strArr[25], extra)+ArchitectsDaughter_letter_space(strArr[26], extra)+ArchitectsDaughter_letter_space(strArr[27], extra)+ArchitectsDaughter_letter_space(strArr[28], extra)+ArchitectsDaughter_letter_space(strArr[29], extra)+ArchitectsDaughter_letter_space(strArr[30], extra)+ArchitectsDaughter_letter_space(strArr[31], extra)+ArchitectsDaughter_letter_space(strArr[32], extra)+ArchitectsDaughter_letter_space(strArr[33], extra)+ArchitectsDaughter_letter_space(strArr[34], extra)+ArchitectsDaughter_letter_space(strArr[35], extra)+ArchitectsDaughter_letter_space(strArr[36], extra)+ArchitectsDaughter_letter_space(strArr[37], extra)+ArchitectsDaughter_letter_space(strArr[38], extra)+ArchitectsDaughter_letter_space(strArr[39], extra)+ArchitectsDaughter_letter_space(strArr[40], extra)+ArchitectsDaughter_letter_space(strArr[41], extra)+ArchitectsDaughter_letter_space(strArr[42], extra)+ArchitectsDaughter_letter_space(strArr[43], extra)+ArchitectsDaughter_letter_space(strArr[44], extra)+ArchitectsDaughter_letter_space(strArr[45], extra)+ArchitectsDaughter_letter_space(strArr[46], extra)+ArchitectsDaughter_letter_space(strArr[47], extra)+ArchitectsDaughter_letter_space(strArr[48], extra)+ArchitectsDaughter_letter_space(strArr[49], extra)+ArchitectsDaughter_letter_space(strArr[50], extra)+ArchitectsDaughter_letter_space(strArr[51], extra)+ArchitectsDaughter_letter_space(strArr[52], extra)+ArchitectsDaughter_letter_space(strArr[53], extra)+ArchitectsDaughter_letter_space(strArr[54], extra)+ArchitectsDaughter_letter_space(strArr[55], extra)+ArchitectsDaughter_letter_space(strArr[56], extra)+ArchitectsDaughter_letter_space(strArr[57], extra)+ArchitectsDaughter_letter_space(strArr[58], extra)+ArchitectsDaughter_letter_space(strArr[59], extra)+ArchitectsDaughter_letter_space(strArr[60], extra)+ArchitectsDaughter_letter_space(strArr[61], extra)+ArchitectsDaughter_letter_space(strArr[62], extra)+ArchitectsDaughter_letter_space(strArr[63], extra)+ArchitectsDaughter_letter_space(strArr[64], extra)+ArchitectsDaughter_letter_space(strArr[65], extra)+ArchitectsDaughter_letter_space(strArr[66], extra)+ArchitectsDaughter_letter_space(strArr[67], extra)+ArchitectsDaughter_letter_space(strArr[68], extra)+ArchitectsDaughter_letter_space(strArr[69], extra)+ArchitectsDaughter_letter_space(strArr[70], extra)+ArchitectsDaughter_letter_space(strArr[71], extra)+ArchitectsDaughter_letter_space(strArr[72], extra)+ArchitectsDaughter_letter_space(strArr[73], extra)+ArchitectsDaughter_letter_space(strArr[74], extra)+ArchitectsDaughter_letter_space(strArr[75], extra)+ArchitectsDaughter_letter_space(strArr[76], extra)+ArchitectsDaughter_letter_space(strArr[77], extra)+ArchitectsDaughter_letter_space(strArr[78], extra)+ArchitectsDaughter_letter_space(strArr[79], extra)+ArchitectsDaughter_letter_space(strArr[80], extra)+ArchitectsDaughter_letter_space(strArr[81], extra)+ArchitectsDaughter_letter_space(strArr[82], extra)+ArchitectsDaughter_letter_space(strArr[83], extra)+ArchitectsDaughter_letter_space(strArr[84], extra)+ArchitectsDaughter_letter_space(strArr[85], extra)+ArchitectsDaughter_letter_space(strArr[86], extra)+ArchitectsDaughter_letter_space(strArr[87], extra)+ArchitectsDaughter_letter_space(strArr[88], extra)+ArchitectsDaughter_letter_space(strArr[89], extra)+ArchitectsDaughter_letter_space(strArr[90], extra)+ArchitectsDaughter_letter_space(strArr[91], extra)+ArchitectsDaughter_letter_space(strArr[92], extra)+ArchitectsDaughter_letter_space(strArr[93], extra)+ArchitectsDaughter_letter_space(strArr[94], extra)+ArchitectsDaughter_letter_space(strArr[95], extra)+ArchitectsDaughter_letter_space(strArr[96], extra)+ArchitectsDaughter_letter_space(strArr[97], extra)+ArchitectsDaughter_letter_space(strArr[98], extra));




module BezConic(p0,p1,p2,steps=5,h=10) {

	stepsize1 = (p1-p0)/steps;
	stepsize2 = (p2-p1)/steps;

	for (i=[0:steps-1]) {
		assign(point1 = p0+stepsize1*i) 
		assign(point2 = p1+stepsize2*i) 
		assign(point3 = p0+stepsize1*(i+1))
		assign(point4 = p1+stepsize2*(i+1))
		assign(bpoint1 = point1+(point2-point1)*(i/steps))
		assign(bpoint2 = point3+(point4-point3)*((i+1)/steps)) {
			if(h == 0) {
				polygon(points=[bpoint1,bpoint2,p1]);
			}
			else {
				linear_extrude(height=h) {
					polygon(points=[bpoint1,bpoint2,p1]);
				}
			}
		}
	}
}