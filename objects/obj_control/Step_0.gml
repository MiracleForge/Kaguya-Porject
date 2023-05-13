/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// variaveis para mouse



	
if instance_exists(Obj_dialog){	
	global.dialogo = true;
	
	}
	

if (point_in_rectangle(_mx, _my, 220 + _xcoord, _huda -20 , 330 +_xcoord, _huda + 60) and mouse_check_button_pressed(mb_left)){
	Obj_inventario.inventory = !Obj_inventario.inventory
	
}	


