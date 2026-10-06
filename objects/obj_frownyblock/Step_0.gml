if image_alpha <= 0
{
	if wait < 180
		wait++
	else
		comeback = 1
}
else
{
	if comeback == 0
		wait = 0;
	if comeback
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
				wait = 0;
		}
	}
}

if !instance_exists(obj_player)
	exit;

if place_meeting(x, y + 1, obj_player) && obj_player.grounded && comeback == 0 && image_alpha >= 1
{
	comeback = -1
}