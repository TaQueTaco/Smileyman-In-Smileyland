global.score += 10
with instance_create_depth(x + 32, y + 32, depth, obj_playonce)
{
	sprite_index = spr_coinsparkle
	image_speed = 1/3
}
with instance_create_depth(x + 32, y + 32, depth - 1, obj_scoretext)
{
	if other.object_index == obj_bluecoin
		str = "100"
}
if audio_is_playing(sfx_coin)
	global.coinpitch += 0.05
sound_play(sfx_coin, global.coinpitch)
ds_list_add(global.lifelist, id)
instance_destroy();