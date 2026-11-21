scr_collision_init()
terminalVelocity = 15;
prevGrounded = 0;
jumpspd = -13
grav = 0.5
coyote = 0;

bouncespd = -17
bouncetime = 0;

walkspd = 6
walljumpspd = 8
runspd = 11
grdfriction = 0.2
airfriction = 0.1

runspdsave = 0
turnspeedup = 0
turnspeeduptime = 6
turnaccel = 2

deadx = x
deady = y
dead = 0

win = 0

oneup = 0;
deadshake = 0;

wall = 0;
walltime = 0;

steppy = 0;

looksie = 0;

falltime = 0;

flip = 0;

slidesnd = -4
audio_sound_loop_start(sfx_slide, 0.55);
audio_sound_loop_end(sfx_slide, 1.49);

walksnd = -4

idlespr = spr_smiley_idle
lookupspr = spr_smiley_lookup
walkspr = spr_smiley_walk
talkspr = spr_smiley_talk
runspr = spr_smiley_run
turnspr = spr_smiley_runturn
runtranspr = spr_smiley_runtransition
jumpspr = spr_smiley_jump
fallspr1 = spr_smiley_fall1
fallspr2 = spr_smiley_fall2
fallspr3 = spr_smiley_fall3
bigfallspr1 = spr_smiley_bigfall1
bigfallspr2 = spr_smiley_bigfall2
bigfallspr3 = spr_smiley_bigfall3
bigfallspr4 = spr_smiley_bigfall4
wallspr = spr_smiley_wallslide
walllandspr = spr_smiley_wallslideland
landspr = spr_smiley_land
crouchspr = spr_smiley_crouch
caramelspr = spr_smiley_caramel
landAnim = 0

xscale = 1
jumpstop = 0

afttime = 0;

input_buffer_jump = 0;
get_input();
state = states.normal;