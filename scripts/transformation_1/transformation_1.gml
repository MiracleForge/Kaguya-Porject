// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_transformed_walking(){	

if transformed and  obj_slime_pet.transform >= 2  {
	
	obj_slime_pet.transform -=1;
	
}else if obj_slime_pet.transform <= 2 {	
		
		 transformed = false;
		state = scr_personagem_andando;
		 
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


dir = floor ((point_direction(x, y, mouse_x, mouse_y)+45) /90);

#region ---------------------------- REGION SPRITES ---------------------
if hveloc == 0 and vveloc == 0{		
switch dir{	
	default:
	image_xscale = 0.7;
	image_yscale = 0.7;
	sprite_index = spr_transfomation_1_stop_right;
	break;
	case 1:
	image_xscale = 0.7;
	image_yscale = 0.7;
	sprite_index = spr_transfomation_1_stop_up;
	break;
	case 2:
	image_xscale = 0.7;
	image_yscale = 0.7;
	sprite_index = spr_transfomation_1_stop_left;
	break;
	case 3:
	image_xscale = 0.7;
    image_yscale = 0.7;
	sprite_index = spr_transfomation_1_stop_down;
	break;	
	}
}else {	
	switch dir{	
	default:
	sprite_index = spr_transfomation_1_walk_right;
	break;
	case 1:
	sprite_index = spr_transfomation_1_walk_up;
	break;
	case 2:
	sprite_index = spr_transfomation_1_walk_left;
	break;
	case 3:
	sprite_index = spr_transfomation_1_walk_down;
	break;	
	}
	}
#endregion

if estamina >=10{ 
	if mouse_check_button_pressed(mb_right) and transformed == true{
	estamina -=30;  //valor gasto da stamina por uso
	alarm[1] = 180; //tempo que leva a pstemina aumentar
	alarm [5] = 8;
	dash_dir = point_direction(x, y, mouse_x,mouse_y);
	state = scr_personagem_dash;
	}
}
	
	scr_collision_character();
	
	 
	}


#region   // ------------------------ DASH STATE ---------------------
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
#endregion