if grounded
{
	hsp = Approach(hsp, image_xscale * walkspd, 0.4)
	
	if (hsp != 0)
	{
		if sign(hsp) != image_xscale
		{
			hsp = Approach(hsp, image_xscale * walkspd, 0.2)
		}
	}
	
	if place_meeting_collision(x + (image_xscale * 32), y, Exclude.SLOPES) || !place_meeting_collision(x + (image_xscale * 64), y + 32, Exclude.SLOPES) || place_meeting(x + (image_xscale * 32), y, par_enemy)
	{
		image_xscale *= -1
	}
}

scr_collision()