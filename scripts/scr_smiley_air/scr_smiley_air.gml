function scr_smiley_air(){
	var spd = walkspd
	var accel = 0.2
		
	if bouncetime
	{
		spd = walljumpspd
		accel = 0.3
	}
	grav = 0.6
	move = key_right - key_left
	if (move != 0) && !((move == sign(hsp)) && (abs(hsp) > spd))
		hsp = Approach(hsp, (spd) * move, accel)
		
	if hsp != 0
	{
		xscale = sign(hsp)
		
		if (move == -xscale)
		{
			hsp += airfriction * -xscale
		}
	}
	
	if key_down2
	{
		sprite_index = fallspr3
	}
	
	if (sprite_index != jumpspr) && (sprite_index != fallspr1) && (sprite_index != fallspr2) && (sprite_index != fallspr3)
	{
		jumpstop = 1
		sprite_index = fallspr2
	}
	
	if (sprite_index == fallspr3)
		vsp += 0.4
	
	if (sprite_index == jumpspr)
	{
		if anim_end()
			sprite_index = fallspr1
	}
	else if (sprite_index != fallspr3)
		sprite_index = (falltime >= 60) ? fallspr2 : fallspr1
	
	if (vsp > 0)
	{
		jumpstop = 1
		if falltime < 60
			falltime++
		if (falltime >= 60) && (sprite_index != fallspr2)
		{
			sound_play(sfx_gasp, random_range(0.85, 1.15))
		}
	}
	
	if !jumpstop
	{
		if key_jump
			grav = 0.4
		else
		{
			jumpstop = 1;
		}
	}
		
	if bouncetime
	{
		bouncetime--
		grav = 0.4
			
		if afttime < 4
		{
			afttime++	
		}
		else
		{
			afttime = 0;
			with instance_create_depth(x, y, depth + 1, obj_afterimage)
			{
				sprite_index = other.sprite_index
				image_index = other.image_index
				image_xscale = other.xscale
			}
		}
	}
	
	if place_meeting_collision(x + sign(hsp), y, Exclude.SLOPES) && place_meeting_collision(x + sign(hsp), y + 64, Exclude.SLOPES)
	{
		sound_play(sfx_land, random_range(0.85, 1.15))
		landAnim = 1;
		wall = sign(hsp)
		walltime = 30;
		if audio_is_playing(sfx_gasp)
			audio_stop_sound(sfx_gasp)
	}
}