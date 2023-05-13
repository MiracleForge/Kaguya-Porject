/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!inicializar) {
    scr_text();
    inicializar = true;
    alarm[0] = 1;
}

if (mouse_check_button_pressed(mb_left)) {
    if (caractere < string_length(text_grid[# conversation.text, pagina])) {
        caractere = string_length(text_grid[# conversation.text, pagina]);
    }
    else {
        alarm[0] = 1;
        caractere = 0;
        
        if (pagina < ds_grid_height(text_grid) - 1) {
            pagina++;
        }
        else {
            global.dialogo = false;
            instance_destroy();
        }
    }
}


