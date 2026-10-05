get_input();

if settings
{
	if !instance_exists(obj_settings)
		settings = 0
}
else if winky
{
	image_index = 1
	if winky < 75
	{
		winky++
		if (winky >= 75)
		{
			sound_play(sfx_fadeout)
			with instance_create_depth(x, y, -999, obj_pinhole)
			{
				transition = 4
			}
		}
	}
}
else
{
	image_index = 0
	select = clamp(select + (key_down2 - key_up2), 0, debug_mode ? 2 : 1)	
	
	if (key_down2 - key_up2) != 0
		sound_play(sfx_poke, random_range(0.85, 1.15))
	
	if key_accept
	{
		switch select	
		{
			case 0:
				winky = 1
				instance_create_depth(740,193,depth,obj_titlestar)
			break;
			case 1:
				settings = 1
				instance_create_depth(0, 0, depth, obj_settings)
			break;
			case 2:
				room_goto(levelselect);
			break;
		}
	}
}