shell_scale = [0.4175, 0.4175, 0.4175]; // 30 mm opening, 72 mm full size
shell_thickness = 4.125;
shell_min = 720;
shell_max = 1800;
theta_step = 12;
beta_step = 20;
wall = true;
wall_step = 2;
wall_fill_percent = 85;
half = true;
beta_max = half ? 180 : 360;
mirror = false;

e = 2.718281828;
pi = 3.1415926535898;

// Fibonacci spiral, good approximation of the nautilus spiral
function r(theta) = pow((1+sqrt(5))/2, 2 * theta / 360) + shell_thickness / 3;

mirror([0, mirror ? 180 : 0, 0])
scale(shell_scale)
for(theta = [shell_min : theta_step : shell_max - theta_step]) {
	assign(r11 = (r(theta) + r(theta - 360)) / 2)
	assign(r12 = (r(theta + theta_step) + r(theta + theta_step - 360)) / 2)
	assign(r21 = (r(theta) - r(theta - 360)) / 2 - shell_thickness / 2)
	assign(r22 = (r(theta) - r(theta - 360)) / 2 + shell_thickness / 2)
	assign(r23 = (r(theta + theta_step) - r(theta + theta_step - 360)) / 2 - shell_thickness / 2)
	assign(r24 = (r(theta + theta_step) - r(theta + theta_step - 360)) / 2 + shell_thickness / 2)
	assign(beta_max = half ? 180 : 360) {
		for(beta = [0 : beta_step : beta_max - beta_step]) {
			assign(rb11 = r21 * cos(beta))
			assign(rb12 = r22 * cos(beta))
			assign(rb13 = r23 * cos(beta))
			assign(rb14 = r24 * cos(beta))
			assign(rb21 = r21 * cos(beta + beta_step))
			assign(rb22 = r22 * cos(beta + beta_step))
			assign(rb23 = r23 * cos(beta + beta_step))
			assign(rb24 = r24 * cos(beta + beta_step))
			assign(theta_mod = theta % 360)
			// These fudge factors are required to force the object to be simple
			assign(xf = 0.001 * ((beta >= 0 && beta < 180) ? -1 : 1))
			assign(yf = 0.001 * (((theta_mod >= 0 && theta_mod < 90) ||
				(theta_mod >= 270 && theta_mod < 360)) ? 1 : -1))
			assign(x1 = (r11 + rb11) * cos(theta))
			assign(x2 = (r11 + rb21) * cos(theta) + xf)
			assign(x3 = (r12 + rb23) * cos(theta + theta_step) + xf)
			assign(x4 = (r12 + rb13) * cos(theta + theta_step))
			assign(x5 = (r11 + rb12) * cos(theta))
			assign(x6 = (r11 + rb22) * cos(theta) + xf)
			assign(x7 = (r12 + rb24) * cos(theta + theta_step) + xf)
			assign(x8 = (r12 + rb14) * cos(theta + theta_step))
			assign(y1 = (r11 + rb11) * sin(theta))
			assign(y2 = (r11 + rb21) * sin(theta))
			assign(y3 = (r12 + rb23) * sin(theta + theta_step) + yf)
			assign(y4 = (r12 + rb13) * sin(theta + theta_step) + yf)
			assign(y5 = (r11 + rb12) * sin(theta))
			assign(y6 = (r11 + rb22) * sin(theta))
			assign(y7 = (r12 + rb24) * sin(theta + theta_step) + yf)
			assign(y8 = (r12 + rb14) * sin(theta + theta_step) + yf)
			assign(z1 = r21 * sin(beta))
			assign(z2 = r21 * sin(beta + beta_step))
			assign(z3 = r23 * sin(beta + beta_step))
			assign(z4 = r23 * sin(beta))
			assign(z5 = r22 * sin(beta))
			assign(z6 = r22 * sin(beta + beta_step))
			assign(z7 = r24 * sin(beta + beta_step))
			assign(z8 = r24 * sin(beta))

			// octahedron
			polyhedron(
				points = [
					[x1, y1, z1], [x2, y2, z2], [x3, y3, z3], [x4, y4, z4],
					[x5, y5, z5], [x6, y6, z6], [x7, y7, z7], [x8, y8, z8]
				],
				triangles = [
					// Bottom
					[3, 0, 1], [3, 1, 2],
					// Front
					[0, 4, 5], [0, 5, 1],
					// Right
					[1, 5, 6], [1, 6, 2],
					// Left
					[3, 7, 4], [3, 4, 0],
					// Top
					[4, 7, 6], [4, 6, 5],
					// Back
					[7, 3, 2], [7, 2, 6]
				]
			);
		}

		// A bit of a mess, sorry
		if(wall && (theta - shell_min) < (wall_fill_percent / 100) * (shell_max - shell_min) && theta % (wall_step * theta_step) == 0) {
			rotate([90, 0, theta])
			translate([r11, 0.000 * theta, -0.0045 * theta])
			scale([1, 1, 0.75]) {
				difference() {
					sphere(r21 + shell_thickness, $fn = 360 / beta_step);
					scale([1.07, 1.08, 1])
						sphere(r21, $fn = 360 / beta_step);
					translate([-r21 - 2 * shell_thickness, -r21 - 2 * shell_thickness, -r21 - 2 * shell_thickness - 2]) {
						cube([2 * (r21 + 2 * shell_thickness), 2 * (r21 + 2 * shell_thickness), r21 + 2 * shell_thickness + 2]);
					}
					if(half) {
						translate([-r21 - 2 * shell_thickness, -2 * (r21 + 2 * shell_thickness), -1]) {
							cube([2 * (r21 + 2 * shell_thickness), 2 * (r21 + 2 * shell_thickness), r21 + 2 * shell_thickness + 2]);
						}
					}
				}
			}
		}
	}
}