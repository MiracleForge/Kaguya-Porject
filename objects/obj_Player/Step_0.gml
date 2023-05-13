
script_execute(state);

#region   //stamina regen
if alarm[1] <= 0 {
    estamina += 1;
}

estamina = clamp(estamina, 0, max_stamina);
#endregion

#region   // sistema de armas
if keyboard_check_pressed(ord("E")) {
    arma += 1;
}

if keyboard_check_pressed(ord("Q")) {
    arma -= 1;
}

if arma >= armas.altura {
    arma = 0;
} else if arma < 0 {
    arma = armas.altura - 1;
}
#endregion


#region   // pick up item - inventory
if instance_exists(Obj_item) and Obj_inventario.inventory == false {
    var _inst = instance_nearest(x, y, Obj_item);
    if distance_to_point(_inst.x, _inst.y) <= 20 {
        if keyboard_check_pressed(ord("F")) {
            ds_grid_add_item(_inst.image_index, _inst.quant_item, _inst.sprite_index);
            instance_destroy(_inst);
        }
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