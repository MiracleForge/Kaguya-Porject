/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if vida <= 0{
	
	slime_splash_sq = layer_sequence_create("instances", x, y, sq_slime_splash)
	
	
	repeat (3){	

		instance_create_layer(x,y, "instances",obj_slime);
		slime_splash_sq =undefined;
		}
		slime_splash_sq =undefined;
	obj_slime_pet.xp = 100;
}
if (slime_splash_sq != undefined && sequence_exists(sq_slime_splash)) {
sequence_destroy((sq_slime_splash));


	instance_destroy();
	}


