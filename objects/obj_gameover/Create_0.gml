image_alpha = 0
okgoaway = 0;
musi = audio_play_sound(mus_gameover, 1, 0, global.mus_vol, 0);
ini_open("savefile.ini")
ini_write_real("Game", "exists", 0)
ini_write_real("Game", "lives", 5)
ini_write_real("Game", "world", 1)
global.save = {
	_exists:0,
	_lives:5,
	_world:1
}
ini_close()