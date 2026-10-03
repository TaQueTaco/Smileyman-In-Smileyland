function sound_play(_sound, _pitch = 1){
	return audio_play_sound(_sound, 1, 0, global.sfx_vol, 0, _pitch);
}

function sound_play_3d(_sound, _x, _y, _pitch = 1){
	return audio_play_sound_at(_sound, -_x, _y, 0, 512, 1024, 0.05, 0, 1, global.sfx_vol, 0, _pitch);
}