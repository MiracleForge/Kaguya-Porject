/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
seconds = 0;
minutes = 0;
hours = 0;
day = 1;

time_increment = 10;

max_darkness = 0.7;
darkness = 0;
light_colour = c_black;
draw_daylight = false;

guiwidth = display_get_gui_width();
guiheight = display_get_gui_height();

enum phase_day{	
	sunrise =6,
	daytime = 8.5,
	sunset = 18,
	nightime = 22,

	}

