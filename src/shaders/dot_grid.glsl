#define scale 15.0
#define dotRadius 0.0035

#define rippleInnerRadius 0.01

precision mediump float;
uniform float width;
uniform float height;
uniform vec2 mouse;
uniform float wipeAmount;
uniform vec4 dotColor;
uniform float gridOffsetY;
uniform float displacementScale;
uniform float rippleRadius;

void main() {
  vec2 resolution = vec2(width, height);
  // Normalized pixel coordinates (from 0 to 1)
  float aspectRatio = resolution.x / resolution.y;
  vec2 uv = gl_FragCoord.xy / resolution.xy;
  vec2 uvSquare = vec2(uv.x * aspectRatio, uv.y - gridOffsetY);

  vec2 mouseLoc = vec2(mouse.x * aspectRatio, mouse.y - gridOffsetY);
  vec2 mouseVec = mouseLoc - uvSquare;
  float mouseDist = length(mouseVec);
  float mouseArea = smoothstep(0.27, 0.1, mouseDist);

  float ripple = smoothstep(rippleRadius, 0.0, mouseDist) *
                 (1.0 - smoothstep(rippleRadius - rippleInnerRadius, 0.0, mouseDist));

  vec2 displacement = mouseVec * mouseArea * displacementScale;
  vec2 grid = fract(uvSquare * scale + displacement);
  // Find distance to dot center
  vec2 toDot = grid - 0.5;
  float dist = length(toDot);
  // For wipe reveal
  vec2 cell = (floor(uv * scale + displacement) + 0.5) / scale;
  float dotScale = 1.0 - cell.x + (wipeAmount * 2.0 - 1.0);
  dotScale = clamp(dotScale, 0.0, 1.0);
  float dotCol = step(dist, dotRadius * scale * dotScale);

  // gl_FragColor = vec4(vec3(dotScale), 1.0) * dotColor;
  gl_FragColor = vec4(dotCol) * dotColor * clamp(ripple * 3.0, 0.1, 1.0);
  // gl_FragColor = vec4(vec3(ripple * mouseArea), 1.0);
}