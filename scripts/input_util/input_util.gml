function get_input(){
	key_left = InputCheck(INPUT_VERB.LEFT)
	key_right = InputCheck(INPUT_VERB.RIGHT)
	key_up = InputCheck(INPUT_VERB.UP)
	key_down = InputCheck(INPUT_VERB.DOWN)
	key_jump = InputCheck(INPUT_VERB.JUMP)
	key_run = InputCheck(INPUT_VERB.ACTION)
	
	key_left2 = InputPressed(INPUT_VERB.LEFT)
	key_right2 = InputPressed(INPUT_VERB.RIGHT)
	key_up2 = InputPressed(INPUT_VERB.UP)
	key_down2 = InputPressed(INPUT_VERB.DOWN)
	key_jump2 = InputPressed(INPUT_VERB.JUMP)
	key_run2 = InputPressed(INPUT_VERB.ACTION)
	
	key_accept = InputPressed(INPUT_VERB.ACCEPT)
	key_cancel = InputPressed(INPUT_VERB.CANCEL)
}

function get_empty_input(){
	key_left  = false
	key_right = false
	key_up    = false
	key_down  = false
	key_jump  = false
	key_run   = false
	
	key_left2  = false
	key_right2 = false
	key_up2    = false
	key_down2  = false
	key_jump2  = false
	key_run2   = false
	
	key_accept = false
	key_cancel = false
}