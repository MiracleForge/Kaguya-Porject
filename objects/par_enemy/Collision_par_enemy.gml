/// @description Enemys collided with
// Você pode escrever seu código neste editor

x -= dcos(point_direction(x, y, other.x, other.y));
y -= dsin(point_direction(x, y, other.x, other.y));
/*
	var _dir = point_direction(x, y, other.x, other.y);
	var _pushEnemy = 2;
	var _pushxEnemy = lengthdir_x(_pushEnemy, _dir);
	var _pushyEnemy = lengthdir_y(_pushEnemy, _dir);

	other.x += _pushxEnemy; 
	other.y += _pushyEnemy;

