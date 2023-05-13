/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (inventario_cheio == true) {
    draw_set_alpha(1);
    draw_set_font(Font1);
    draw_set_color(c_red);
    draw_text( 100 ,obj_control._huda, "Inventory full, don't be greedy.")
    draw_set_color(-1);
} 