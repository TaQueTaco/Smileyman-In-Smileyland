var i2 = 0;
for (var i = 0; i < array_length(options); i++)
{
	draw_set_colour(sel == i ? c_yellow : c_white)
	draw_text(options[i]._title ? 32 : 288, 32 + (i2 * 32), options[i]._name)
	if !options[i]._title
		i2++
}
draw_set_colour(c_white)