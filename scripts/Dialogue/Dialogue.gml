function get_dialogue(_room)
{
	var _dlg = [
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"FUCK YOU"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"NO THANKS"},
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"I'M GONNA KILL YOU"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"UH OH!"},
			]
	switch _room
	{
		case Boss1:
			_dlg = [
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"FUCK YOU"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"NO THANKS"},
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"I'M GONNA KILL YOU"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"UH OH!"},
			]
		break;
	}
	
	return _dlg;
}