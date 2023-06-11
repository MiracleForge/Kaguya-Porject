/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


#region ------------------------------------- Inventory open ----------------------------------------------
if obj_transition {
if keyboard_check_pressed(ord("I")){
inventory = !inventory;
global.pauseON = !global.pauseON;
	
}
}
#endregion

#region ------------------------------------- Equip Activation (NEED REWORK) ------------------------------
if grid_weapon[# Infos.item, 0 ] != -1 {	
	obj_Player.active_sword = true;
	}else if grid_weapon[# Infos.item, 0 ] == -1{	
		obj_Player.active_sword = false;
		}
		
		if grid_weapon[# Infos.item, 1 ] != -1 {
			if grid_weapon[# Infos.typeWeapon, 1] == 20{
				obj_Player.shield = false;
				obj_Player.active_bow = true;
				obj_Player.istrowing = false;
				} else if grid_weapon[# Infos.typeWeapon, 1] == 25{	
					obj_Player.shield = true;
					obj_Player.active_bow = false;
					obj_Player.istrowing = false;
					}else if grid_weapon[# Infos.typeWeapon,1] == 21{	
						obj_Player.istrowing = true;
						obj_Player.shield = false;
					     obj_Player.active_bow = false;
						}
		}else {	
			obj_Player.shield = false;
			obj_Player.active_bow = false;
			obj_Player.istrowing = false;
			}
#endregion

#region ------------------------------------- Item descriptions activation --------------------------------
if keyboard_check_pressed(ord("O"))  {
	
ShowingDespription = !ShowingDespription;


}else if inventory == false {	
	ShowingDespription = false
	} else if ShowingDespription == true {	
		
		}
#endregion

#region ------------------------------------- Coin System and shop System ---------------------------------
#region	//------------ coind and money 
//0 = GOLD
//1 = SILVER
//2 = NEBULONITE


ds_grid_coin = ds_grid_create(2, 3);
ds_grid_coin[# 0, 0] = "GOLD";
ds_grid_coin[# 0, 1] = "SILVER";
ds_grid_coin[# 0, 2] = "NEBULONITE"; 

ds_grid_coin[# 1, 0] = string(global.coin);
ds_grid_coin[# 1, 1] = string(global.silver);
ds_grid_coin[# 1, 2] = string(global.nebulite);


#endregion

if keyboard_check_pressed(ord("E")) {
	shopOpen = !shopOpen
	global.pauseON = !global.pauseON;
	
	}
if shopOpen{
    var _grid = grid_itens;
    var numItens = -1;
 
	
    // Contar o número total de itens no grid
    for (var i = 0; i < ds_grid_height(_grid); i++) {
        if (_grid[# Infos.item, i] != -1) {
            numItens++;
        }
    }

    // Verificar se o mouse foi rolado para baixo
    if (mouse_wheel_down()) {
        selectShop++;
        if (selectShop == numItens)
            selectShop = 0;
    }

    // Verificar se o mouse foi rolado para cima
    if (mouse_wheel_up()) {
        selectShop--;
        if (selectShop < 0)
            selectShop = numItens - 1;
    }

}


 if (!shopOpen) {
        is_showing = false;
 }
#endregion