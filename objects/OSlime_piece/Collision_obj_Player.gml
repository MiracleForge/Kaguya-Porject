/// @description if transformed increment transform time else inv +1

var isTransformed = obj_Player.transformed;
var TimeTransfor = obj_slime_pet.transform;
var TimeTransfor_max = obj_slime_pet.transformation_time[obj_slime_pet.level];

var destroyInstance = true;

if obj_Player.attack == false and !isTransformed {
    // percorre o grid e conta os slots vazios


    // verifica se há espaço suficiente para adicionar um novo item
  
        var _drop_name = Obj_inventario.names_foe_info[0][0];
        var _drop_info = Obj_inventario.names_foe_info[0][1];
        var _drop_equip = Obj_inventario.names_foe_info[0][2];
        var _drop_coin = Obj_inventario.names_foe_info[0][3];
        var _drop_cost = Obj_inventario.names_foe_info[0][4];
		var _drop_wep = Obj_inventario.names_foe_info[0][5];
        
        // chama a função para adicionar o item
        ds_grid_add_item(
            item_inimigos.Slime_jelly,
            irandom(20),
            spr_items_inimigos,
            _drop_name,
            _drop_info,
            _drop_equip,
            _drop_coin,
            _drop_cost,
			_drop_wep
        );
        
        destroyInstance = true;
  
} else if isTransformed and TimeTransfor <= (TimeTransfor_max - 20) {
    obj_slime_pet.transform += 20;
    destroyInstance = true;
}

if (destroyInstance) {
    instance_destroy();
}


/*
var _grid = Obj_inventario.grid_itens;
var _empty_slots = 0;
var isTransformed = obj_Player.transformed;
var TimeTransfor = obj_slime_pet.transform;
var TimeTransfor_max = obj_slime_pet.transformation_time[obj_slime_pet.level];

var destroyInstance = true;

if obj_Player.attack == false and !isTransformed {
    // percorre o grid e conta os slots vazios
    for (var i = 0; i < ds_grid_height(_grid); i++) {
        if (_grid[# Infos.item, i] == -1) {
            _empty_slots++;
        }
    }

    // verifica se há espaço suficiente para adicionar um novo item
    if (_empty_slots > 0) {
        var _drop_name = Obj_inventario.names_foe_info[0][0];
        var _drop_info = Obj_inventario.names_foe_info[0][1];
        var _drop_equip = Obj_inventario.names_foe_info[0][2];
        var _drop_coin = Obj_inventario.names_foe_info[0][3];
        var _drop_cost = Obj_inventario.names_foe_info[0][4];
		var _drop_wep = Obj_inventario.names_foe_info[0][5];
        
        // chama a função para adicionar o item
        ds_grid_add_item(
            item_inimigos.Slime_jelly,
            irandom(20),
            spr_items_inimigos,
            _drop_name,
            _drop_info,
            _drop_equip,
            _drop_coin,
            _drop_cost,
			_drop_wep
        );
        
        destroyInstance = true;
    } else {
        // exibe uma mensagem de erro informando que o inventário está cheio
        inventario_cheio = true;
        destroyInstance = false;
    }
} else if isTransformed and TimeTransfor <= (TimeTransfor_max - 20) {
    obj_slime_pet.transform += 20;
    destroyInstance = true;
}

if (destroyInstance) {
    instance_destroy();
}




