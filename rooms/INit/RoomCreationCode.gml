global.lives = 3
global.livescheck = 1;
global.world = 1;
global.score = 0;
global.pause = 0;
global.time = 0
global.fnt_score = font_add_sprite_ext(spr_fntscore, "0123456789.x:/", 1, 1)
global.fnt_text = font_add_sprite_ext(spr_fnttext, "ABCDEFGHIJKLMNOPQRSTUVWXYZ.!?,:0123456789", 1, 1)
global.showcollisions = 0;
global.bluecoins_world = 0;
global.bluecoins = 0;
global.coinpitch = 1;

ini_open("options.ini")
global.mas_vol = ini_read_real("Volume", "Master", 1)
global.mus_vol = ini_read_real("Volume", "Music", 1)
global.sfx_vol = ini_read_real("Volume", "SFX", 1)
ini_close()

room_goto_next()