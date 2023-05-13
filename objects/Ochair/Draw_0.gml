/// @description Inserir descrição aqui
// Você pode escrever seu código neste edit
switch dir_chair {	
	default:
	draw_sprite_ext(Sprite137, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	
	break;
	
	case 0:
	draw_sprite_ext(Sprite137, 4, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	
	break;
	
	case 1: 
	draw_sprite_ext(Sprite137, 3, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	
	break;
	case 2:
	draw_sprite_ext(Sprite137, 4, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	
	break;
	}