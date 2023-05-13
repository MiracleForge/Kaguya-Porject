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

function draw_text_colour_outline(){	
    //Created by Andrew McCluskey http://nalgames.com/
 
    ///@arg x
    ///@arg y
    ///@arg str
    ///@arg outwidth
    ///@arg outcol
    ///@arg outfidelity
    ///@arg separation
    ///@arg width
 
 
   ///draw_text_outline(x,y,str,outwidth,outcol,outfidelity,_separation,width)

//Created by Andrew McCluskey http://nalgames.com/

//x,y: Coordinates to draw
//str: String to draw
//arugment3 = outwidth: Width of outline in pixels
//argument4 = outcol: Colour of outline (main text draws with regular set colour)
//argument5 = outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
//argument6 = separation, for the draw_text_EXT command.
//argument7 = width for the draw_text_EXT command.


//2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)
var dto_dcol=draw_get_color();

draw_set_color(argument4);

for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
{
  //draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);
  draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);
}

draw_set_color(dto_dcol);
draw_text_ext(argument0,argument1,argument2,argument6,argument7);

}
	



function ds_grid_add_item(){	
	///@arg item
	///@arg Quantity
	///@arg sprite
	///@arg name
	
var _grid = Obj_inventario.grid_itens;
var _empty_slots = 0;
var _itensname = Obj_inventario.item_names
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
        _grid[# 3, _checking] = _itensname[argument[0]];
		
    } else {
        // exibe uma mensagem de erro informando que o inventário está cheio
        inventario_cheio = true;
    }
}
}
	
	/*original code
	
	var _grid = Obj_inventario.grid_itens;
	
	var _checking = 0;
	while _grid  [# Infos.item, _checking] != -1 {	
		_checking++;
		} 
		
		_grid[# 0, _checking] = argument[0];
		_grid[# 1, _checking] = argument[1];
		_grid[# 2, _checking] = argument[2];
		_grid[# 3, _checking] = argument[3];
		*/
	

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