/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Cria uma variável global com o ID do objeto obj_pickup_heart

if obj_transition {
if keyboard_check_pressed(ord("I")){
inventory = !inventory;
global.pauseON = !global.pauseON
	
}
}



if keyboard_check_pressed(ord("O"))  {
	
ShowingDespription = !ShowingDespription;


}else if inventory == false {	
	ShowingDespription = false
	} else if ShowingDespription == true {	
		
		}

	//------------ coind and money 
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

