switch global.world
{
	case 1:
		if bgsprites.preset != "world1"
			bgsprites = bgpresets.world1
	break;
	default:
		if bgsprites.preset != "secret"
			bgsprites = bgpresets.secret
	break;
}

if room == titlescreen
	bgsprites = bgpresets.title

if string_pos("Secret", room_get_name(room)) != 0
	bgsprites = bgpresets.secret

if layer_exists("Tiles_1")
	depth = layer_get_depth("Tiles_1") + 1
else
	depth = 99