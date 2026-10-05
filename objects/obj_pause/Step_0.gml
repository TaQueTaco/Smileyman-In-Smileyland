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
	alpha = lerp(alpha, 1, 0.2)
	if !instance_exists(obj_pinhole)
	{
		sel = clamp(sel + (key_down2 - key_up2), 0, array_length(options) - 1)
		if (key_down2 - key_up2) != 0
			sound_play(sfx_poke, random_range(0.85, 1.15))
	}
	
	if key_accept
	{
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
			
			break;
			case 2:
				audio_stop_sound(music)
				music = -4
				with instance_create_depth(x, y, -999, obj_pinhole)
					transition = -1
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