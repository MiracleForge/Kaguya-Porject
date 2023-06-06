function scr_collision_character() {
    if place_meeting(x + hveloc, y, obj_wall) {
        var maxIterations = abs(hveloc); // Set maximum iteration count
        var iterations = 0; // Initialize iteration counter

        while (!place_meeting(x + sign(hveloc), y, obj_wall) && iterations < maxIterations) {
            x += sign(hveloc);
            iterations++;
        }
        hveloc = 0;
    }
    x += hveloc;

    if place_meeting(x, y + vveloc, obj_wall) {
        var maxIterations = abs(vveloc); // Set maximum iteration count
        var iterations = 0; // Initialize iteration counter

        while (!place_meeting(x, y + sign(vveloc), obj_wall) && iterations < maxIterations) {
            y += sign(vveloc);
            iterations++;
        }
        vveloc = 0;
    }
    y += vveloc;
}




function scr_personagem_andando(){
	if global.pauseON ==true{	exit;}
    if instance_exists(Obj_dialog) {
        exit;
    }
    up = keyboard_check(ord("W"));
    down = keyboard_check(ord("S"));
    right = keyboard_check(ord("D"));
    left = keyboard_check(ord("A"));
	interact = keyboard_check_pressed(vk_space);
	

    hveloc = (right - left) * veloc ; 
    vveloc = (down - up) * veloc ;  
	
    hipotenusa = sqrt((hveloc*hveloc) + (vveloc*vveloc));

    if (hipotenusa > veloc) {		
        hveloc = (hveloc / hipotenusa) * veloc;
        vveloc = (vveloc / hipotenusa) * veloc;
	
    }

   

//mudança de sprite
 //flor transforma o resultado do mouse me numero inteiro
dir = floor ((point_direction(x, y, mouse_x, mouse_y)+45) /90);
#region ----------------------------------- Region Sprites ------------------------------------
if hveloc == 0 and vveloc == 0{		
switch dir{	
	default:
	sprite_index = spr_personagem_parado_direita;
	break;
	case 1:
	sprite_index = spr_personagem_parado_cima;
	break;
	case 2:
	sprite_index = spr_personagem_parado_esquerda;
	break;
	case 3:
	sprite_index = spr_personagem_parado_baixo;
	break;	
	}
}else {	
	switch dir{	
	default:
	sprite_index = spr_personagem_correndo_direita;
	break;
	case 1:
	sprite_index = spr_personagem_correndo_cima;
	break;
	case 2:
	sprite_index = spr_personagem_correndo_esquerda;
	break;
	case 3:
	sprite_index = spr_personagem_correndo_baixo;
	break;	
	}
	}
#endregion

	#region ------------------------------- ANOTHER FUNCTIONS CALLS ------------------
if interact {	
	// find the direction of the push block in 360 degree
	var _face = directionblock(); 
	// see if we find a push block
	var _checkX = x + lengthdir_x(blockdist, _face);
	var _checkY = y + lengthdir_y(blockdist, _face);
	var _pushinstance = instance_place(_checkX,_checkY, obj_block);
	//if there is a push block , tell it to slide and whith direction
	if instance_exists(_pushinstance) && _pushinstance.sliding == false{	
		_pushinstance.sliding = true;
		_pushinstance.facedir = directionblock();
		}
	
	}
	
	
  if mouse_check_button_pressed(mb_right){
  
 if estamina >=40 and shield == true{	
		 
			image_index = 0;
			state = scr_shield_posture;
			} else if active_bow {
				
				image_index = 0;
				state = scr_character_bow;
				}else if istrowing {
					
					image_index = 0;
					var _dir = point_direction(x,y, mouse_x, mouse_y);
					var _xx = lengthdir_x(5, _dir);
					var _yy = lengthdir_y(5, _dir);
					
					var _inst = instance_create_layer(x + _xx, y + _yy, "Instances", obj_bomb);
					_inst.direction = _dir;
					_inst.image_angle = _dir;
					_inst.speed = 1;
		}
  }


if  keyboard_check_pressed(ord("J")) and obj_slime_pet.transform >=10 and !transformed and !shield_up {	
	
	state = scr_transformation;
	transformed = true;
	}

#endregion

if (collision_point(mouse_x, mouse_y, obj_slime_pet,false,false) or collision_point(mouse_x, mouse_y, obj_Player,false,false)) {
    // Não ative o código abaixo
} else {		
if mouse_check_button_pressed(mb_left) and shield_up == false {
	if active_sword{
	attack = true;
	
	ds_list_clear(enemyhit);
	image_index = 0;
	audio_play_sound(snd_atk_2_license_Lemonjolly,  1 , 0);
	
	switch dir {
		//right
		default:
		sprite_index = spr_personagem_atacando_direita;
		mask_index = spr_personagem_atacando_direitaHB;
		break;
		//up
		case 1:
		sprite_index = spr_personagem_atacando_cima;
		mask_index = spr_personagem_atacando_cimaHB;
		break;
		//left
		case 2:
		sprite_index = spr_personagem_atacando_esquerda;
		mask_index = spr_personagem_atacando_esquerdaHB;
		break;
		//down
		case 3:
		sprite_index = spr_personagem_atacando_baixo;
		mask_index = spr_personagem_atacando_baixoHB;
		break;
		}
		state = scr_character_attacking;
	
		}
	}
} 
 scr_collision_character();
}

	

