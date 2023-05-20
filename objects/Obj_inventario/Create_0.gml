/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
 // coin 
global.coin = (0);
global.silver = (0);
global.nebulite = (0);


global.escala = 3;
inventory = false;

#region           // Inventory base
//distnacia entre a borda da sprite e do primeiro slot
x_inventory = 113 * global.escala
y_inventory = 57 * global.escala

// total numbers of slots
slots_h = 4;
slots_v = 4;
total_slots = slots_h * slots_v;
size_slots = 16 * global.escala;
buffer = 9 * global.escala;

// length and hight sprite vs camera scale or room Idk
inventory_L = sprite_get_width(spr_new_inventory) * global.escala;
inventory_A = sprite_get_height(spr_new_inventory) * global.escala;

wallet_L = sprite_get_width(spr_wallet_hui) * global.escala;
wallet_A = sprite_get_height(spr_wallet_hui) * global.escala;

//mouse interactions
item_select = -1;
pos_select	= -1;
equip_select = -1;
weapon_select = -1;
posWeapon_select = -1;
quantity_select = -1

// description e animations
ShowingDespription = false;
Sequence = undefined;
silly_animation = false;
silly_count = 0;

#endregion

#region --------------------------------------SLOTS EQUIPS / POTIONS/ARMORS/WEAPONS ----------------------
// armor Items slots

slots_equiH = 1
slots_equiV = 4
total_equipS = slots_equiH * slots_equiV;
x_equip = 81 * global.escala;
y_equip = 57 * global.escala;


// potions System 
slots_potH = 2;
slots_potV = 1;
total_pots = slots_potH * slots_potV;
x_pots = 30 * global.escala;
y_pots = 117 * global.escala;

// Weapons System
slots_wepH = 2;
slots_wepV = 1;
total_wepS = slots_wepH * slots_wepV;
x_weps = 30 * global.escala;
y_weps = 32 * global.escala;


#endregion

enum itens_armas{	
	espada ,
	arco,
	cajado ,
	small_health_pot,
	cat_shield,
	altura	
	}
	
enum item_inimigos {	
	Slime_jelly,
	orc_helmet,
	orc_tooth,
	apple_bite,
	altura
	}	
	
enum Infos{	
	item,              //subimage
	quantity,         //quantity
	sprite,          //sprite
	name,           //name
	discription,   //discription
	equipable,    //equipable
	coin,        //gold, silver or nebulanita
	cost,       // sell and buy
	typeWeapon,//Type of item
	altura
	}


#region               //--------- Grid create, inventory names e discriptions  ------//
grid_itens = ds_grid_create(Infos.altura,total_slots);
ds_grid_set_region(grid_itens, 0,0, Infos.altura -1, total_slots -1, -1);

grid_equip = ds_grid_create(Infos.altura,total_equipS);
ds_grid_set_region(grid_equip, 0,0, Infos.altura -1, total_equipS -1, -1);

grid_weapon = ds_grid_create(Infos.altura,total_wepS);
ds_grid_set_region(grid_weapon, 0,0, Infos.altura -1, total_wepS -1, -1);

#region              //------------Names and discriptions arrays---------------------//
// Infos.name and Infos.discriptions  |  itens_armas 
// names_weapons_info[0][0] for names
// and names_weapons_info[0][1] for discriptions
// names_weapons_info[0][2] for equippable
// names_weapons_info[0][3] for coin type
// names_weapons_info[0][4] for cost
// names_weapons_info[0][5] for type of Weapon    One hand = 10 | Shield = 20 | Helmet = 30 | Armor = 40 | Legs = 50 | Bots = 60 | Potions = 70 | Rings = 80 | No Equippable = 0

names_weapons_info = [   
	["Scout Saber", "A saber used by explorers, ideal for quick but not precise attacks. " + chr(10) + chr(10) + "Equippable item", true, 1, 1,10 ],
    ["Hunter Bow", "Made of wood and string and not so good. " +  chr(10) + chr(10) + "Equippable item",true,1, 1, 10],
    ["Rod of Whispers", "Bring insanity for the weak ones." + chr(10) + chr(10) + "Equippable item ",true, 1, 1, 20],
	["Gooheal Potion", " A strange and gooey texture clinging to the edges of the flask." + chr(10) + chr(10) + "Consumable", true, 2, 1, 70 ],
	["Feline Guardian Shield", "A symbol of honor and protection."  + chr(10) + chr(10) + "Equippable item", true, 1,1, 20]
];

