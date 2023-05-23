
script_execute(state);


#region   //stamina regen, status, energy increment
if alarm[1] <= 0 {
    estamina += 1;
	
}

var TimeTransfor = obj_slime_pet.transform
var TimeTransfor_max = obj_slime_pet.transformation_time[obj_slime_pet.level]
// if player transformed and 
if !transformed and TimeTransfor != TimeTransfor_max {
    obj_slime_pet.transform += 0.01;
}

estamina = clamp(estamina, 0, max_stamina);
#endregion


#region   // pick up item - inventory
if instance_exists(Obj_item) and Obj_inventario.inventory == false {
    var _inst = instance_nearest(x, y, Obj_item);
    var _grid = Obj_inventario.grid_itens;
    var _empty_slots = 0;

    // percorre o grid e conta os slots vazios
    for (var i = 0; i < ds_grid_height(_grid); i++) {
        if (_grid[# Infos.item, i] == -1) {
            _empty_slots++;
        }
    }

					
    if distance_to_point(_inst.x, _inst.y) <= 20 and  (_empty_slots > 0) {
        if keyboard_check_pressed(ord("F"))  {
            ds_grid_add_item(
			_inst.image_index,
			_inst.quant_item,
			_inst.sprite_index,
			_inst.obj_name,
			_inst.info_desc,
			_inst.equip,
			_inst.coinType,
			_inst.cost,
			_inst.type_wep
			);
			
            instance_destroy(_inst);
        }
    }
    else if (_empty_slots == 0) {
        // exibe uma mensagem de erro informando que o inventário está cheio
        Obj_item.inventario_cheio = true;
    }
}


#endregion


#region   //start dialogue
if distance_to_object(Obj_par_npc) <= 10 {
    if keyboard_check_pressed(ord("H")) and global.dialogo == false {
        var _npc = instance_nearest(x,y,Obj_par_npc);
        var _dialog = instance_create_layer(x, y, "Dialog", Obj_dialog);
        _dialog.npc_nome = _npc.nome;
    }
}
#endregion


#region   // SHIELD_UP
if shield_up == true {
    instance_create_layer(x = obj_Player.x - 10, y = obj_Player.y, "instances", obj_shield);
} else if shield_up == false and object_exists(obj_shield) {
    instance_destroy(obj_shield);
}

#endregion