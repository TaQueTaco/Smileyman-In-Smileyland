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

if global.bluecoins_world > 0
{
	draw_set_font(global.fnt_score)
	var str = string_concat("AA", global.bluecoins_world, "/5")
	draw_set_halign(fa_center)
	draw_sprite_ext(spr_bluecoin, blueindex, 416 - (string_width(str) / 2), 476, 1, 1, 0, c_white, alpha)
	draw_set_colour(c_blue)
	draw_text(480, 492, str)
	draw_set_halign(fa_left)
}

draw_set_halign(fa_left)
draw_set_alpha(1)
draw_set_colour(c_white)

if prettysurethrewatrashbagintospaceatwork
{
	draw_set_alpha(0.5)
	draw_set_colour(c_black)
	draw_rectangle(0, 0, room_width, room_height, 0)
	draw_set_alpha(1)
	draw_set_colour(c_white)
	draw_sprite(spr_WAIT, 0, 480, 270)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(480,120,"! WAIT !")
	draw_text(480,160,"ARE YOU SURE YOU WANT TO GO BACK TO TITLE?\nYOUR PROGRESS WON'T SAVE!!")
		
	draw_set_colour(!areyousure ? c_white : c_grey)
	draw_text(400,380,"NO")
		
	draw_set_colour(areyousure ? c_red : c_grey)
	draw_text(560,380,"YES")
		
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_colour(c_white)
}