if keyboard_check_pressed(vk_anykey)
{
	code = string_concat(code,keyboard_lastchar)
	keyboard_lastkey = vk_nokey
}

var valid = false;
for (var i = 0; i < array_length(codes); i++)
{
	if string_pos(string_upper(code), codes[i]) != 0
		valid = true;
	if string_upper(code) == codes[i]
	{
		sound_play(sfx_bluecoin, random_range(1, 1.3))
		switch i
		{
			case 0: global.god = !global.god; break;
			case 1: global.fly = !global.fly; break;
			case 2: global.blue = !global.blue; break;
		}
		valid = false
	}
}
if !valid
	code = ""