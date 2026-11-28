sound_play(sfx_fadeout)
with instance_create_depth(camera_get_view_width(view_camera[0])/2, camera_get_view_height(view_camera[0])/2, -999, obj_pinhole)
{
	transition = 1 + (other.dead != 0) + ((other.win == 2) * 2)
	tr_shrink = true
}