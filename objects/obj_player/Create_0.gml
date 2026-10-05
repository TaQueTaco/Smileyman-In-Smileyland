scr_collision_init()
terminalVelocity = 15;
prevGrounded = 0;
jumpspd = -13
bouncespd = -17
bouncetime = 0;
walkspd = 6
walljumpspd = 8
runspd = 11
grdfriction = 0.2
airfriction = 0.1
deadx = x
deady = y
crouch = 0;
dead = 0
win = 0
oneup = 0;
deadshake = 0;
grav = 0.5
coyote = 0;
wall = 0;
walltime = 0;

falltime = 0;

slidesnd = -4
audio_sound_loop_start(sfx_slide, 0.55);
audio_sound_loop_end(sfx_slide, 1.49);

walksnd = -4

idlespr = spr_smiley_idle
walkspr = spr_smiley_walk
runspr = spr_smiley_run
jumpspr = spr_smiley_jump
fallspr1 = spr_smiley_fall1
fallspr2 = spr_smiley_fall2
wallspr = spr_smiley_wallslide
walllandspr = spr_smiley_wallslideland
landspr = spr_smiley_land
landAnim = 0

xscale = 1
jumpstop = 0

afttime = 0;

input_buffer_jump = 0;
get_input();