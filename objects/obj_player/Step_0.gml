get_input();

if grounded
	coyote = 6
else if coyote
	coyote--

if input_buffer_jump
	input_buffer_jump--

if key_jump2
	input_buffer_jump = 8

grav = 0.5

image_speed = 1/6

if (wall == 0)
	walltime = 0

if (wall != 0)
{
	xscale = -wall
	if !place_meeting_collision(x + wall, y, Exclude.SLOPES) || !place_meeting_collision(x + wall, y + 64, Exclude.SLOPES) || grounded
	{
		if !grounded
		{
			sprite_index = jumpspr
			image_index = 0
			hsp = -xscale * 4
		}
		else
		{
			sprite_index = idlespr
		}
		wall = 0
	}
	else
	{
		sprite_index = wallspr
		if walltime
		{
			walltime--
			grav = 0
			vsp = Approach(vsp, 0.2, 0.4)
		}
		else
		{
			grav = 0.2
			vsp = max(vsp, 2)
		}
	}
}
else if grounded
{
	move = key_right - key_left
	var accel = 0.4
	
	if abs(hsp < 1) && (move == sign(hsp))
		accel = 0.2
	if abs(hsp) >= walkspd
		accel = 0.1
	hsp = Approach(hsp, (key_run ? runspd : walkspd) * move, accel)
	
	if hsp != 0
	{
		if move == -xscale
		{
			hsp += grdfriction * -xscale
		}
		xscale = sign(hsp)
		
		image_speed = (sprite_index == runspr) ? (1/3) : ((abs(hsp)/walkspd) * (1/6))
	
		sprite_index = (abs(hsp) >= runspd) ? runspr : walkspr
	}
	else
		sprite_index = idlespr
}
else
{
	grav = 0.6
	move = key_right - key_left
	if (move != 0) && !((move == sign(hsp)) && (abs(hsp) > walkspd))
		hsp = Approach(hsp, (walkspd) * move, 0.2)
		
	if hsp != 0
	{
		xscale = sign(hsp)
		
		if (move == -xscale)
		{
			hsp += airfriction * -xscale
		}
	}
	
	if sprite_index != jumpspr
	{
		jumpstop = 1
		sprite_index = jumpspr
		image_index = 0
	}
	else if anim_end()
	{
		image_index = image_number - 1
	}
	
	if (vsp > 0)
		jumpstop = 1
	
	if !jumpstop
	{
		if key_jump
			grav = 0.4
		else
		{
			jumpstop = 1;
		}
	}
	
	if place_meeting_collision(x + sign(hsp), y, Exclude.SLOPES) && place_meeting_collision(x + sign(hsp), y + 64, Exclude.SLOPES)
	{
		wall = sign(hsp)
		walltime = 30;
	}
}

if (coyote || (wall != 0)) && (input_buffer_jump) && (walltime != 30)
{
	coyote = 0
	input_buffer_jump = 0;
	vsp = jumpspd
	jumpstop = 0
	sprite_index = jumpspr
	image_index = 0
	if (wall != 0)
	{
		wall = 0
		hsp = xscale * walljumpspd
	}
}

scr_collision()