/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// No evento Draw do objeto pai obj_item, use a estrutura "switch" para desenhar o sprite

draw_self();
// alpha change alert
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
