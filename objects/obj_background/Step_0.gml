if (room == titlescreen) || (room == gameover) || (room == levelselect)
	exit;

switch bgsprites.preset
{
	default:
		with bgsprites.bg1
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
	break;
}