if amt > 0
	amt -= 0.02
else
{
	if wait && transition
		wait--
	else
	{
		switch transition
		{
			case -1:
				audio_resume_all()
				instance_activate_all()
				room_goto(titlescreen)
				global.pause = 0
			break;
			case 0:
				instance_destroy()
			break;
			case 1:
				if string_pos("Boss", room_get_name(room)) != 0
					global.world++
				room_goto_next()
			break;
			case 2:
				if global.lives > 0
					room_restart()
				else
					room_goto(gameover)
			break;
			case 3:
				if global.bluecoins_world >= 4
					room_goto_next()
				else
					room_goto(room_next(room_next(room)))
				global.bluecoins_world = 0;
			break;
			case 4:
				room_goto(Room1)
			break;
		}
	}
}

if room == gameover
{
	x = 480
	y = 270
}
else if instance_exists(obj_titlescreen)
{
	x = 681	
	y = 274
}
else if instance_exists(obj_player)
{
	x = lerp(x, obj_player.x, 0.5)	
	y = lerp(y, obj_player.y, 0.5)	
}