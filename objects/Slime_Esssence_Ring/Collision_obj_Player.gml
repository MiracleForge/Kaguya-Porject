/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


        var _drop_name = Obj_inventario.names_weapons_info[5][0];
		var _drop_info = Obj_inventario.names_weapons_info[5][1];
		var _drop_equip = Obj_inventario.names_weapons_info[5][2];
	    var _drop_coin = Obj_inventario.names_weapons_info[5][3];
	    var _drop_cost = Obj_inventario.names_weapons_info[5][4];
	    var _drop_wep = Obj_inventario.names_weapons_info[5][5];
		
        // chama a função para adicionar o item
        ds_grid_add_item(
            itens_armas.ring_slime1,
            irandom(20),
            spr_items,
            _drop_name,
            _drop_info,
            _drop_equip,
            _drop_coin,
            _drop_cost,
			_drop_wep
        );
        
     
instance_destroy();