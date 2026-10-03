function scr_smiley_1up(){
	if audio_is_playing(slidesnd)
	{
		audio_stop_sound(slidesnd)
		slidesnd = -4
	}
	if audio_is_playing(walksnd)
	{
		audio_stop_sound(walksnd)
		walksnd = -4
	}
	if grounded
	{
		if audio_is_playing(sfx_gasp)
			audio_stop_sound(sfx_gasp)
		if audio_is_playing(sfx_jump)
			audio_stop_sound(sfx_jump)
		if !prevGrounded
		{
			sound_play(sfx_land, random_range(0.85, 1.15))
			landAnim = true;
			sprite_index = landspr
			image_index = 0;
		}
		
		hsp = Approach(hsp, 0, 0.4)
		
		if (hsp != 0) || landAnim
		{
			image_speed = 1/6
			if landAnim
			{
				if anim_end()
				{
					landAnim = false;
					sprite_index = idlespr
				}
			}
			else
			{
				sprite_index = idlespr
			}
		}
		else
		{
			image_speed = 1/6
			if deadshake < 45
			{	
				deadshake++
				if deadshake >= 45
				{
					sprite_index = spr_smiley_win
					with obj_camera
					{
						lifeflash = 1	
					}
					global.lives++
					audio_play_sound(mus_1up, 1, 0, global.mus_vol, 0);	
				}
			}
			else 
			{
				if (deadshake < 55) && !audio_is_playing(mus_1up)
				{
					deadshake++
					global.score++
					if deadshake >= 55
						sound_play(sfx_incrementdone)
					else
						sound_play(sfx_increment, random_range(0.85, 1.15))
				}
				if !audio_is_playing(sfx_incrementdone) && deadshake >= 55
				{
					oneup = 0;	
				}
			}
		}
	}
	else
	{
		sprite_index = fallspr1	
	}
}