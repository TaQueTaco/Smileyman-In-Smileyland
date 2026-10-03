function Approach(_start, _end, _step) {
	
	if (abs(abs(_start) - abs(_end)) < _step) && (sign(_start) == sign(_end))
		return _end
	
	if (_start < _end)
	    return min(_start + _step, _end); 
	else
	    return max(_start - _step, _end);
}

function anim_end(){
	return (floor(image_index) >= (image_number - 1));
}