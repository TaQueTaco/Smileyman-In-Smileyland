if !huddraw exit;

var _amt = tr_shrink ? amt : 1 - amt
var _max = 16
var _min = 0
var __amt = lerp(_min, _max, _amt)

var _off_l = sprite_get_xoffset(spr_pinhole);
var _off_r = sprite_get_width(spr_pinhole)-sprite_get_xoffset(spr_pinhole);
var _off_t = sprite_get_yoffset(spr_pinhole);
var _off_b = sprite_get_height(spr_pinhole)-sprite_get_yoffset(spr_pinhole);

var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

draw_set_colour(c_black)
draw_rectangle(0, 0, x - (_off_l * __amt), _cam_w, 0)
draw_rectangle(x + (_off_r * __amt), 0, _cam_w, _cam_h, 0)
draw_rectangle(x + (_off_r * __amt), 0, x - (_off_l * __amt), y - (_off_t * __amt), 0)
draw_rectangle(x + (_off_r * __amt), y + (_off_b * __amt), x - (_off_l * __amt), _cam_h, 0)
draw_set_colour(c_white)

draw_sprite_ext(spr_pinhole, 0, x, y, __amt, __amt, 0, c_white, 1)