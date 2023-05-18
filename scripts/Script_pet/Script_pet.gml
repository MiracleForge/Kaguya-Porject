// função para seguir o player 
//mudar direção da sprite
function scr_pet_slime_walking() { 

	
		

if obj_Player.transformed == false{
		scr_check_enemy_prox();
		
		#region  //moviment aleatory
var _hveloc_player = obj_Player.hveloc;
var _vveloc_player = obj_Player.vveloc;
var _total_player_mov = abs(_hveloc_player) + abs(_vveloc_player);

// Verifique se o jogador está se movendo
if (_total_player_mov == 0) and obj_Player.attack == false {
 
    time_aleatory  ++; 
    
    if (time_aleatory >= 380) {
       		
		time_aleatory = 0;
        scr_aleatory_moviment();	
    }
	}else {
		
	#endregion
	
	
    // Obtenha a posição atual do jogador
    var player_x = obj_Player.x;
    var player_y = obj_Player.y;

    // Direção em que o jogador está olhando
    var player_dir = point_direction(player_x, player_y, mouse_x, mouse_y);

    // Ajuste a direção para um valor positivo dentro do intervalo [0, 360)
    if (player_dir < 0) {
        player_dir += 360;
    }

 
    if (player_dir >= 315 || player_dir < 45) {
        sprite_index = spr_slime_cat_direita;
    } else if (player_dir >= 45 && player_dir < 135) {
        sprite_index = spr_slime_cat_baixo;
    } else if (player_dir >= 135 && player_dir < 225) {
        sprite_index = spr_slime_cat_esquerda;
    } else {
        sprite_index = spr_slime_cat_cima;
    }

    scr_teleport_distanc();
}
} else {	
	state = scr_pet_transform;
	}	
}

// função para desenhar variaveis no mapa
function draw_variables()
{
    var _hveloc_player = obj_Player.hveloc;
    var _vveloc_player = obj_Player.vveloc;
    var var _total_player_mov = abs(_hveloc_player) + abs(_vveloc_player) ;
    
    // Desenhar as variáveis na tela do jogo
    draw_text(10, 10, "Valor de _hveloc_player: " + string(_hveloc_player));
    draw_text(10, 30, "Valor de _vveloc_player: " + string(_vveloc_player));
    draw_text(10, 50, "Valor de _total_player_mov: " + string(_total_player_mov));
}

                                            //FUNÇÃO DE CHECAGEM 
//chega por inimigos proximos
function scr_aleatory_moviment () {
    var _counter = 0;
    _counter ++;

    if (_counter == 10) {
        choose(scr_sleep_animation);
    }

    if (scr_sleep_animation) {
        scr_sleep_animation();
        _counter = 0;      
    }

    #region //Desativar chamada/aleatory_moviment
    var _hveloc_player = obj_Player.hveloc;
    var _vveloc_player = obj_Player.vveloc;
    var _total_player_mov = abs(_hveloc_player) + abs(_vveloc_player);

    if (_total_player_mov != 0 && obj_Player.attack == false) {
        // A condição é verdadeira
        // Faça o que precisa ser feito aqui
        _counter = 0;
        state = scr_aleatory_moviment;
    }
    #endregion
}


// checa por inimigos proximos e ativa a função chasing
function scr_check_enemy_prox() {
	if instance_exists(par_enemy) and instance_nearest(x, y, par_enemy) <= dist_aggro {
		state = scr_pet_chasing_enemy;
	}
}

//controla mudança de state do pet
function scr_control_pet(){

	prox_state = choose(scr_pet_slime_walking, scr_stop);
	if prox_state == scr_pet_slime_walking{	
		state = scr_pet_slime_walking;		
	} else if prox_state == scr_stop {
		state = scr_stop;
	}
}

function scr_pet_chasing_enemy() {
    

    image_speed = 1.5;
    dest_x = par_enemy.x;
    dest_y = par_enemy.y;

    var _dir = point_direction(x, y, dest_x, dest_y);
    hveloc = lengthdir_x(veloc_chasing, _dir);
    vveloc = lengthdir_y(veloc_chasing, _dir);

    scr_slime_collision();

    if distance_to_object(obj_Player) == deseng_aggro {
        state = scr_pet_chasing_enemy;
    }
}
	
function scr_stop(){	
		 scr_control_pet();
	}
	
	                                       // FUNÇÕES APENAS DE CHAMADA 
