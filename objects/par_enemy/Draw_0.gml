/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if hit == true{	
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite(sombra,image_index, x -4 , y );
	draw_self();
	gpu_set_fog(false, c_white, 0, 0);
	}else {	
	draw_sprite(sombra, image_index, x -4 , y );
	draw_self();
		}

if dest_x < x {	
	image_xscale = -1; //left
	
	}else {	
		image_xscale = 1; 
		}
		
		
if alarm[2] >= 0 {
	draw_sprite_ext(spr_inimigo_hud_vida, 0, x, y - 8,1,1,0, c_white, 1);
	draw_sprite_ext(spr_inimigo_barra_vida, 0, x, y-8, vida/max_vida, 1, 0, c_white, 1);
}		


