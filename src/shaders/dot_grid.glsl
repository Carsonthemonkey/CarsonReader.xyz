#define scale 15.0
#define dotRadius 0.0035
precision mediump float;
uniform float width;
uniform float height;
uniform vec2 mouse;
uniform float wipeAmount;

void main() {
  vec2 resolution = vec2(width, height);
  // Normalized pixel coordinates (from 0 to 1)
  float aspectRatio = resolution.x / resolution.y;
  vec2 uv = gl_FragCoord.xy / resolution.xy;
  vec2 uvSquare = vec2(uv.x * aspectRatio, uv.y);

  vec2 mouseLoc = vec2(mouse.x * aspectRatio, mouse.y);
  vec2 mouseVec = mouseLoc - uvSquare;
  float mouseDist = length(mouseVec);
  float mouseArea = smoothstep(0.27, 0.1, mouseDist);

  vec2 displacement = mouseVec * mouseArea * 2.0;
  vec2 grid = fract(uvSquare * scale + displacement);
  // Find distance to dot center
  vec2 toDot = grid - 0.5;
  float dist = length(toDot);
  // For wipe reveal
  vec2 cell = (floor(uv * scale + displacement) + 0.5) / scale;
  float dotScale = 1.0 - cell.x + (wipeAmount * 2.0 - 1.0);
  dotScale = clamp(dotScale, 0.0, 1.0);
  float dotCol = step(dist, dotRadius * scale * dotScale);

  gl_FragColor = vec4(vec3(dotScale), 1.0);
  gl_FragColor = vec4(dotCol * 0.1);
}