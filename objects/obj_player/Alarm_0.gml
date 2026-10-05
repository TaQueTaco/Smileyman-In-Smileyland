sound_play(sfx_fadeout)
with instance_create_depth(x, y, -999, obj_pinhole)
{
	transition = 1 + other.dead + ((other.win == 2) * 2)
}