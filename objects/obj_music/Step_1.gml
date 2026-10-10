switch room
{
	case titlescreen:
		music = mus_title
	break;
	case levelselect:
		music = mus_levelselect
	break;
	case Room1:
	case Room2:
	case Room3:
	case Room4:
	case Room5:
		music = mus_world1
	break;
	case Secret1:
		music = mus_secret
	break;
	case Boss1:
		music = instance_exists(obj_bossdialogue) ? mus_dialogue : mus_boss
	break;
}