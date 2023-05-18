// Os recursos de script mudaram para a v2.3.0; veja

function scr_slime_collision() {
	if place_meeting(x + hveloc, y, obj_wall) {
		while !place_meeting(x + sign(hveloc), y, obj_wall) {
			x += sign(hveloc);
		}
		hveloc = 0;
	}

	if place_meeting(x, y + vveloc, obj_wall) {
		while !place_meeting(x, y + sign(vveloc), obj_wall) {
			y += sign(vveloc);
		}
		vveloc = 0;
	}

	x += hveloc;
	y += vveloc;
}


function scr_check_player_prox() {
    if (distance_to_object(obj_Player) <= dist_aggro || vida < max_vida) {
        state = scr_slime_chasing;
    }
}
	

function scr_slime_chosing_state(){
		if instance_exists(Obj_dialog) {
		exit;
	}
	scr_check_player_prox();
	
	prox_state = choose (scr_slime_walking, scr_slime_stop);
	if prox_state == scr_slime_walking{	
		state = scr_slime_walking;
		dest_x = irandom_range(0, room_width); //escolha qual ponto quer ir da room
		dest_y = irandom_range(0, room_height);
		}else if prox_state == scr_slime_stop {
		state = scr_slime_stop;
}
}

function scr_slime_walking(){
	scr_check_player_prox();
	image_speed = 1;
	
	if distance_to_point(dest_x, dest_y) > veloc{
	var _dir = point_direction(x, y, dest_x, dest_y);
	hveloc = lengthdir_x(veloc, _dir);
	vveloc = lengthdir_y(veloc, _dir);
	
	 scr_slime_collision();
	}else {	
		x = dest_x;
		y = dest_y;
		}
	}
	
function scr_slime_stop() {	
	scr_check_player_prox();
	image_speed = 0.5;
	}
	
function scr_slime_chasing() {
	
	image_speed = 1.5;
	dest_x = obj_Player.x;
	dest_y = obj_Player.y;
	
	
	var _dir = point_direction(x, y, dest_x, dest_y);
	hveloc = lengthdir_x(veloc_chasing, _dir);
	vveloc = lengthdir_y(veloc_chasing, _dir);
	
	scr_slime_collision();
	
	if par_enemy.vida < max_vida {	
		state = scr_slime_chasing;
		}else {
	if distance_to_object(obj_Player) >= deseng_aggro{	
		state = scr_slime_chosing_state;
		alarm[0] = irandom_range(120, 240);
		}
	
}
}

function scr_slime_hit() {
	alarm[2] = 180;
	push_veloc = lerp(push_veloc, 0, 0.5);

	hveloc = lengthdir_x(push_veloc, push_dir);
	vveloc = lengthdir_y(push_veloc, push_dir);

	// Atualize as variáveis hveloc e vveloc antes da colisão
	x += hveloc;
	y += vveloc;

	scr_slime_collision();
}

	