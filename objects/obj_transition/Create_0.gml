/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//state.machine



enum states {	
	Out,
	in
	}
	
global.pauseON = false;
state = states.Out;


spr = s_trans_sq;
sprw = sprite_get_width(spr);
sprh = sprite_get_height(spr);

//get nunber of sprites requited
//set max sprite for x
xmax = room_width div sprw;
//get max sprite for y
ymax = room_height div sprh;
imax = sprite_get_number(spr);
//set image speed
sub_image_index_inc = sprite_get_speed(spr)/room_speed;
sub_image_index = 0;

//transition color
col = c_black;

target_room = noone;