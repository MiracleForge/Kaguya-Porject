/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
	global.pauseON = true
switch(state){	
	
	case states.Out:
	global.pauseON = true
		if sub_image_index < imax + xmax {		
		//incremente index
		sub_image_index += sub_image_index_inc;
	} else {	
		state = states.in;	
		if room_exists(target_room) room_goto(target_room);
		}
break;
	case states.in:	
	if sub_image_index > 0 {	
		sub_image_index -= sub_image_index_inc;
		}else		
		instance_destroy();
	global.pauseON = false
break;
}
