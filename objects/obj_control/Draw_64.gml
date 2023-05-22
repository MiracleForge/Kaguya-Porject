/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var _vida = obj_Player.vida;
var _max_vida = obj_Player.max_vida;

var _stamina = obj_Player.estamina;
var _max_stamina = obj_Player.max_stamina;


var _transform = obj_slime_pet.transform;
var _max_transform = obj_slime_pet.transformation_time[obj_slime_pet.level]
//huda = hight
draw_set_alpha(1);
draw_sprite_ext(spr_hud_barra_vida, 0, +81, _huda - 600,(_vida/_max_vida) * global.escala, global.escala, 0, c_white, 1);

draw_sprite_ext(spr_hud_barra_estamina, 0, +81, _huda - 585,(_stamina/_max_stamina) * global.escala, global.escala, 0, c_white, 1);

draw_sprite_ext(spr_hud_vida, 0, +75, _huda -600, global.escala, global.escala, 0, c_white, 1);

draw_sprite_ext(spr_hud_portrait, 0, + 41, _huda -597, global.escala, global.escala, 0, c_white, 1);

draw_sprite_ext(spr_day_nigh, 0, 280 + _xcoord, _huda - 600, global.escala, global.escala, 0, c_white, 1);

draw_sprite_ext(spr_bag_hui, 0, 280 + _xcoord, _huda, global.escala, global.escala, 0, c_white, 1)


#region    //-------------hui weapon

draw_sprite_ext(spr_hud_weapon, 0, + 95, _huda -520, global.escala, global.escala, 0, c_white, 0.7);

 switch (obj_Player.arma) {	
	 case 0 :
	 draw_sprite_ext(spr_hud_portrait_weapon, 0, + 95, _huda -520, global.escala, global.escala, 0, c_white, 1);
	 break;
	 case 1 :
	 draw_sprite_ext(spr_hud_portrait_bow, 0, + 95, _huda -520, global.escala, global.escala, 0, c_white, 1);
	 break;
	 case 2 :
	 draw_sprite_ext(spr_hud_portrait_shield, 0, + 95, _huda -520, global.escala, global.escala, 0, c_white, 1);
	 break;
	 }

#endregion

draw_sprite_ext(spr_hui_transform,0,35,_huda - 550, global.escala, global.escala,0,c_white,1);
draw_sprite_ext(spr_hui_transform_bar, 0, 35, _huda - 410 - (_transform / _max_transform) * (_huda - 550), global.escala, (_transform / _max_transform) * global.escala, 0, c_white, 1);


//barra de boss
var  _gl = display_get_gui_width();
if instance_exists(obj_parente_boss){	
	var _sprw = sprite_get_width(spr_boss_hud) * global.escala;
	draw_set_alpha(1);
	draw_sprite_ext(spr_boss_hud, 0, _gl/2 - _sprw/2, 100, global.escala, global.escala, 0 , c_white, 1);
	draw_sprite_ext(spr_boss_vida, 0, _gl/2 - _sprw/2 + 6, 100, obj_Boss_1.vida/obj_Boss_1.vida_max * global.escala, global.escala, 0, c_white, 1);
	}
	/*
if item_pickup == true {	
	draw_sprite_ext( spr_pick_up, 0, 80, 520, global.escala,global.escala, 0 , c_white,1);
	
	draw_sprite_ext(_sprite_pick, 0, 130, 640, global.escala/2, global.escala/2, 0, c_white, 1);
	 var _spr =_sprite_pick 
	 
	 if _sprite_pick != _spr {	
		
		 draw_sprite_ext(_sprite_pick, 0, 130, 600, global.escala/2, global.escala/2, 0, c_white, 1);
		 }
	}
	*/
var pick_counter = 0;
var spr_up = 0;
var spry = 640;

if (item_pickup == true) {
  pick_counter++;
  
  if (pick_counter <= 120) {
     _sprite_pick = spr_up; // Atualiza o valor de spr_up apenas uma vez
    // Desenha a sprite pela primeira vez
    draw_sprite_ext(spr_pick_up, 0, 130, 640, global.escala, global.escala, 0, c_white, 1);
    draw_sprite_ext(spr_up, 0, 80, 640, global.escala / 2, global.escala / 2, 0, c_white, 1);
    draw_text(100, 640, spr_up);
  }
} else if (spr_up != _sprite_pick && pick_counter != 0 && pick_counter <= 120) {
  spry += 20;
  draw_sprite_ext(spr_pick_up, 0, 80, spry, global.escala, global.escala, 0, c_white, 1);
  draw_sprite_ext(_sprite_pick, 0, 130, spry, global.escala / 2, global.escala / 2, 0, c_white, 1);
  if (pick_counter >= 120) {
    pick_counter = 0;
    item_pickup = false;
  }
}




	