if global.pause
	draw_sprite(picture, 0, 0, 0)
draw_set_alpha(alpha * 0.5)
draw_set_colour(c_black)
draw_rectangle(0, 0, room_width, room_height, 0)
draw_set_alpha(alpha)
draw_set_font(global.fnt_text)
for (var i = 0; i < array_length(options); i++)
{
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_colour(sel == i ? c_white : c_grey)
	draw_text(480, 128 + (i * 64), options[i]._name)
}
draw_set_colour(c_white)
draw_text(480, 64, "PAUSED")
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_alpha(1)
