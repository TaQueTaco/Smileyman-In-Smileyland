if global.blue
{
	draw_set_colour(c_blue)
	gpu_set_blendmode(bm_inv_src_colour)
	draw_rectangle(0, 0, 1280, 720, 0)
	draw_set_colour(c_white)
	gpu_set_blendmode(bm_normal)
}