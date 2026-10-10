global.lives = 3
global.livescheck = 1;
global.world = 1;
global.score = 0;
global.pause = 0;
global.time = 0
global.fnt_score = font_add_sprite_ext(spr_fntscore, "0123456789.x:/-", 1, 1)
global.fnt_text = font_add_sprite_ext(spr_fnttext, "ABCDEFGHIJKLMNOPQRSTUVWXYZ.!?,:0123456789-'", 1, 1)
global.showcollisions = 0;
global.bluecoins_world = 0;
global.bluecoins = 0;
global.coinpitch = 1;
global.secrets = 0;

ini_open("options.ini")
global.mas_vol = ini_read_real("Volume", "Master", 1)
global.mus_vol = ini_read_real("Volume", "Music", 1)
global.sfx_vol = ini_read_real("Volume", "SFX", 1)
global.windowtype = ini_read_real("Video", "Window", 0)
ini_close()

ini_open("savefile.ini")
global.save = {
	_exists:ini_read_real("Game", "exists", 0),
	_lives:ini_read_real("Game", "lives", 5),
	_world:ini_read_real("Game", "world", 1),
	_secrets:ini_read_real("Game", "secrets", 0)
}
ini_close()

window_set_caption("Smileyman In Smileyland")
room_goto_next()