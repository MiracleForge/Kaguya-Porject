/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !active_pet {	
    image_alpha = 0;
} else {
    image_alpha = 1;

draw_text(x,y,velocidade)
draw_sprite(spr_slime_sombra, 0, x -4 , y+3); 
depth = bbox_bottom;
draw_self();
var _scale = 0.5;

if alarm[3] >0 {	
	if image_alpha >= 1{	
		damage_alpha = -0.05; 
		}else if image_alpha <= 0 {	
			damage_alpha = 0.05;
			}
		image_alpha += damage_alpha;	 
	}else{	
		image_alpha = 1;
		}
		
//EMOTE SYSTEM
if mouse_check_button_pressed(mb_left)
{
    if collision_point(mouse_x, mouse_y, obj_slime_pet, false, false)
    {
        if (!alarm[11])
        {
            alarm[11] = room_speed * 2;
        }
    }
}

if (alarm[11] > 0)
{
    var progress = (room_speed * 2 - alarm[11]) / (room_speed * 2);
    draw_sprite_ext(spr_life_recorver, 0, obj_slime_pet.x - 5, obj_slime_pet.y - 20, _scale, _scale, 0, c_white, 1);
    draw_set_alpha(0.5);
    draw_sprite_ext(spr_life_recorver, 0, obj_slime_pet.x - 5, obj_slime_pet.y - 20, _scale, _scale, 0, c_white, progress);
    draw_set_alpha(1);
}
}
alarm[11]--;


/*
// Define a posição onde será desenhado o texto
var text_x = x;
var text_y = y - 20;


// Escolhe a cor do texto com base no estado atual
draw_set_alpha(1);
switch (state) {
	case scr_pet_slime_walking:
	draw_set_color(c_green)
	break;
	case scr_pet_chasing_enemy:
	draw_set_color(c_red)
	break;
	case scr_stop:
	draw_set_color(c_blue)
	break;
	case scr_control_pet:
	draw_set_color(c_black)
	break; 
	case scr_check_enemy_prox:
	draw_set_color(c_fuchsia)
	break; 
	case scr_aleatory_moviment:
	draw_set_color(c_gray)
	break;
}

// Escreve o nome do estado atual na tela
draw_text(text_x, text_y, state);

draw_variables();
 