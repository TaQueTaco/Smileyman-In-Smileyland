image_speed = 1/3

if ds_list_find_index(global.lifelist, id) != -1
{
	if other.object_index != obj_bluecoin
		instance_destroy()
	else
	{
		global.bluecoins --
		global.bluecoins_world --
		ds_list_delete(global.lifelist, ds_list_find_index(global.lifelist, id))
	}
}