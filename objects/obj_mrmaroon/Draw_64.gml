event_inherited()

draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(global.fnt_score)
var _spr = spr_life
if hp <= 1
	_spr = spr_lifeuhoh
if hp == 0 && instance_exists(obj_blood)
	_spr = spr_death
draw_sprite_ext(_spr, image_index, 960, 444, -1, 1, 0, c_purple, 1)
draw_text(780, 492, string_concat("x ", hp))
draw_text(780, 460, string_concat(": ", attack))