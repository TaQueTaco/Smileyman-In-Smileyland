draw_self();

if (time >= 30 && time <= 270)
{
	draw_set_font(global.fnt_text)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(x,y,str)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
}