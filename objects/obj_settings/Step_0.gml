get_input()
move = key_right - key_left
sel = clamp(sel + (key_down2 - key_up2), 0, array_length(options) - 1)
if (key_down2 - key_up2) != 0
	sound_play(sfx_poke, random_range(0.85, 1.15))

options[1]._name = "MASTER VOLUME: " + string(global.mas_vol * 100)
options[2]._name = "MUSIC VOLUME: " + string(global.mus_vol * 100)
options[3]._name = "SFX VOLUME: " + string(global.sfx_vol * 100)
switch global.windowtype
{
	case 0:
		options[4]._name = "WINDOW MODE: WINDOWED"
	break;
	case 1:
		options[4]._name = "WINDOW MODE: FULLSCREEN"
	break;
	case 2:
		options[4]._name = "WINDOW MODE: BORDERLESS"
	break;
}

switch sel
{
	case 0:
		if key_accept
		{
			instance_destroy()	
		}
	break;
	case 1:
		if move != 0
			global.mas_vol = clamp(global.mas_vol + (move / 100), 0, 1)
	break;
	case 2:
		if move != 0
			global.mus_vol = clamp(global.mus_vol + (move / 100), 0, 1)
	break;
	case 3:
		if move != 0
			global.sfx_vol = clamp(global.sfx_vol + (move / 100), 0, 1)
	break;
	case 4:
		if key_accept
		{
			if global.windowtype == 0
			{
				x = window_get_x()
				y = window_get_y()
			}
			global.windowtype++
			if global.windowtype > 2
				global.windowtype = 0
			
			switch global.windowtype
			{
				case 0:
					window_set_position(x, y)
					window_set_fullscreen(0)
					window_set_size(960, 540)
					window_set_showborder(1)
				break;
				case 1:
					window_set_fullscreen(1)
				break;
				case 2:
					window_set_fullscreen(0)
					window_set_showborder(0)
					window_set_size(display_get_width(),display_get_height())
				break;
			}
		}
	break;
}

if InputPressed(INPUT_VERB.PAUSE)
{
	instance_destroy()	
}