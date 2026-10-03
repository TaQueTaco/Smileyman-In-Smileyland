function scr_smiley_win(){
	if grounded
	{
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
		
		if (hsp != 0) && (!landAnim)
		{
			image_speed = 1/6
			if landAnim
			{
				if anim_end()
					landAnim = false;
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
					if (alarm[0] == -1)
					{
						alarm[0] = 260
						audio_play_sound(mus_die, 1, 0, global.mus_vol, 0);
					}	
				}
			}
			else if anim_end()
			{
				image_index = image_number - 1;
			}
		}
	}
	else
	{
		sprite_index = fallspr1	
	}
}