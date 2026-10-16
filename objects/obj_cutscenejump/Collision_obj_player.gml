if other.coyote
{
	sound_play_3d(sfx_jump, x, y, random_range(0.85, 1.15))
	other.grounded = false;
	other.coyote = 0
	other.vsp = other.jumpspd
	other.jumpstop = 0
	other.sprite_index = other.jumpspr
	other.image_index = 0
	instance_destroy();
}