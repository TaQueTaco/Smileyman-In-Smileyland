if (room == titlescreen) || (room == gameover)
	exit;

draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(global.fnt_score)
var _spr = spr_life
if global.lives <= 1
	_spr = spr_lifeuhoh
if global.lives == 0 && instance_exists(obj_blood)
	_spr = spr_death
draw_sprite(_spr, image_index, 0, 444)
draw_text(96, 492, string_concat("x ", global.lives))
var _score = "000000"
if global.score > 999999
	_score = "999999"
else
	_score = global.score

if string_length(_score) < 6
{
	while string_length(_score) < 6
	{
		_score = string_concat("0", _score)
	}
}
draw_text(16, 16, _score)
draw_text(16, 48, "0:00.00")

if deadflash > 0
{
	draw_set_colour(c_red)
	draw_set_font(global.fnt_score)
	var _spr = spr_life
	if global.lives == 0 && instance_exists(obj_blood)
		_spr = spr_death
	draw_sprite_ext(_spr, image_index, 0, 444, 1, 1, 0, c_red, deadflash)
	draw_set_alpha(deadflash)
	draw_text(96, 492, string_concat("x ", global.lives))
	draw_text(16, 16, _score)
}

if lifeflash > 0
{
	draw_set_colour(c_green)
	draw_set_font(global.fnt_score)
	var _spr = spr_life
	if global.lives == 0 && instance_exists(obj_blood)
		_spr = spr_death
	draw_sprite_ext(_spr, image_index, 0, 444, 1, 1, 0, c_red, lifeflash)
	draw_set_alpha(lifeflash)
	draw_text(96, 492, string_concat("x ", global.lives))
}

draw_set_alpha(1)
draw_set_colour(c_white)