if image_alpha <= 0
{
	if wait < 180
		wait++
	else
	{
		instance_activate_object(ownsolid)
		comeback = 1
		image_alpha += 0.08
	}
}
else
{
	if comeback == 0
		wait = 0;
	if comeback == 1
	{
		image_alpha += 0.08
		if image_alpha >= 1
			comeback = 0;
	}
	else if comeback == -1
	{
		if wait < 8
			wait++
		else
		{
			image_alpha -= 0.08
			if image_alpha <= 0
			{
				instance_deactivate_object(ownsolid)
				wait = 0;
			}
		}
	}
}

if !instance_exists(obj_player)
	exit;

if obj_player.wall != 0
{
	if place_meeting(x - obj_player.wall, y, obj_player) && comeback == 0 && image_alpha >= 1
	{
		comeback = -1
	}
}
else
{
	if place_meeting(x, y - 1, obj_player) && obj_player.grounded && comeback == 0 && image_alpha >= 1
	{
		comeback = -1
	}
}