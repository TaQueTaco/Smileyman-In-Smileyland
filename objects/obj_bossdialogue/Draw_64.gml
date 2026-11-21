draw_self()
draw_sprite(dialogue[index].spr, 0, x+321, y+20);
draw_set_font(global.fnt_text)
draw_text(x+486,y+23,dialogue[index].nme)
draw_text_ext(x+486, y+53, text, 28, 455)