function scr_smiley_cutscene()
{
	if audio_is_playing(walksnd)
	{
		audio_stop_sound(walksnd)
		walksnd = -4
	}
	hsp = xscale * runspd
	sprite_index = runspr
	image_speed = (1/3)
	if steppy
		steppy--
	else
	{
		with instance_create_depth(x - (xscale * 16), bbox_bottom, depth + 1, obj_playonce)	
		{
			sprite_index = spr_runcloud
			image_speed = 1/3
			hspeed = other.xscale * -3
		}
		steppy = 7
	}	
	
	if x > 2400 && !instance_exists(obj_pinhole)
	{
		with instance_create_depth(x, y, -999, obj_pinhole)
		{
			transition = 1
		}
	}
}