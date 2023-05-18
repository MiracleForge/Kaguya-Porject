/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Inherit the parent event
state = scr_control_pet;
prox_state = 0;

#region //variables general
hveloc = 0;
vveloc = 0;
velocidade = 1;

time_aleatory = 0;

//chasing
veloc_chasing = 1.5;
dist_aggro = 20;
deseng_aggro = 30;
contador = 0;

// collision
take_damage = true;
push_dir = 0;
attack = false;
damage_alpha = -1;
#endregion

#region // level up variables
//level
level = 1;
xp = 0;
max_exp[1] = 100;
max_exp[2] = 200;
max_exp[3] = 300;
max_exp[4] = 400;
max_exp[5] = 500;

//vida e combate
max_vida[1] = 20;
max_vida[2] = 30;
max_vida[3] = 42;
max_vida[4] = 60;
max_vida[5] = 80;
vida = max_vida;

max_stamina[1] = 0;
max_stamina[2] = 0;
max_stamina[3] = 0;
max_stamina[4] = 0;
max_stamina[5] = 0;
max_stamina[6] = 0;
estamina = max_stamina[level];

damage[1] = 1;
damage[2] = 2;
damage[3] = 3;
damage[4] = 4;
damage[5] = 5;


transformation_time[1] = 300;
transformation_time[2] = 340;
transformation_time[3] = 400;
transformation_time[4] = 440;
transformation_time[5] = 500;
transform = transformation_time[level];

armor_transformation[1] = 1;
armor_transformation[2] = 2;
armor_transformation[3] = 3;
armor_transformation[4] = 4;
armor_transformation[5] = 5;
#endregion



alarm[11] = 0; // Desativa o alarme 1




