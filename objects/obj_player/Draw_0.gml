if (wall != 0) && !walltime
{
	draw_sprite_ext(spr_wallslidedust, image_index * 2, x, y, xscale, 1, 0, c_white, 1)
}

draw_sprite_ext(sprite_index, image_index, x, y, xscale, 1, 0, c_white, image_alpha)