/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if stateslide == Opush.slideoff {
    startpoinx = x;
    startpoiny = y;
    
    h_speed = 0;
    v_speed = 0;
} else if stateslide == Opush.slideon {
	dir = floor ((point_direction(x, y, mouse_x, mouse_y)+45) /90);
    var _face = dir
    
    var targetXdist = lengthdir_x(grid_space, _face);
    var targetYdist = lengthdir_y(grid_space, _face);
    
    targetx = startpoinx + targetXdist;
    targety = startpoiny + targetYdist;
    
    // speed
    var _targetdist = point_distance(x, y, targetx, targety);
    var finalspeed = min(Vel_speed, _targetdist);
    
    var h_direction = (targetx - x) / _targetdist;
    var v_direction = (targety - y) / _targetdist;
    
    // Check for collision in the calculated direction
    if h_direction != 0 && place_meeting(x + h_direction * finalspeed, y, obj_wall) {
        h_direction = 0;
    }
    if v_direction != 0 && place_meeting(x, y + v_direction * finalspeed, obj_wall) {
        v_direction = 0;
    }
    
    h_speed = h_direction * finalspeed;
    v_speed = v_direction * finalspeed;
}

x += h_speed;
y += v_speed;

if h_speed == 0 && v_speed == 0 {
    stateslide = Opush.slideoff;
}
