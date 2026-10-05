function scr_smiley_crouch(){
	sprite_index = crouchspr
	if grounded
	{
		if !key_down
		{
			crouch = 0;	
		}
		hsp = Approach(hsp, 0, grdfriction)
	}
}