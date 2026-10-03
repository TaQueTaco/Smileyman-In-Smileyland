if !landed
{
	ysp += grav
	hsp = xsp
	vsp = ysp
	image_angle += xsp
	scr_collision()
	if (hsp != xsp) || (vsp != ysp + grav) || (place_meeting(x, y, obj_spike))
		landed = 1
}