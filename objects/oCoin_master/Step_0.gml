/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (coin_move) {	
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	if (abs(x - goal_x) < 1 and abs(y - goal_y) < 1) {
		coin_move = false;
	}	
}
y = goal_y + sin(time * frequency) * amplitude;
time ++;
	
