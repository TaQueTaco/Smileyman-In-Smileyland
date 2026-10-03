if instance_exists(obj_player)
{
	if obj_player.win || obj_player.dead
	{
		if audio_is_playing(musicid)	
			audio_stop_sound(musicid)
		exit;
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


if (musicid == -4) || (audio_sound_get_asset(musicid) != music)
{
	if audio_is_playing(musicid)	
		audio_stop_sound(musicid)
	musicid = audio_play_sound(music, 1, 1, global.mus_vol, 0);
}