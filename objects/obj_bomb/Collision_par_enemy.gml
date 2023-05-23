/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


instance_create_layer(obj_bomb.x, obj_bomb.y,"Instances", obj_explosion1)
var _dano = 1;
var _dir = point_direction(x, y, other.x, other.y);

other.push_dir = _dir;
other.push_veloc = 6;
other.hit = true;
other.alarm[1] = 5;
other.state = scr_slime_hit;
other.vida -= _dano;

instance_destroy();