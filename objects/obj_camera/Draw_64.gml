if (room == titlescreen) || (room == gameover) || (room == levelselect)
	exit;

draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(global.fnt_score)
draw_sprite(sprite_index, image_index, 0, 444)
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
	draw_sprite_ext(sprite_index, image_index, 0, 444, 1, 1, 0, c_red, deadflash)
	draw_set_alpha(deadflash)
	draw_text(96, 492, string_concat("x ", global.lives))
	draw_text(16, 16, _score)
}

if lifeflash > 0
{
	draw_set_colour(c_green)
	draw_set_font(global.fnt_score)
	draw_sprite_ext(sprite_index, image_index, 0, 444, 1, 1, 0, c_green, lifeflash)
	draw_set_alpha(lifeflash)
	draw_text(96, 492, string_concat("x ", global.lives))
}

draw_set_alpha(1)
draw_set_colour(c_white)

if showblue > 0
{
	draw_set_font(global.fnt_score)
	var str = string_concat("AA", global.bluecoins_world, "/5")
	draw_set_halign(fa_center)
	draw_sprite_ext(spr_bluecoin, blueindex, 416 - (string_width(str) / 2), 476, 1, 1, 0, c_white,showblue)
	draw_set_alpha(showblue)
	draw_set_colour(c_blue)
	draw_text(480, 492, str)
	draw_set_halign(fa_left)
}

draw_set_alpha(1)
draw_set_colour(c_white)