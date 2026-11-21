event_inherited()

if !obj_arenadoor.active
	exit;
draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(global.fnt_score)
var _spr = spr_life
if hp <= 1
	_spr = spr_lifeuhoh
if hp == 0 && instance_exists(obj_blood)
	_spr = spr_death
var _camw = camera_get_view_width(view_camera[0])
var _camh = camera_get_view_height(view_camera[0])
draw_sprite_ext(_spr, image_index,_camw,_camh-100,-1, 1, 0, c_purple, 1)
draw_text(_camw-180,_camh-52,string_concat("x ", hp))