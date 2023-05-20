/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _potions = Obj_inventario.grid_potions;
var _healAmount = 5;
var _remainingHealth = obj_Player.max_vida - obj_Player.vida;

if (_potions[# Infos.quantity, 1] == 1) {
	_potions[# Infos.item, 1] = -1;
	_potions[# Infos.quantity, 1] = -1;
	_potions[# Infos.sprite, 1] = -1;
	_potions[# Infos.name, 1] = -1;
	_potions[# Infos.discription, 1] = -1;
	_potions[# Infos.coin, 1] = -1;
	_potions[# Infos.cost, 1] = -1;
	_potions[# Infos.typeWeapon, 1] = -1;
	
} else if (obj_Player.vida < obj_Player.max_vida && _potions[# Infos.item, 1] != -1) {
	obj_Player.vida += min(_healAmount, _remainingHealth);
	_potions[# Infos.quantity, 1] -= 1;
}

  

	
