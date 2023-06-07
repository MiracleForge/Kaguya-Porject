/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if place_meeting(x,y,obj_Player) || place_meeting(x,y, obj_block){	
	stateButton = 1;
	}else {	
		stateButton = 0;
	
		}
		
if stateButton = 1{	
	with(obj_block){	
		x = xstart;
		y = ystart;
		}
	}
	
image_index = stateButton;