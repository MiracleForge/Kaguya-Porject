/// @description Inserir descrição aqui
///////////////////////////////////////////// SEPARA OS ELEMENTOS ///////////////////////
//---------------------------------- SEPARA FUNÇÕES DENTRO DO MESMO ELEMENTO ////////////

#region //largar item
if mouse_check_button_pressed(mb_right) or !inventory  {
			item_select = -1;
			pos_select = -1;
			equip_select = -1;
			weapon_select = -1;
			posWeapon_select = -1;
			potion_select = -1;
			pospotion_select = -1;
			armor_select = -1;
			posarmor_select = -1;
			pet_select = -1;
			pospet_select = -1;
	}
	if !petinventory{	
		mb_pet_posselect= -1;
		mb_pet_posselect = -1;
		mb_pet_quant = -1;
		mb_craft_posselect = -1;
		mb_craft_select = -1;
		mb_craft_quant = -1;
		}

#endregion

//centralização  da sprite
var _guiL = display_get_gui_width();
var _guia = display_get_gui_height();
var _scala = global.escala;
// variaveis para mouse
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var c = c_black;
var C = c_white;
if inventory == true {
	

	 // local variable and loof for slots
	
	var _invx =  _guiL/2 - inventory_L/2;  // dividir o tamanho da sprite 
	var _invy = _guia/2 - inventory_A/2;
	
	
	var _walletx = _guia/2 - wallet_L/2; // wallet sprite
    var _wallety = _guia/2 - wallet_A/2;
	
	draw_set_alpha(0.7)
	draw_rectangle_color(_guiL, _guia, -_guiL, - _guia, c_black,c_black,c_black,c_black, false);
	
	
	draw_set_alpha(1);
	draw_sprite_ext(spr_new_inventory, 0, _invx, _invy, global.escala, global.escala, 0 , c_white, 1);
	
	var ix = 0; // variaveis que guardam o tracking
	var iy = 0;
	for (var i = 0; i < total_slots; i++) {  //i igual a 0 , enquanto i for menor que total slots acrescenta mais 1	
	
	
	var _slotsx = _invx + x_inventory + ((size_slots + buffer) * ix);  // soma o inicio do slot com o comprimento e multiplica pelo numero de slots para começar o proximo slot 
	var _slotsy = _invy + y_inventory + ((size_slots + buffer -14) * iy);



#region ------------------------- Trash Can---------------------------------------------------------------------
	if !ShowingDespription { 
draw_sprite_ext(spr_trash_hui, 0, 970, 180, global.escala / 5, global.escala / 5, 0, c_white, 1);
	
	
if point_in_rectangle(_mx, _my, 970, 200, 1070, 325) {
   
    
    if mouse_check_button_pressed(mb_left) {
		var grid = undefined;
		var pos;

		if item_select != -1 {
		    grid = grid_itens;
		    pos = pos_select;
		    item_select = -1;
		    pos_select = -1;
		    equip_select = -1;
			} else if weapon_select != -1 {
			    grid = grid_weapon;
			    pos = posWeapon_select;
			    weapon_select = -1;
			    posWeapon_select = -1;
			} else if potion_select != -1 {
			    grid = grid_potions;
			    pos = pospotion_select;
			    potion_select = -1;
			    pospotion_select = -1;
			} else if armor_select != -1 {
			    grid = grid_equip;
			    pos = posarmor_select;
			    armor_select = -1;
			    posarmor_select = -1;
			}

			if !is_undefined(grid) {
			    grid[#Infos.item, pos] = -1;
			    grid[#Infos.quantity, pos] = -1;
			    grid[#Infos.sprite, pos] = -1;
			    grid[#Infos.name, pos] = -1;
			    grid[#Infos.discription, pos] = -1;
			    grid[#Infos.coin, pos] = -1;
			    grid[#Infos.cost, pos] = -1;
			    grid[#Infos.typeWeapon, pos] = -1;
		}


	}
}
}
#endregion

	
	if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + size_slots, _slotsy + size_slots) {
    
	draw_sprite_ext(spr_inventario_seletor, 0, _slotsx, _slotsy, global.escala, global.escala, 0, c_white, 1); // desenho do retangulo do mouse


#region  // ---------------------- Discription PRESS "O"   --------------------------------------------------------
// desenhar a sprite do item na aba de descrição

draw_info_inventory(grid_itens[# Infos.item, i], grid_itens[# Infos.name,i], grid_itens[# Infos.discription,i], grid_itens[# Infos.sprite,i], grid_itens[# Infos.coin,i], grid_itens[# Infos.cost,i],1);


#endregion
			
#region  // ---------------------- Pickup itens and drop	------------------------------------------------------

				// esvaziando inventario
				if keyboard_check_pressed(ord("F")) and grid_itens[# Infos.item, i] != -1 and item_select == -1 {
				var _inst = instance_create_layer(obj_Player.x,obj_Player.y, "inventory", Obj_item);
					_inst.sprite_index = grid_itens[# Infos.sprite, i];
					_inst.image_index = grid_itens[# Infos.item, i];
					_inst.quant_item = grid_itens[# Infos.quantity, i];
					_inst.obj_name = grid_itens[# Infos.name, i];
					_inst.info_desc = grid_itens[# Infos.discription, i];
					_inst.equip = grid_itens[# Infos.equipable, i]; 
					_inst.coinType = grid_itens[# Infos.coin, i];
					_inst.cost = grid_itens[# Infos.cost, i];
					_inst.type_wep = grid_itens[# Infos.typeWeapon, i]; 
					
				grid_itens[# Infos.item, i] = -1;
				grid_itens[# Infos.quantity, i] = -1;
				grid_itens[# Infos.sprite, i] = -1;
				grid_itens[# Infos.name, i] = -1;
				grid_itens[# Infos.discription, i] = -1;
				grid_itens[# Infos.equipable, i] = -1;
			    grid_itens[# Infos.coin, i] = -1;
				grid_itens[# Infos.cost, i] = -1;
				grid_itens[# Infos.typeWeapon, i]  = -1;
				 
				
				} 
				
				
#endregion	

#region	 // ---------------------- Check slots   ----------------------------------------------------------------- 		
				if mouse_check_button_pressed(mb_left) {
          if weapon_select == -1 and potion_select == -1 and armor_select == -1 and pet_select == -1 {
				// não tenha item selecionado
				if item_select == -1  {
				
				item_select =  grid_itens[# Infos.item, i];
				equip_select = grid_itens[# Infos.equipable,i];
				quantity_select = grid_itens[# Infos.quantity, i];
				pos_select = i;
				// caso tenha item selecionado
				
#region -------------------------- inventory - to - inventory    ---------------------------------
				}else {	
							// caso o item do slot seja diferente
					if item_select == grid_itens [# Infos.item, i] and pos_select !=i and grid_itens[# Infos.sprite, i] == grid_itens[# Infos.sprite, pos_select] {	
						grid_itens[# Infos.quantity, i] += grid_itens[# Infos.quantity, pos_select];							
						grid_itens[# Infos.item, pos_select] = -1;
						grid_itens[# Infos.quantity, pos_select] = -1;
						
						item_select = - 1;
						pos_select = - 1;
						equip_select = -1;
						 
				}		//caso o slot selecionado esteja vazio
					else if grid_itens[# Infos.item, i] == -1 {
							grid_itens[# Infos.item, i] = grid_itens[# Infos.item, pos_select];
							grid_itens[# Infos.quantity, i] = grid_itens[# Infos.quantity, pos_select];
							grid_itens[# Infos.sprite, i] = grid_itens[# Infos.sprite, pos_select];
							grid_itens[# Infos.name, i] = grid_itens[# Infos.name, pos_select];
							grid_itens[# Infos.discription, i] = grid_itens[# Infos.discription, pos_select];
							grid_itens[# Infos.equipable, i] = grid_itens[# Infos.equipable, pos_select];
							grid_itens[# Infos.coin, i] = grid_itens[# Infos.coin, pos_select];
							grid_itens[# Infos.cost, i] = grid_itens[# Infos.cost, pos_select];
							grid_itens[# Infos.typeWeapon, i] = grid_itens[# Infos.typeWeapon, pos_select];
							
							grid_itens[# Infos.item, pos_select] = -1;
							grid_itens[# Infos.quantity, pos_select] = -1;
							grid_itens[# Infos.sprite, pos_select] = -1;
							grid_itens[# Infos.name, pos_select] = -1;
							grid_itens[# Infos.discription, pos_select] = -1;
							grid_itens[# Infos.equipable, pos_select] = -1;
							grid_itens[# Infos.coin, pos_select] = -1;
						    grid_itens[# Infos.cost, pos_select] = -1;
							grid_itens[# Infos.typeWeapon, pos_select] = -1;
							
							item_select = - 1;
							pos_select = - 1;
							equip_select = -1;
								
							//caso o slot selecionado ja tenha um item, trocar posição
					}
						else if grid_itens[# Infos.item, pos_select] != grid_itens[# Infos.item, i] or grid_itens[# Infos.sprite, pos_select] != grid_itens[# Infos.sprite, i]{	
								var _item = grid_itens[# Infos.item, i];
								var _quantity = grid_itens[# Infos.quantity, i];
								var _spr = grid_itens[# Infos.sprite, i];
						        var _name = grid_itens[# Infos.name, i];
								var _info = grid_itens[# Infos.discription, i];
								var _equip =  grid_itens[# Infos.equipable, i];
								var _coin = grid_itens[# Infos.coin, i];
								var _cost = grid_itens[# Infos.cost, i];
								var _wep = grid_itens[# Infos.typeWeapon, i]; 
								
								grid_itens[# Infos.item, i] = grid_itens [# Infos.item, pos_select];
								grid_itens[# Infos.quantity, i] = grid_itens[# Infos.quantity, pos_select];
								grid_itens[# Infos.sprite, i] = grid_itens[# Infos.sprite, pos_select];
								grid_itens[# Infos.name, i] = grid_itens[# Infos.name, pos_select];
								grid_itens[# Infos.discription, i] = grid_itens[# Infos.discription, pos_select]
								grid_itens[# Infos.equipable, i] = grid_itens[# Infos.equipable, pos_select];
								grid_itens[# Infos.coin, i] = grid_itens[# Infos.coin, pos_select];
								grid_itens[# Infos.cost, i] = grid_itens[# Infos.cost, pos_select];
								grid_itens[# Infos.typeWeapon, i] = grid_itens[# Infos.typeWeapon, pos_select];
						       
						
								grid_itens[# Infos.item, pos_select] =  _item;
								grid_itens[# Infos.quantity, pos_select] = _quantity;
								grid_itens[# Infos.sprite, pos_select] = _spr;
								grid_itens[# Infos.name, pos_select] = _name;
								grid_itens[# Infos.discription, pos_select] = _info;
								grid_itens[# Infos.equipable, pos_select] = _equip;
								grid_itens[# Infos.coin, pos_select] = _coin;
								grid_itens[# Infos.cost, pos_select] = _cost;
							    grid_itens[# Infos.typeWeapon, pos_select] = _wep;
								
								item_select = - 1;
								pos_select = - 1;
								equip_select = -1;
							}		
						}
						#endregion

#region -------------------------- weapon slots - to - inventory ---------------------------------
						 }	else if weapon_select != -1 and grid_itens[# Infos.item,i] = -1 {	
		 
								
			

					                grid_itens[# Infos.item, i] = grid_weapon[# Infos.item, posWeapon_select];
					                grid_itens[# Infos.quantity, i] = grid_weapon[# Infos.quantity, posWeapon_select];
					                grid_itens[# Infos.sprite, i] = grid_weapon[# Infos.sprite, posWeapon_select];
					                grid_itens[# Infos.name, i] = grid_weapon[# Infos.name, posWeapon_select];
					                grid_itens[# Infos.discription, i] = grid_weapon[# Infos.discription, posWeapon_select];
					                grid_itens[# Infos.equipable, i] = grid_weapon[# Infos.equipable, posWeapon_select];
					                grid_itens[# Infos.coin, i] = grid_weapon[# Infos.coin, posWeapon_select];
					                grid_itens[# Infos.cost, i] = grid_weapon[# Infos.cost, posWeapon_select];
									grid_itens[# Infos.typeWeapon, i] = grid_weapon[# Infos.typeWeapon, posWeapon_select];

					                grid_weapon[# Infos.item, posWeapon_select] = -1;
					                grid_weapon[# Infos.quantity, posWeapon_select] = -1;
					                grid_weapon[# Infos.sprite, posWeapon_select] = -1;
					                grid_weapon[# Infos.name, posWeapon_select] = -1;
					                grid_weapon[# Infos.discription, posWeapon_select] = -1;
					                grid_weapon[# Infos.coin, posWeapon_select] = -1;
					                grid_weapon[# Infos.cost, posWeapon_select] = -1;
								    grid_weapon[# Infos.typeWeapon, posWeapon_select] = -1;

					                weapon_select = -1;
					                posWeapon_select = -1;
								
						}else if weapon_select != -1 and grid_weapon[# Infos.item, posWeapon_select] != grid_itens[# Infos.item, i] and grid_weapon[# Infos.typeWeapon, posWeapon_select] == grid_itens[# Infos.typeWeapon, i]  {
           
								    var _item = grid_weapon[# Infos.item, posWeapon_select];
								    var _quantity = grid_weapon[# Infos.quantity, posWeapon_select];
								    var _spr = grid_weapon[# Infos.sprite, posWeapon_select];
								    var _name = grid_weapon[# Infos.name, posWeapon_select];
								    var _info = grid_weapon[# Infos.discription, posWeapon_select];
								    var _equip =  grid_weapon[# Infos.equipable, posWeapon_select];
								    var _coin = grid_weapon[# Infos.coin, posWeapon_select];
								    var _cost = grid_weapon[# Infos.cost, posWeapon_select];
								    var _wep = grid_weapon[# Infos.typeWeapon, posWeapon_select]; 

								    grid_weapon[# Infos.item, posWeapon_select] = grid_itens[# Infos.item, i];
								    grid_weapon[# Infos.quantity, posWeapon_select] = grid_itens[# Infos.quantity, i];
								    grid_weapon[# Infos.sprite, posWeapon_select] = grid_itens[# Infos.sprite, i];
								    grid_weapon[# Infos.name, posWeapon_select] = grid_itens[# Infos.name, i];
								    grid_weapon[# Infos.discription, posWeapon_select] = grid_itens[# Infos.discription, i];
								    grid_weapon[# Infos.equipable, posWeapon_select] = grid_itens[# Infos.equipable, i];
								    grid_weapon[# Infos.coin, posWeapon_select] = grid_itens[# Infos.coin, i];
								    grid_weapon[# Infos.cost, posWeapon_select] = grid_itens[# Infos.cost, i];
								    grid_weapon[# Infos.typeWeapon, posWeapon_select] = grid_itens[# Infos.typeWeapon, i];

								    grid_itens[# Infos.item, i] = _item;
								    grid_itens[# Infos.quantity, i] = _quantity;
								    grid_itens[# Infos.sprite, i] = _spr;
								    grid_itens[# Infos.name, i] = _name;
								    grid_itens[# Infos.discription, i] = _info;
								    grid_itens[# Infos.equipable, i] = _equip;
								    grid_itens[# Infos.coin, i] = _coin;
								    grid_itens[# Infos.cost, i] = _cost;
								    grid_itens[# Infos.typeWeapon, i] = _wep;

								    weapon_select = -1;
								    posWeapon_select = -1;
						#endregion	
						
#region -------------------------- potionsslots - to - inventory ---------------------------------
						 }	else  if potion_select != -1 and grid_itens[# Infos.item,i] = -1 {	
									

					                grid_itens[# Infos.item, i] = grid_potions[# Infos.item, pospotion_select];
					                grid_itens[# Infos.quantity, i] = grid_potions[# Infos.quantity, pospotion_select];
					                grid_itens[# Infos.sprite, i] = grid_potions[# Infos.sprite, pospotion_select];
					                grid_itens[# Infos.name, i] = grid_potions[# Infos.name, pospotion_select];
					                grid_itens[# Infos.discription, i] = grid_potions[# Infos.discription, pospotion_select];
					                grid_itens[# Infos.equipable, i] = grid_potions[# Infos.equipable, pospotion_select];
					                grid_itens[# Infos.coin, i] = grid_potions[# Infos.coin, pospotion_select];
					                grid_itens[# Infos.cost, i] = grid_potions[# Infos.cost, pospotion_select];
									grid_itens[# Infos.typeWeapon, i] = grid_potions[# Infos.typeWeapon, pospotion_select];

					                grid_potions[# Infos.item, pospotion_select] = -1;
					                grid_potions[# Infos.quantity, pospotion_select] = -1;
					                grid_potions[# Infos.sprite, pospotion_select] = -1;
					                grid_potions[# Infos.name, pospotion_select] = -1;
					                grid_potions[# Infos.discription, pospotion_select] = -1;
					                grid_potions[# Infos.coin, pospotion_select] = -1;
					                grid_potions[# Infos.cost, pospotion_select] = -1;
								    grid_potions[# Infos.typeWeapon, pospotion_select] = -1;

					                potion_select = -1;
					                pospotion_select = -1;
								
								}else if potion_select != -1 and grid_potions[# Infos.item, pospotion_select] != grid_itens[# Infos.item, i] and grid_potions[# Infos.typeWeapon, pospotion_select] == grid_itens[# Infos.typeWeapon, i]  {
           
								    var _item = grid_potions[# Infos.item, pospotion_select];
								    var _quantity = grid_potions[# Infos.quantity, pospotion_select];
								    var _spr = grid_potions[# Infos.sprite, pospotion_select];
								    var _name = grid_potions[# Infos.name, pospotion_select];
								    var _info = grid_potions[# Infos.discription, pospotion_select];
								    var _equip =  grid_potions[# Infos.equipable, pospotion_select];
								    var _coin = grid_potions[# Infos.coin, pospotion_select];
								    var _cost = grid_potions[# Infos.cost, pospotion_select];
								    var _wep = grid_potions[# Infos.typeWeapon, pospotion_select]; 

								    grid_potions[# Infos.item, pospotion_select] = grid_itens[# Infos.item, i];
								    grid_potions[# Infos.quantity,pospotion_select] = grid_itens[# Infos.quantity, i];
								    grid_potions[# Infos.sprite, pospotion_select] = grid_itens[# Infos.sprite, i];
								    grid_potions[# Infos.name, pospotion_select] = grid_itens[# Infos.name, i];
								    grid_potions[# Infos.discription, pospotion_select] = grid_itens[# Infos.discription, i];
								    grid_potions[# Infos.equipable, pospotion_select] = grid_itens[# Infos.equipable, i];
								    grid_potions[# Infos.coin, pospotion_select] = grid_itens[# Infos.coin, i];
								    grid_potions[# Infos.cost, pospotion_select] = grid_itens[# Infos.cost, i];
								    grid_potions[# Infos.typeWeapon, pospotion_select] = grid_itens[# Infos.typeWeapon, i];

								    grid_itens[# Infos.item, i] = _item;
								    grid_itens[# Infos.quantity, i] = _quantity;
								    grid_itens[# Infos.sprite, i] = _spr;
								    grid_itens[# Infos.name, i] = _name;
								    grid_itens[# Infos.discription, i] = _info;
								    grid_itens[# Infos.equipable, i] = _equip;
								    grid_itens[# Infos.coin, i] = _coin;
								    grid_itens[# Infos.cost, i] = _cost;
								    grid_itens[# Infos.typeWeapon, i] = _wep;

								    potion_select = -1;
								    pospotion_select = -1;
									
								} else if armor_select != -1 and grid_itens[# Infos.item,i] == -1 {	
									

					                grid_itens[# Infos.item, i] = grid_equip[# Infos.item, posarmor_select];
					                grid_itens[# Infos.quantity, i] = grid_equip[# Infos.quantity, posarmor_select];
					                grid_itens[# Infos.sprite, i] = grid_equip[# Infos.sprite, posarmor_select];
					                grid_itens[# Infos.name, i] = grid_equip[# Infos.name, posarmor_select];
					                grid_itens[# Infos.discription, i] = grid_equip[# Infos.discription, posarmor_select];
					                grid_itens[# Infos.equipable, i] = grid_equip[# Infos.equipable, posarmor_select];
					                grid_itens[# Infos.coin, i] = grid_equip[# Infos.coin, posarmor_select];
					                grid_itens[# Infos.cost, i] = grid_equip[# Infos.cost, posarmor_select];
									grid_itens[# Infos.typeWeapon, i] = grid_equip[# Infos.typeWeapon, posarmor_select];

					                grid_equip[# Infos.item, posarmor_select] = -1;
					                grid_equip[# Infos.quantity, posarmor_select] = -1;
					                grid_equip[# Infos.sprite, posarmor_select] = -1;
					                grid_equip[# Infos.name, posarmor_select] = -1;
					                grid_equip[# Infos.discription, posarmor_select] = -1;
					                grid_equip[# Infos.coin, posarmor_select] = -1;
					                grid_equip[# Infos.cost, posarmor_select] = -1;
								    grid_equip[# Infos.typeWeapon, posarmor_select] = -1;

					                armor_select = -1;
					                posarmor_select = -1;
								
								} else if armor_select != -1 and grid_equip[# Infos.item, posarmor_select] != grid_itens[# Infos.item, i] and grid_equip[# Infos.typeWeapon, posarmor_select] == grid_itens[# Infos.typeWeapon, i]  {
           
								    var _item = equip[# Infos.item, posarmor_select];
								    var _quantity = equip[# Infos.quantity, posarmor_select];
								    var _spr = grid_equip[# Infos.sprite,posarmor_select];
								    var _name = grid_equip[# Infos.name,posarmor_select];
								    var _info = grid_equip[# Infos.discription, posarmor_select];
								    var _equip =  grid_equip[# Infos.equipable, posarmor_select];
								    var _coin = grid_equip[# Infos.coin, posarmor_select];
								    var _cost = grid_equip[# Infos.cost, posarmor_select];
								    var _wep = grid_equip[# Infos.typeWeapon, posarmor_select]; 

								    grid_equip[# Infos.item, posarmor_select] = grid_itens[# Infos.item, i];
								    grid_equip[# Infos.quantity,posarmor_select] = grid_itens[# Infos.quantity, i];
								    grid_equip[# Infos.sprite, posarmor_select] = grid_itens[# Infos.sprite, i];
								    grid_equip[# Infos.name, posarmor_select] = grid_itens[# Infos.name, i];
								    grid_equip[# Infos.discription, posarmor_select] = grid_itens[# Infos.discription, i];
								    grid_equip[# Infos.equipable, posarmor_select] = grid_itens[# Infos.equipable, i];
								    grid_equip[# Infos.coin, posarmor_select] = grid_itens[# Infos.coin, i];
								    grid_equip[# Infos.cost, posarmor_select] = grid_itens[# Infos.cost, i];
								    grid_equip[# Infos.typeWeapon, posarmor_select] = grid_itens[# Infos.typeWeapon, i];

								    grid_itens[# Infos.item, i] = _item;
								    grid_itens[# Infos.quantity, i] = _quantity;
								    grid_itens[# Infos.sprite, i] = _spr;
								    grid_itens[# Infos.name, i] = _name;
								    grid_itens[# Infos.discription, i] = _info;
								    grid_itens[# Infos.equipable, i] = _equip;
								    grid_itens[# Infos.coin, i] = _coin;
								    grid_itens[# Infos.cost, i] = _cost;
								    grid_itens[# Infos.typeWeapon, i] = _wep;

								    armor_select = -1;
								    posarmor_select = -1;
									
								}
								#endregion
					 }		
	   }	
	
#endregion
	
#region  //----------------------- Itens inventory sprites -------------------------------------------------------
var  _sprite = grid_itens[# Infos.sprite, i]; //checar se tem item no slot

	if grid_itens[# Infos.item, i] != -1{	//desenho dos itens (chega se o valor do inventario for diferente de 1)
		
		draw_sprite_ext(_sprite, grid_itens[# 0, i], _slotsx, _slotsy, global.escala, global.escala, 0, c_white, 1);
		
			//quantidade dos itens
			draw_set_alpha(1);
			draw_set_font(Font1);
			draw_set_halign(fa_center);
			draw_text_colour_outline(_slotsx + size_slots, _slotsy + size_slots - 8, grid_itens[# Infos.quantity, i], 4, c_black, 16, 100, 100);
			} 

#endregion
			
		
		ix ++;  // adiciona os slots horizontalmente
		
		if ix >= slots_h {   //se os slots add foram maior que os slots _h adicionar slot y
			ix = 0;
			iy ++;
			
	}
	
}
	
#region	 ------------------ Drop item from mouse and quantity of item on mouse to draw --------------------------



			if item_select	!= -1 and weapon_select == -1 and armor_select == -1 {	
	
			draw_sprite_ext(grid_itens[# Infos.sprite, pos_select], item_select, _mx, _my, global.escala, global.escala, 0, c_white, 1);
			draw_set_alpha(1);
			draw_set_font(Font1);
			draw_set_halign(fa_center);
			draw_text_colour_outline(_mx, _my, quantity_select, 4, c_black, 16, 100, 100);

		}  else if weapon_select != -1  {	
			draw_sprite_ext(grid_weapon[# Infos.sprite, posWeapon_select], weapon_select, _mx, _my, global.escala, global.escala, 0, c_white, 1);
			}else if  potion_select != -1{	
				draw_sprite_ext(grid_potions[# Infos.sprite, pospotion_select], potion_select, _mx, _my, global.escala, global.escala, 0, c_white, 1);
				} else if armor_select != -1{	
					draw_sprite_ext(grid_equip[# Infos.sprite, posarmor_select], armor_select, _mx, _my, global.escala, global.escala, 0, c_white, 1);
					}else if pet_select != -1{	
						draw_sprite_ext(grid_pet[# pet_info.sprite, pospet_select], pet_select, _mx, _my, global.escala / 29, global.escala / 29, 0 , c_white, 1);
						}
#endregion		


// /////////////////////////////////////////// OTHER SLOTS //////////////////////////////////////////////////////

#region  ------------------------------------- Armor SLOTS ------------------------------------------------------

var eqx = 0; // variáveis que guardam o tracking
var eqy = 0;

for (var i = 0; i < total_equipS; i++) { // i igual a 0, enquanto i for menor que total slots acrescenta mais 1

    var _equipslotx = _invx + x_equip  // soma o início do slot com o comprimento e multiplica pelo número de slots para começar o próximo slot
    var _equipsloty = _invy + y_equip + ((size_slots + buffer_equip) * eqy);

    if point_in_rectangle(_mx, _my, _equipslotx, _equipsloty, _equipslotx + size_slots, _equipsloty + size_slots) {

        draw_sprite_ext(spr_inventario_seletor, 0, _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
	
		draw_info_inventory(grid_equip[# Infos.item, i],grid_equip[# Infos.name, i], grid_equip[# Infos.discription, i], grid_equip[# Infos.sprite, i], grid_equip[# Infos.coin, i], grid_equip[# Infos.cost, i], 1);

        if mouse_check_button_pressed(mb_left) {
			if item_select != -1 {
  

            if equip_select == 1 and grid_equip[# Infos.item,i] = -1 {
				var itemType = grid_itens[# Infos.typeWeapon, pos_select];
				
               if ((i == 0 && itemType == 30) || (i == 1 && itemType == 40) || (i == 2 && itemType == 50) || (i == 3 && itemType == 60)){
	                grid_equip[# Infos.item, i] = grid_itens[# Infos.item, pos_select];
	                grid_equip[# Infos.quantity, i] = grid_itens[# Infos.quantity, pos_select];
	                grid_equip[# Infos.sprite, i] = grid_itens[# Infos.sprite, pos_select];
	                grid_equip[# Infos.name, i] = grid_itens[# Infos.name, pos_select];
	                grid_equip[# Infos.discription, i] = grid_itens[# Infos.discription, pos_select];
	                grid_equip[# Infos.equipable, i] = grid_itens[# Infos.equipable, pos_select];
	                grid_equip[# Infos.coin, i] = grid_itens[# Infos.coin, pos_select];
	                grid_equip[# Infos.cost, i] = grid_itens[# Infos.cost, pos_select];
					grid_equip[# Infos.typeWeapon, i] = grid_itens[# Infos.typeWeapon, pos_select];

	                grid_itens[# Infos.item, pos_select] = -1;
	                grid_itens[# Infos.quantity, pos_select] = -1;
	                grid_itens[# Infos.sprite, pos_select] = -1;
	                grid_itens[# Infos.name, pos_select] = -1;
	                grid_itens[# Infos.discription, pos_select] = -1;
	                grid_itens[# Infos.coin, pos_select] = -1;
	                grid_itens[# Infos.cost, pos_select] = -1;
				    grid_itens[# Infos.typeWeapon, pos_select] = -1;

	                item_select = -1;
	                pos_select = -1;
	                equip_select = -1;
				} 
			  }else if equip_select == 1 and grid_itens[# Infos.item, pos_select] != grid_potions[# Infos.item,i]   {    
			 var itemType = grid_itens[# Infos.typeWeapon, pos_select];
    
		     if ((i == 0 && itemType == 30) || (i == 1 && itemType == 40) || (i == 2 && itemType == 50) || (i == 3 && itemType == 60)){
		        var _item = grid_equip[# Infos.item, i];
		        var _quantity = grid_equip[# Infos.quantity, i];
		        var _spr = grid_equip[# Infos.sprite, i];
		        var _name = grid_equip[# Infos.name, i];
		        var _info = grid_equip[# Infos.discription, i];
		        var _equip =  grid_equip[# Infos.equipable, i];
		        var _coin = grid_equip[# Infos.coin, i];
		        var _cost = grid_equip[# Infos.cost, i];
		        var _wep = grid_equip[# Infos.typeWeapon, i]; 
                            
		        grid_equip[# Infos.item, i] = grid_itens [# Infos.item, pos_select];
		        grid_equip[# Infos.quantity, i] = grid_itens[# Infos.quantity, pos_select];
		        grid_equip[# Infos.sprite, i] = grid_itens[# Infos.sprite, pos_select];
		        grid_equip[# Infos.name, i] = grid_itens[# Infos.name, pos_select];
		        grid_equip[# Infos.discription, i] = grid_itens[# Infos.discription, pos_select];
		        grid_equip[# Infos.equipable, i] = grid_itens[# Infos.equipable, pos_select];
		        grid_equip[# Infos.coin, i] = grid_itens[# Infos.coin, pos_select];
		        grid_equip[# Infos.cost, i] = grid_itens[# Infos.cost, pos_select];
		        grid_equip[# Infos.typeWeapon, i] = grid_itens[# Infos.typeWeapon, pos_select];
                   
		        grid_itens[# Infos.item, pos_select] =  _item;
		        grid_itens[# Infos.quantity, pos_select] = _quantity;
		        grid_itens[# Infos.sprite, pos_select] = _spr;
		        grid_itens[# Infos.name, pos_select] = _name;
		        grid_itens[# Infos.discription, pos_select] = _info;
		        grid_itens[# Infos.equipable, pos_select] = _equip;
		        grid_itens[# Infos.coin, pos_select] = _coin;
		        grid_itens[# Infos.cost, pos_select] = _cost;
		        grid_itens[# Infos.typeWeapon, pos_select] = _wep;
                        
		        item_select = -1;
		        pos_select = -1;
		        equip_select = -1;

				}
			 }

			}else {	
			 if armor_select == -1{
				armor_select =  grid_equip[# Infos.item, i];
				posarmor_select = i;
			} 
		 }			
    }
}
 

    if grid_equip[# Infos.item, i] != -1 {

        var _sprite = grid_equip[# Infos.sprite, i];
        draw_sprite_ext(_sprite, grid_equip[# 0, i], _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
    }

    eqy++; // adiciona os slots horizontalmente

  
}
	
#endregion


#region -------------------------------------- Potion and rings SLOTS -------------------------------------------
    var eqx = 0; // variaveis que guardam o tracking
	
	for (var i = 0; i < total_pots; i++) {  //i igual a 0 , enquanto i for menor que total slots acrescenta mais 1	
	
	
	var _equipslotx = _invx + x_pots + ((size_slots + buffer ) * eqx);  // soma o inicio do slot com o comprimento e multiplica pelo numero de slots para começar o proximo slot 
	var _equipsloty = _invy + y_pots;
	
		if point_in_rectangle(_mx, _my, _equipslotx, _equipsloty, _equipslotx + size_slots, _equipsloty + size_slots) {
    
			draw_sprite_ext(spr_inventario_seletor, 0, _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
			

			draw_info_inventory(grid_potions[# Infos.item, i ],grid_potions[# Infos.name, i ], grid_potions[# Infos.discription, i ], grid_potions[# Infos.sprite, i ], grid_potions[# Infos.coin, i ], grid_potions[# Infos.cost, i ], 1);


		 if mouse_check_button_pressed(mb_left) {
		 if item_select != -1 {
  

            if equip_select == 1 and grid_potions[# Infos.item,i] = -1 {
				var itemType = grid_itens[# Infos.typeWeapon, pos_select];
				
               if ((i == 0 && itemType == 80) || (i == 1 && itemType == 70)){
	                grid_potions[# Infos.item, i] = grid_itens[# Infos.item, pos_select];
	                grid_potions[# Infos.quantity, i] = grid_itens[# Infos.quantity, pos_select];
	                grid_potions[# Infos.sprite, i] = grid_itens[# Infos.sprite, pos_select];
	                grid_potions[# Infos.name, i] = grid_itens[# Infos.name, pos_select];
	                grid_potions[# Infos.discription, i] = grid_itens[# Infos.discription, pos_select];
	                grid_potions[# Infos.equipable, i] = grid_itens[# Infos.equipable, pos_select];
	                grid_potions[# Infos.coin, i] = grid_itens[# Infos.coin, pos_select];
	                grid_potions[# Infos.cost, i] = grid_itens[# Infos.cost, pos_select];
					grid_potions[# Infos.typeWeapon, i] = grid_itens[# Infos.typeWeapon, pos_select];

	                grid_itens[# Infos.item, pos_select] = -1;
	                grid_itens[# Infos.quantity, pos_select] = -1;
	                grid_itens[# Infos.sprite, pos_select] = -1;
	                grid_itens[# Infos.name, pos_select] = -1;
	                grid_itens[# Infos.discription, pos_select] = -1;
	                grid_itens[# Infos.coin, pos_select] = -1;
	                grid_itens[# Infos.cost, pos_select] = -1;
				    grid_itens[# Infos.typeWeapon, pos_select] = -1;

	                item_select = -1;
	                pos_select = -1;
	                equip_select = -1;
				} 	
			}else if equip_select == 1 and grid_itens[# Infos.item, pos_select] != grid_potions[# Infos.item,i]   {    
			 var itemType = grid_itens[# Infos.typeWeapon, pos_select];
    
		    if ((i == 0 && itemType == 80) || (i == 1 && itemType == 70)) {
		        var _item = grid_potions[# Infos.item, i];
		        var _quantity = grid_potions[# Infos.quantity, i];
		        var _spr = grid_potions[# Infos.sprite, i];
		        var _name = grid_potions[# Infos.name, i];
		        var _info = grid_potions[# Infos.discription, i];
		        var _equip =  grid_potions[# Infos.equipable, i];
		        var _coin = grid_potions[# Infos.coin, i];
		        var _cost = grid_potions[# Infos.cost, i];
		        var _wep = grid_potions[# Infos.typeWeapon, i]; 
                            
		        grid_potions[# Infos.item, i] = grid_itens [# Infos.item, pos_select];
		        grid_potions[# Infos.quantity, i] = grid_itens[# Infos.quantity, pos_select];
		        grid_potions[# Infos.sprite, i] = grid_itens[# Infos.sprite, pos_select];
		        grid_potions[# Infos.name, i] = grid_itens[# Infos.name, pos_select];
		        grid_potions[# Infos.discription, i] = grid_itens[# Infos.discription, pos_select];
		        grid_potions[# Infos.equipable, i] = grid_itens[# Infos.equipable, pos_select];
		        grid_potions[# Infos.coin, i] = grid_itens[# Infos.coin, pos_select];
		        grid_potions[# Infos.cost, i] = grid_itens[# Infos.cost, pos_select];
		        grid_potions[# Infos.typeWeapon, i] = grid_itens[# Infos.typeWeapon, pos_select];
                   
		        grid_itens[# Infos.item, pos_select] =  _item;
		        grid_itens[# Infos.quantity, pos_select] = _quantity;
		        grid_itens[# Infos.sprite, pos_select] = _spr;
		        grid_itens[# Infos.name, pos_select] = _name;
		        grid_itens[# Infos.discription, pos_select] = _info;
		        grid_itens[# Infos.equipable, pos_select] = _equip;
		        grid_itens[# Infos.coin, pos_select] = _coin;
		        grid_itens[# Infos.cost, pos_select] = _cost;
		        grid_itens[# Infos.typeWeapon, pos_select] = _wep;
                        
		        item_select = -1;
		        pos_select = -1;
		        equip_select = -1;

				}
			 }
 } else {	
			 if potion_select == -1{
				potion_select =  grid_potions[# Infos.item, i];
				pospotion_select = i;
				} 
			 }			
    }
}

var  _sprite = grid_potions[# Infos.sprite, i]; //checar se tem item no slot

	if grid_potions[# Infos.item, i] != -1{	//desenho dos itens (chega se o valor do inventario for diferente de 1)
		
		draw_sprite_ext(_sprite, grid_potions[# 0, i], _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
		
			//quantidade dos itens
			draw_set_alpha(1);
			draw_set_font(Font1);
			draw_set_halign(fa_center);
			draw_text_colour_outline(_equipslotx, _equipsloty, grid_potions[# Infos.quantity, i], 4, c_black, 16, 100, 100);
			} 
			
			 if i == 0 {	
				 draw_text_colour_outline(_equipslotx + size_slots + 7  ,_equipsloty + size_slots-20 , 1 , 4, c_red,16,100,100)
				 } else {
				  draw_text_colour_outline(_equipslotx + size_slots + 8  ,_equipsloty + size_slots-20 , 2 , 4, c_red,16,100,100)
				 }

		eqx ++;  // adiciona os slots horizontalmente
	
}
#endregion


#region -------------------------------------- Weapon  Slots ----------------------------------------------------
   var eqx = 0; // variaveis que guardam o tracking
 
   for (var i = 0; i < total_wepS; i++) {  //i igual a 0 , enquanto i for menor que total slots acrescenta mais 1	
	

	var _equipslotx = _invx + x_weps + ((size_slots + buffer ) * eqx);  // soma o inicio do slot com o comprimento e multiplica pelo numero de slots para começar o proximo slot 
	var _equipsloty = _invy + y_weps;
	
		if point_in_rectangle(_mx, _my, _equipslotx, _equipsloty, _equipslotx + size_slots, _equipsloty + size_slots) {
    
	draw_sprite_ext(spr_inventario_seletor, 0, _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);

	draw_info_inventory(grid_weapon[# Infos.item,i], grid_weapon[# Infos.name,i],grid_weapon[# Infos.discription,i], grid_weapon[# Infos.sprite,i],grid_weapon[# Infos.coin,i], grid_weapon[# Infos.cost,i],1)
	
#region --------------------------------------- Checking SLOTS AND Tranfering items ------------------------------
	 if mouse_check_button_pressed(mb_left) {
		 if item_select != -1 {
  
#region --------------------------------------- Inventory - to  - weapon ----------------------------------------- 
            if equip_select == 1 and grid_weapon[# Infos.item,i] = -1 and quantity_select = 1 {
				var itemType = grid_itens[# Infos.typeWeapon, pos_select];
				
               if ((i == 0 && itemType == 10) || (i == 1 &&  (itemType >= 20 &&  itemType <= 25))){
				   
	                grid_weapon[# Infos.item, i] = grid_itens[# Infos.item, pos_select];
	                grid_weapon[# Infos.quantity, i] = grid_itens[# Infos.quantity, pos_select];
	                grid_weapon[# Infos.sprite, i] = grid_itens[# Infos.sprite, pos_select];
	                grid_weapon[# Infos.name, i] = grid_itens[# Infos.name, pos_select];
	                grid_weapon[# Infos.discription, i] = grid_itens[# Infos.discription, pos_select];
	                grid_weapon[# Infos.equipable, i] = grid_itens[# Infos.equipable, pos_select];
	                grid_weapon[# Infos.coin, i] = grid_itens[# Infos.coin, pos_select];
	                grid_weapon[# Infos.cost, i] = grid_itens[# Infos.cost, pos_select];
					grid_weapon[# Infos.typeWeapon, i] = grid_itens[# Infos.typeWeapon, pos_select];

	                grid_itens[# Infos.item, pos_select] = -1;
	                grid_itens[# Infos.quantity, pos_select] = -1;
	                grid_itens[# Infos.sprite, pos_select] = -1;
	                grid_itens[# Infos.name, pos_select] = -1;
	                grid_itens[# Infos.discription, pos_select] = -1;
	                grid_itens[# Infos.coin, pos_select] = -1;
	                grid_itens[# Infos.cost, pos_select] = -1;
				    grid_itens[# Infos.typeWeapon, pos_select] = -1;

	                item_select = -1;
	                pos_select = -1;
	                equip_select = -1;
					
			} 
#endregion

#region ------------------------------------ Inventory - to - occuped weapon inventory --------------------------
         }else if equip_select == 1 and grid_itens[# Infos.item, pos_select] != grid_weapon[# Infos.item,i] and quantity_select = 1  {    
			 var itemType = grid_itens[# Infos.typeWeapon, pos_select];
    
		    if ((i == 0 && itemType == 10) || (i == 1 && (itemType >= 20 &&  itemType <= 25))) {
		        var _item = grid_weapon[# Infos.item, i];
		        var _quantity = grid_weapon[# Infos.quantity, i];
		        var _spr = grid_weapon[# Infos.sprite, i];
		        var _name = grid_weapon[# Infos.name, i];
		        var _info = grid_weapon[# Infos.discription, i];
		        var _equip =  grid_weapon[# Infos.equipable, i];
		        var _coin = grid_weapon[# Infos.coin, i];
		        var _cost = grid_weapon[# Infos.cost, i];
		        var _wep = grid_weapon[# Infos.typeWeapon, i]; 
                            
		        grid_weapon[# Infos.item, i] = grid_itens [# Infos.item, pos_select];
		        grid_weapon[# Infos.quantity, i] = grid_itens[# Infos.quantity, pos_select];
		        grid_weapon[# Infos.sprite, i] = grid_itens[# Infos.sprite, pos_select];
		        grid_weapon[# Infos.name, i] = grid_itens[# Infos.name, pos_select];
		        grid_weapon[# Infos.discription, i] = grid_itens[# Infos.discription, pos_select];
		        grid_weapon[# Infos.equipable, i] = grid_itens[# Infos.equipable, pos_select];
		        grid_weapon[# Infos.coin, i] = grid_itens[# Infos.coin, pos_select];
		        grid_weapon[# Infos.cost, i] = grid_itens[# Infos.cost, pos_select];
		        grid_weapon[# Infos.typeWeapon, i] = grid_itens[# Infos.typeWeapon, pos_select];
                   
		        grid_itens[# Infos.item, pos_select] =  _item;
		        grid_itens[# Infos.quantity, pos_select] = _quantity;
		        grid_itens[# Infos.sprite, pos_select] = _spr;
		        grid_itens[# Infos.name, pos_select] = _name;
		        grid_itens[# Infos.discription, pos_select] = _info;
		        grid_itens[# Infos.equipable, pos_select] = _equip;
		        grid_itens[# Infos.coin, pos_select] = _coin;
		        grid_itens[# Infos.cost, pos_select] = _cost;
		        grid_itens[# Infos.typeWeapon, pos_select] = _wep;
                        
		        item_select = -1;
		        pos_select = -1;
		        equip_select = -1;

				}
			 }
		 }
		 #endregion
		 else {	
			 if weapon_select == -1{
				weapon_select =  grid_weapon[# Infos.item, i];
				posWeapon_select = i;
				} 
			 }			
    }
}
#endregion

   if grid_weapon[# Infos.item, i] != -1 {

        var _sprite = grid_weapon[# Infos.sprite, i];
        draw_sprite_ext(_sprite, grid_weapon[# 0, i], _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
    }

		eqx ++;  // adiciona os slots horizontalmente
		
	
}
	if weapon_select != -1 {	
			draw_sprite_ext(grid_weapon[# Infos.sprite, posWeapon_select], weapon_select, _mx, _my, global.escala, global.escala, 0, c_white, 1);
			}


#endregion

#region -------------------------------------- PET SLOTS --------------------------------------------------------
var petx = 0;

for (var i = 0; i < total_petS; i++) {
    var petslotX = _invx + x_pets + ((size_slots + buffer_pet) * petx);
    var petslotY = _invy + y_pets;
    
    if point_in_rectangle(_mx, _my, petslotX, petslotY, petslotX + size_slots, petslotY + size_slots) {
        draw_sprite_ext(spr_inventario_seletor, 0, petslotX, petslotY, global.escala, global.escala, 0, c_white, 1);
 draw_info_inventory(grid_pet[# pet_info.item,i],grid_pet[# pet_info.name,i],grid_pet[# pet_info.description,i],grid_pet[# pet_info.sprite, i], 0, 0,29)
   
	   
        if mouse_check_button_pressed(mb_left) {
            if item_select != -1 {
                // Você pode adicionar lógica aqui caso haja um item selecionado anteriormente
            } else { // Não tem item selecionado
                if (pet_select == -1) {
                    pet_select = grid_pet[#pet_info.item, i];
                    pospet_select = i;
                }
            }
        }
    }
    
    if (grid_pet[# pet_info.item, i] != -1) {
        var _sprite = grid_pet[# pet_info.sprite, i];
        draw_sprite_ext(_sprite, grid_pet[#0, i], petslotX, petslotY, global.escala / 29, global.escala / 29, 0, c_white, 1);
    }
    
    petx++;
}


var activeslotx = _invx + x_active;
var activesloty = _invy + y_active;


var activelloop = 0;
for (var i = 0; activelloop < total_active; i++) {
    // código aqui
	
    if (point_in_rectangle(_mx, _my, activeslotx, activesloty, activeslotx + size_activex, activesloty + size_activey)) {
        draw_sprite_ext(spr_inventario_seletor_active, 0, activeslotx, activesloty, global.escala, global.escala, 0, c_white, 1);
		
#region  // ---------------------- Discription PRESS "O"   --------------------------------------------------------
// desenhar a sprite do item na aba de descrição

if grid_active[# pet_info.item, i] != -1 and ShowingDespription == true {
    var c = c_white;

    Sequence = draw_sprite_ext(spr_inventory_description, 0, 955, 120, global.escala, global.escala, 0, c, 1);

    draw_set_font(Font1);
    draw_set_halign(fa_middle);
    draw_text(1080, 150, grid_active[# pet_info.name, i]);
    draw_text_ext_color(1100, 210, grid_active[# pet_info.description, i], string_height("M"), 55 * global.escala, c, c, c, c, 1);

		switch (grid_active[# pet_info.item, i]){
			case 0:
			draw_sprite_ext(spr_pet_inventory ,image_index, 970, 200 , global.escala, global.escala, 0, c_white, 1);
			
			break;
			
			case 1 :
			draw_sprite_ext(spr_petpurple_inventory ,image_index, 970, 200, global.escala, global.escala, 0, c_white, 1);
			
			break;
		
		}
 
} else if inventory == false {
    ShowingDespription = false
}
#endregion	   
if mouse_check_button_pressed(mb_left){
        if grid_active[# pet_info.item, i] == -1 and pet_select != -1  {
            grid_active[# pet_info.item, i] = grid_pet[# pet_info.item, pospet_select];
            grid_active[# pet_info.sprite, i] = grid_pet[# pet_info.sprite, pospet_select];
            grid_active[# pet_info.name, i] = grid_pet[# pet_info.name, pospet_select];
            grid_active[# pet_info.description, i] = grid_pet[# pet_info.description, pospet_select];
            grid_active[# pet_info.damage, i] = grid_pet[# pet_info.damage, pospet_select];
            grid_active[# pet_info.class, i] = grid_pet[# pet_info.class, pospet_select];

            grid_pet[# pet_info.item, pospet_select] = -1;           
            grid_pet[# pet_info.sprite, pospet_select] = -1;
            grid_pet[# pet_info.name, pospet_select] = -1;
            grid_pet[# pet_info.description, pospet_select] = -1;
            grid_pet[# pet_info.damage, pospet_select] = -1;
            grid_pet[# pet_info.class, pospet_select] = -1;

            pet_select = -1;
            pospet_select = -1;
			
        }else if grid_active[# pet_info.item, i] != -1 and pet_select != -1 and grid_pet[# pet_info.item, pospet_select] != grid_active[# pet_info.item,i] {    
			 

		    var _item = grid_active[# pet_info.item, i]
            var _spr = grid_active[# pet_info.sprite, i]
            var _name = grid_active[# pet_info.name, i] 
            var _info = grid_active[# pet_info.description, i] 
            var _damage = grid_active[# pet_info.damage, i]
            var _class = grid_active[# pet_info.class, i]
		
                            
		        grid_active[# pet_info.item, i] = grid_pet [# pet_info.item, pospet_select];
		        grid_active[# pet_info.sprite, i] = grid_pet[# pet_info.sprite, pospet_select];
		        grid_active[# pet_info.name, i] = grid_pet[# pet_info.name, pospet_select];
		        grid_active[# pet_info.description, i] = grid_pet[# pet_info.description, pospet_select];
		        grid_active[# pet_info.damage, i] = grid_pet[# pet_info.damage, pospet_select];
                   
		        grid_pet[# pet_info.item, pospet_select] =  _item;
		        grid_pet[# pet_info.sprite, pospet_select] = _spr;
		        grid_pet[# pet_info.name, pospet_select] = _name;
		        grid_pet[# pet_info.description, pospet_select] = _info;
				grid_pet[# pet_info.damage, pospet_select] = _damage;
				grid_pet[# pet_info.class, pospet_select] = _class;
		
                        
		        pet_select = -1;
		        pospet_select = -1;
		        

		}
		if item_select != -1  {	
					var _item = grid_itens[# Infos.item, pos_select];
	                var _quantity = grid_itens[# Infos.quantity, pos_select];
	                var _sprite = grid_itens[# Infos.sprite, pos_select];
	                var _name = grid_itens[# Infos.name, pos_select];
	                var _desc = grid_itens[# Infos.discription, pos_select];
	                var _equip = grid_itens[# Infos.equipable, pos_select];
	                var _coin = grid_itens[# Infos.coin, pos_select];
	                var _cost = grid_itens[# Infos.cost, pos_select];
					var _weapon = grid_itens[# Infos.typeWeapon, pos_select];

					ds_grid_add_itemPET(_item,_quantity,_sprite,_name,_desc,_equip,_coin,_cost,_weapon);
					if !petInvFull {
	                grid_itens[# Infos.item, pos_select] = -1;
	                grid_itens[# Infos.quantity, pos_select] = -1;
	                grid_itens[# Infos.sprite, pos_select] = -1;
	                grid_itens[# Infos.name, pos_select] = -1;
	                grid_itens[# Infos.discription, pos_select] = -1;
	                grid_itens[# Infos.coin, pos_select] = -1;
	                grid_itens[# Infos.cost, pos_select] = -1;
				    grid_itens[# Infos.typeWeapon, pos_select] = -1;

	                item_select = -1;
	                pos_select = -1;
					}
	                
			}
}
    }

   
		switch (grid_active[# pet_info.item, i]){
			case 0:
			draw_sprite_ext(spr_pet_inventory ,image_index,  activeslotx +25, activesloty  - 10 , global.escala, global.escala, 0, c_white, 1);
			
			break;
			
			case 1 :
			draw_sprite_ext(spr_petpurple_inventory ,image_index,  activeslotx +25 , activesloty -10  , global.escala, global.escala, 0, c_white, 1);
			
			break;
		
		}
    
    
    activelloop++;
}






#endregion

// ////////////////////////////////////////// Status ands inventory draws ///////////////////////////////////////


#region  // ------------- status wallet ------- //status player ------- // Pet status  --------------------------



var str_vida = string(obj_Player.vida);
var str_max_vida = string(obj_Player.max_vida);
var text_life = str_vida + " / " + str_max_vida;
draw_set_alpha(1);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_text_colour_outline(x - 30, y + 470, text_life, 2, c_black, 23, 50, 100);

//stamina player
var str_stamina = string(obj_Player.estamina);
var str_max_stamina = string(obj_Player.max_stamina);
var texto = str_stamina + " / " + str_max_stamina;

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_text_colour_outline(x - 30, y + 515, texto, 2, c_black, 23, 50, 100);
draw_text_colour_outline(x - 30, y + 670, "Damage: " + string(obj_Player.damage), 2, c_black, 23, 50, 100);

#region //character animation
if (mouse_check_button_pressed(mb_left) && point_in_rectangle(_mx, _my, 415, 200, 540, 350)) {
  silly_animation = true;
}

if (silly_animation) {
  silly_count++;
  image_speed = 0.1;
  draw_sprite_ext(spr_personagem_sombra, 0, _invx + 150, _invy + 957, global.escala * 2, global.escala * 5, 0, c_white, 0.9);
  draw_sprite_ext(spr_personagem_atacando_baixo, image_index, _invx + 150, _invy + 240, global.escala * 2, global.escala * 2, 0, c_white, 1);
  if (silly_count >= 60) {
    silly_animation = false;
    silly_count = 0;
  }
} else {
  draw_sprite_ext(spr_personagem_sombra, 0, _invx + 150, _invy + 957, global.escala * 2, global.escala * 5, 0, c_white, 0.9);
  image_speed = 0.1;
  draw_sprite_ext(spr_personagem_parado_baixo, image_index, _invx + 150, _invy + 240, global.escala * 2, global.escala * 2, 0, c_white, 1);
}


#endregion



var _xp = obj_slime_pet.xp;
var _maxxp = obj_slime_pet.max_exp[obj_slime_pet.level];

draw_sprite_ext(spr_xp_pet, 0, 720, 578, (_xp/_maxxp) * global.escala, global.escala, 0 , c_white, 1);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_text_colour_outline(760, 590, string(obj_slime_pet.level), 2, c_black, 23, 50, 100);
draw_text_colour_outline(760, 625, string(obj_slime_pet.damage[obj_slime_pet.level]), 2, c_black, 23, 50, 100);
draw_text_colour_outline(900, 683, string(obj_slime_pet.transformation_time[obj_slime_pet.level]), 2, c_fuchsia, 23, 50, 100);
draw_text_colour_outline(760, 680, string(obj_slime_pet.armor_transformation[obj_slime_pet.level]), 2, c_fuchsia, 23, 50, 100);

//wallet draw

if point_in_rectangle(_mx, _my, _walletx + 400, _wallety - 170, _walletx + 540, _wallety - 100) {
	draw_sprite_ext(spr_wallet_hui, 1, _walletx + 472, _wallety - 142, global.escala * 0.5, global.escala * 0.5, 0, c_white, 1);
	
	var coin_index = 0;
	var yy_hieght = 0;
	var yy = 0;
	var coin_grid = ds_grid_coin;
	
		// coin value draw  ----- repeat 3 time grid 1 changing the height and sprites
	repeat (3) {	
		draw_sprite_ext(spr_coin_inventory, coin_index, _walletx + 510, _wallety - (109 + yy_hieght), global.escala * 0.6, global.escala * 0.6, 0, c_white, 1);
		draw_text_colour_outline(_walletx + 485, _wallety - (109 + yy_hieght), string(coin_grid[# 1, yy]), 2, c_black, 23, 50, 100);
		coin_index ++;
		yy_hieght += 35
		yy += 1;
		
		}
}
else {
	draw_sprite_ext(spr_wallet_hui, 0, _walletx + 472, _wallety - 142, global.escala * 0.5, global.escala * 0.5, 0, c_white, 1);
}

	
	#endregion
	


}



#region ////////////////////////////////////////////  Shop Sell and buy System ////////////////////////////////////////////////////////
if shopOpen {
	
//centralização  da sprite
var _guiL = display_get_gui_width();
var _guia = display_get_gui_height();
// mouse tracking
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
// scale global
var Scale = global.escala
// Position of the inventory box
var _invx = (_guiL / 1.5) - (inventoryBox_L / 2);
var _invy = (_guia / 1.3) - (inventoryBox_A / 2);
// colour font
var c = c_black;
var C = c_white

#region -------------------------------------------- Determine witch inventory is showing on shop ------------------------------------------------------
// Switches the player's inventory box with the pet's inventory box and vice versa.
if point_in_rectangle(_mx, _my, _invx + 10, _invy + 20, _invx + 50, _invy + 50) {
   
    if   mouse_check_button_pressed(mb_left)  {
		petbox = !petbox;
		audio_play_sound(turn_page,0,false);  
    } 
}
// Locks the variable. If 0, keeps the player's inventory; if 1, switches to the pet's inventory.
sprbox = petbox ? 1 : 0;

// draw the inventory dow player or pet
draw_sprite_ext(spr_box_inventory_sell, sprbox, _invx, _invy, Scale, Scale, 0, C, 1);
#endregion

 ///////////////////////////////////////////   Shop buy System  /////////////////////////////////////////////////////////////////////////////////

// variable of back of shop
var _backshopx = _guiL/2 - inventoryback_L/2 + 145; 
var _backshopy = _guia/2 - inventoryback_A/2 + 80;
// Variable that keeps track of the loop.
var backcardx = 0;
var backcardy = 0;
// draw the back
draw_sprite_ext(spr_back_shop, 0, _backshopx, _backshopy, Scale, Scale/1.9, 0, C, 1);
var totalcard = array_length(npc_keepes.npc_itens)
for (var i = 0; i < totalcard; i++) {
	//centralized sprite
	var _gridshop = npc_keepes.npc_select
    var _slotcardX = _backshopx + x_card + ((size_card_x + buffercardx) * backcardx);
    var _slotCardY = _backshopy + y_card + ((size_card_y + buffercardy) * backcardy);
	// Sprite index of the inventory box or pet inventory box
	var _spr_index = 0;
	// Sprite of the slot on the grid
	var _sprite = _gridshop[#Infos.sprite, i];
	// Quantity of items in the slot
	var _quantity = _gridshop[#Infos.quantity, i];
	// Index of the item in the slot
	var _item = _gridshop[# Infos.item,i];
	
    //Detects the mouse position over the card. And increases the scale.And Plots the data from the shop's grid
    if (!point_in_rectangle(_mx, _my, _slotcardX - x_card, _slotCardY - y_card, _slotcardX + size_card_x - x_card, _slotCardY + size_card_y - y_card)) {
       	 //same sprite only change the index in each iteration
	   repeat (3) {
            draw_sprite_ext(spr_sell_box, _spr_index, _slotcardX, _slotCardY, Scale, Scale, 0, C, 1);
            _spr_index += 1;
			  
        }
					draw_sprite_ext(_sprite, _gridshop[# 0, i], _slotcardX -25, _slotCardY - 37,Scale,Scale,0,C,1)
						draw_text_color(_slotcardX -25, _slotCardY - 37, _quantity,c,c,c,c,1)					
	    } else {
	        repeat (3) {
	            draw_sprite_ext(spr_sell_box, _spr_index, _slotcardX, _slotCardY, 3.5, 3.5, 0, C, 1);
	            _spr_index += 1;
		
	        }
						draw_sprite_ext(_sprite, _gridshop[# 0, i], _slotcardX -25, _slotCardY - 37,3.5,3.5,0,C,1)
							draw_text_color(_slotcardX -25, _slotCardY - 37, _quantity,c,c,c,c,1);
	    }
 
 // Detects the click with the card slot and stores the position of the item in the grid in variables.
    if (mouse_check_button_pressed(mb_left) and point_in_rectangle(_mx, _my, _slotcardX - x_card, _slotCardY - y_card, _slotcardX + size_card_x - x_card, _slotCardY + size_card_y - y_card)) {	 
		is_showing = true; // Show description of item card
		playerStoreChoice = _item; // Save item index card
	    selectedshopItem = i // save grid position of the item
    }

    backcardx++;
 // Stop creation of slots horizontly and begeins vertical
    if (backcardx >= cardsH) {
        backcardx = 0;
        backcardy++;
    }
}

// creation of description area of clicked card slot and buy item by player
if (is_showing) {
	// variable that's keep the valor of cell in the grid
var _desc_select = _gridshop[#Infos.discription,selectedshopItem];
var _cointype_select = _gridshop[# Infos.coin, selectedshopItem];
var _name_select = _gridshop[#Infos.name, selectedshopItem];
var _currency_select = _gridshop[#Infos.coin, selectedshopItem];
var _cost_select = _gridshop[#Infos.cost, selectedshopItem];
var _sprite_select = _gridshop[#Infos.sprite, selectedshopItem];
var _quantity_select = _gridshop[#Infos.quantity, selectedshopItem];
var _equippable_select = _gridshop[#Infos.equipable, selectedshopItem];
var _item_select = _gridshop[#Infos.item, selectedshopItem];
var _typeweapon_select = _gridshop[#Infos.typeWeapon, selectedshopItem];
	
	// draw card _select
    repeat (3) {
        draw_sprite_ext(spr_sell_box, _spr_index, _backshopx + 700, _backshopy + 150, 4, 4, 0, C, 1);
        _spr_index += 1;
    }
	// draw button buy
    draw_sprite_ext(spr_buyButton, _spr_index, _backshopx + 657, _backshopy + 200, 4, 4, 0, C, 1);
	// draw_item select sprite
	 draw_sprite_ext(_sprite_select, playerStoreChoice, _backshopx + 668, _backshopy + 102, 4, 4, 0, C, 1);
		// draw item_select_cost
		draw_text_color( _backshopx + 695, _backshopy + 400 , _cost_select , c, c, c, c, 1);
			draw_set_color(c);
				// draw name and description card
				draw_text_ext(_backshopx + 690, _backshopy + 300, _desc_select,string_height("M"), 200);
					draw_text_ext(_backshopx + 700, _backshopy +40 ,_name_select,1,180)
					draw_set_color(-1);
	
	// draw type of coin
	switch (_cointype_select) {
        case 1:
            draw_sprite_ext(spr_coin_inventory, 0, _backshopx + 700, _backshopy + 400, 2, 2, 0, C, 1);
            break;
        case 2:
            draw_sprite_ext(spr_coin_inventory, 1, _backshopx + 700, _backshopy + 400,2, 2, 0, C, 1);
            break;
        case 3:
            draw_sprite_ext(spr_coin_inventory, 2, _backshopx + 700, _backshopy + 400, 2, 2, 0, C, 1);
            break;
    }
	
// button buy click
 if mouse_check_button_pressed(mb_left) &&
   point_in_rectangle(_mx, _my, _backshopx + 657, _backshopy + 200, _backshopx + 740, _backshopy + 250) && _quantity_select > 0{
    var canPurchase = false;
  
  // Deducts the item cost from the player's money based on the required currency and if the player has enough money.
    switch (_currency_select) {
        case 1:
            if global.coin >= _cost_select {
                global.coin -= _cost_select;
                canPurchase = true;
            }
            break;
        case 2:
            if global.silver >= _cost_select {
                global.silver -= _cost_select;
                canPurchase = true;
            }
            break;
    }
  
  // add purchaded item to the grid of player inventory
    if canPurchase {
        audio_play_sound(_1_Coins, 0, false);
        ds_grid_add_item(_item_select,
		1,
		_sprite_select,
		_name_select,
		_desc_select,
		_equippable_select,
		_currency_select,
		_cost_select,
		_typeweapon_select
		);
		//Subtracts the total quantity of items in the shop by the number of clicks
        _gridshop[#Infos.quantity, selectedshopItem] -= 1;
    }
}

 } 
	



if sprbox == 0{
	var ix = 0; // variaveis que guardam o tracking
	var iy = 0;

// Desenha todos os itens e verifica se o mouse está sobre o slot
for (var i = 0; i < total_slotBox; i++) {
	
    var _sprite = grid_itens[# Infos.sprite, i]; // Checa se há um item no slot
	var _name = grid_itens[# Infos.name, i];
	var _equip = grid_itens[# Infos.equipable, i];
	var _desc = grid_itens[# Infos.discription,i];
	var _cost = grid_itens[# Infos.cost,i];

    var _slotBoxX = _invx + x_Boxinventory + ((size_slotsBox + bufferBox) * ix);
    var _slotBoxY = _invy + y_Boxinventory + ((size_slotsBox + bufferBox) * iy);
	

    // Desenha a sprite do item
    if (grid_itens[# Infos.item, i] != -1) {
        draw_sprite_ext(_sprite, grid_itens[# 0, i], _slotBoxX, _slotBoxY, global.escala, global.escala, 0, c_white, 1);
      
        // Quantidade dos itens
        draw_set_alpha(1);
        draw_set_font(Font1);
        draw_set_halign(fa_center);
        draw_text_colour_outline(_slotBoxX + size_slotsBox, _slotBoxY + size_slotsBox, grid_itens[# Infos.quantity, i], 4, c_black, 16, 100, 100);
    

    // Verifica se o mouse está sobre o slot
    if (point_in_rectangle(_mx, _my, _slotBoxX, _slotBoxY, _slotBoxX + size_slotsBox, _slotBoxY + size_slotsBox))  {
        // Desenha o sprite do descritor
		
		draw_sprite_ext(spr_seletor_20x20, 0, _slotBoxX - 15, _slotBoxY - 10, global.escala, global.escala, 0, c_white, 1);
		
        draw_sprite_ext(spr_descriptor, 0,  _slotBoxX + (_slotBoxX - _mx) - 40, _slotBoxY + (_slotBoxY - _my), global.escala, global.escala, 0, c_white, 1);
		draw_set_color(c);
			draw_set_halign(fa_center);
				 draw_text_ext(_slotBoxX + (_slotBoxX - _mx) + 70, _slotBoxY + (_slotBoxY - _my) - 200, _name,1, 180);
					   draw_set_halign(fa_middle);
							draw_set_font(Font_shopdesc);
								draw_set_color(c);
									draw_text_ext(_slotBoxX + (_slotBoxX - _mx) + 65, _slotBoxY + (_slotBoxY - _my) - 120, _desc,string_height("M"), 200);
						draw_set_font(-1);
					draw_set_halign(fa_left);
				draw_set_color(-1);
	if _equip == 1{
		
		 draw_set_color(c_green);
			draw_text_ext(_slotBoxX + (_slotBoxX - _mx) -30 , _slotBoxY + (_slotBoxY - _my) - 165, "Equipable", 1, 180);
		 draw_set_color(-1);
	 }else {
		 
		draw_set_color(c_red);
			 draw_text_ext(_slotBoxX + (_slotBoxX - _mx) -30, _slotBoxY + (_slotBoxY - _my) - 165, "Unequipable", 1, 180);			  			
		draw_set_color(-1);
	 }
	if (grid_itens[# Infos.cost, i] != 0) {
    var coinType = grid_itens[# Infos.coin, i]; // Obtém o valor do coin type do item

    switch (coinType) {
        case 1:
            draw_sprite_ext(spr_coin_inventory, 0, _slotBoxX + (_slotBoxX - _mx) + 130, _slotBoxY + (_slotBoxY - _my) - 50, global.escala * 0.6, global.escala * 0.6, 0, C, 1);
            break;
        case 2:
            draw_sprite_ext(spr_coin_inventory, 1, _slotBoxX + (_slotBoxX - _mx) + 130, _slotBoxY + (_slotBoxY - _my) - 50, global.escala * 0.6, global.escala * 0.6, 0, C, 1);
            break;
        case 3:
            draw_sprite_ext(spr_coin_inventory, 2, _slotBoxX + (_slotBoxX - _mx) + 130, _slotBoxY + (_slotBoxY - _my) - 50, global.escala * 0.6, global.escala * 0.6, 0, C, 1);
            break;
    }

    draw_text_colour_outline(_slotBoxX + (_slotBoxX - _mx) + 120, _slotBoxY + (_slotBoxY - _my) - 45, grid_itens[# Infos.cost, i], 2, c, 23, 50, 100);
	
}

if (mouse_check_button_pressed(mb_right)) {
    var _cost = grid_itens[# Infos.cost, i];
    var coinType = grid_itens[# Infos.coin, i];
    var quantity = grid_itens[# Infos.quantity, i];
    
    if (quantity == 1) { 
        if (coinType == 1) {	
            global.coin += _cost;

        } else if (coinType == 2) {	
            global.silver += _cost;
	
        }
        
 
    } else {	
        if (coinType == 1 && !keyboard_check(vk_shift)) {
            global.coin += _cost;
            grid_itens[# Infos.quantity, i] -= 1;
        } else if (coinType == 2 && !keyboard_check(vk_shift)) {
            global.silver += _cost;
            grid_itens[# Infos.quantity, i] -= 1;
        } else {
            if (coinType == 1) {
                global.coin += _cost * quantity;
				 grid_itens[# Infos.quantity, i] = -1;
            } else if (coinType == 2) {
                global.silver += _cost * quantity;
				 grid_itens[# Infos.quantity, i] = -1;
            }
            
        
        }
    }
    if (grid_itens[# Infos.quantity, i] <= 1)  {	
		grid_itens[# Infos.item, i] = -1;
        grid_itens[# Infos.sprite, i] = -1;
        grid_itens[# Infos.name, i] = -1;
        grid_itens[# Infos.equipable, i] = -1;
        grid_itens[# Infos.discription, i] = -1;
        grid_itens[# Infos.cost, i] = -1;
        grid_itens[# Infos.coin, i] = -1;
        grid_itens[# Infos.quantity, i] = -1;
        grid_itens[# Infos.typeWeapon, i] = -1;
		}
    audio_play_sound(_1_Coins, 0, false);
}


}


 }

    ix++;
    if (ix >= slotboxX) {
        ix = 0;
        iy++;
        if (iy >= slotBoxY) {
            break; // Sai do loop quando atingir o número máximo de linhas de slots
        }

	}
}


	}	
	

}	
	
#endregion


#region - ///////////////////////////////////////////// PET INVENTORY SYSTEM OUT OF PLAYER INVENTORY and craft system ///////////////////////
if petinventory {
if mouse_check_button_pressed(mb_right){
	mb_pet_select = -1;
	mb_pet_posselect = -1;
	mb_craft_quant = -1;
	mb_craft_select = -1;
	mb_craft_posselect = -1;
	mb_craft_quant = -1;
				}
	
	var _invx =  _guiL/2 - petbelly_L/2;  
	var _invy = _guia/2 - petbelly_A/2;
	
	draw_set_alpha(0.7)
	draw_rectangle_color(_guiL, _guia, -_guiL, - _guia, c,c,c,c, false);

	draw_set_alpha(1);
	draw_sprite_ext(spr_inventory_belly, 0, _invx, _invy, _scala, _scala, 0 , C, 1);
	
	var ix = 0; 
	var iy = 0;
	for (var i = 0; i < pettotal_slots; i++) {  
	 
	var _slotsx = _invx + x_petinv + ((size_petslots + petbuffer) * ix);  
	var _slotsy = _invy + y_petinv + ((size_petslots + petbuffer) * iy);
	
	var _itemEmpty = grid_petiInv[# Infos.item, i]; 
	var _sprPet = grid_petiInv[# Infos.sprite, i];
	var _quantPet = grid_petiInv[# Infos.quantity, i];
	var _descPet = grid_petiInv[# Infos.discription,i];
	var _namePet = grid_petiInv[# Infos.name, i];
	var _equip = grid_petiInv[# Infos.equipable, i];
	var _cost = grid_petiInv[# Infos.cost, i];
	
	
    if (_itemEmpty != -1) {
        draw_sprite_ext(_sprPet, grid_petiInv[# 0, i], _slotsx, _slotsy, _scala, _scala, 0,C, 1);
		
        // Quantidade dos itens
        draw_set_alpha(1);
        draw_set_font(Font1);
        draw_set_halign(fa_center);
        draw_text_colour_outline(_slotsx + size_petslots -15,  _slotsy + size_petslots -30, _quantPet, 4, c, 16, 100, 100);
	}
		
		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + size_petslots, _slotsy + size_petslots) {
			draw_sprite_ext(spr_seletor_20x20, 0, _slotsx - 15, _slotsy - 10, _scala, _scala, 0, C, 1);
			
			draw_sprite_ext(spr_descriptor, 0,  _slotsx + (_slotsx - _mx) - 40, _slotsy + (_slotsy - _my), _scala, _scala, 0, C, 1);
			draw_set_color(c);
				draw_set_halign(fa_center);
					 draw_text_ext(_slotsx + (_slotsx - _mx) + 70, _slotsy + (_slotsy - _my) - 200, _namePet,1, 180);
						   draw_set_halign(fa_middle);
								draw_set_font(Font_shopdesc);
									draw_set_color(c);
										draw_text_ext(_slotsx + (_slotsx - _mx) + 65, _slotsy + (_slotsy - _my) - 120, _descPet, string_height("M"), 200);
							draw_set_font(-1);
						draw_set_halign(fa_left);
					draw_set_color(-1);
			 if _equip == 1{
		
			 draw_set_color(c_green);
				draw_text_ext(_slotsx + (_slotsx - _mx) -30 , _slotsy + (_slotsy - _my) - 165, "Equipable", 1, 180);
			 draw_set_color(-1);
			 }else {
		 
			draw_set_color(c_red);
				 draw_text_ext(_slotsx + (_slotsx - _mx) -30, _slotsy + (_slotsy - _my) - 165, "Unequipable", 1, 180);			  			
			draw_set_color(-1);
			 }
	 
			if (grid_petiInv[# Infos.cost, i] != 0) {
		    var coinType = grid_petiInv[# Infos.coin, i]; // Obtém o valor do coin type do item

		    switch (coinType) {
		        case 1:
		            draw_sprite_ext(spr_coin_inventory, 0, _slotsx + (_slotsx - _mx) + 130, _slotsy + (_slotsy - _my) - 50, _scala * 0.6, _scala * 0.6, 0, C, 1);
		            break;
		        case 2:
		            draw_sprite_ext(spr_coin_inventory, 1, _slotsx + (_slotsx - _mx) + 130, _slotsy + (_slotsy - _my) - 50, _scala * 0.6, _scala * 0.6, 0, C, 1);
		            break;
		        case 3:
		            draw_sprite_ext(spr_coin_inventory, 2, _slotsx + (_slotsx - _mx) + 130, _slotsy + (_slotsy - _my) - 50, _scala * 0.6, _scala * 0.6, 0, C, 1);
		            break;
		    }

 draw_text_colour_outline(_slotsx + (_slotsx - _mx) + 120, _slotsy + (_slotsy - _my) - 45, _cost, 2, c, 23, 50, 100);
}
	
	if mouse_check_button_pressed(mb_left){
		if  mb_craft_select != -1 {
			 if _itemEmpty ==  -1 {

			         grid_petiInv[# Infos.item, i] = grid_craft[# Infos.item, mb_craft_posselect];
		             grid_petiInv[# Infos.quantity, i] = grid_craft[# Infos.quantity, mb_craft_posselect];
		             grid_petiInv[# Infos.sprite, i] = grid_craft[# Infos.sprite, mb_craft_posselect];
		             grid_petiInv[# Infos.name, i] = grid_craft[# Infos.name, mb_craft_posselect];
		             grid_petiInv[# Infos.discription, i] =grid_craft[# Infos.discription, mb_craft_posselect];
		             grid_petiInv[# Infos.equipable, i] = grid_craft[# Infos.equipable, mb_craft_posselect];
		             grid_petiInv[# Infos.coin,i] = grid_craft[# Infos.coin, mb_craft_posselect];
		             grid_petiInv[# Infos.cost, i] = grid_craft[# Infos.cost, mb_craft_posselect];
					 grid_petiInv[# Infos.typeWeapon, i] = grid_craft[# Infos.typeWeapon, mb_craft_posselect];

		             grid_craft[# Infos.item, mb_craft_posselect] = -1;
		             grid_craft[# Infos.quantity, mb_craft_posselect] = -1;
		             grid_craft[# Infos.sprite, mb_craft_posselect] = -1;
		             grid_craft[# Infos.name, mb_craft_posselect] = -1;
		             grid_craft[# Infos.discription, mb_craft_posselect] = -1;
		             grid_craft[# Infos.coin, mb_craft_posselect] = -1;
		             grid_craft[# Infos.cost, mb_craft_posselect] = -1;
					 grid_craft[# Infos.typeWeapon, mb_craft_posselect] = -1;

		             mb_craft_select = -1;
		             mb_craft_posselect = -1;	
					 mb_craft_quant = -1;
		
		}
		if _itemEmpty != -1  {	
			
				    var _item = grid_petiInv[# Infos.item, i];
			        var _quantity = grid_petiInv[# Infos.quantity, i];
			        var _spr = grid_petiInv[# Infos.sprite, i];
			        var _name = grid_petiInv[# Infos.name, i];
			        var _info = grid_petiInv[# Infos.discription,i];
			        var _equip =  grid_petiInv[# Infos.equipable, i];
			        var _coin = grid_petiInv[# Infos.coin, i];
			        var _cost =grid_petiInv[# Infos.cost, i];
			        var _wep = grid_petiInv[# Infos.typeWeapon, i]; 
                            
			        grid_petiInv[# Infos.item, i] = grid_craft[# Infos.item, mb_craft_posselect];
			        grid_petiInv[# Infos.quantity,i] = grid_craft[# Infos.quantity, mb_craft_posselect];
			        grid_petiInv[# Infos.sprite, i] = grid_craft[# Infos.sprite, mb_craft_posselect];
			        grid_petiInv[# Infos.name, i] = grid_craft[# Infos.name, mb_craft_posselect];
			        grid_petiInv[# Infos.discription, i] = grid_craft[# Infos.discription,mb_craft_posselect];
			        grid_petiInv[# Infos.equipable, i] = grid_craft[# Infos.equipable, mb_craft_posselect];
			        grid_petiInv[# Infos.coin, i] = grid_craft[# Infos.coin, mb_craft_posselect];
			        grid_petiInv[# Infos.cost, i] = grid_craft[# Infos.cost, mb_craft_posselect];
			        grid_petiInv[# Infos.typeWeapon, i] = grid_craft[# Infos.typeWeapon, mb_craft_posselect];
                   
			        grid_craft[# Infos.item, mb_craft_posselect] =  _item;
			        grid_craft[# Infos.quantity,mb_craft_posselect] = _quantity;
			        grid_craft[# Infos.sprite, mb_craft_posselect] = _spr;
			        grid_craft[# Infos.name, mb_craft_posselect] = _name;
			        grid_craft[# Infos.discription, mb_craft_posselect] = _info;
			        grid_craft[# Infos.equipable, mb_craft_posselect] = _equip;
			        grid_craft[# Infos.coin, mb_craft_posselect] = _coin;
			        grid_craft[# Infos.cost, mb_craft_posselect] = _cost;
			        grid_craft[# Infos.typeWeapon, mb_craft_posselect] = _wep;
                        
			        mb_craft_select = -1;
			        mb_craft_posselect = -1;
					mb_craft_quant = -1;

			}
			
			}else {	
					
				mb_pet_select = _itemEmpty;
		        mb_pet_posselect = i;
				mb_pet_quant = _quantPet;
	
			}
	}
	
}

	ix ++;
	if ix >= petslots_h{	
		ix = 0;
		iy ++;
		}
	
	}
	
		if mb_pet_select != -1 and mb_craft_select == -1  {	
		    draw_sprite_ext(grid_petiInv[# Infos.sprite, mb_pet_posselect], mb_pet_select, _mx, _my, _scala, _scala, 0, C, 1);
			draw_set_alpha(1);
			draw_set_font(Font1);
			draw_set_halign(fa_center);			
			draw_text_colour_outline(_mx+10, _my+10 , mb_pet_quant, 4, c, 16, 100, 100);

		}  else if mb_craft_select != -1  {	
				draw_sprite_ext(grid_craft[# Infos.sprite, mb_craft_posselect], mb_craft_select, _mx, _my, _scala, _scala, 0, C, 1);
					draw_set_alpha(1);
					draw_set_font(Font1);
					draw_set_halign(fa_center);			
					draw_text_colour_outline(_mx+10, _my+10 , mb_craft_quant, 4, c, 16, 100, 100);
			}



var _craftx = _guiL / 2 - craft_L * 3.5;
var _crafty = _guia / 2 - craft_A / 2;

draw_sprite_ext(spr_craft, 0, _craftx, _crafty, _scala, _scala, 0, C, 1);

var cx = 0; // variáveis que guardam o tracking
var cy = 0;

for (var j = 0; j < total_craftSlot; j++) {
	
    var _cslotsx = _craftx + x_craft + ((size_craftslot + craftbuffer) * cx);
    var _cslotsy = _crafty + y_craft + ((size_craftslot + craftbuffer - 8) * cy);
	
	var _craft = grid_craft[#Infos.item ,j];
	var _sprcraft = grid_craft[#Infos.sprite,j];
	var _quantcraft = grid_craft[#Infos.quantity, j];
	var _name = grid_craft[#Infos.name, j];
	var _desc = grid_craft[#Infos.discription, j];
	var _equip = grid_craft[#Infos.equipable,j];
	var _cost = grid_craft[#Infos.cost,j];
	 var coinType = grid_craft[# Infos.coin, i];
	 
    if (point_in_rectangle(_mx, _my, _cslotsx, _cslotsy, _cslotsx + size_craftslot, _cslotsy + size_craftslot)) {
		if j == 2 {	

			draw_sprite_ext(spr_seletor_20x20, 0, _cslotsx + 10, _cslotsy - 6, _scala/2,_scala/2, 0 , C, 1);
			}else{
				
				 draw_sprite_ext(spr_seletor_20x20, 0, _cslotsx - 14, _cslotsy - 17, _scala, _scala, 0, C, 1);
			}
			
			
			
			draw_sprite_ext(spr_descriptor, 0,  _cslotsx + (_cslotsx - _mx) - 40, _cslotsy + (_cslotsy - _my), _scala, _scala, 0, C, 1);
			draw_set_color(c);
				draw_set_halign(fa_center);
					 draw_text_ext(_cslotsx + (_cslotsx - _mx) + 70, _cslotsy + (_cslotsy - _my) - 200, _name,1, 180);
						   draw_set_halign(fa_middle);
								draw_set_font(Font_shopdesc);
									draw_set_color(c);
										draw_text_ext(_cslotsx + (_cslotsx - _mx) + 65, _cslotsy + (_cslotsy - _my) - 120, _desc, string_height("M"), 200);
							draw_set_font(-1);
						draw_set_halign(fa_left);
					draw_set_color(-1);
			 if _equip == 1{
		
			 draw_set_color(c_green);
				draw_text_ext(_cslotsx + (_cslotsx - _mx), _cslotsy + (_cslotsy - _my) - 165, "Equipable", 1, 180);
			 draw_set_color(-1);
			 }else {
		 
			draw_set_color(c_red);
				 draw_text_ext(_cslotsx + (_cslotsx - _mx), _cslotsy + (_cslotsy - _my) - 165, "Unequipable", 1, 180);			  			
			draw_set_color(-1);
			 }
	
		if mouse_check_button_pressed(mb_left){
			if  mb_pet_select != -1 {
				if (j <= 1 and _craft = -1) || (j == 2 and grid_petiInv[# Infos.name, mb_pet_posselect] == "Slime Jelly"  and _craft = -1){	
				     grid_craft[# Infos.item, j] = grid_petiInv[# Infos.item, mb_pet_posselect];
		             grid_craft[# Infos.quantity, j] = grid_petiInv[# Infos.quantity, mb_pet_posselect];
		             grid_craft[# Infos.sprite, j] = grid_petiInv[# Infos.sprite, mb_pet_posselect];
		             grid_craft[# Infos.name, j] = grid_petiInv[# Infos.name, mb_pet_posselect];
		             grid_craft[# Infos.discription, j] =grid_petiInv[# Infos.discription, mb_pet_posselect];
		             grid_craft[# Infos.equipable, j] = grid_petiInv[# Infos.equipable, mb_pet_posselect];
		             grid_craft[# Infos.coin,j] = grid_petiInv[# Infos.coin, mb_pet_posselect];
		             grid_craft[# Infos.cost, j] = grid_petiInv[# Infos.cost, mb_pet_posselect];
					 grid_craft[# Infos.typeWeapon, j] = grid_petiInv[# Infos.typeWeapon, mb_pet_posselect];

		             grid_petiInv[# Infos.item, mb_pet_posselect] = -1;
		             grid_petiInv[# Infos.quantity, mb_pet_posselect] = -1;
		             grid_petiInv[# Infos.sprite, mb_pet_posselect] = -1;
		             grid_petiInv[# Infos.name, mb_pet_posselect] = -1;
		             grid_petiInv[# Infos.discription, mb_pet_posselect] = -1;
		             grid_petiInv[# Infos.coin, mb_pet_posselect] = -1;
		             grid_petiInv[# Infos.cost, mb_pet_posselect] = -1;
					 grid_petiInv[# Infos.typeWeapon, mb_pet_posselect] = -1;

		             mb_pet_select = -1;
		             mb_pet_posselect = -1;	
					 mb_pet_quant = -1;
			}
			if _craft != -1  {	
			
				    var _item = grid_craft[# Infos.item, j];
			        var _quantity = grid_craft[# Infos.quantity, j];
			        var _spr = grid_craft[# Infos.sprite, j];
			        var _name = grid_craft[# Infos.name, j];
			        var _info = grid_craft[# Infos.discription, j];
			        var _equip =  grid_craft[# Infos.equipable, j];
			        var _coin = grid_craft[# Infos.coin, j];
			        var _cost = grid_craft[# Infos.cost, j];
			        var _wep = grid_craft[# Infos.typeWeapon, j]; 
                            
			        grid_craft[# Infos.item, j] = grid_petiInv [# Infos.item, mb_pet_posselect];
			        grid_craft[# Infos.quantity, j] = grid_petiInv[# Infos.quantity, mb_pet_posselect];
			        grid_craft[# Infos.sprite, j] = grid_petiInv[# Infos.sprite, mb_pet_posselect];
			        grid_craft[# Infos.name, j] = grid_petiInv[# Infos.name, mb_pet_posselect];
			        grid_craft[# Infos.discription, j] = grid_petiInv[# Infos.discription, mb_pet_posselect];
			        grid_craft[# Infos.equipable, j] = grid_petiInv[# Infos.equipable, mb_pet_posselect];
			        grid_craft[# Infos.coin, j] = grid_petiInv[# Infos.coin, mb_pet_posselect];
			        grid_craft[# Infos.cost, j] = grid_petiInv[# Infos.cost, mb_pet_posselect];
			        grid_craft[# Infos.typeWeapon, j] = grid_petiInv[# Infos.typeWeapon, mb_pet_posselect];
                   
			        grid_petiInv[# Infos.item, mb_pet_posselect] =  _item;
			        grid_petiInv[# Infos.quantity, mb_pet_posselect] = _quantity;
			        grid_petiInv[# Infos.sprite, mb_pet_posselect] = _spr;
			        grid_petiInv[# Infos.name, mb_pet_posselect] = _name;
			        grid_petiInv[# Infos.discription, mb_pet_posselect] = _info;
			        grid_petiInv[# Infos.equipable, mb_pet_posselect] = _equip;
			        grid_petiInv[# Infos.coin, mb_pet_posselect] = _coin;
			        grid_petiInv[# Infos.cost, mb_pet_posselect] = _cost;
			        grid_petiInv[# Infos.typeWeapon, mb_pet_posselect] = _wep;
                        
			        mb_pet_select = -1;
			        mb_pet_posselect = -1;
					mb_pet_quant = -1;

			}
	    }else {
		 
			mb_craft_select = _craft;
			mb_craft_posselect = j;
			mb_craft_quant = _quantcraft;
			}
	  }
   }
	
	if _craft != -1{
		if j == 2 {	
			 draw_sprite_ext(_sprcraft, grid_craft[# 0, j], _cslotsx + 15, _cslotsy, _scala/2, _scala/2, 0, C, 1);
			}else{
				 draw_sprite_ext(_sprcraft, grid_craft[# 0, j], _cslotsx, _cslotsy, _scala, _scala, 0, C, 1);
			}
        // Quantidade dos itens
        draw_set_alpha(1);
        draw_set_font(Font1);
        draw_set_halign(fa_center);
        draw_text_colour_outline(_cslotsx + size_craftslot -15,  _cslotsy + size_craftslot -30, _quantcraft, 4, c, 16, 100, 100);
	}
	
    cx++;
    if (cx >= craft_h) {
        cx = 0;
        cy++;
    }
	
}
		

}
#endregion







