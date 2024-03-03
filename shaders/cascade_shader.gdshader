shader_type canvas_item;

uniform float speed;
//uniform vec4 color = vec4(0.00, 0.69, 0.89, 0.63);

void fragment() {
	vec4 c = texture(TEXTURE, UV);
	vec4 modulate = COLOR / c;
	COLOR =  texture(TEXTURE, vec2(UV.x,UV.y-TIME*speed)) * modulate;	
//	COLOR =  texture(TEXTURE, vec2(UV.x,UV.y-TIME*speed)) * color;	
}
