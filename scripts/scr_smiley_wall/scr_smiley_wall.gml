function scr_smiley_wall(){
	xscale = -wall
	if !place_meeting_collision(x + wall, y, Exclude.SLOPES) || !place_meeting_collision(x + wall, y + 64, Exclude.SLOPES) || grounded
	{
		if !grounded
		{
			sprite_index = jumpspr
			image_index = 0
			hsp = -xscale * 4
		}
		else
		{
			sprite_index = idlespr
		}
		wall = 0
	}
	else
	{
		image_speed = 1/6
		if landAnim
		{
			if sprite_index != walllandspr
			{
				sprite_index = walllandspr
				image_index = 0;
			}
			else if anim_end()
			{
				landAnim = false;
				sprite_index = wallspr
			}
		}
		else
			sprite_index = wallspr
		if walltime
		{
			walltime--
			if key_down
				walltime--
			grav = 0
			vsp = Approach(vsp, 0.2, 0.4)
		}
		else
		{
			if key_down
			{
				grav = 0.4
				vsp = max(vsp, 4)
			}
			else
			{
				grav = 0.2
				vsp = max(vsp, 2)
			}
			if slidesnd == -4
			{
				slidesnd = audio_play_sound(sfx_slide, 1, 1, global.sfx_vol, 0);
			}
		}
	}
}