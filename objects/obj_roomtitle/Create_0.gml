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
		str = string_concat(str, "HAPPY HILL")
	break;
	case Room2:
		str = string_concat(str, "HUMBLE SPRINGINNINGS")
	break;
	case Room3:
		str = string_concat(str, "HI SPAUL!")
	break;
	case Room4:
		str = string_concat(str, "GOING DONUTS")
	break;
	case Room5:
		str = string_concat(str, "IN A PACK")
	break;
	case Secret1:
		str = string_concat(str, "SMILEYLAND SECRET")
	break;
	case Boss1:
		str = string_concat(str, "MAROON MORON")
	break;
	default:
		str = string_concat(str, "???")
	break;
}
time = 0;