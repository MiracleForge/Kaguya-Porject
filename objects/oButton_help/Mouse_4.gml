/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if instance_exists(oControlsMenu) {	
	
	instance_destroy(oControlsMenu);
	
	}else {	
		
		instance_create_layer(room_width / 2 -200, room_width / 2 - 100  , "Instances", oControlsMenu);
		}