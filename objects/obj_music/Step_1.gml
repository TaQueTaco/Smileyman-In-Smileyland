switch room
{
	case titlescreen:
		music = mus_title
	break;
	case levelselect:
		music = mus_levelselect
	break;
	case Secret1:
		music = mus_secret
	break;
	case Boss1:
		music = instance_exists(obj_bossdialogue) ? mus_dialogue : mus_boss
	break;
	default:
		switch global.world
		{
			case 1:
				music = mus_world1
			break;
			case 2:
				music = mus_world2
			break;
			case 3:
				music = mus_world3
			break;
		}
	break;
}