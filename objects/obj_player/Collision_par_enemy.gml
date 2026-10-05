if other.bounce && (vsp > 0) && !dead && !win
{
	vsp = bouncespd
	hsp = xscale * -2
	with other
	{
		event_user(0)	
	}
}
else if other.kill && !dead && !win
{
	other.killer = 1
	sound_play(sfx_impact, random_range(0.95, 1.05))
	instance_create_depth(0,0,-999,obj_deathflash)
	dead = 1
	deadshake = 0
	hsp = 0
	vsp = 0
	deady = y
	deadx = x
	sprite_index = spr_smiley_dead
	image_index = 0
}