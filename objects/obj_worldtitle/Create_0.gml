str = "???"
sng = mus_world1jingle
switch global.world
{
	case 1:
		str = "SMILEYLAND"
	break;
	case 2:
		str = "WETWORLD"
	break;
}
time = 0;
audio_play_sound(sng, 1, 0, global.mus_vol, 0);