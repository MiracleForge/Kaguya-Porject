/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//direita
	//cima
	//esquerda
	//baixo

switch (obj_Player.dir) {	
	//left
	default: 
	x = obj_Player.x + 10;
	y = obj_Player.y;
	break;
	//up
	case 1:
	x = obj_Player.x;
	y = obj_Player.y - 10;
	break;
	//left
	case 2:
	x = obj_Player.x - 10;
	y = obj_Player.y;
	break;
	//down
	case 3:
	x = obj_Player.x;
	y = obj_Player.y + 10;
	break;
	
	}