function scr_character_attacking(){

	var enemy_on_box = ds_list_create();   // cria uma lista que adiciona os id dos inimigos que foram atingidos pela hitbox
	// coloca a id dos inimigos atingidos na lista
	var enemys = instance_place_list(x, y, par_enemy, enemy_on_box, false);
	// se tiver inimigos atingidos , execute
	if enemys > 0{	
		for (var i = 0; i < enemys; i++) {	// loop checa a id de cada inimigo atingido
			var enemysID = enemy_on_box[|i];   // a id de cada inimigo atingido
			
			// compara a id do inimigo na id local com a lista de atingidos do obj_player
			if (ds_list_find_index(enemyhit, enemysID)) == -1 {	
				ds_list_add(enemyhit, enemysID);    // lista grava os inimigos atingidos
				
				with (enemysID){	// o que acontece ao inimigo
				vida -= obj_slime_pet.damage[obj_slime_pet.level];
				var _dir = point_direction(x,y, mouse_x, mouse_y);
				push_dir = _dir;
				push_veloc = 20;	
				state = scr_slime_hit;
				
				alarm[1] = 5;
				hit = true;
				
				var _inst = instance_create_layer(x, y , "Instances", Obj_dano);
				_inst.alvo = other;
				_inst.damage = obj_slime_pet.damage[obj_slime_pet.level];
					}
				}
			}
		}

ds_list_destroy(enemy_on_box);

if image_index >= 3 {	
		if mouse_check_button_pressed(mb_left) {	
			combo = true;
			}
		}

if fim_da_animacao(){	
		if combo == false {	
		
		mask_index = spr_personagem_correndo_baixo;
		state = scr_personagem_andando;
		attack = false;
		}else {	
		ds_list_clear(enemyhit);
		image_index = 0;
		audio_play_sound(snd_atk_1_license_Lemonjolly,  1 , 0);
	
		switch dir {
			//right
			default:
				sprite_index = spr_personagem_arco_baixo;
				mask_index = spr_personagem_atacando_direitaHB;
			break;
			//up
			case 1:
				sprite_index = spr_personagem_atacando_cima_combo;
				mask_index = spr_personagem_atacando_cima_comboHB;
			break;
			//left
			case 2:
				sprite_index = spr_personagem_arco_baixo;
				mask_index = spr_personagem_atacando_esquerdaHB;
			break;
			//down
			case 3:
				sprite_index = spr_personagem_atacando_baixo_combo;
				mask_index = spr_personagem_atacando_baixo_comboHB;
			break;
			}
			state = scr_combo_attack1;
			}
	}
}

