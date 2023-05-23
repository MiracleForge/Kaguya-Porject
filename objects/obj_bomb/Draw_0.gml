/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


draw_sprite_ext(spr_bomb,image_index, x, y-z,image_xscale/2,image_yscale/2,0,c_white,image_alpha)
draw_text(x,y, fall)


draw_sprite_ext(spr_slime_sombra,image_index, x - 5, y+z + 3,image_xscale+0.05,image_yscale+0.05,0,c_black,0.7);

if alarm[0] <150 {	
	if image_alpha >= 1{	
		alarm_alpha = -0.05; 
		}else if image_alpha <= 0 {	
			alarm_alpha = 0.05;
			}
		image_alpha += alarm_alpha;	 
	}else{	
		image_alpha = 1;
		
		}