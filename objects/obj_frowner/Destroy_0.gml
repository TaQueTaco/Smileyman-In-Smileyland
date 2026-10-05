with instance_create_depth(x, y + 100, depth, obj_gib)
{
	sound_play_3d(sfx_impact, x, y, random_range(0.95, 1.05))
	sprite_index = spr_frowner
	image_yscale = -1
	image_xscale = other.image_xscale
	hspeed = image_xscale * -4
	vspeed = -6
}