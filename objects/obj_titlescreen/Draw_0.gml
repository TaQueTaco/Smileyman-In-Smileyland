if !settings
{
	for (var i = 0; i < sprite_get_number(spr_title_buttons); i++)
	{
		var _color = ((select == i) ? make_colour_rgb(254, 233, 170) : c_white)
		if (i == 1) && !global.save._exists
		{
			_color = make_colour_rgb(158, 171, 180)
		}
		draw_sprite_ext(spr_title_buttons, i, 260 - (vissel * 256) + (i * 256), 372, 1, 1, 0, _color, 1)
	}
	
	draw_self()
	draw_sprite(spr_title, 0, 32, 32)
	
	if prettysurethrewatrashbagintospaceatwork
	{
		draw_set_alpha(0.5)
		draw_set_colour(c_black)
		draw_rectangle(0, 0, room_width, room_height, 0)
		draw_set_alpha(1)
		draw_set_colour(c_white)
		draw_sprite(spr_WAIT, 0, 480, 270)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		draw_text(480,120,"! WAIT !")
		var reason = "START A NEW GAME"
		if select == 4
			reason = "QUIT"
		draw_text(480,160,"ARE YOU SURE YOU WANT TO " + reason + "?")
		
		draw_set_colour(!areyousure ? c_white : c_grey)
		draw_text(400,380,"NO")
		
		draw_set_colour(areyousure ? c_red : c_grey)
		draw_text(560,380,"YES")
		
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		draw_set_colour(c_white)
	}
}
