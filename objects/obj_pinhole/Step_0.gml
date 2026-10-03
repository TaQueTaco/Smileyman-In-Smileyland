if amt > 0
	amt -= 0.02
else
{
	if wait && transition
		wait--
	else
	{
		if (transition == 1)
		{
			room_goto_next()
		}
		else if (transition == 2)
		{
			if global.lives > 0
				room_restart()
			else
				room_goto(gameover)
		}
		else if (transition == 3)
		{
			room_goto(Room1)
		}
		else
		{
			instance_destroy()	
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