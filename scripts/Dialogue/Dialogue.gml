function get_dialogue(_room)
{
	var _dlg = [
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"DIE"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"NO"},
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"YES"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"UH OH!"},
			]
	switch _room
	{
		case Boss1:
			_dlg = [
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"WELL, IF IT ISN'T SMILEYMAN. I'VE BEEN EXPECTING YOU!"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"SORRY, WHO ARE YOU..?"},
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"OF COURSE YOU DON'T RECOGNISE YOUR ARCH NEMESIS, TYPICAL!"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"LISTEN STRANGER, I DON'T HAVE TIME FOR THIS! THAT BLUE GUY STOLE MY GIRLFRIEND!"},
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"I DO NOT CARE FOR YOUR TROUBLES! SHE IS THE LEAST OF YOUR WORRIES NOW!"},
				{spr:spr_dlg_smiley1, blp:0, nme:"SMILEYMAN", txt:"SIR, PLEASE--"},
				{spr:spr_dlg_maroon1, blp:1, nme:"MR. MAROON", txt:"I, MR. MAROON! WILL END YOU!!"},
			]
		break;
	}
	
	return _dlg;
}