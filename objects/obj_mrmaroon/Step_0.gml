kill = 0;

if hp <= 0
{
	dead = 1;
	if wait < 200
	{
		wait++	
		sprite_index = spr_smiley_dead
		if wait < 180
		{
			var shake = floor(wait/7)
			x = hurtx + irandom_range(-shake, shake)
			y = hurty + irandom_range(-shake, shake)
			image_speed = (1/3) * (wait/5)
			
			if (wait mod 15) == 0
			{
				if audio_is_playing(sfx_die)
					audio_stop_sound(sfx_die)
				sound_play(sfx_die, random_range(0.95, 1.05) * (wait/15))
			}
		}
		else
		{
			image_speed = 0
			x = hurtx
			y = hurty
		}
		
		if wait == 180
		{
			sound_play(sfx_impact, random_range(0.2, 0.3))
			if audio_is_playing(sfx_die)
				audio_stop_sound(sfx_die)
			instance_create_depth(x, y, -999, obj_bossdeathflash)
		}
		
		if wait >= 200
		{
			instance_create_depth(x, y, -999, obj_deathflash)
			sound_play(sfx_die, random_range(0.5, 0.6))
			image_alpha = 0
			repeat 250
			{
				with instance_create_depth(hurtx, hurty, depth - 1, obj_blood)
				{
					image_blend = c_black
				}
			}	
			
			for (var i = 0; i < 7; i++)
			{
				with instance_create_depth(hurtx, hurty, depth + i - 7, obj_gib)
				{
					sprite_index = spr_smiley_gibs
					image_blend = c_purple
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
	else if wait < 440
	{
		obj_player.win = 1
		obj_player.deadshake = 43
		wait++
	}
	exit;
}

switch attack
{
	case -2:
		kill = -1
		if grounded
			hsp = Approach(hsp, 0, 0.8)
		if (sprite_index != spr_maroon_dead) && (sprite_index != spr_maroon_stun)
			sprite_index = spr_maroon_stun
		if place_meeting(x, y, obj_player) && (obj_player.vsp > 0) && (wait < 80)
		{
			if hp != 1
			{
				sound_play(sfx_impact, random_range(0.95, 1.05))
				obj_player.vsp = obj_player.bouncespd
				obj_player.hsp = obj_player.xscale * -2
				vsp = -12
				hsp = obj_player.xscale * 12
				wait = 80
				hp--
				sprite_index = spr_maroon_dead
			}
			else
			{
				sound_play(sfx_impact, random_range(0.5, 0.6))
				obj_player.vsp = obj_player.bouncespd
				obj_player.hsp = obj_player.xscale * -2
				hurtx = x
				hurty = y
				wait = 0;
				hsp = 0
				vsp = 0;
				hp = 0
				
			}
		}
		if (wait < 80)
			wait++
		else if grounded && vsp >= 0
		{
			if sprite_index == spr_maroon_stun
			wait = random_range(35, 55)
			attack = 0
		}
	break;
	case -1:
		sprite_index = spr_maroon_stun
		wait = 0
		if grounded && vsp >= 0
			attack = -2
	break;
	case 0:
		if (wait < 80)
			sprite_index = spr_maroon_idle
		else if obj_player.dead
		{
			sprite_index = spr_maroon_win
		}
		
		if obj_player.x < x
			image_xscale = -1
		else
			image_xscale = 1
		
		hsp = Approach(hsp, 0, 0.8)
		if (wait < 80)
			wait++
		else if wait >= 80
		{
			if !obj_player.dead
				attack = irandom_range(1, 3)
		}
	break;
	case 1:
		if sprite_index != spr_maroon_run
		{
			sound_play_3d(sfx_jump, x, y, random_range(0.85, 1.15))
			vsp = -6
			sprite_index = spr_maroon_run
		}
		else
		{
			if grounded
			{
				kill = 1;
				hsp = image_xscale * 12	
				if place_meeting_collision(x + image_xscale, y)
				{
					vsp = -8
					hsp = image_xscale * -8
					grounded = false;
					attack = -1
				}
			}
		}
	break;
	case 2:
		if (sprite_index != spr_smiley_jump) && (sprite_index != spr_smiley_fall1) && (sprite_index != spr_smiley_fall2)
		{
			sound_play_3d(sfx_jump, x, y, random_range(0.85, 1.15))
			sprite_index = spr_smiley_jump
			image_index = 0
			vsp = -21
		}
		else
		{
			switch sprite_index
			{
				case spr_smiley_jump:
					vsp = min(vsp, -0.6)
					hsp = 0
					x = lerp(x, obj_player.x, 0.1)
					if anim_end()
					{
						wait = irandom_range(45, 120)
						sprite_index = spr_smiley_fall1
					}
				break;
				case spr_smiley_fall1:
					if wait
					{
						wait--	
						vsp = min(vsp, -0.6)
						x = lerp(x, obj_player.x, 0.1)
					}
					else
					{
						sprite_index = spr_smiley_fall2
						vsp = 20
					}
				break;
				case spr_smiley_fall2:
					kill = 1;
					if grounded
					{
						vsp = -8
						grounded = false;
						attack = -1
					}
				break;
			}
		}
	break;
	case 3:
		kill = (vsp >= 4);
		if sprite_index != spr_maroon_spin
		{
			sound_play_3d(sfx_jump, x, y, random_range(0.85, 1.15))
			sprite_index = spr_maroon_spin
			vsp = -16
			wait = 0
		}
		if grounded && vsp >= 0
		{
			sound_play_3d(sfx_jump, x, y, random_range(0.85, 1.15))
			image_index = 0;
			hsp = image_xscale * 8
			wait++
			vsp = -16
		}
		else
			hsp += image_xscale * 0.1
		
		if place_meeting_collision(x + image_xscale, y)
		{
			sound_play_3d(sfx_jump, x, y, random_range(0.7, 1))
			vsp = -8
			image_xscale *= -1
			hsp = image_xscale * 2
		}
		
		if wait > 5
		{
			attack = -1	
		}
	break;
}

scr_collision()
image_blend = (string_pos("maroon", sprite_get_name(sprite_index)) != 0) ? ((kill == -1) ? c_green : c_white) : ((kill == -1) ? c_fuchsia : c_purple)