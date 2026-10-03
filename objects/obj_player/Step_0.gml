get_input();

if grounded
	coyote = 6
else if coyote
	coyote--

if input_buffer_jump
	input_buffer_jump--

if key_jump2
	input_buffer_jump = 8

if (room == titlescreen) || (room == gameover)
{
	grav = 0
	hsp = 0
	vsp = 0
}
else if oneup
{
	scr_smiley_1up()
}
else if win
{
	scr_smiley_win()
}
else if dead
{
	scr_smiley_dead()
}
else
{
	image_alpha = 1
	grav = 0.5

	image_speed = 1/6

	if (wall == 0)
	{
		walltime = 0
	
		if audio_is_playing(slidesnd)
		{
			audio_stop_sound(slidesnd)
			slidesnd = -4
		}
	}

	if !grounded
	{
		if audio_is_playing(walksnd)
		{
			audio_stop_sound(walksnd)
			walksnd = -4
		}
	}

	if (grounded && (vsp >= 0)) || (wall != 0)
	{
		falltime = 0;
		bouncetime = 0;
	}

	if (wall != 0)
	{
		scr_smiley_wall()
	}
	else if grounded
	{
		scr_smiley_grounded()
	}
	else
	{
		scr_smiley_air()
	}

	if (coyote || (wall != 0)) && (input_buffer_jump) && (walltime != 30)
	{
		sound_play_3d(sfx_jump, x, y, random_range(0.85, 1.15))
		if audio_is_playing(sfx_land)
			audio_stop_sound(sfx_land)
		coyote = 0
		input_buffer_jump = 0;
		vsp = jumpspd
		jumpstop = 0
		sprite_index = jumpspr
		image_index = 0
		if (wall != 0)
		{
			bouncetime = 30;
			wall = 0
			hsp = xscale * walljumpspd
		}
	}	
}
audio_listener_set_position(0, -x, y, 0)
var _g = grounded
scr_collision()
prevGrounded = _g