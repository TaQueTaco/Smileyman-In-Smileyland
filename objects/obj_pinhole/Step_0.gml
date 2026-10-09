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
				
				ini_open("savefile.ini")
				ini_write_real("Game", "exists", 1)
				ini_write_real("Game", "lives", global.lives)
				ini_write_real("Game", "world", global.world)
				global.save = {
					_exists:1,
					_lives:global.lives,
					_world:global.world
				}
				ini_close()
			break;
			case 0:
				if (room != titlescreen)
					instance_create_depth(0, 64, -999, obj_roomtitle)
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
				if global.bluecoins_world >= 5
					room_goto_next()
				else
					room_goto(room_next(room_next(room)))
				global.bluecoins_world = 0;
			break;
			case 4:
				room_goto(Room1)
			break;
			case 5:
				global.lives = global.save._lives
				global.world = global.save._world
				switch global.world
				{
					case 1:
						room_goto(Room1)
					break;
					case 2:
						room_goto(Room6)
					break;
				}
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
	x = 723
	y = 258
}
else if instance_exists(obj_player)
{
	x = lerp(x, obj_player.x, 0.5)	
	y = lerp(y, obj_player.y, 0.5)	
}