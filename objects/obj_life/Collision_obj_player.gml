other.oneup = true;
other.deadshake = 0;
ds_list_add(global.lifelist, id)
with instance_create_depth(x + 32, y + 32, depth, obj_playonce)
{
	sprite_index = spr_coinsparkle
	image_speed = 1/3
}
instance_destroy();