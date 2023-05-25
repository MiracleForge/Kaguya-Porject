event_inherited();

#region  //Movimento
right = -1;
left = -1;
up = -1;
down = -1;

hveloc = 0;
vveloc = 0;

veloc = 1;
dir =0;


//Dash
dash_dir = -1;
dash_veloc = 1;

//block interactions
blockdist = 4;

#endregion

//estados
state = scr_personagem_andando;

#region   //combate
max_stamina =100;
estamina = max_stamina;
max_vida = 20
vida = max_vida;

take_damage = true;
push_dir = 0;

// damage and triggered
damage = 1 + obj_slime_pet.damage[obj_slime_pet.level];
attack = false;
damage_alpha = -1;
combo = false;

//shield variable
shield_up = false;
shield = false;
arma = 0;

active_sword = false;
active_bow = false;
#endregion


//sistema de arma
enum armas{	
	espada,
	arco,
	shield,
	altura
	}
	
enemyhit = ds_list_create();




// transformations

transformed = false;