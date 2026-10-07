str = "???"
switch global.world
{
	case 1:
		str = "SMILEYLAND"
	break;
	case 2:
		str = "WETWORLD"
	break;
}
str = string_concat(str, " - ")
switch room
{
	case Room1:
		str = string_concat(str, "WELCOME")
	break;
	case Room2:
		str = string_concat(str, "HUMBLE SPRINGS")
	break;
	case Room3:
		str = string_concat(str, "HI SPAUL")
	break;
	case Room4:
		str = string_concat(str, "WELCOME 2")
	break;
	case Boss1:
		str = string_concat(str, "MAROON MORON")
	break;
	default:
		str = string_concat(str, "???")
	break;
}
time = 0;