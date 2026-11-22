draw_set_colour(c_black)
draw_rectangle(0, 0, 1280, 80, 0)
draw_rectangle(0, 640, 1280, 720, 0)
draw_set_colour(c_white)

draw_set_font(global.fnt_text)
draw_text(16,16,string_concat("WORLD ", global.world))
draw_text(16,camera_get_view_height(view_camera[0])-40,str)