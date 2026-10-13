if time < 15
{
	var _lerpinator = round((time/15) * 20)/20
	x = lerp(0, 480, _lerpinator)
	image_xscale = lerp(0, 1, _lerpinator)
	image_yscale = lerp(-1, 1, _lerpinator)
	y = 64
}

if time > 255
{
	var _lerpinator = round(((270-time)/15) * 20)/20
	x = lerp(960, 480, _lerpinator)
	image_xscale = lerp(0, 1, _lerpinator)
	image_yscale = lerp(0, 1, _lerpinator)
	y = 64
}

time++
if time >= 270
{
	instance_destroy();	
}