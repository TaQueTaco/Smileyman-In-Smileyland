get_input()
move = key_right - key_left
sel = clamp(sel + (key_down2 - key_up2), 0, array_length(options) - 1)
if (key_down2 - key_up2) != 0
	sound_play(sfx_poke, random_range(0.85, 1.15))

options[1]._name = "MASTER VOLUME: " + string(global.mas_vol * 100)
options[2]._name = "MUSIC VOLUME: " + string(global.mus_vol * 100)
options[3]._name = "SFX VOLUME: " + string(global.sfx_vol * 100)
options[4]._name = "WINDOW MODE: " + (window_get_borderless_fullscreen() ? "BORDERLESS" : (window_get_fullscreen() ? "FULLSCREEN" : "WINDOWED"))

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
			if window_get_borderless_fullscreen()
			{
				window_enable_borderless_fullscreen(0)
				window_set_fullscreen(0)
			}
			else
			{
				if window_get_fullscreen()
					window_enable_borderless_fullscreen(1)
				else
					window_set_fullscreen(1)
			}
		}
	break;
}

if InputPressed(INPUT_VERB.PAUSE)
{
	instance_destroy()	
}