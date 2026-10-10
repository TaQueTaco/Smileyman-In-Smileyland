if !instance_exists(obj_player)
	exit;
if (obj_player.x > ((x + (image_xscale * 64)) + 32)) && !visible
{
	visible = 1	
	sound_play(sfx_arenadoorslam)
	with instance_create_depth(x, y, depth, obj_solid)
	{
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale * 3
	}
	instance_create_depth(0, 0, -10000, obj_bossdialogue)
}

if visible && !active
	active++