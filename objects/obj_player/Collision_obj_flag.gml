if !dead && !win
{
	win = 1 + (other.special != 0)
	deadshake = 0
	other.image_speed = 1/6
}