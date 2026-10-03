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
			room_restart()
		}
		else
		{
			instance_destroy()	
		}
	}
}

if instance_exists(obj_player)
{
	x = lerp(x, obj_player.x, 0.5)	
	y = lerp(y, obj_player.y, 0.5)	
}