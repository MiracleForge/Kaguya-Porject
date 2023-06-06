/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// if control is off, move is equal to zero;
if !sliding {	
	startpoinx = x;
	startpoiny = y;
	
	h_speed = 0;
    v_speed = 0;
	}

if sliding {	
	//get the real direction	
	var _realdir = facedir;
	
	//Calculate the final distance based on the total allowed distance
	//and the direction the player is facing.
	var _targetXdist = lengthdir_x(grid_space,_realdir);
	var _targetYdist = lengthdir_y(grid_space, _realdir);
	targetx = startpoinx + _targetXdist;
	targety = startpoiny + _targetYdist;
	
	var _targetDist = point_distance(x, y, targetx, targety);
	var _finalspeed = min(Vel_speed, _targetDist);
	// Update the value of the h_speed and v_speed of the veloc;
	h_speed = lengthdir_x(_finalspeed, _realdir);
	v_speed = lengthdir_y(_finalspeed, _realdir);
	// if collide if wall - stop
	if place_meeting(targetx,targety, obj_wall){
		h_speed = 0;
		v_speed = 0;
	}
	
}

//move the object
x += h_speed;
y += v_speed;

if h_speed == 0 and v_speed == 0{	
	sliding = false;
	}




