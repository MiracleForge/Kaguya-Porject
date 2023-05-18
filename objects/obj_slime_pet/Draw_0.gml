/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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
// Verifica se o mouse está sobre o objeto no momento em que o botão é pressionado
if collision_point(mouse_x, mouse_y, obj_slime_pet, false,false)
{
// Desenha a sprite apenas se o mouse estiver sobre o objeto e o alarme 0 não estiver ativo
if (!alarm[11])
{
// Define o alarme 0 para desativar depois de 2 segundos
alarm[11] = room_speed * 2; // room_speed é a taxa de atualização da room em frames por segundo (fps)
}
}
}

// Atualiza a sprite a cada quadro, mostrando o progresso do tempo restante
if (alarm[11] > 0)
{
draw_sprite_ext(spr_life_recorver, 0, obj_slime_pet.x - 5, obj_slime_pet.y -20, _scale, _scale, 0, c_white, 1);
draw_set_alpha(0.5);
draw_sprite_ext(spr_life_recorver, 0, obj_slime_pet.x - 5, obj_slime_pet.y-20, _scale, _scale, 0, c_white, (room_speed * 2 - alarm[11]) / (room_speed * 2));
draw_set_alpha(1);
}
// Reduz o tempo restante no alarme a cada quadro
alarm[11]--;

draw_text(x,y, transform)
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
 