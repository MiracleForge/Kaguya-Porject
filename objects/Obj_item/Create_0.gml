/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// size sprite
image_xscale = 0.5;
image_yscale = 0.5;

quant_item = -1;

//randomize coord drop_item
drop_move = true;
var itemdir = irandom_range(0, irandom(300));
var len = 16;
goal_x = x + lengthdir_x(len, itemdir);
goal_y = y + lengthdir_y(len, itemdir);

//visual effect
pointy = y;
frequency = 0.02;
amplitude = 2;
time = 0;

//destroy item 
alarm[0] = 600;
alarm_alpha = -1;

