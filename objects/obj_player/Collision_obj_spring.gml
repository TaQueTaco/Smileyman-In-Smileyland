if (other.image_speed == 0) && !dead && !win
{
	sound_play(sfx_sproing, random_range(0.9, 1.2))
	vsp = bouncespd
	jumpstop = 1
	bouncetime = 30;
	sprite_index = jumpspr
	image_index = 0
	falltime = 0
	other.image_speed = 1/3
}