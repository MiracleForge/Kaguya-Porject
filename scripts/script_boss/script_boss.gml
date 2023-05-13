// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_boss_chosing_attack(){
		if instance_exists(Obj_dialog) {
		exit;
	}
if alarm [0] <= 0 {
var _attack = choose(scr_boss_attack, scr_boss_attack_especial);
 state = _attack;
 alarm[0] = 240;
}
}

function scr_boss_attack(){	
	var _dir = 0;
	
	repeat(8){
		var _inst = instance_create_layer(x,y, "Instances", obj_boss_proj_1);
		_inst.speed = 2;
		_inst.direction = _dir;
		
		_dir += 45;
	}
	state = scr_boss_chosing_attack;
}
	
	
function scr_boss_attack_especial() {	
	repeat(6){	
		var _xx = irandom_range(x -100, x+100);
		var _yy = irandom_range(y -100, y+100);
		
		instance_create_layer(_xx, _yy,"Instances", Obj_boss_atk_special);
		
		}

	state = scr_boss_chosing_attack;
}