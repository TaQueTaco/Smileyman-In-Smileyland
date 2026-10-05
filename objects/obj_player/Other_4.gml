if instance_exists(obj_spawnpoint)
{
	image_alpha = 1
	dead = 0
	win = 0
	sprite_index = idlespr
	xscale = 1
	x = obj_spawnpoint.x
	y = obj_spawnpoint.y
	scr_collision()
	prevGrounded = grounded
	if (room != gameover) && (room != levelselect)
	{
		sound_play(sfx_fadein)
		with instance_create_depth(obj_spawnpoint.x, obj_spawnpoint.y, -999, obj_pinhole)
		{
			transition = 0	
		}
	}
}

switch room
{
	case titlescreen:
		window_set_caption("Smileyman In Smileyland")
	break;
	case gameover:
		window_set_caption("Smileyman In Death")
	break;
	case levelselect:
		window_set_caption("Smileyman In The Level Select")
	break;
	default:
		var _world = "Smileyland"
		var _act = "1"
		switch global.world
		{
			case 2:
				_world = "???"
			break;
		}
		
		if (string_pos("Secret", room_get_name(room)) == 0) && (string_pos("Boss", room_get_name(room)) == 0)
			_act = string_char_at(room_get_name(room), 5)
		if (string_pos("Secret", room_get_name(room)) != 0)
			_act = ":)"
		
		if (string_pos("Boss", room_get_name(room)) == 0)
			window_set_caption("Smileyman In " + _world + ", Act " + _act)
		else
			window_set_caption("Smileyman In " + _world + ", Boss")
	break;
}