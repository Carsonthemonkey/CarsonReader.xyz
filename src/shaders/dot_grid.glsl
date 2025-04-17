#define scale 2.0
#define dot_radius 0.02
precision mediump float;
uniform vec2 resolution;
uniform vec2 mouse;
void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    float aspect_ratio = resolution.x / resolution.y;
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    uv.x *= aspect_ratio;
    
    vec2 mouse_loc = mouse.xy / resolution.xy;
    mouse_loc.x *= aspect_ratio;
    vec2 mouse_vec = mouse_loc - uv;
    float mouse_dist = length(mouse_vec);
    float mouse_area = smoothstep(0.5, 0.1, mouse_dist);
    

    vec2 displacement = mouse_vec * mouse_area * 3.0;
    vec2 grid = fract(uv * scale + displacement);
    //grid += displacement;
    float dist = length(grid - 0.5);
    float dot_col = step(dist, dot_radius * scale);
    
    gl_FragColor = vec4(vec3(dot_col), 1.0);
    // gl_FragColor = vec4(1.0, 0.0, 1.0, 1.0);
    // gl_FragColor = vec4(grid, 0.0, 1.0);
}