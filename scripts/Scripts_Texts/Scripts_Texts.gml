function scr_text(){	
	switch npc_nome{	
		case "Gllop":
			ds_grid_add_text("Eu sou uma recordacaoo presente da ma programação", Spr_gloob,0, "Gloop");
			ds_grid_add_text("Sou apenas o passado obscuro de uma era que ainda nao passou", Spr_gloob,0, "Gloop");
			ds_grid_add_text("Ei não diga isso, olha o quando melhorei", spr_personagem_parado_baixo,1, "Kaguya");
			ds_grid_add_text("Continue tentando", spr_personagem_parado_baixo,1, "Kaguya");
			
			break;
			case "Dayse":
			ds_grid_add_text("Oi, sou Dayse", Dayse,1, "Dayse");
			break;
		}
	}
	
function ds_grid_add_row(){
	///@arg ds_grid
 
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);	
}
 
 
function ds_grid_add_text(){
	///@arg texto
	///@arg retrato
	///@arg lado
	///@arg nome
 
	var _grid = text_grid;
	var _y = ds_grid_add_row(_grid);
 
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}