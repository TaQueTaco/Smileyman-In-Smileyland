if obj_arenadoor.active
{
	if (bbox_left > obj_camera.x + 960) || (bbox_right < obj_camera.x)
	{
		var side = (bbox_left > obj_camera.x + 960) ? 1 : -1
		if !variable_instance_exists(id, "warningindex")
			warningindex = 0	
		else
		{
			warningindex += 1/3
			if warningindex > 9
				warningindex = frac(warningindex)
		}
		draw_sprite(spr_offscreen_arrow, warningindex, side ? 928 : 32, clamp(y - obj_camera.y, 32, 508))
	}
}