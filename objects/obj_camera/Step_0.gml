if !instance_exists(obj_player)
	exit;

if instance_exists(obj_arenadoor)
{
	if obj_arenadoor.active
	{
		_minx = lerp(_minx, obj_arenadoor.x, 0.1)	
		_miny = lerp(_miny, obj_arenadoor.y - 576, 0.1)
		_maxy = lerp(_maxy, obj_arenadoor.bbox_bottom - 412, 0.1)
	}
}

if blueindex < 7
	blueindex += 1/3
else
	blueindex = frac(blueindex)

if abs(obj_player.hsp) > 4
	hsp = lerp(hsp, obj_player.hsp * 4, 0.5)
else
	hsp = lerp(hsp, 0, 0.5)

if !obj_player.grounded
	vsp = lerp(vsp, obj_player.vsp * 3, 0.5)
else
	vsp = lerp(vsp, 0, 0.5)

x = obj_player.x - 480 + hsp
y = obj_player.y -270 + vsp

if instance_exists(obj_camshake)
{
	with obj_camshake
	{
		other.x += random(intens) * choose(-1, 1)
		other.y += random(intens) * choose(-1, 1)
	}
}

x = clamp(x, _minx, room_width - 960)
y = clamp(y, _miny, _maxy)

camera_set_view_pos(view_camera[0], x, y)

if deadflash > 0
	deadflash -= 0.08

if lifeflash > 0
	lifeflash -= 0.06
	
if showblue > 0
	showblue -= 1/60

sprite_index = spr_life
if global.lives <= 1
	sprite_index = spr_lifeuhoh
if global.lives == 0 && (obj_player.dead == 2)
	sprite_index = spr_death