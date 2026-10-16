str = "???"
sng = mus_world1jingle
switch global.world
{
	case 1:
		str = "SMILEYLAND"
	break;
	case 2:
		str = "CARAMEL CANYON"
		sng = mus_world2jingle
	break;
	case 3:
		str = "TERROR TUNDRA"
		sng = mus_world3jingle
	break;
	case 4:
		str = "ATLANTIASCASIS"
	break;
	case 5:
		str = "BOOZE BOYZ CLUB"
	break;
	case 7:
		str = "THE UNHAPPY FACTORY"
	break;
	case 8:
		str = "RAGEROCK FORTRESS"
	break;
	case 9:
		str = "THERE IS NO WORLD NINE"
	break;
}
audio_play_sound(sng, 1, 0, global.mus_vol, 0);