get_input();

if settings
{
	
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
				transition = 3
			}
		}
	}
}
else
{
	image_index = 0
	select = clamp(select + (key_down2 - key_up2), 0, debug_mode ? 2 : 1)	
	
	if key_accept
	{
		switch select	
		{
			case 0:
				winky = 1
				instance_create_depth(740,193,depth,obj_titlestar)
			break;
			case 2:
			
			break;
		}
	}
}