draw_set_colour(c_black)
draw_rectangle(0, 0, 960, 120, 0)
draw_rectangle(0, 420, 960, 540, 0)
draw_set_colour(c_white)

draw_set_font(global.fnt_text)
draw_text(16,16,string_concat("WORLD ", global.world))
draw_text(16,498,str)