shader_type canvas_item;

uniform vec3 bg_color : source_color;

void fragment() {
    // Luminosity formula (perceived brightness)
    float brightness = dot(bg_color, vec3(0.299, 0.587, 0.114));

    // Choose visible star color based on background
    float star_brightness = brightness > 0.5 ? 0.0 : 1.0;

    COLOR = vec4(vec3(star_brightness), 1.0);
}
