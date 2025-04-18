#define scale 15.0
#define dot_radius 0.0035
// #define wipe_amount 0.0;
precision mediump float;
uniform float width;
uniform float height;
uniform vec2 mouse;
uniform float wipe_amount;

void main() {
  vec2 resolution = vec2(width, height);
  // Normalized pixel coordinates (from 0 to 1)
  float aspect_ratio = resolution.x / resolution.y;
  vec2 uv = gl_FragCoord.xy / resolution.xy;
  vec2 uv_square = vec2(uv.x * aspect_ratio, uv.y);

  vec2 mouse_loc = vec2(mouse.x * aspect_ratio, mouse.y);
  vec2 mouse_vec = mouse_loc - uv_square;
  float mouse_dist = length(mouse_vec);
  float mouse_area = smoothstep(0.27, 0.1, mouse_dist);

  vec2 displacement = mouse_vec * mouse_area * 2.0;
  vec2 grid = fract(uv_square * scale + displacement);
  // Find distance to dot center
  vec2 to_dot = grid - 0.5;
  float dist = length(to_dot);
  // For wipe reveal
  vec2 cell = (floor(uv * scale + displacement) + 0.5) / scale;
  float dot_scale = 1.0 - cell.x + (wipe_amount * 2.0 - 1.0);
  dot_scale = clamp(dot_scale, 0.0, 1.0);
  float dot_col = step(dist, dot_radius * scale * dot_scale);

  gl_FragColor = vec4(vec3(dot_scale), 1.0);
  gl_FragColor = vec4(dot_col * 0.1);
}