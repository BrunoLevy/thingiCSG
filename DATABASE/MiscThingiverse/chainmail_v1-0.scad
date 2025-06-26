// Instructions:
// 1] make sure chainmail v1-0.scad and link.stl are the same directory
// 2] specify the width and length parameters
// 3] compile (F6)
// 4] wait a really long time and hope it doesn't crash
// 5] export

width = 3;
length = 3;

module loadLinks() {
	import("link.stl", convexity = 6);
	translate([6.1,-4.8,0])
	mirror([ 1, 0, 0 ]) {
		import("link.stl", convexity = 6);
	}
}

module makeChainmail(mm, nn) {
	for (n=[0:nn-1]) {
		for (m = [0:mm-1]) {
			translate([n * 6.5, m * 9.5, 0]) {
				loadLinks();
			}
		}
	}
}

makeChainmail(width, length);

