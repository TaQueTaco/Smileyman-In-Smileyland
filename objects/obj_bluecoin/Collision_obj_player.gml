global.score -= 10
global.bluecoins ++
global.bluecoins_world ++
sound_play(sfx_bluecoin, random_range(1, 1.3))
with obj_camera
{
	showblue = 3	
}
with obj_flag
{
	if global.bluecoins_world >= 5
	{
		special = 2;
		sprite_index = spr_flag_special;
	}
}
event_inherited();