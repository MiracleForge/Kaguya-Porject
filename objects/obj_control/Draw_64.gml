/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var _vida = obj_Player.vida;
var _max_vida = obj_Player.max_vida;

var _stamina = obj_Player.estamina;
var _max_stamina = obj_Player.max_stamina;

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




//barra de boss
var  _gl = display_get_gui_width();
if instance_exists(obj_parente_boss){	
	var _sprw = sprite_get_width(spr_boss_hud) * global.escala;
	draw_set_alpha(1);
	draw_sprite_ext(spr_boss_hud, 0, _gl/2 - _sprw/2, 100, global.escala, global.escala, 0 , c_white, 1);
	draw_sprite_ext(spr_boss_vida, 0, _gl/2 - _sprw/2 + 6, 100, obj_Boss_1.vida/obj_Boss_1.vida_max * global.escala, global.escala, 0, c_white, 1);
	}
	



	
	