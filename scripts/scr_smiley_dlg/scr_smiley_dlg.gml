function scr_smiley_dlg(){
	if !instance_exists(obj_bossdialogue)
		exit;
	if grounded
	{
		var dir = 1
		if par_boss.x > x
			dir = 1
		else
			dir = -1
			
		if distance_to_object(par_boss) > 240
		{
			key_run = distance_to_object(par_boss) > 360
			move = dir
		}
		else
		{
			key_run = 0
			if abs(hsp) > 6
			{
				move = -sign(hsp)
			}
			else
			{
				move = 0
				if xscale != dir
					move = dir
			}
		}
		
		var accel = 0.4
	
		if abs(hsp < 1) && (move == sign(hsp))
			accel = 0.2
		if abs(hsp) >= walkspd
			accel = 0.1
		hsp = Approach(hsp, (key_run ? runspd : walkspd) * move, accel)
		
		if hsp != 0
		{
			if walksnd == -4
			{
				walksnd = audio_play_sound(sfx_walking, 1, 1, global.sfx_vol, 0);
			}
			audio_sound_pitch(walksnd, max(0.5, (abs(hsp)/walkspd) * 1.3))
			if move == -xscale
			{
				hsp += grdfriction * -xscale
			}
			
			image_speed = (sprite_index == runspr) ? (1/3) : ((abs(hsp)/walkspd) * (1/6))
			sprite_index = (abs(hsp) >= runspd) ? runspr : walkspr
			xscale = sign(hsp)
		}
		else
		{
			if audio_is_playing(walksnd)
			{
				audio_stop_sound(walksnd)
				walksnd = -4
			}
			var talking = obj_bossdialogue.smiley && !obj_bossdialogue.donetalking
			image_speed = talking ? (1/3) : (1/6)
			sprite_index = talking ? talkspr : idlespr
		}
	}
	else
	{
		sprite_index = fallspr1	
	}
}