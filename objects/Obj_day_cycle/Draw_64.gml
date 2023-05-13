/// @description Inserir descrição aqui
if (draw_daylight) {
var _c =  light_colour;
draw_set_alpha(darkness);
draw_rectangle_color(0, 0, guiwidth, guiheight, _c, _c, _c, _c, false);
}
var _c = c_yellow;
draw_text_color(10, 10, string(seconds), _c, _c, _c, _c, 1);
draw_text_color(10, 30, string(minutes), _c, _c, _c, _c, 1);
draw_text_color(10, 50, string(hours), _c, _c, _c, _c, 1);
draw_text_color(10, 110, string(day), _c, _c, _c, _c, 1);


	
