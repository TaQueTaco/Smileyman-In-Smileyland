if instance_exists(obj_spawnpoint)
{
	dead = 0
	win = 0
	sprite_index = idlespr
	xscale = 1
	x = obj_spawnpoint.x
	y = obj_spawnpoint.y
	scr_collision()
	prevGrounded = grounded
}