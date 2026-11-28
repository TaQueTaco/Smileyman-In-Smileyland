if (room == gameover) || (room == levelselect)
	exit;

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

switch bgsprites.preset
{
	case "title":
	case "secret":
		for (var i=0;i<array_length(bgsprites.elements);i++) {
			with bgsprites.elements[i]
			{
				draw_sprite_tiled(spite_index, imge_index, x + (_cam_x * xscroll), y + (_cam_y * yscroll))
			}
		}
	break;
	default:
		for (var i=0;i<array_length(bgsprites.elements);i++) {
			with bgsprites.elements[i]
			{
				var _curx = x;
				var _camx = camera_get_view_x(view_camera[0]);
				var _camw = camera_get_view_width(view_camera[0]);
				var _camr = _camx + _camw;
				while (_curx>_camx) _curx-=_camw;
				while _curx <= _camr {
					draw_sprite(spite_index, imge_index, _curx + (_cam_x * xscroll), y + (_cam_y * yscroll))
					_curx += _camw;
				}
			}
		}
	break;
}