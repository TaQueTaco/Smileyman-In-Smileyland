if room == titlescreen
	exit;

draw_set_font(global.fnt_score)
draw_sprite(spr_life, 0, 0, 444)
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