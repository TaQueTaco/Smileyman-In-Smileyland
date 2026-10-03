function scr_smiley_grounded(){
	if !prevGrounded
	{
		sound_play(sfx_land, random_range(0.85, 1.15))
		landAnim = true;
		sprite_index = landspr
		image_index = 0;
		if audio_is_playing(sfx_gasp)
			audio_stop_sound(sfx_gasp)
	}
	
	move = key_right - key_left
	var accel = 0.4
	
	if abs(hsp < 1) && (move == sign(hsp))
		accel = 0.2
	if abs(hsp) >= walkspd
		accel = 0.1
	hsp = Approach(hsp, (key_run ? runspd : walkspd) * move, accel)
	
	if hsp != 0
	{
		if walksnd == -4
		{
			walksnd = audio_play_sound(sfx_walking, 1, 1, global.sfx_vol, 0);
		}
		audio_sound_pitch(walksnd, max(0.5, (abs(hsp)/walkspd) * 1.3))
		
		if move == -xscale
		{
			hsp += grdfriction * -xscale
		}
		xscale = sign(hsp)
		
		if !landAnim
		{
			image_speed = (sprite_index == runspr) ? (1/3) : ((abs(hsp)/walkspd) * (1/6))
		
			sprite_index = (abs(hsp) >= runspd) ? runspr : walkspr
		}
	}
	else if !landAnim
	{
		sprite_index = idlespr
		if audio_is_playing(walksnd)
		{
			audio_stop_sound(walksnd)
			walksnd = -4
		}
	}
		
	if landAnim
	{
		image_speed = 1/6
		if anim_end()
			landAnim = false;
	}
}