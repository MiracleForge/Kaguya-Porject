/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
sliding = false;
startpoinx = x;
startpoiny = y;

grid_space = 16;
targetx = x;
targety = y;

h_speed = 0;
v_speed = 0;
Vel_speed = 2;

stateslide = Opush.slideoff;

enum Opush{	
	slideoff,
	slideon,
	}