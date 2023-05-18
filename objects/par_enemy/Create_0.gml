/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
pushing = 0;

randomize();
possible_itens = [OSlime_piece, oTeeth_enemy];
//movimento
state = scr_slime_chosing_state;
prox_state = 0;

hveloc =0;
vveloc =0;
veloc =0.2;
veloc_chasing = 0.5;

dest_x = 0;
dest_y =0;

alarm[0] = 1;

dist_aggro = 50;
deseng_aggro = 100;

//combate
max_vida = 25;
vida = 25;
push_dir = 0;
push_veloc = 0;
hit = false;
pet_hit = 0;

sombra = -1;
