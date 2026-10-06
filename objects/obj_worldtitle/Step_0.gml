if time < 30
{
	var _lerpinator = round((time/30) * 20)/20
	x = lerp(0, 480, _lerpinator)
	image_xscale = lerp(0, 1, _lerpinator)
	image_yscale = lerp(-1, 1, _lerpinator)
	y = 64
}

if time > 270
{
	var _lerpinator = round(((300-time)/30) * 20)/20
	x = lerp(960, 480, _lerpinator)
	image_xscale = lerp(0, 1, _lerpinator)
	image_yscale = lerp(0, 1, _lerpinator)
	y = 64
}

time++
if time >= 300
{
	instance_destroy();	
}