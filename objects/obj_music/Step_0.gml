if instance_exists(obj_player)
{
	if obj_player.win || obj_player.dead
	{
		if audio_is_playing(musicid)	
			audio_stop_sound(musicid)
		exit;
	}
	if obj_player.oneup
	{
		if !audio_is_paused(musicid)
			audio_pause_sound(musicid)
		exit;
	}
	else
	{
		if audio_is_paused(musicid)
			audio_resume_sound(musicid)
	}
}

if instance_exists(obj_titlescreen)
{
	if obj_titlescreen.winky
	{
		if audio_is_playing(musicid)	
			audio_stop_sound(musicid)
		exit;
	}
}

if instance_exists(obj_arenadoor)
{
	if !obj_arenadoor.active
	{
		if audio_is_playing(musicid)	
			audio_stop_sound(musicid)
		exit;
	}
}

if instance_exists(par_boss)
{
	if par_boss.hp == 0
	{
		if audio_is_playing(musicid)	
			audio_stop_sound(musicid)
		exit;
	}
}

if room == gameover
{
	if audio_is_playing(musicid)	
		audio_stop_sound(musicid)
	exit;
}


if (musicid == -4) || (audio_sound_get_asset(musicid) != music)
{
	if audio_is_playing(musicid)	
		audio_stop_sound(musicid)
	musicid = audio_play_sound(music, 1, 1, global.mus_vol, 0);
}