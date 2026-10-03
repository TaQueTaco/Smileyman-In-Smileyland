if !settings
{
	draw_self()

	draw_sprite_ext(spr_title_buttons, 0, 80, 208, 1, 1, 0, ((select == 0) ? c_white : c_black), 1)
	draw_sprite_ext(spr_title_buttons, 1, 80, 304, 1, 1, 0, ((select == 1) ? c_white : c_black), 1)

	if debug_mode
		draw_sprite_ext(spr_title_buttons, 2, 80, 400, 1, 1, 0, ((select == 2) ? c_white : c_black), 1)
}
else
{
		
}