function scr_smiley_dead(){
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
			if global.lives > 0
				global.lives--
			sound_play(sfx_die, random_range(0.95, 1.05))
			
			global.score = max(global.score - 100, 0)
			with obj_camera
			{
				deadflash = 1	
			}
			
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
		if (alarm[0] == -1) && (deadshake >= 100) && !instance_exists(obj_pinhole)
		{
			alarm[0] = 260
			audio_play_sound(mus_die, 1, 0, global.mus_vol, 0);
		}	
	}
}