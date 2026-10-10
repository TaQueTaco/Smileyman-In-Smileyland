if !active
{
	if obj_arenadoor.active
		active = 1
}
else
{
	get_input();
	visible = 1
	if index < array_length(dialogue)
	{
		if textl < (string_length(dialogue[index].txt) + 1)
		{
			donetalking = 0;
			if time
				time--
			else
			{
				time = 4
				text = string_delete(dialogue[index].txt, textl + 1, string_length(dialogue[index].txt) - textl)
				textl++
				if !array_contains(untalkables, string_char_at(text, textl))
				{
					switch dialogue[index].blp
					{
						case 0:
							sound_play(choose(sfx_blip_smiley1, sfx_blip_smiley2, sfx_blip_smiley3, sfx_blip_smiley4, sfx_blip_smiley4, sfx_blip_smiley5), random_range(0.85, 1.15))
						break;
						case 1:
							sound_play(choose(sfx_blip_smiley1, sfx_blip_smiley2, sfx_blip_smiley3, sfx_blip_smiley4, sfx_blip_smiley4, sfx_blip_smiley5), random_range(0.45, 0.75))
						break;
					}
				}
			}
			
			smiley = (string_pos("smiley", sprite_get_name(dialogue[index].spr)) != 0)
			
			if (string_pos("maroon", sprite_get_name(dialogue[index].spr)) != 0) || (string_pos("neutral", sprite_get_name(dialogue[index].spr)) != 0) || (string_pos("frowny", sprite_get_name(dialogue[index].spr)) != 0)
				bossy = true
			else
				bossy = false
			
			if key_run2
			{
				textl = string_length(dialogue[index].txt) + 1
				text = dialogue[index].txt
			}
		}
		else 
		{
			donetalking = 1;
			if key_jump2
			{
				index++
				text = ""
				textl = 0
				time = 4
			}
		}
	}
}

if index >= array_length(dialogue)
{
	instance_destroy();
}