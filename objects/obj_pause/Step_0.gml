get_input()
audio_master_gain(global.mas_vol)
canPause = !instance_exists(obj_pinhole) && !instance_exists(obj_settings) && (room != titlescreen) && (room != gameover) && (room != levelselect)
if instance_exists(obj_player)
{
	canPause = canPause && !obj_player.win && !obj_player.dead
}
if instance_exists(par_boss)
{
	canPause = canPause && !par_boss.dead
}

if InputPressed(INPUT_VERB.PAUSE) && canPause
{
	global.pause = !global.pause
	if global.pause
	{
		picture = sprite_create_from_surface(application_surface, 0, 0, 960, 540, 0, 0, 0, 0)
		sel = 0
		audio_pause_all()
		music = audio_play_sound(mus_pause, 1, 1, global.mus_vol, 0);
		instance_deactivate_all(true)
		instance_activate_object(__InputUpdateController)
	}
	else
	{
		audio_stop_sound(music)
		music = -4
		audio_resume_all()
		instance_activate_all()
	}
}

if global.pause
{
	if blueindex < 7
		blueindex += 1/3
	else
		blueindex = frac(blueindex)
	alpha = lerp(alpha, 1, 0.2)
	
	if prettysurethrewatrashbagintospaceatwork
	{
		if prettysurethrewatrashbagintospaceatwork == 2
		{
			prettysurethrewatrashbagintospaceatwork = 1
			areyousure = 0
			exit;	
		}
		
		areyousure = clamp(areyousure + (key_right2 - key_left2), 0, 1)	
	
		if (key_right2 - key_left2) != 0
			sound_play(sfx_poke, random_range(0.85, 1.15))
		
		if key_accept
		{
			if areyousure
			{
				prettysurethrewatrashbagintospaceatwork = 0
				sound_play(sfx_poke2, random_range(0.75, 1.05))
				sound_play(sfx_fadeout)
				audio_stop_sound(music)
				music = -4
				with instance_create_depth(camera_get_view_x(view_camera[0]) + 480, camera_get_view_y(view_camera[0]) + 270, depth - 1, obj_pinhole)
					transition = -1	
			}
			else
				prettysurethrewatrashbagintospaceatwork = 0
		}
		exit;
	}
	
	if instance_exists(obj_settings)
		exit;
	
	if !instance_exists(obj_pinhole)
	{
		sel = clamp(sel + (key_down2 - key_up2), 0, array_length(options) - 1)
		if (key_down2 - key_up2) != 0
			sound_play(sfx_poke, random_range(0.85, 1.15))
	}
	
	if key_accept
	{
		sound_play(sfx_poke2, random_range(0.75, 1.05))
		switch sel
		{
			case 0:
				global.pause = 0
				audio_stop_sound(music)
				music = -4
				audio_resume_all()
				instance_activate_all()
			break;
			case 1:
				instance_create_depth(x, y, -999, obj_settings)
			break;
			case 2:
				prettysurethrewatrashbagintospaceatwork = 2
			break;
		}
	}
}
else
{
	if sprite_exists(picture)
	{
		sprite_delete(picture)
		picture = -4;
	}
	alpha = lerp(alpha, 0, 0.5)
}