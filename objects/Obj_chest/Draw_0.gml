/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
	
draw_self();


switch (Current_mode){	
	
	case statechest.Close:
	image_index = 0
	sprite_index = Spr_chest_state1
	break;
	
	case statechest.Opening:
	
	sprite_index = Spr_chest_state1
	if  image_index >= 3 {
		Current_mode = statechest.Open	
	}
	break;
	
	case statechest.Open:
	sprite_index = Spr_chest_state1
	image_index = 2
	image_speed = 0
   
	break;
	}


	



