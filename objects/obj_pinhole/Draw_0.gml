var _amt = transition ? amt : 1 - amt
var _max = 16
var _min = 0
var __amt = lerp(_min, _max, _amt)

draw_set_colour(c_black)
draw_rectangle(0, 0, x - (138 * __amt), room_height, 0)
draw_rectangle(x + (138 * __amt), 0, room_width, room_height, 0)
draw_rectangle(x + (138 * __amt), 0, x - (138 * __amt), y - (120 * __amt), 0)
draw_rectangle(x + (138 * __amt), y + (120 * __amt), x - (138 * __amt), room_height, 0)
draw_set_colour(c_white)

draw_sprite_ext(spr_pinhole, 0, x, y, __amt, __amt, 0, c_white, 1)
