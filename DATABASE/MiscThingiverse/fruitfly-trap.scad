// Thread diameter, measured on outside of thread
outer_thread_diameter = 52;
// Total height of the trap
height = 55;
// Number of intertwined threads
thread_starts = 4;
// Thread height = the inside height of the lid section. I found 11 mm to be reasonably universal
lid_inner_height = 11;

/* [ Output options ] */

// How detailed the model will be rendered. A circle will have at most 360/fa segments
fa_final = 2;
// How detailed the model will be rendered. Maximum size of a circle segment fs. 
fs_final = 0.5;

// Same settings, but for preview
fa_preview = 9;
fs_preview = 1;

$fa = $preview ? fa_preview : fa_final;
$fs = $preview ? fs_preview : fs_final;

module _customizer_end() {}

// Some constants you might want to tweak
CLEARANCE = 0.5;
// Chamfer along the outside
CHAMFER = 0.6;
// Width of the inside of the rim
RIM_WIDTH = 5.5;
// All walls have equal thickness
WALL_THICKNESS = 1.2;
THREAD_DEPTH = 1.5;
// Angle of the flat section of the thread profile
THREAD_ANGLE = 35;
// Radius of the tip of the thread profile
THREAD_TIP_RADIUS = 0.7;
// I foun that most jars have a thread pitch of ~14, but the value does not seem to matter much
THREAD_PITCH = 14;

THREAD_HALF_BASE_WIDTH = THREAD_TIP_RADIUS * cos(THREAD_ANGLE) + (THREAD_DEPTH - THREAD_TIP_RADIUS * sin(THREAD_ANGLE)) * tan(THREAD_ANGLE);
// This determines how long each of the thread fragments on the lid are 
THREAD_HEIGHT = 0.8;

PERFORATION_HOLE_HEIGHT = 3;
PERFORATION_HOLE_WIDTH = 0.6;
PERFORATION_DISTANCE_V = 2;
PERFORATION_DISTANCE_H = 3;

// Radius of hole at the bottom where the guests are welcomed
ENTRANCE_RADIUS = 1.8;

fruitfly_trap(
  outer_thread_diameter = outer_thread_diameter,
  lid_inner_height = lid_inner_height,
  thread_starts = thread_starts,
  height = height
);

module fruitfly_trap(
  outer_thread_diameter,
  lid_inner_height,
  thread_starts,
  height,
) {
  difference() {
    union() {
      rotate_extrude() 
        fruitfly_trap_profile(
          outer_thread_diameter = outer_thread_diameter,
          lid_inner_height = lid_inner_height,
          height = height
        );
      translate([0, 0, lid_inner_height + WALL_THICKNESS / 2 - THREAD_HALF_BASE_WIDTH - THREAD_HEIGHT])
      copy_rotate(n = thread_starts)
        qthread(
         h = THREAD_HEIGHT,
         r = outer_thread_diameter / 2 + CLEARANCE,
         pitch = THREAD_PITCH,
         segs = 100
         ) 
           thread_profile();
    }
   
    perforation_layer_height = PERFORATION_HOLE_HEIGHT + PERFORATION_DISTANCE_V;
    perforation_start_z = WALL_THICKNESS + PERFORATION_HOLE_HEIGHT;
    num_perforation_layers = floor((height - perforation_start_z) / perforation_layer_height);
    inner_radius = outer_thread_diameter / 2 - RIM_WIDTH;
   
    union() {
      for (i = [0 : num_perforation_layers - 1]) {
        perforation_z = perforation_start_z + i * perforation_layer_height;
        factor = (inner_radius - ENTRANCE_RADIUS) / height; 
        r = inner_radius - perforation_z * factor;
        num_holes = floor(r * 2 * PI / (PERFORATION_HOLE_WIDTH + PERFORATION_DISTANCE_H));
        if (num_holes >= 4) {
          perforation_hole_angle = 360 * (1 / num_holes - PERFORATION_DISTANCE_H / (r * 2 * PI));
          rotate([0, 0, i * 5])
          copy_rotate(num_holes)
          translate([0, 0, perforation_z])
          cube([inner_radius, PERFORATION_HOLE_WIDTH, PERFORATION_HOLE_HEIGHT]);
        }
      }    
    }
  }
}

