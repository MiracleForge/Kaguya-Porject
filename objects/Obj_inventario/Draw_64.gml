/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//centralização  da sprite
var _guiL = display_get_gui_width();
var _guia = display_get_gui_height();

// variaveis para mouse
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


if inventory == true {
	

	 // local variable and loof for slots
	
	var _invx =  _guiL/2 - inventory_L/2;  // dividir o tamanho da sprite 
	var _invy = _guia/2 - inventory_A/2;
	var _walletx = _guia/2 - wallet_L/2;
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
	
	#region -----------------------------Trash Can------------------------------------------------
	if !ShowingDespription { 
draw_sprite_ext(spr_trash_hui, 0, 970, 180, global.escala / 5, global.escala / 5, 0, c_white, 1);
	
	
if point_in_rectangle(_mx, _my, 970, 200, 1070, 325) {
   
    
    if mouse_check_button_pressed(mb_left) {
        grid_itens[# Infos.item, pos_select] = -1;
        grid_itens[# Infos.quantity, pos_select] = -1;
        grid_itens[# Infos.sprite, pos_select] = -1;
        grid_itens[# Infos.name, pos_select] = -1;
        grid_itens[# Infos.discription, pos_select] = -1;
        
        item_select = -1;
        pos_select = -1;
		equip_select = -1;
    }
}
	}
#endregion

	
	if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + size_slots, _slotsy + size_slots) {
    
	draw_sprite_ext(spr_inventario_seletor, 0, _slotsx, _slotsy, global.escala, global.escala, 0, c_white, 1); // desenho do retangulo do mouse


#region   //discription
// desenhar a sprite do item na aba de descrição

if grid_itens[# Infos.item, i] != -1 and ShowingDespription == true {
    var c = c_white;

    Sequence = draw_sprite_ext(spr_inventory_description, 0, 955, 120, global.escala, global.escala, 0, c, 1);

    draw_set_font(Font1);
    draw_set_halign(fa_middle);
    draw_text(1080, 150, grid_itens[# Infos.name, i]);
    draw_text_ext_color(1100, 210, grid_itens[# Infos.discription, i], string_height("M"), 55 * global.escala, c, c, c, c, 1);
    draw_sprite_ext(grid_itens[# Infos.sprite, i], grid_itens[# Infos.item, i], 970, 200, global.escala, global.escala, 0, c, 1);
draw_text(960, 200,grid_itens[# Infos.typeWeapon,i])
    switch (grid_itens[# Infos.coin, i]) {
        case 1:
            draw_sprite_ext(spr_coin_inventory, 0, _walletx + 950, _wallety - (-199), global.escala * 0.6, global.escala * 0.6, 0, c, 1);
            break;
        case 2:
            draw_sprite_ext(spr_coin_inventory, 1, _walletx + 950, _wallety - (-199), global.escala * 0.6, global.escala * 0.6, 0, c, 1);
            break;
        case 3:
            draw_sprite_ext(spr_coin_inventory, 2, _walletx + 950, _wallety - (-199), global.escala * 0.6, global.escala * 0.6, 0, c, 1);
            break;
    }

    draw_text_colour_outline(_walletx + 940, _wallety - (-200), grid_itens[# Infos.cost, i], 2, c_black, 23, 50, 100 )
} else if inventory == false {
    ShowingDespription = false
}
#endregion
	
		
		
#region  // Pickup itens and drop	

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

#region	 // check slots, stack itens, 		
				if mouse_check_button_pressed(mb_left) {

				// não tenha item selecionado
				if item_select == -1{
				
				item_select =  grid_itens[# Infos.item, i];
				equip_select = grid_itens[# Infos.equipable,i];
				pos_select = i;
				// caso tenha item selecionado
				

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
}	
#endregion	

	}

		
var  _sprite = grid_itens[# Infos.sprite, i]; //checar se tem item no slot

	if grid_itens[# Infos.item, i] != -1{	//desenho dos itens (chega se o valor do inventario for diferente de 1)
		
		draw_sprite_ext(_sprite, grid_itens[# 0, i], _slotsx, _slotsy, global.escala, global.escala, 0, c_white, 1);
		
			//quantidade dos itens
			draw_set_alpha(1);
			draw_set_font(Font1);
			draw_set_halign(fa_center);
			draw_text_colour_outline(_slotsx + size_slots, _slotsy + size_slots - 8, grid_itens[# Infos.quantity, i], 4, c_black, 16, 100, 100);
			} 
			
			
		
		ix ++;  // adiciona os slots horizontalmente
		
		if ix >= slots_h {   //se os slots add foram maior que os slots _h adicionar slot y
			ix = 0;
			iy ++;
			
	}
	
}
	
	
	//largar item
		if mouse_check_button_pressed(mb_right){
			item_select = -1;
			pos_select = -1;
			equip_select = -1;
	}


			if item_select	!= -1{	
	
				draw_sprite_ext(grid_itens[# Infos.sprite, pos_select], item_select, _mx, _my, global.escala, global.escala, 0, c_white, 1);

		} 
		
			


	

#region ---------------------------Armor System ------------------------------------------

var eqx = 0; // variáveis que guardam o tracking
var eqy = 0;

for (var i = 0; i < total_equipS; i++) { // i igual a 0, enquanto i for menor que total slots acrescenta mais 1

    var _equipslotx = _invx + x_equip + ((size_slots + buffer) * eqx); // soma o início do slot com o comprimento e multiplica pelo número de slots para começar o próximo slot
    var _equipsloty = _invy + y_equip + ((size_slots + buffer - 15) * eqy);

    if point_in_rectangle(_mx, _my, _equipslotx, _equipsloty, _equipslotx + size_slots, _equipsloty + size_slots) {

        draw_sprite_ext(spr_inventario_seletor, 0, _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);

        if mouse_check_button_pressed(mb_left) {
            if equip_select == 1 {

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
        }
    }

    if grid_equip[# Infos.item, i] != -1 {

        var _sprite = grid_equip[# Infos.sprite, i];
        draw_sprite_ext(_sprite, grid_equip[# 0, i], _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
    }

    eqx++; // adiciona os slots horizontalmente

    if eqx >= slots_equiH { // se os slots add foram maior que os slots _h adicionar slot y
        eqx = 0;
        eqy++;
    }
}

	
#endregion 


#region ---------------------------------Potion Equip ------------------------------
    var eqx = 0; // variaveis que guardam o tracking
	var eqy = 0;
	for (var i = 0; i < total_pots; i++) {  //i igual a 0 , enquanto i for menor que total slots acrescenta mais 1	
	
	
	var _equipslotx = _invx + x_pots + ((size_slots + buffer ) * eqx);  // soma o inicio do slot com o comprimento e multiplica pelo numero de slots para começar o proximo slot 
	var _equipsloty = _invy + y_pots + ((size_slots + buffer -15) * eqy);
	
		if point_in_rectangle(_mx, _my, _equipslotx, _equipsloty, _equipslotx + size_slots, _equipsloty + size_slots) {
    
			draw_sprite_ext(spr_inventario_seletor, 0, _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
				
			
}



		eqx ++;  // adiciona os slots horizontalmente
		
		if eqx >= slots_potH {   //se os slots add foram maior que os slots _h adicionar slot y
			eqx = 0;
			eqy ++;
			
	}
	
}
#endregion


#region ------------------------------------ Weapon equip Slots -----------------------------
   var eqx = 0; // variaveis que guardam o tracking
   var eqy = 0;
   for (var i = 0; i < total_wepS; i++) {  //i igual a 0 , enquanto i for menor que total slots acrescenta mais 1	
	
	
	var _equipslotx = _invx + x_weps + ((size_slots + buffer ) * eqx);  // soma o inicio do slot com o comprimento e multiplica pelo numero de slots para começar o proximo slot 
	var _equipsloty = _invy + y_weps + ((size_slots + buffer -15) * eqy);
	
		if point_in_rectangle(_mx, _my, _equipslotx, _equipsloty, _equipslotx + size_slots, _equipsloty + size_slots) {
    
	draw_sprite_ext(spr_inventario_seletor, 0, _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
	
	 if mouse_check_button_pressed(mb_left) {
            if equip_select == 1 and grid_weapon[# Infos.item,i] = -1 {
				var itemType = grid_itens[# Infos.typeWeapon, pos_select];
				
               if ((i == 0 && itemType == 10) || (i == 1 && itemType == 20)){
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
         } 
    }
}

   if grid_weapon[# Infos.item, i] != -1 {

        var _sprite = grid_weapon[# Infos.sprite, i];
        draw_sprite_ext(_sprite, grid_weapon[# 0, i], _equipslotx, _equipsloty, global.escala, global.escala, 0, c_white, 1);
    }

		eqx ++;  // adiciona os slots horizontalmente
		
		if eqx >= slots_wepH {   //se os slots add foram maior que os slots _h adicionar slot y
			eqx = 0;
			eqy ++;
			
	}
	
}


#endregion






#region  // status wallet
//status player
//life player

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



//pet
/*
var _pet_vida = obj_slime_pet.vida[obj_slime_pet.level];
var _max_pet_vida = obj_slime_pet.max_vida[obj_slime_pet.level];

draw_sprite_ext(spr_xp_pet, 0, 720, 578, (_pet_vida/_max_pet_vida) * escala, escala, 0, c_white, 1);
*/
//PET
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




