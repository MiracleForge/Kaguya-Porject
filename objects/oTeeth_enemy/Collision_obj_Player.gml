/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _drop_name = Obj_inventario.names_foe_info[2][0];
var _drop_info = Obj_inventario.names_foe_info[2][1]
   ds_grid_add_item(item_inimigos.orc_tooth, irandom(20) , spr_items_inimigos, _drop_name,_drop_info);
	instance_destroy();
