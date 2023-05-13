/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

	


var _grid = Obj_inventario.grid_itens;
var _empty_slots = 0;

if obj_Player.attack == false{
// percorre o grid e conta os slots vazios
for (var i = 0; i < ds_grid_height(_grid); i++) {
    if (_grid[# Infos.item, i] == -1) {
        _empty_slots++;
    }
}

// verifica se há espaço suficiente para adicionar um novo item
if (_empty_slots > 0) {
	var _drop_name = Obj_inventario.names_foe_info[0][0]
	var _drop_info = Obj_inventario.names_foe_info[0][1]
    // chama a função para adicionar o item
   ds_grid_add_item(item_inimigos.Slime_jelly, irandom(20) , spr_items_inimigos,_drop_name, _drop_info);
	instance_destroy();
} else {
    // exibe uma mensagem de erro informando que o inventário está cheio
	 inventario_cheio = true;
}
}