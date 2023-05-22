/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
 _mx = device_mouse_x_to_gui(0);
 _my = device_mouse_y_to_gui(0);

 _guia = display_get_gui_height();
 _spra = sprite_get_height(spr_hud_vida) * global.escala;
 _huda = _guia - _spra;
 _xcoord = (10 * 100);

_sprite_pick = noone;
item_pickup = false;



global.dialogo = false;

global.pauseON = false;





