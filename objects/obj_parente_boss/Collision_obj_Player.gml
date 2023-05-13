/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
	

if other.take_damage == true {
var  dir_hit = point_direction(x, y, other.x, other.y);

with (other){	
	push_dir = dir_hit;
	state = scr_character_hit;
	alarm[2] = 10;
	alarm[3] =100;
	take_damage = false;
	vida -=1;
	}
	var _inst = instance_create_layer(x, y, "instances", Obj_dano);
_inst.alvo = other;
_inst.dano = 1;
}	