function scr_combo_attack1 (){	
	var enemy_on_box = ds_list_create();   // cria uma lista que adiciona os id dos inimigos que foram atingidos pela hitbox
	// coloca a id dos inimigos atingidos na lista
	var enemys = instance_place_list(x, y, par_enemy, enemy_on_box, false);
	// se tiver inimigos atingidos , execute
	if enemys > 0{	
		for (var i = 0; i < enemys; i++) {	// loop checa a id de cada inimigo atingido
			var enemysID = enemy_on_box[|i];   // a id de cada inimigo atingido
			
			// compara a id do inimigo na id local com a lista de atingidos do obj_player
			if (ds_list_find_index(enemyhit, enemysID)) == -1 {	
				ds_list_add(enemyhit, enemysID);    // lista grava os inimigos atingidos
				
				with (enemysID){	// o que acontece ao inimigo
				vida -= (obj_Player.damage);
				var _dir = point_direction(x,y, mouse_x, mouse_y);
				push_dir = _dir;
				push_veloc =12;
				state = scr_slime_hit;
				alarm[1] = 5;
				hit = true;
				
				var _inst = instance_create_layer(x, y , "Instances", Obj_dano);
				_inst.alvo = other;
				_inst.damage = obj_Player.damage;
					}
				}
			}
		}
		ds_list_destroy(enemy_on_box);
		
		if fim_da_animacao(){
			mask_index = spr_personagem_parado_baixo;
			attack = false;
			combo = false;
			state = scr_personagem_andando;
			}
	}



	
function scr_character_hit() {	
    if (alarm[2] > 0) {	
		
        hveloc = lengthdir_x(3, push_dir);
        vveloc = lengthdir_y(3, push_dir);
		
        scr_collision_character();
		
	}else {
			audio_play_sound(snd_hit_license_Lemonjolly,  1 , 0)
			if shield_up {
				state =scr_shield_posture;
				}else{
		    state = scr_personagem_andando;
				}
    }
}
	

function scr_character_bow(){	
	dir = floor ((point_direction(x, y, mouse_x, mouse_y)+45) /90);
	
	switch dir{	
		//right
		default:
		sprite_index = spr_personagem_arco_direita
		break;
		//up
		case 1:
		sprite_index = spr_personagem_arco_cima
		break;
		//left
		case 2:
		sprite_index = spr_personagem_arco_esquerda
		break;
		//down
		case 3:
		sprite_index = spr_personagem_arco_baixo
		break;
		}
		if fim_da_animacao(){	
			image_index = 4;
			}	
			if mouse_check_button_released(mb_left){	
				if image_index >=4 {
					var _dir = point_direction(x,y, mouse_x, mouse_y);
					var _xx = lengthdir_x(5, _dir);
					var _yy = lengthdir_y(5, _dir);
					
					var _inst = instance_create_layer(x + _xx, y + _yy, "Instances", obj_flecha);
					_inst.direction = _dir;
					_inst.image_angle = _dir;
					_inst.speed = 12;
					
					push_dir = point_direction(mouse_x, mouse_y, x, y,);
					alarm[2] = 5;
					state = scr_character_hit;
					
				}else {
					state = scr_personagem_andando;
				}
			}
	}



function scr_shield_posture(){
	

	scr_personagem_andando();

	
	veloc = 0.4;
	alarm[1] = 180; //tempo que leva a pstemina aumentar
	alarm [0] = 8;
	
	shield_up = true;
	
	
if hveloc == 0 and vveloc == 0{	
		
switch dir{	
	default:
	sprite_index = spr_shield_porture_right;
	break;
	case 1:
	sprite_index = spr_shield_porture_cima;
	break;
	case 2:
	sprite_index = spr_shield_porture_left;
	break;
	case 3:
	sprite_index = spr_shield_porture_baixo;
	break;	
	}
	}else {	
	
		switch dir{	
		default:
		sprite_index = spr_shield_running_right;
		break;
		case 1:
		sprite_index = spr_shield_running_up;
		break;
		case 2:
		sprite_index = spr_shield_running_left;
		break;
		case 3:
		sprite_index = spr_shield_running_down;
		break;	
		}
	
	}
if mouse_check_button_released(mb_right) {	
	shield_up = false;
} else if mouse_check_button_pressed(mb_left) {	
	shield_up = false;
}

if estamina <= 10 {
	shield_up = false;
}

if shield_up {
	veloc = 0.5;
	state = scr_shield_posture;
} else {
	veloc = 1;
	state = scr_personagem_andando;
}

}
	


function scr_transformation() {

	if 	obj_slime_pet.triggered_transform == true{
	state = scr_transformed_walking
	}
}

