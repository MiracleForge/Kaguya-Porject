/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// if control is off, move is equal to zero;
if !sliding {	
	startpoinx = x;
	startpoiny = y;
	
	h_speed = 0;
    v_speed = 0;
	}

//type ground area 
if place_meeting(x,y,obj_pusharea){	
	pushblockArea = true;
	}else {	
		pushblockArea = false;
		}
		
if place_meeting(x,y, obj_IceGround){	
	onIce = true;
	}else {	
		onIce = false;
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
	
	//on ice keep add coord until the edge of the iceGround
if onIce {
    targetx = startpoinx;
    targety = startpoiny;
   
    while (place_meeting((targetx + _targetXdist) + sign(_targetXdist), (targety + _targetYdist) + sign(targety), obj_IceGround))  {
        
        
        targetx += sign(_targetXdist);
        targety += sign(_targetYdist);
    }
} 
	
	var _targetDist = point_distance(x, y, targetx, targety);
	var _finalspeed = min(Vel_speed, _targetDist);
	// Update the value of the h_speed and v_speed of the veloc;
	h_speed = lengthdir_x(_finalspeed, _realdir);
	v_speed = lengthdir_y(_finalspeed, _realdir);
	// if collide if wall - stop
  if place_meeting(x + h_speed, y, obj_wall)  {
        var maxIterations = abs(h_speed); // Set maximum iteration count
        var iterations = 0; // Initialize iteration counter

        while (!place_meeting(x + sign(h_speed), y, obj_wall) && iterations < maxIterations)  {
            x += sign(h_speed);
            iterations++;
        }
        h_speed = 0;
    }else if (pushblockArea && !place_meeting(targetx, targety, obj_pusharea)){	
		h_speed = 0;
		}
    x += h_speed;

    if place_meeting(x, y + v_speed, obj_wall) {
        var maxIterations = abs(v_speed); // Set maximum iteration count
        var iterations = 0; // Initialize iteration counter

        while (!place_meeting(x, y + sign(v_speed), obj_wall) && iterations < maxIterations)  {
            y += sign(v_speed);
            iterations++;
        }
        v_speed = 0;
    }else if (pushblockArea && !place_meeting(targetx, targety, obj_pusharea)){	
		v_speed = 0;
		}
    y += v_speed;
	

}
	




if h_speed == 0 and v_speed == 0{	
	sliding = false;
	}




