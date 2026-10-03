if instance_exists(obj_spawnpoint)
{
	image_alpha = 1
	dead = 0
	win = 0
	sprite_index = idlespr
	xscale = 1
	x = obj_spawnpoint.x
	y = obj_spawnpoint.y
	scr_collision()
	prevGrounded = grounded
	if room != gameover
	{
		sound_play(sfx_fadein)
		with instance_create_depth(obj_spawnpoint.x, obj_spawnpoint.y, -999, obj_pinhole)
		{
			transition = 0	
		}
	}
}