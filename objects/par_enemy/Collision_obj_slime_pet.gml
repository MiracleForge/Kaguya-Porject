/// @description PET ATTACK BEHAVIOR
// Você pode escrever seu código neste editor

if obj_Player.attack == true {
	var  dir_hit = point_direction(x, y, other.x, other.y);
	pet_hit ++;

	if pet_hit >= 60 {
		with (other){	
			push_dir = dir_hit;
			state = scr_pet_hit;
			alarm[2] = 20;
			alarm[3] =100;
			take_damage = false;
	
			}
	
	
		var _inst = instance_create_layer(x, y, "instances", Obj_dano);
			_inst.alvo = other;
			_inst.dano = 1;
			_inst.colour = c_red;
		pet_hit = 0;
		vida -=1;
	}
	
}