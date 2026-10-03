draw_set_colour(c_white)
draw_set_alpha(image_alpha)
draw_rectangle(0, 0, room_width, room_height, 0)
draw_set_alpha(1)

with obj_gib
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, other.image_alpha)	
}

with obj_player
{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, 1, 0, c_black, other.image_alpha)	
}