module qthread(h, r, pitch, segs = 12) {
  layers = floor(h / pitch);
  end_angle = (h / pitch - layers) * 360; 
  std_seg_angle = 360 / segs;
  seg_vdist = pitch / segs;
  seg_hdist = r * sin(std_seg_angle);
  a = asin(seg_vdist / seg_hdist);
  union() {
    for (j = [0 : layers]) {
      segs_for_layer = (j < layers) 
        ? segs
        : ceil(end_angle / std_seg_angle);
      translate([0, 0, pitch * j]) {
        for (i = [0 : segs_for_layer - 1]) {
          seg_angle = (j < layers || i < segs_for_layer - 1) 
            ? std_seg_angle 
            : end_angle - std_seg_angle * i;
          translate([0, 0, seg_vdist * i])
          rotate([a, 0, std_seg_angle * i])
          rotate_extrude(angle = seg_angle / cos(a) + 0.2) {
              translate([r, 0])
              children();
          }
        }
      }
    }
    // rounded end caps
    translate([r, 0.001, 0])
    rotate([a, 0, 0])
    rotate([0, 90, 0])
    thread_end() children();
    
    rotate([0, 0, end_angle + 0.2])
    translate([r, 0, h])
    rotate([a + 180, 0, 0])
    rotate([0, 90, 0])
    thread_end() children();
  }
}

module fruitfly_trap_profile(
  outer_thread_diameter,
  lid_inner_height,
  height,
  entrance_diameter
) {
  outer_thread_radius = outer_thread_diameter / 2 + CLEARANCE;
  outer_radius = outer_thread_radius + WALL_THICKNESS;
  inner_rim_radius = outer_thread_radius - RIM_WIDTH;
  lid_outer_height = lid_inner_height + WALL_THICKNESS;
  wall_thickness_h = wall_thickness_h(height = height, inner_rim_radius = inner_rim_radius);
  inner_top_radius = inner_top_radius(height = height, inner_rim_radius = inner_rim_radius);
  union() {
    polygon([
      [inner_top_radius, 0],
      [outer_radius - CHAMFER, 0],
      [outer_radius, CHAMFER],
      [outer_radius, lid_outer_height - WALL_THICKNESS / 2],
      [outer_radius - WALL_THICKNESS, lid_outer_height - WALL_THICKNESS / 2],
      [outer_radius - WALL_THICKNESS, WALL_THICKNESS],
      [inner_rim_radius, WALL_THICKNESS],
      [ENTRANCE_RADIUS + wall_thickness_h, height],
      [ENTRANCE_RADIUS, height]
    ]);
    translate([outer_radius - WALL_THICKNESS / 2, lid_outer_height - WALL_THICKNESS / 2])
    circle(d = WALL_THICKNESS);   
  }  
}

module thread_profile() {
  union() {
    tip_radius_center_x = -THREAD_DEPTH + THREAD_TIP_RADIUS;

    translate([tip_radius_center_x, 0])
    circle(r = THREAD_TIP_RADIUS);
    polygon([
      [ tip_radius_center_x - THREAD_TIP_RADIUS * sin(THREAD_ANGLE), -THREAD_TIP_RADIUS  * cos(THREAD_ANGLE) ],
      [ 0, -THREAD_HALF_BASE_WIDTH ],
      [ 0.1, -THREAD_HALF_BASE_WIDTH ],
      [ 0.1, THREAD_HALF_BASE_WIDTH ],
      [ 0, THREAD_HALF_BASE_WIDTH ],
      [ tip_radius_center_x - THREAD_TIP_RADIUS * sin(THREAD_ANGLE), THREAD_TIP_RADIUS * cos(THREAD_ANGLE) ]
    ]);
  }
}

module thread_end() {
    rotate_extrude(angle = 180)
    rotate([0, 0, 90])
    intersection() {
      translate([-500, 0])
      square(1000);
      children();
    }
}

module copy_rotate(n) {
  for (i = [0 : n - 1]) {
    rotate([0, 0, 360 / n * i])
    children();
  }
}

function wall_thickness_h(height, inner_rim_radius) =
  let(inner_height = (height - WALL_THICKNESS))
  let(h = inner_rim_radius - ENTRANCE_RADIUS)
  let(k = pow(WALL_THICKNESS, 2) / pow(inner_height, 2))
  let(a = k - 1)
  let(b = -2 * k * h)
  let(c = pow(WALL_THICKNESS, 2) + k * pow(h, 2))
  (-b - sqrt(pow(b, 2) - 4 * a * c)) / (2 * a);
  
function inner_top_radius(height, inner_rim_radius) =
  let(wall_thickness_h = wall_thickness_h(height = height, inner_rim_radius = inner_rim_radius))
  inner_rim_radius - (inner_rim_radius - wall_thickness_h - ENTRANCE_RADIUS) / (height - WALL_THICKNESS) * WALL_THICKNESS;
