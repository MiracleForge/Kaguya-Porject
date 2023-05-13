function scr_collision_character(){	
    if place_meeting(x + hveloc, y, obj_wall){	
        while !place_meeting(x + sign(hveloc), y, obj_wall) {	
            x += sign(hveloc);
        }
        hveloc = 0;
    }
    x += hveloc;

    if place_meeting(x, y + vveloc, obj_wall){	
        while !place_meeting(x, y + sign(vveloc), obj_wall){	
            y += sign(vveloc);
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

	
	if estamina >=10{ 
	if mouse_check_button_pressed(mb_side1){
	estamina -=30;  //valor gasto da stamina por uso
	alarm[1] = 180; //tempo que leva a pstemina aumentar
	alarm [0] = 8;
	dash_dir = point_direction(x, y, mouse_x,mouse_y);
	state = scr_personagem_dash;
	}
}
  if mouse_check_button_pressed(mb_right){
  
 if estamina >=40 and shield == true{	
		 
			image_index = 0;
			state = scr_shield_posture;
			} 
  }

if (collision_point(mouse_x, mouse_y, obj_slime_pet,false,false) or collision_point(mouse_x, mouse_y, obj_Player,false,false)) {
    // Não ative o código abaixo
} else {		
if mouse_check_button_pressed(mb_left) and shield_up == false{
	if arma == armas.espada{
	attack = true;
	dir = floor ((point_direction(x, y, mouse_x, mouse_y)+45) /90);
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
	
		}else if arma == armas.arco{	
		image_index = 0;
		
		state = scr_character_bow;
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
				var _dir = point_direction(obj_Player.x, obj_Player.y, other.x, other.y)
				push_dir = _dir;
				push_veloc = 6;
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
				var _dir = point_direction(obj_Player.x, obj_Player.y, other.x, other.y)
				push_dir = _dir;
				push_veloc = 6;
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

function scr_personagem_dash(){	
    // Desabilita o dano durante o dash
    take_damage = false;
	
    // Verifica as colisões antes do dash
    scr_collision_character();
	
    // Define a velocidade do personagem na direção do dash
    hveloc = lengthdir_x(dash_veloc, dash_dir);
    vveloc = lengthdir_y(dash_veloc, dash_dir);
	
    // Verifica as colisões durante o dash
    scr_collision_character();

    // Move player and NPC
    x += hveloc;
    y += vveloc;
	
    // Verify collision after dash
    scr_collision_character();
	
    // visual effect (opcional)
    var _inst = instance_create_layer(x, y, "Instances", obj_dash);
    _inst.sprite_index = sprite_index;
}

	
function scr_character_hit() {	
    if (alarm[2] > 0) {	
		
        hveloc = lengthdir_x(3, push_dir);
        vveloc = lengthdir_y(3, push_dir);
		
        scr_collision_character();
		
	}else {
			audio_play_sound(snd_hit_license_Lemonjolly,  1 , 0)
		    state = scr_personagem_andando;
		
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
	dir = floor ((point_direction(x, y, mouse_x, mouse_y)+45) /90);
	
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
	
	