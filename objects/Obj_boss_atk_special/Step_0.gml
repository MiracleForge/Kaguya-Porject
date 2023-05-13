/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if fim_da_animacao(){
	var _dir = 0;
	
	repeat(4){	
		var _inst = instance_create_layer(x, y, "Instances", Obj_boss_atk_special);
		_inst.speed = 3;
		_inst.direction = _dir;
		
		_dir +=90;
		
		}
		instance_destroy();
	}
	
if !instance_exists(obj_parente_boss) {	
	instance_destroy();
	}