get_input()
move = key_right - key_left
sel = clamp(sel + (key_down2 - key_up2), 1, array_length(options) - 1)

if options[sel]._title
{
	sel += (key_down2 - key_up2)
}

if (key_down2 - key_up2) != 0
	sound_play(sfx_poke, random_range(0.85, 1.15))

if key_accept
{
	room_goto(options[sel].goto)	
}