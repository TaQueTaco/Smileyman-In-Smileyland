if (room == titlescreen) || (room == gameover) || (room == levelselect)
	exit;

switch bgsprites.preset
{
	default:
		with bgsprites.bg1
		{
			draw_sprite_tiled(spite_index, imge_index, x + (obj_camera.x * xscroll), y + (obj_camera.y * yscroll))
		}
	break;
}