if global.blue
{
	draw_set_colour(c_blue)
	gpu_set_blendmode(bm_min)
	draw_rectangle(0, 0, 960, 540, 0)
	draw_set_colour(c_white)
	gpu_set_blendmode(bm_normal)
}