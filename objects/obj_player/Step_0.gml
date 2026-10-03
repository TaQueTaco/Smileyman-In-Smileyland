get_input();

if grounded
	coyote = 6
else if coyote
	coyote--

if input_buffer_jump
	input_buffer_jump--

if key_jump2
	input_buffer_jump = 8

if dead
{
	grav = 0
	hsp = 0
	vsp = 0
	
	if audio_is_playing(slidesnd)
	{
		audio_stop_sound(slidesnd)
		slidesnd = -4
	}
	if audio_is_playing(walksnd)
	{
		audio_stop_sound(walksnd)
		walksnd = -4
	}
	if audio_is_playing(sfx_gasp)
		audio_stop_sound(sfx_gasp)
	if audio_is_playing(sfx_land)
		audio_stop_sound(sfx_land)
	if audio_is_playing(sfx_jump)
		audio_stop_sound(sfx_jump)
	
	if deadshake < 45
	{
		sprite_index = spr_smiley_dead
		image_speed = 1/6
		if anim_end()
			image_index = image_number - 1
		if deadshake < 25
		{
			x = deadx + irandom_range(-4, 4)
			y = deady + irandom_range(-4, 4)
		}
		else
			x = deadx
			y = deady
		deadshake++
		
		if deadshake >= 45
		{
			sound_play(sfx_die, random_range(0.95, 1.05))
			repeat 100
			{
				instance_create_depth(x, y, depth - 1, obj_blood)
			}	
			
			for (var i = 0; i < 7; i++)
			{
				with instance_create_depth(x, y, depth + i - 7, obj_gib)
				{
					sprite_index = spr_smiley_gibs
					image_index = i
					switch i
					{
						case 0:
							vspeed = -12
						break;
						case 1:
							vspeed = -4
							hspeed = 9
						break;
						case 2:
							vspeed = -4
							hspeed = -9
						break;
						case 3:
							vspeed = -6
							hspeed = -9
						break;
						case 4:
							vspeed = -9
							hspeed = 9
						break;
						case 5:
							vspeed = -8
						break;
						case 6:
							vspeed = -10
						break;
					}
					vspeed += random_range(-4, 4)
					hspeed += random_range(-4, 4)
				}
			}
		}
	}
	else
	{
		image_alpha = 0
		if deadshake < 100
			deadshake++
		if (alarm[0] == -1) && (deadshake >= 100)
		{
			alarm[0] = 260
			audio_play_sound(mus_die, 1, 0, global.mus_vol, 0);
		}	
	}
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

	if grounded || (wall != 0)
		falltime = 0;

	if (wall != 0)
	{
		xscale = -wall
		if !place_meeting_collision(x + wall, y, Exclude.SLOPES) || !place_meeting_collision(x + wall, y + 64, Exclude.SLOPES) || grounded
		{
			if !grounded
			{
				sprite_index = jumpspr
				image_index = 0
				hsp = -xscale * 4
			}
			else
			{
				sprite_index = idlespr
			}
			wall = 0
		}
		else
		{
			sprite_index = wallspr
			if walltime
			{
				walltime--
				grav = 0
				vsp = Approach(vsp, 0.2, 0.4)
			}
			else
			{
				grav = 0.2
				vsp = max(vsp, 2)
				if slidesnd == -4
				{
					slidesnd = audio_play_sound(sfx_slide, 1, 1, global.sfx_vol, 0);
				}
			}
		}
	}
	else if grounded
	{
		if !prevGrounded
		{
			sound_play(sfx_land, random_range(0.85, 1.15))
			landAnim = true;
			sprite_index = landspr
			image_index = 0;
			if audio_is_playing(sfx_gasp)
				audio_stop_sound(sfx_gasp)
		}
	
		move = key_right - key_left
		var accel = 0.4
	
		if abs(hsp < 1) && (move == sign(hsp))
			accel = 0.2
		if abs(hsp) >= walkspd
			accel = 0.1
		hsp = Approach(hsp, (key_run ? runspd : walkspd) * move, accel)
	
		if hsp != 0
		{
			if walksnd == -4
			{
				walksnd = audio_play_sound(sfx_walking, 1, 1, global.sfx_vol, 0);
			}
			audio_sound_pitch(walksnd, max(0.5, (abs(hsp)/walkspd) * 1.3))
		
			if move == -xscale
			{
				hsp += grdfriction * -xscale
			}
			xscale = sign(hsp)
		
			if !landAnim
			{
				image_speed = (sprite_index == runspr) ? (1/3) : ((abs(hsp)/walkspd) * (1/6))
		
				sprite_index = (abs(hsp) >= runspd) ? runspr : walkspr
			}
		}
		else if !landAnim
		{
			sprite_index = idlespr
			if audio_is_playing(walksnd)
			{
				audio_stop_sound(walksnd)
				walksnd = -4
			}
		}
		
		if landAnim
		{
			image_speed = 1/6
			if anim_end()
				landAnim = false;
		}
	}
	else
	{
		grav = 0.6
		move = key_right - key_left
		if (move != 0) && !((move == sign(hsp)) && (abs(hsp) > walkspd))
			hsp = Approach(hsp, (walkspd) * move, 0.2)
		
		if hsp != 0
		{
			xscale = sign(hsp)
		
			if (move == -xscale)
			{
				hsp += airfriction * -xscale
			}
		}
	
		if (sprite_index != jumpspr) && (sprite_index != fallspr1) && (sprite_index != fallspr2)
		{
			jumpstop = 1
			sprite_index = fallspr2
		}
	
		if (sprite_index == jumpspr)
		{
			if anim_end()
				sprite_index = fallspr1
		}
		else
			sprite_index = (falltime >= 60) ? fallspr2 : fallspr1
	
		if (vsp > 0)
		{
			jumpstop = 1
			if falltime < 60
				falltime++
			if (falltime >= 60) && (sprite_index != fallspr2)
			{
				sound_play(sfx_gasp, random_range(0.85, 1.15))
			}
		}
	
		if !jumpstop
		{
			if key_jump
				grav = 0.4
			else
			{
				jumpstop = 1;
			}
		}
	
		if place_meeting_collision(x + sign(hsp), y, Exclude.SLOPES) && place_meeting_collision(x + sign(hsp), y + 64, Exclude.SLOPES)
		{
			sound_play(sfx_land, random_range(0.85, 1.15))
			wall = sign(hsp)
			walltime = 30;
			if audio_is_playing(sfx_gasp)
				audio_stop_sound(sfx_gasp)
		}
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
			wall = 0
			hsp = xscale * walljumpspd
		}
	}	
}
audio_listener_set_position(0, -x, y, 0)
var _g = grounded
scr_collision()
prevGrounded = _g