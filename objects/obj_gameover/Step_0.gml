if okgoaway
{
	if image_alpha > 0
		image_alpha -= 0.08
	else
		okgoaway++
	
	if okgoaway > 15
		room_goto(titlescreen)
}
else
{
	if image_alpha < 1
	{
		image_alpha += 0.08
		if image_alpha >= 1
			audio_play_sound(mus_gameover, 1, 0, global.mus_vol, 0);
	}
	else if !audio_is_playing(mus_gameover)
		okgoaway = 1;
}