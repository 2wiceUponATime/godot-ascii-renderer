shader_type canvas_item;

const int NUM_GLYPHS = 70;

uniform sampler2D glyph_data : filter_nearest;
uniform sampler2D glyphs : filter_linear;

void fragment() {
	vec4 source = texture(glyph_data, UV);
	float glyph = round(source.a * 127.0);
	vec2 cell_uv = mod(UV * vec2(textureSize(glyph_data, 0)), 1.0);
	COLOR.rgb = source.rgb * texture(glyphs, vec2(
		cell_uv.x / float(NUM_GLYPHS) + glyph / float(NUM_GLYPHS),
		cell_uv.y
	)).rgb;
	COLOR.a = 1.0;
}
