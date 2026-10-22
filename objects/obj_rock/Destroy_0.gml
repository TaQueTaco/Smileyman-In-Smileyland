var maxamt = 4;

switch sprite_index
{
	case spr_rockM:
		maxamt = 16
	break;
	case spr_rockL:
		maxamt = 36
	break;
}

for (var i = 0; i < maxamt; i++)
{
	with instance_create_depth(x, y, depth, obj_gib)
	{
		sprite_index = spr_rock_debris
		switch (i mod 4)
		{
			case 0:	
				vspeed = -2
				hspeed = -5
			break;
			case 1:	
				vspeed = -2
				hspeed = 5
			break;
			case 2:	
				vspeed = -5
				hspeed = -2
			break;
			case 3:	
				vspeed = -5
				hspeed = 2
			break;
		}
		vspeed += random_range(-4, 4)
		hspeed += random_range(-4, 4)
	}
}