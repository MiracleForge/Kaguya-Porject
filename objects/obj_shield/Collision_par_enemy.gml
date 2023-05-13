/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




/*
 if object_exists(obj_shield) and obj_Player.shield_up == true  {
*/
	//if enemy hit player with shield
		
if (collision_line(obj_shield.x, obj_shield.y, x, y, par_enemy, false, false)) {

	with (other){
		
		
				  
	    	var _dir = point_direction(obj_Player.x, obj_Player.y, other.x, other.y)
	     	push_dir = _dir;
			push_veloc = 30;
			state = scr_slime_hit;
			alarm[1] = 5;
	
	 }
	
 }
  veloc_chasing = 0.5
