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
}
else
{
		
}