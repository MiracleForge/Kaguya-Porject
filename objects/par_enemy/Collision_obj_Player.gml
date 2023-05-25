/// @description // SHIELD AND HIT BEHAVIOR
/*
with (par_enemy){
	var _dir = point_direction(x, y, other.x, other.y);
	var _push = 1;
	var _pushx = lengthdir_x(_push, _dir);
	var _pushy = lengthdir_y(_push, _dir);

	other.x += _pushx; 
	other.y += _pushy;
}*/
// Evento "collision" do objeto inimigo




// iff anemy hit player without shield
if (other.take_damage == true and other.attack ==false)  {
var dir_hit = point_direction(x, y, other.x, other.y);
    with (other) { 
var angle = point_direction(x, y, x, y);
x -= dcos(angle);
y -= dsin(angle);
		if place_meeting (x,y, obj_wall) {
			
			push_dir = dir_hit;
	        state = scr_character_hit;
	        alarm[2] = 10;
	        alarm[3] = 100;
	        take_damage = false;
	        vida -= 1;
			
				} else {			
				        push_dir = dir_hit;
						if shield_up == true{
						}else {
				        state = scr_character_hit;
			}
			
	        alarm[2] = 10;
	        alarm[3] = 100;
	        take_damage = false;
	        vida -= 1;
		}
    }

    var _inst = instance_create_layer(x, y, "instances", Obj_dano);
    _inst.alvo = other;
    _inst.dano = 1;
	
	
}
 
