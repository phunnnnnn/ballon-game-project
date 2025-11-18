shader_type canvas_item;

uniform float speed = 0.05;

// Convert HSV → RGB
vec3 hsv2rgb(vec3 c) {
    vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void fragment() {
    float hue = mod(TIME * speed, 1.0);
    vec3 rgb = hsv2rgb(vec3(hue, 0.6, 1.0));
    COLOR = vec4(rgb, 1.0);
}
