#define scale 15.0
#define dot_radius 0.0035
precision mediump float;
uniform float width;
uniform float height;
uniform vec2 mouse;

void main()
{
    vec2 resolution = vec2(width, height);
    // Normalized pixel coordinates (from 0 to 1)
    float aspect_ratio = resolution.x / resolution.y;
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    uv.x *= aspect_ratio;
    
    vec2 mouse_loc = vec2(mouse.x * aspect_ratio, mouse.y);
    vec2 mouse_vec = mouse_loc - uv;
    float mouse_dist = length(mouse_vec);
    float mouse_area = smoothstep(0.27, 0.1, mouse_dist);
    

    vec2 displacement = mouse_vec * mouse_area * 2.0;
    vec2 grid = fract(uv * scale + displacement);
    //grid += displacement;
    float dist = length(grid - 0.5);
    float dot_col = step(dist, dot_radius * scale);
    
    gl_FragColor = vec4(dot_col * 0.1);
}