switch room
{
	case titlescreen:
		music = mus_title
	break;
	case levelselect:
	case Secret1:
		music = mus_secret
	break;
	case Room1:
	case Room2:
	case Room3:
	case Room4:
		music = mus_world1
	break;
	case Boss1:
		music = mus_boss
	break;
}