// Infos.name and Infos.discriptions  |  itens_inimigos 
// names_foe_info[0][0] for names
// names_foe_info[0][1] for discriptions
// names_foe_info[0][2] for equippable
// names_foe_info[0][3] for coin type
// names_foe_info[0][4] for cost
names_foe_info = [  
	["Slime Jelly", "A viscous and shiny substance", false,2, 1, 0],
    ["Orc Helmet", "Rust and decay piece of metal",false,1,1,0],
    ["Orc Tooth", "Someone maybe need a new one",false, 2,2,0],
	["Chrysalis Bite", " A yummy Home", false,2,1,0]
];


#endregion

// add item to grid argument 0 = item,
//argument 1 = quantity, 
//argument 2 = sprite,
//argument 3 = name,
//argument 4 = discription,
//argument 5 = equippable,
//argument 6 = coin type
//argument 7 = cost,
//argument 8 = WeaponType,

ds_grid_add_item(item_inimigos.apple_bite, 2 , spr_items_inimigos, names_foe_info[3][0], names_foe_info[3][1],names_foe_info[3][2], names_foe_info[3][3], names_foe_info[3][4], names_foe_info[3][5]);

ds_grid_add_item(itens_armas.small_health_pot, 5 , spr_items, names_weapons_info[3][0],names_weapons_info[3][1],names_weapons_info[3][2], names_weapons_info[3][3], names_weapons_info[3][4], names_weapons_info[3][5]);

ds_grid_add_item(itens_armas.cat_shield, 1 , spr_items, names_weapons_info[4][0],names_weapons_info[4][1],names_weapons_info[4][2], names_weapons_info[4][3], names_weapons_info[4][4], names_weapons_info[4][5]);

ds_grid_add_item(itens_armas.arco, 1 , spr_items, names_weapons_info[1][0],names_weapons_info[1][1],names_weapons_info[1][2], names_weapons_info[1][3], names_weapons_info[1][4], names_weapons_info[1][5]);

ds_grid_add_item(itens_armas.espada, 1 , spr_items, names_weapons_info[0][0], names_weapons_info[0][1],names_weapons_info[0][2], names_weapons_info[0][3], names_weapons_info[0][4], names_weapons_info[0][5]);
ds_grid_add_item(itens_armas.cajado, 1 , spr_items, names_weapons_info[2][0], names_weapons_info[2][1],names_weapons_info[2][2], names_weapons_info[2][3], names_weapons_info[2][4], names_weapons_info[2][5]);
ds_grid_add_item(itens_armas.espada, 32 , spr_items, names_weapons_info[0][0], names_weapons_info[0][1],names_weapons_info[0][2],names_weapons_info[0][3], names_weapons_info[0][4], names_weapons_info[0][5]);

ds_grid_add_item(item_inimigos.Slime_jelly, 6 , spr_items_inimigos, names_foe_info[0][0], names_foe_info[0][1],names_foe_info[0][2], names_foe_info[0][3], names_foe_info[0][4], names_foe_info[0][5]);
ds_grid_add_item(item_inimigos.orc_helmet, 54 , spr_items_inimigos, names_foe_info[1][0], names_foe_info[1][1],names_foe_info[1][2], names_foe_info[1][3], names_foe_info[1][4], names_foe_info[1][5]);

ds_grid_add_item(item_inimigos.orc_tooth, 12 , spr_items_inimigos, names_foe_info[2][0], names_foe_info[2][1],names_foe_info[2][2], names_foe_info[2][3], names_foe_info[2][4], names_foe_info[2][5]);

ds_grid_add_item(item_inimigos.Slime_jelly, 5 , spr_items_inimigos, names_foe_info[0][0], names_foe_info[0][1],names_foe_info[0][2], names_foe_info[0][3], names_foe_info[0][4], names_foe_info[0][4]);


#endregion