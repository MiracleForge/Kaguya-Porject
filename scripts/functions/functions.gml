// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function fim_da_animacao(){
    /// @description animation_end(sprite_index,image_index, rate)
    /// @param {real} <sprite_index> The index of the sprite being animated
    /// @param {real} <image_index> The current frame value
    /// @param {real} <rate> -See Below-
    ///     The rate of change in frames per step if not
    ///     using built in image_index/image_speed.  
    ///     Don't use if you don't think you need this.  You probably don't.
 
    //returns true if the animation will loop this step.
 
    //Script courtesy of PixellatedPope & Minty Python from the GameMaker subreddit discord 
    //https://www.reddit.com/r/gamemaker/wiki/discord
 
    var _sprite = sprite_index;
    var _image = image_index;
    if(argument_count > 0)   _sprite = argument[0];
    if(argument_count > 1)  _image = argument[1];
    var _type = sprite_get_speed_type(sprite_index);
    var _spd = sprite_get_speed(sprite_index)*image_speed;
    if(_type == spritespeed_framespersecond)
        _spd = _spd/room_speed;
    if(argument_count > 2) _spd = argument[2];
    return _image + _spd >= sprite_get_number(_sprite);
}

function draw_text_colour_outline(x, y, str, outwidth, outcol, outfidelity, separation, width) {
    //Created by Andrew McCluskey http://nalgames.com/
 
    ///draw_text_outline(x, y, str, outwidth, outcol, outfidelity, separation, width)

    //Created by Andrew McCluskey http://nalgames.com/

    //x, y: Coordinates to draw
    //str: String to draw
    //argument3 = outwidth: Width of outline in pixels
    //argument4 = outcol: Colour of outline (main text draws with regular set colour)
    //argument5 = outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
    //argument6 = separation, for the draw_text_EXT command.
    //argument7 = width for the draw_text_EXT command.


    //2, c_dkgray, 4, 20, 500 <Personal favorite preset. (For fnt_3)
    var dto_dcol = draw_get_color();

    draw_set_color(outcol);

    for (var dto_i = 45; dto_i < 405; dto_i += 360 / outfidelity) {
        //draw_text_ext(x + lengthdir_x(outwidth, dto_i), y + lengthdir_y(outwidth, dto_i), str, separation, width);
        draw_text_ext(x + round(lengthdir_x(outwidth, dto_i)), y + round(lengthdir_y(outwidth, dto_i)), str, separation, width);
    }

    draw_set_color(dto_dcol);
    draw_text_ext(x, y, str, separation, width);
}

	

function ds_grid_add_item() {
    ///@arg item
    ///@arg Quantity
    ///@arg sprite
    ///@arg name
    ///@arg discription
    ///@arg equipable
    ///@arg cointype
    ///@arg cost
    
    var _grid = Obj_inventario.grid_itens;
    var _empty_slots = 0;

    if obj_Player.attack == false {
        // percorre o grid e conta os slots vazios
        var _grid_height = ds_grid_height(_grid);  // Chamada da função apenas uma vez
        for (var i = 0; i < _grid_height; i++) {  // Utilizando a variável _grid_height como limite do loop
            if (_grid[# Infos.item, i] == -1) {
                _empty_slots++;
            }
        }

        // verifica se há espaço suficiente para adicionar um novo item
        if (_empty_slots > 0) {
            var _checking = 0;
            while (_grid[# Infos.item, _checking] != -1) {    
                _checking++;
            } 
            
            _grid[# 0, _checking] = argument[0];
            _grid[# 1, _checking] = argument[1];
            _grid[# 2, _checking] = argument[2];
            _grid[# 3, _checking] = argument[3];
            _grid[# 4, _checking] = argument[4];
            _grid[# 5, _checking] = argument[5];
            _grid[# 6, _checking] = argument[6];
            _grid[# 7, _checking] = argument[7];
			_grid[# 8, _checking] = argument[8];
            
        } else {
            // exibe uma mensagem de erro informando que o inventário está cheio
            inventario_cheio = true;
        }
    }
}


function ds_grid_add_pet (){	
    ///@arg item
    ///@arg sprite
    ///@arg name
    ///@arg discription
    ///@arg damage
    ///@arg class

    
    var _gridpet = Obj_inventario.grid_pet;
    var _empty_slots = 0;
    var _grid_height = ds_grid_height(_gridpet);  
        for (var i = 0; i < _grid_height; i++) {  // Utilizando a variável _grid_height como limite do loop
            if (_gridpet[# pet_info.item, i] == -1) {
                _empty_slots++;
            }
        }

        // verifica se há espaço suficiente para adicionar um novo item
        if (_empty_slots > 0) {
            var _checking = 0;
            while (_gridpet[# pet_info.item, _checking] != -1) {    
                _checking++;
            } 
            
            _gridpet[# 0, _checking] = argument[0];
            _gridpet[# 1, _checking] = argument[1];
            _gridpet[# 2, _checking] = argument[2];
            _gridpet[# 3, _checking] = argument[3];
            _gridpet[# 4, _checking] = argument[4];
            _gridpet[# 5, _checking] = argument[5];
           
            
        } else {
            // exibe uma mensagem de erro informando que o inventário está cheio
            inventario_cheio = true;
        }
   
}






function ds_grid_equip_item(){	
	///@arg item
	///@arg Quantity
	///@arg sprite
	///@arg name
	///@arg discription
	
var _grid = Obj_inventario.grid_equip;
var _empty_slots = 0;

if obj_Player.attack == false {
    // percorre o grid e conta os slots vazios
    for (var i = 0; i < ds_grid_height(_grid); i++) {
        if (_grid[# Infos.item, i] == -1) {
            _empty_slots++;
        }
    }

    // verifica se há espaço suficiente para adicionar um novo item
    if (_empty_slots > 0) {
        var _checking = 0;
        while (_grid[# Infos.item, _checking] != -1) {	
            _checking++;
        } 
		
        _grid[# 0, _checking] = argument[0];
        _grid[# 1, _checking] = argument[1];
        _grid[# 2, _checking] = argument[2];
        _grid[# 3, _checking] = argument[3];
		_grid[# 4, _checking] = argument[4];
		
    } else {
        // exibe uma mensagem de erro informando que o inventário está cheio
        inventario_cheio = true;
    }
}
}
	

function loop_animation(){
	///action_loop()
///@param ani_state
///@param ani_speed
///@param ani_start
///@param ani_end

image_index = ani_start; //set image index to ani_start

if ani_state!=argument[0] {
    //set up the base animation and state
    ani_state=argument[0];
    ani_start=argument[2];
    ani_end = argument[3];
 
}

ani_speed = argument[1]; //set animation speed
ani_end = argument[3]+ani_speed; //set animation end + the image speed
 
if ani_start <= ani_end {
    ani_start += ani_speed; //do animation
} else {
    ani_start = argument[2]; // reset animation
}
}