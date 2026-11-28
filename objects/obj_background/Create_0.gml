depth = 99

bgsprites = {
	preset: "secret",
	elements: [
		{spite_index: bg_secret, imge_index: 0, imge_speed: 1/3, x: 0, y: 0, vspeed: 1, hspeed: 1, xscroll: 0.6, yscroll: 0.6}
	]
}

var _cam_h = camera_get_view_height(view_camera[0]);

bgpresets = {
	title: {
		preset: "title",
		elements: [
			{spite_index: bg_menu, imge_index: 0, imge_speed: 1/3, x: 0, y: 0, vspeed: 1, hspeed: 1, xscroll: 0.6, yscroll: 0.6}
		]
	},
	world1: {
		preset: "world1",
		elements: [
			{spite_index: bg_smileyland_sky, imge_index: 0, imge_speed: 1/3, x: 0, y: 0, vspeed: 0, hspeed: 0, xscroll: 1, yscroll: 1},
			{spite_index: bg_smileyland_clouds, imge_index: 0, imge_speed: 1/3, x: 0, y: 0, vspeed: 0, hspeed: -0.1, xscroll: 1, yscroll: 1},
			{spite_index: bg_smileyland_farhills, imge_index: 0, imge_speed: 1/3, x: 0, y: 0, vspeed: 0, hspeed: 0, xscroll: 0.95, yscroll: 0.95},
			{spite_index: bg_smileyland_hills, imge_index: 0, imge_speed: 1/3, x: 0, y: 0, vspeed: 0, hspeed: 0, xscroll: 0.9, yscroll: 0.9},
			{spite_index: bg_smileyland_land, imge_index: 0, imge_speed: 1/3, x: 0, y: 0, vspeed: 0, hspeed: 0, xscroll: 0.8, yscroll: 0.8}
		]
	},
	secret:	{
		preset: "secret",
		elements: [
			{spite_index: bg_secret, imge_index: 0, imge_speed: 1/3, x: 0, y: 0, vspeed: 1, hspeed: 1, xscroll: 0.6, yscroll: 0.6}
		]
	}
}