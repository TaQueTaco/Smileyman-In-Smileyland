get_input();

vissel = lerp(vissel, select, 0.1)

if settings
{
	if !instance_exists(obj_settings)
		settings = 0
}
else if winky
{
	image_speed = 1/3
	if anim_end()
		image_index = image_number - 1
	if winky < 75
	{
		winky++
		if (winky >= 75)
		{
			sound_play(sfx_fadeout)
			with instance_create_depth(x, y, -999, obj_pinhole)
			{
				transition = 4
				if other.select == 1
					transition = 5
			}
		}
	}
}
else
{
	image_speed = 1/6
	select = clamp(select + (key_right2 - key_left2), 0, 4)	
	
	if (key_right2 - key_left2) != 0
		sound_play(sfx_poke, random_range(0.85, 1.15))
	
	if key_accept
	{
		switch select	
		{
			case 0:
				if !(key_run && key_down && key_up)
				{
					sound_play(sfx_wink)
					winky = 1
					instance_create_depth(832,160,depth,obj_titlestar)
					sprite_index = spr_titlesmiley_winky
					image_index = 0
				}
				else
					room_goto(levelselect);
			break;
			case 1:
				if global.save._exists
				{
					sound_play(sfx_wink)
					winky = 1
					instance_create_depth(832,160,depth,obj_titlestar)
					sprite_index = spr_titlesmiley_winky
					image_index = 0
				}
				else
				{
					sound_play(sfx_gasp)	
				}
			break;
			case 2:
				settings = 1
				instance_create_depth(0, 0, depth, obj_settings)
			break;
			case 3:
				room_goto(levelselect);
			break;
			case 4:
				game_end()
			break;
		}
	}
	
	if !winky
	{
		switch select
		{
			case 0:
				sprite_index = spr_titlesmiley_newgame
			break;
			case 1:
				sprite_index = spr_titlesmiley_continue
			break;
			case 2:
				sprite_index = spr_titlesmiley_settings
			break;
			case 3:
				sprite_index = spr_titlesmiley_extras
			break;
			case 4:
				sprite_index = spr_titlesmiley_quit
			break;
		}
	}
}