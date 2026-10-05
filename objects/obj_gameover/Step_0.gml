image_xscale = lerp(0.2, 1, image_alpha)
image_yscale = lerp(0.1, 1, image_alpha)

if okgoaway
{
	image_alpha = lerp(1, 0, (audio_sound_get_track_position(musi) - 4.4) / 4.6)
	
	if !audio_is_playing(musi)
		room_goto(titlescreen)
}
else
{
	if image_alpha < 1
	{
		image_alpha = lerp(image_alpha, 1, 0.1)
	}
	else if (audio_sound_get_track_position(musi) >= 4.40)
	{
		okgoaway = 1;
	}
}