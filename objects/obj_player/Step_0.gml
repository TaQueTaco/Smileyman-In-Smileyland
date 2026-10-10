get_input();

if !audio_is_playing(sfx_coin)
	global.coinpitch = 1;

if global.score >= (global.livescheck * 1000)
{
	global.livescheck ++
	global.lives++
	if !audio_is_playing(mus_1upjingle)
		audio_play_sound(mus_1upjingle, 1, 0, global.mus_vol, 0);
}

if grounded
	coyote = 6
else if coyote
	coyote--

if input_buffer_jump
	input_buffer_jump--

if key_jump2
	input_buffer_jump = 8

if (room == titlescreen) || (room == gameover) || (room == levelselect)
{
	if audio_is_playing(walksnd)
	{
		audio_stop_sound(walksnd)
		walksnd = -4
	}
	if audio_is_playing(slidesnd)
	{
		audio_stop_sound(slidesnd)
		slidesnd = -4
	}
	grav = 0
	hsp = 0
	vsp = 0
}
else
{
	image_alpha = 1
	grav = 0.5

	image_speed = 1/6
	if instance_exists(obj_bossdialogue) || state == states.dlg
	{
		grav = 0.6
		scr_smiley_dlg()
		state = states.dlg	
		if !instance_exists(obj_bossdialogue)
			state = states.normal
	}
	if oneup
	{
		grav = 0.6
		scr_smiley_1up()
		state = states.oneup
	}
	else if win
	{
		grav = 0.6
		scr_smiley_win()
		state = states.win
	}
	else if dead
	{
		grav = 0
		scr_smiley_dead()
		state = states.dead
	}
	
	if (wall == 0)
	{
		walltime = 0
	
		if audio_is_playing(slidesnd)
		{
			audio_stop_sound(slidesnd)
			slidesnd = -4
		}
	}

	if !grounded || (state == states.crouch)
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
	
	switch state
	{
		case states.normal:
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
		break;
		case states.crouch:
			scr_smiley_crouch()	
		break;
	}

	

	if (coyote || (wall != 0)) && (input_buffer_jump) && (walltime != 30) && !(state == states.dlg) && !(state == states.crouch)
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

mask_index = (state == states.crouch) ? spr_small_mask : spr_smiley_mask
scr_collision()
prevGrounded = _g