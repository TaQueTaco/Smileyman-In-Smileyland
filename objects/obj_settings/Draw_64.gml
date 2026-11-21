var _camw = camera_get_view_width(view_camera[0])
var _camh = camera_get_view_height(view_camera[0])

draw_sprite_tiled(bg_secret,0, 0, 0)
draw_set_font(global.fnt_text)
for (var i = 0; i < array_length(options); i++)
{
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_colour(sel == i ? c_white : c_grey)
	draw_text(_camw/2, 192 + ((i+1) * 64), options[i]._name)
}
/*draw_set_colour(c_black)
draw_rectangle(-960,0,0,540, 0)
draw_rectangle(960,0,1920,540, 0)*/ // dunno what this one is for
draw_set_colour(c_white)
draw_text(_camw/2, 192, "OPTIONS")
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_alpha(1)