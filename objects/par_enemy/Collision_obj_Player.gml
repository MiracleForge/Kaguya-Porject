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



var dir_hit = point_direction(x, y, other.x, other.y);
// iff anemy hit player without shield
if (other.take_damage == true and other.attack ==false)  {

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
 
/* else if object_exists(obj_shield) and obj_Player.shield_up == true  {

	// se o inimigo atingir o player com shield, inimigo empurrado na direção contrária ao player.dir
	
	
	//if enemy hit player with shield
	with (par_enemy.id){
			var _dir = point_direction(x, y, obj_Player.dir, obj_Player.dir);
			var _push = 3;
		    veloc_chasing = 0;
		
			switch obj_Player.dir{
			
			default:
				    var _pushx = lengthdir_x(_push, _dir);	
				    var _pushy = lengthdir_y(_push, _dir);
				
					other.x -= _pushx; 
				    other.y -= _pushy;
			break;	
			case 1:	
				    var _pushy = lengthdir_y(_push, _dir);
				
				    other.y += _pushy;
			break;
			case 2:
				   var _pushx = lengthdir_x(_push, _dir);
				   var _pushy = lengthdir_y(_push, _dir);
			   
				   other.x += _pushx; 
			       other.y += _pushy;
	
			break;	
			case 3:
				   var _pushy = lengthdir_y(_push, _dir);
			   
		           other.y -= _pushy;
			break;
	
	
			}

		veloc_chasing = 0.5
		}
	
 }

		
	

/* if obj_Player.shield ==true {
		    push_dir = dir_hit;
			state = scr_character_hit;
	        take_damage = false;
	        obj_Player.estamina -=20;
		}