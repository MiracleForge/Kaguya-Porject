
draw_sprite(spr_personagem_sombra, 0, x , y+9); 
depth = bbox_bottom;
draw_self();
var _scale = 0.5

draw_text(x,y, hveloc)
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
		
#region//EMOTE SYSTEM
if mouse_check_button_pressed(mb_left)
{
// Verifica se o mouse está sobre o objeto no momento em que o botão é pressionado
if collision_point(mouse_x, mouse_y, obj_Player, false,false)

{
// Desenha a sprite apenas se o mouse estiver sobre o objeto e o alarme 0 não estiver ativo
if (!alarm[11])

audio_play_sound(snd_aka_sound,  1 , 0);
{
// Define o alarme 0 para desativar depois de 2 segundos
alarm[11] = room_speed * 2; // room_speed é a taxa de atualização da room em frames por segundo (fps)
}
}
}

// Atualiza a sprite a cada quadro, mostrando o progresso do tempo restante
if (alarm[11] > 0)
{
depth = 800;

draw_sprite_ext(spr_U_w_U, 0, obj_Player.x - 8, obj_Player.y -30, _scale, _scale, 0, c_white, 1);
draw_set_alpha(0.5);

draw_sprite_ext(spr_U_w_U, 0, obj_Player.x - 8, obj_Player.y-30, _scale, _scale, 0, c_white, (room_speed * 2 - alarm[11]) / (room_speed * 2));
draw_set_alpha(1);
}
#endregion



