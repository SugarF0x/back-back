shader_type canvas_item;

void fragment() {
	vec4 tex = texture(TEXTURE, UV) * COLOR;
	float gray = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
	vec3 out_rgb = mix(tex.rgb, vec3(gray), 1.0);
	COLOR = vec4(out_rgb, tex.a);
}
