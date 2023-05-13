/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if inicializar == true {	
var _guiL = display_get_gui_width();
var _guia = display_get_gui_height();

var _xx = 0;
var _yy = _guia - 200 ; // tamanho da tela de dialogo
var _c = c_black;
var _sprite = text_grid[# conversation.portrait, pagina];
var _texto = string_copy(text_grid[# conversation.text, pagina],0,caractere); // velocidade de escrita

draw_set_alpha(0.5); // day/dialog
draw_set_font(Font1);
if text_grid[# conversation.side, pagina] ==0{	
	//lado esquerdo
	draw_rectangle_color(_xx +200, _yy, _guiL, _guia, _c,_c,_c,_c, false);
	draw_text(_xx + 216, _yy - 32, text_grid[# conversation.name, pagina]);
	draw_text_ext(_xx + 232, _yy +32, _texto, 32, _guiL - 264);
	
	draw_sprite_ext(_sprite, 0, 100, _guia -75,global.escala, global.escala, 0, c_white, 1);  //altura e disp da sprite esquerda
}// lado direito
else {	
	draw_rectangle_color(_xx, _yy, _guiL -200, _guia, _c,	_c,_c,_c, false); // retangulo
	var _stgw = string_width(text_grid[# conversation.name, pagina]);
	draw_text(_guiL - 216 - _stgw, _yy - 32, text_grid[# conversation.name, pagina]);
	draw_text_ext(_xx +100, _yy + 32, _texto, 32, _guiL - 264); //altura e disposicao do texto
	
	draw_sprite_ext(_sprite, 0, +1200, _guia - 100, global.escala, global.escala, 0, c_white, 1);
	/*
	_guia +175 // colocar quando tiver sprite definitiva no lugar do -1200
	*/
	}
}
/*
draw_set_font(font_dialog2); /caso queria mudar a fonte em dialogo especifico
*/