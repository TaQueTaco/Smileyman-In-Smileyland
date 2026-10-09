global.lives = 5
global.score = 0
global.time = 0
global.livescheck = 1;
global.world = 1;
global.bluecoins_world = 0;
global.bluecoins = 0;
global.secrets = 0;
if variable_global_exists("lifelist")
{
	ds_list_destroy(global.lifelist)
}
global.lifelist = ds_list_create()