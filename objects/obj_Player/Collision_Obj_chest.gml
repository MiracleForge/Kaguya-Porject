/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if collision_circle(obj_Player.x, obj_Player.y + 8, 8, Obj_chest, true, false) and obj_Player.dir == 1 {
	if instance_nearest(obj_Player.x, obj_Player.y, Obj_chest){
		with(other){
	  if keyboard_check_pressed(ord("F")) &&  chest_triggered == false {
		chest_triggered= true;
		if chest_open ==false {
	
 Current_mode = statechest.Opening;
 chest_open = true;
		
			}
		}
		}
	}
}	