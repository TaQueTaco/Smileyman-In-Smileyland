if obj_arenadoor.active
{
	var _camw = camera_get_view_width(view_camera[0])
	var _camh = camera_get_view_height(view_camera[0])
	if (bbox_left > obj_camera.x + _camw) || (bbox_right < obj_camera.x)
	{
		var side = (bbox_left > obj_camera.x + _camw) ? 1 : -1
		if !variable_instance_exists(id, "warningindex")
			warningindex = 0	
		else
		{
			warningindex += 1/3
			if warningindex > 9
				warningindex = frac(warningindex)
		}
		draw_sprite(spr_offscreen_arrow, warningindex, side ? _camw-32 : 32, clamp(y - obj_camera.y, 32, _camh-32))
	}
}