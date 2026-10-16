function scr_smiley_cutscene()
{
	if audio_is_playing(walksnd)
	{
		audio_stop_sound(walksnd)
		walksnd = -4
	}
	hsp = xscale * walkspd
	if grounded
	{
		sprite_index = walkspr
		image_speed = (1/6)
	}
	else
	{
		if (sprite_index == jumpspr)
		{
			if anim_end()
				sprite_index = fallspr1
		}
	}
	
	if x > 2400 && !instance_exists(obj_pinhole)
	{
		with instance_create_depth(x, y, -999, obj_pinhole)
		{
			transition = 1
		}
	}
}