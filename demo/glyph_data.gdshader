shader_type canvas_item;
render_mode blend_disabled;

uniform sampler2D content : filter_nearest;

const int NUM_SAMPLES = 4;
const int NUM_GLYPHS = 70;

void fragment() {
	vec3 c = vec3(0);
	for (int x = 0; x < NUM_SAMPLES; x++) {
		for (int y = 0; y < NUM_SAMPLES; y++) {
			vec2 offset = SCREEN_PIXEL_SIZE * vec2(float(x), float(y)) / float(NUM_SAMPLES);
			vec4 color = texture(content, (UV + offset));
			c += color.rgb * color.a;
		}
	}
	c /= float(NUM_SAMPLES * NUM_SAMPLES);
	float b = clamp(0.2126 * c.r + 0.7152 * c.g + 0.0722 * c.b, 0.0, 1.0);
	float v = max(max(c.r, c.g), c.b);
	vec3 fg = c / max(v, 1e-4) * pow(v, 0.7);
	int glyph = min(int(b * float(NUM_GLYPHS)), NUM_GLYPHS - 1);
	COLOR.rgb = fg;
	COLOR.a = float(glyph) / 127.0;
}