//teleporta o pet após colisão 
function scr_teleport_distanc() {	
    var distancia = 20;
    // Velocidade do NPC

    // Obtenha a posição atual do jogador
    var player_x = obj_Player.x;
    var player_y = obj_Player.y;

    var dx = player_x - x;
    var dy = player_y - y;

    // Calcule a magnitude do vetor de deslocamento
    var magnitude = sqrt(dx * dx + dy * dy);

    // Normalize o vetor de deslocamento
    dx /= magnitude;
    dy /= magnitude;

    // Calcule a direção em que o NPC deve se mover
    var _direction = point_direction(x, y, player_x, player_y);

    // Verifique se há colisão com obj_wall antes de mover
    if (!place_meeting(x + dx * velocidade, y + dy * velocidade, obj_wall)) {
        // Se a distância entre o NPC e o jogador for maior do que a distância desejada
        if (magnitude > distancia) {
            // Calcule o deslocamento em X e Y com base na direção e na velocidade desejada
            move_x = dx * velocidade;
            move_y = dy * velocidade;
            x += move_x;
            y += move_y;
        }
    } else {
        // Se houver colisão com obj_wall, pare de se mover
        move_x = 0;
        move_y = 0;
    }

    // Se a distância entre o NPC e o jogador for maior que a distância máxima permitida
    if (magnitude > distancia * 3) {
        // Teleportar o NPC para uma posição a uma distância de 20 do jogador
        x = player_x + lengthdir_x(distancia, _direction);
        y = player_y + lengthdir_y(distancia, _direction);
    }
}

// Ativa o o hit do pet 
function scr_pet_hit() {	
    if alarm[2] > 0 {	
        hveloc = lengthdir_x(1, push_dir);
        vveloc = lengthdir_y(1, push_dir);
        scr_collision_character();
    } else {
		state = scr_control_pet;
	}
    
}

// função do movimento aleatório do pet
function scr_sleep_pet (){	
var player_dir_x = obj_Player.x;
var player_dir_y = obj_Player.y;

// Gerar uma posição aleatória em um círculo com raio de 50 unidades em torno do jogador
var angle = random (choose(0, 360)); // Ângulo aleatório em graus
var distance = 50; // Distância fixa de 50 unidades
var pet_dir_x = player_dir_x + distance * cos(angle); // Nova posição x do pet
var pet_dir_y = player_dir_y + distance * sin(angle); // Nova posição y do pet

// Atualizar posição do pet para se mover em direção à nova posição
var pet_speed = 2; // Velocidade fixa do pet (exemplo em pseudocódigo)
x += (pet_dir_x - x) * pet_speed;
y += (pet_dir_y - y) * pet_speed;

	}
	

function scr_sleep_animation() {
    var intervalo = irandom_range(5, 20); // Intervalo de tempo em frames para trocar as sprites
    var sprites = [spr_slime_cat_sleep, spr_slime_cat_sleepmode, spr_slime_cat_cima, spr_personagem_parado_baixo]; // Array com os nomes dos sprites

    // Evento "Create"
    
    // Atualização do objeto
    // Adicione esse código ao objeto no evento "Step"
    
    // Evento "Step"
    contador++;
    if (contador >= intervalo) {
        contador = 0;
        var sprite_atual = sprite_index; // Salva o sprite atual
        var novo_sprite; // Variável para o novo sprite
        do {
            var indice_sprite = irandom(array_length_1d(sprites) - 1); // Gera um índice aleatório para o array de sprites
            switch (indice_sprite) {
                case 0:
                    novo_sprite = sprites[0];
                    break;
                case 1:
                    novo_sprite = sprites[1];
                    break;
                case 2:
                    novo_sprite = sprites[2];
                    break;
                case 3:
                    novo_sprite = sprites[3];
                    break;
            }
        } until (novo_sprite != sprite_atual); // Garante que o novo sprite seja diferente do sprite atual
        sprite_index = novo_sprite; // Troca o sprite atual pelo novo sprite
    }
}



function scr_pet_transform() {	
	
	if obj_Player.transformed   {	
		
		
	var transfor_dest_x = obj_Player.x;
    var transfor_dest_y = obj_Player.y
	var end_point = distance_to_object(obj_Player) < 10,
	
	var _dir = point_direction(x, y, transfor_dest_x, transfor_dest_y);
	
	hveloc = lengthdir_x(veloc_chasing, _dir);
	vveloc = lengthdir_y(veloc_chasing, _dir);
	
	scr_collision_character();
	
	if end_point {	
		
		obj_slime_pet.triggered_transform = true;
		visible =  false;
		}
	}	else {	
		state = scr_control_pet;
		visible = true;
		}
		
	}



	
		








