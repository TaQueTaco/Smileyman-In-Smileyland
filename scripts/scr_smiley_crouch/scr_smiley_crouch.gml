function scr_smiley_crouch(){
	sprite_index = crouchspr
	if grounded
	{
		if !prevGrounded
		{
			sound_play(sfx_land, random_range(0.85, 1.15))
		}
		if !key_down
		{
			state = states.normal;
			landAnim = true;
			sprite_index = landspr
			image_index = 0;
		}
		hsp = Approach(hsp, 0, grdfriction)
	}
}