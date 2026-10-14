transition = 0
depth = -999
amt = 1
wait = 15

if (string_pos("Cutscene", room_get_name(room)) != 0) && !instance_exists(obj_worldtitle)
	instance_create_depth(0, 64, -999, obj_worldtitle)