if (room == gameover) || (room == levelselect)
	exit;

switch bgsprites.preset
{
	case "title":
	case "secret":
		for (var i=0;i<array_length(bgsprites.elements);i++) {
			with bgsprites.elements[i]
			{
				imge_index += imge_speed
				if imge_index > sprite_get_number(spite_index)
					imge_index = frac(imge_index)
				x += hspeed
				y += vspeed
				if (x > sprite_get_width(spite_index)) || (x < -sprite_get_width(spite_index))
					x = frac(x)
				if (y > sprite_get_height(spite_index)) || (y < -sprite_get_height(spite_index))
					y = frac(y)
			}
		}
	break;
	default:
		for (var i=0;i<array_length(bgsprites.elements);i++) {
			with bgsprites.elements[i]
			{
				imge_index += imge_speed
				if imge_index > sprite_get_number(spite_index)
					imge_index = frac(imge_index)
				x += hspeed
				y += vspeed
				if (x > sprite_get_width(spite_index)) || (x < -sprite_get_width(spite_index))
					x = frac(x)
				y = (room_height-camera_get_view_height(view_camera[0])) * (1-yscroll);
			}
		}
	break;
}