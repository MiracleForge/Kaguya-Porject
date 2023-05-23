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
quantity_select = -1;
potion_select = -1;
pospotion_select = -1;
armor_select = -1;
posarmor_select = -1;
pet_select = -1;
pospet_select = -1;

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
buffer_equip = 4 * global.escala;
x_weps = 30 * global.escala;
y_weps = 32 * global.escala;

// PET slot inventory sprite
slots_petH = 2;
slots_petV = 1;
total_petS = slots_petH * slots_petV;
x_pets = 160 * global.escala;
y_pets = 159 * global.escala;
buffer_pet = 11 * global.escala;


// Slots active pet 
size_activex = 37 * global.escala ;
size_activey = 24 *global.escala;
x_active =  114 * global.escala;
y_active = 147 * global.escala;
total_active = 1;


#endregion

#region --------------------------------------Enum itens -------------------------------------------------
enum itens_armas{	
	espada ,
	arco,
	cajado ,
	small_health_pot,
	cat_shield,
	ring_slime1,
	ribbon_pink,
	girl_dress,
	girl_pants,
	old_bots,
	little_bomb,
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

#endregion

#region ------------------------------------- enum pets --------------------------------------------------

enum pets_crafted {
    petorange,
	petpurple,
	petred,
	height
}

enum pet_info{	
	item,
	sprite,
	name,
	description,
	damage,
	class,
	height
	}

#endregion

#region ------------------------- Grid create, inventory names - discriptions - pets ---------------------
grid_itens = ds_grid_create(Infos.altura,total_slots);
ds_grid_set_region(grid_itens, 0,0, Infos.altura -1, total_slots -1, -1);

grid_equip = ds_grid_create(Infos.altura,total_equipS);
ds_grid_set_region(grid_equip, 0,0, Infos.altura -1, total_equipS -1, -1);

grid_weapon = ds_grid_create(Infos.altura,total_wepS);
ds_grid_set_region(grid_weapon, 0,0, Infos.altura -1, total_wepS -1, -1);

grid_potions = ds_grid_create(Infos.altura,total_pots);
ds_grid_set_region(grid_potions, 0,0, Infos.altura -1, total_pots -1, -1);

grid_pet = ds_grid_create(pet_info.height, total_petS);
ds_grid_set_region(grid_pet, 0,0,pet_info.height - 1, total_petS -1, -1);


grid_active = ds_grid_create(pet_info.height, total_active);
ds_grid_set_region(grid_active, 0, 0, pet_info.height - 1, total_active -1, -1);


#region              //------------Names and discriptions arrays---------------------//
// Infos.name and Infos.discriptions  |  itens_armas 
// names_weapons_info[0][0] for names
// and names_weapons_info[0][1] for discriptions
// names_weapons_info[0][2] for equippable
// names_weapons_info[0][3] for coin type
// names_weapons_info[0][4] for cost
// names_weapons_info[0][5] for type of Weapon   

//One hand = 10 || hand = 20 bomb = 21 | shield = 25 || Helmet = 30 | Armor = 40 | Legs = 50 | Bots = 60 | Potions = 70 | Rings = 80 | No Equippable = 0

names_weapons_info = [   
	["Scout Saber", "A saber used by explorers, ideal for quick but not precise attacks. " + chr(10) + chr(10) + "Equippable item", true, 1, 1,10 ],
    ["Hunter Bow", "Made of wood and string and not so good. " +  chr(10) + chr(10) + "Equippable item",true,1, 1, 20],
    ["Rod of Whispers", "Bring insanity for the weak ones." + chr(10) + chr(10) + "Equippable item ",true, 1, 1, 20],
	["Gooheal Potion", " A strange and gooey texture clinging to the edges of the flask." + chr(10) + chr(10) + "Consumable", true, 2, 1, 70 ],
	["Feline Shield", "A symbol of honor and protection."  + chr(10) + chr(10) + "Equippable item", true, 1,1, 25],
	["Slime Essence Ring", "Crafted from enchanted slime essence. The eye in the middle looks kind familiar" + chr(10) + chr(10) + "Equippable item", true,1,5,80],
	["Cute Ribbon", " A ribbon made sweet with tenderness." + chr(10) + chr(10) + "Equippable item", true, 2,1, 30 ],
	["Cute Dress", " Cute dress made by hand." + chr(10) + chr(10) + "Equippable item", true,2, 1, 40],
	["Cute Pants", " Cute pants with little flowers" + chr(10) + chr(10) + "Equippable item", true, 2, 1, 50],
	["Old shoes", "A old girl shoes" + chr(10) + chr(10) + "Equippable item", true, 2, 1, 60],
	["Instabooom", " Small explosive device with an unpredictable twist." + chr(10) + chr(10) + "Equippable item", true, 1, 2,21]
	
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


#region ----------------------------------------- PET ARRAY ------------------------------------------------------
// pet_names[0][0] for names,
// pet_names[0][1] for discriptions,
// pet_names[0][2] for damage,
// pet_names[]0[3] for classe,
pet_names = [	
["Default pet", " wierd slime pet" + chr(10) + chr(10) + "Equippable item", 1, 10],
["Purple pet ", " wierd slime purple slime" + chr(10) + chr(10) + "Equippable item", 2, 20 ]
];


#endregion


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

ds_grid_add_item(itens_armas.little_bomb, 1 , spr_items, names_weapons_info[10][0],names_weapons_info[10][1],names_weapons_info[10][2], names_weapons_info[10][3], names_weapons_info[10][4], names_weapons_info[10][5]);

ds_grid_add_pet(pets_crafted.petpurple, spr_pet_pot, pet_names[1][0], pet_names[1][1], pet_names[1][2], pet_names[1][3]);
ds_grid_add_pet(pets_crafted.petorange, spr_pet_pot, pet_names[0][0], pet_names[0][1], pet_names[0][2], pet_names[0][3]);

ds_grid_add_item(itens_armas.old_bots, 1 , spr_items, names_weapons_info[9][0],names_weapons_info[9][1],names_weapons_info[9][2], names_weapons_info[9][3], names_weapons_info[9][4], names_weapons_info[9][5]);

ds_grid_add_item(itens_armas.girl_pants, 1 , spr_items, names_weapons_info[8][0],names_weapons_info[8][1],names_weapons_info[8][2], names_weapons_info[8][3], names_weapons_info[8][4], names_weapons_info[8][5]);

ds_grid_add_item(itens_armas.girl_dress, 1 , spr_items, names_weapons_info[7][0],names_weapons_info[7][1],names_weapons_info[7][2], names_weapons_info[7][3], names_weapons_info[7][4], names_weapons_info[7][5]);

ds_grid_add_item(itens_armas.ribbon_pink, 1 , spr_items, names_weapons_info[6][0],names_weapons_info[6][1],names_weapons_info[6][2], names_weapons_info[6][3], names_weapons_info[6][4], names_weapons_info[6][5]);

ds_grid_add_item(itens_armas.ring_slime1, 5 , spr_items, names_weapons_info[5][0],names_weapons_info[5][1],names_weapons_info[5][2], names_weapons_info[5][3], names_weapons_info[5][4], names_weapons_info[5][5]);

ds_grid_add_item(item_inimigos.apple_bite, 2 , spr_items_inimigos, names_foe_info[3][0], names_foe_info[3][1],names_foe_info[3][2], names_foe_info[3][3], names_foe_info[3][4], names_foe_info[3][5]);

ds_grid_add_item(itens_armas.small_health_pot, 5 , spr_items, names_weapons_info[3][0],names_weapons_info[3][1],names_weapons_info[3][2], names_weapons_info[3][3], names_weapons_info[3][4], names_weapons_info[3][5]);

ds_grid_add_item(itens_armas.cat_shield, 1 , spr_items, names_weapons_info[4][0],names_weapons_info[4][1],names_weapons_info[4][2], names_weapons_info[4][3], names_weapons_info[4][4], names_weapons_info[4][5]);

ds_grid_add_item(itens_armas.arco, 1 , spr_items, names_weapons_info[1][0],names_weapons_info[1][1],names_weapons_info[1][2], names_weapons_info[1][3], names_weapons_info[1][4], names_weapons_info[1][5]);

ds_grid_add_item(itens_armas.espada, 1 , spr_items, names_weapons_info[0][0], names_weapons_info[0][1],names_weapons_info[0][2], names_weapons_info[0][3], names_weapons_info[0][4], names_weapons_info[0][5]);
ds_grid_add_item(itens_armas.cajado, 1 , spr_items, names_weapons_info[2][0], names_weapons_info[2][1],names_weapons_info[2][2], names_weapons_info[2][3], names_weapons_info[2][4], names_weapons_info[2][5]);


ds_grid_add_item(item_inimigos.Slime_jelly, 6 , spr_items_inimigos, names_foe_info[0][0], names_foe_info[0][1],names_foe_info[0][2], names_foe_info[0][3], names_foe_info[0][4], names_foe_info[0][5]);
ds_grid_add_item(item_inimigos.orc_helmet, 54 , spr_items_inimigos, names_foe_info[1][0], names_foe_info[1][1],names_foe_info[1][2], names_foe_info[1][3], names_foe_info[1][4], names_foe_info[1][5]);

ds_grid_add_item(item_inimigos.orc_tooth, 12 , spr_items_inimigos, names_foe_info[2][0], names_foe_info[2][1],names_foe_info[2][2], names_foe_info[2][3], names_foe_info[2][4], names_foe_info[2][5]);

ds_grid_add_item(item_inimigos.Slime_jelly, 5 , spr_items_inimigos, names_foe_info[0][0], names_foe_info[0][1],names_foe_info[0][2], names_foe_info[0][3], names_foe_info[0][4], names_foe_info[0][4]);


#endregion