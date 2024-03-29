/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region-------------------------------------- Shop and coins System --------------------------------------
 // coin 
global.coin = (0);
global.silver = (0);
global.nebulite = (0);


#endregion

#region ------------------------------------- Inventory base ---------------------------------------------
global.item = noone;
global.escala = 3;
inventory = false;
//distnacia entre a borda da sprite e do primeiro slot
x_inventory = 113 * global.escala;
y_inventory = 57 * global.escala;

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

#region ------------------------------------- SLOTS EQUIPS / POTIONS/ARMORS/WEAPONS ----------------------
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

shopOpen = false;
//distnacia entre a borda da sprite e do primeiro slot
x_Boxinventory = 23 * global.escala;
y_Boxinventory = 10 * global.escala;
// total numbers of slots
slotboxX = 8;
slotBoxY = 2;
total_slotBox = slotboxX * slotBoxY;
size_slotsBox = 20 * global.escala;
bufferBox = 6 * global.escala;
// length and hight sprite vs camera scale or room Idk
inventoryBox_L = sprite_get_width(spr_box_inventory_sell) * global.escala;
inventoryBox_A = sprite_get_height(spr_box_inventory_sell) * global.escala;

 sprbox = 0;
 petbox = false;

 
 //BUY SYSTEM - background
 inventoryback_L = sprite_get_width(spr_back_shop) * global.escala;
 inventoryback_A = sprite_get_height(spr_back_shop) * global.escala;
 
 
 //cards inventory buy
 
 //cards sizes
 size_card_x = 48 *global.escala;
 size_card_y = 68 *global.escala;
 // origin point of cards drawn
 x_card = 39 * global.escala;
 y_card = 49 * global.escala;
 // distance bedween cards
 buffercardx = 4 * global.escala; 
 buffercardy = 0 * global.escala;
 // numbers of cards
 cardsH = 3;
 cardsV = 2;
 total_cards = cardsH * cardsV;
 is_showing = false;
 playerStoreChoice = -1;
selectedshopItem = -1;
 
 //cards loops itens info
 inventorycard_L = sprite_get_width(spr_sell_box) * global.escala;
 inventorycard_A = sprite_get_height(spr_sell_box) * global.escala;
 
 buybutton_L = sprite_get_width(spr_buyButton) * global.escala;
 buybutton_A = sprite_get_height(spr_buyButton) * global.escala;


#endregion

#region ------------------------------------- Enum itens -------------------------------------------------
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
#region ------------------------------------- pet's inventory --------------------------------------------
petinventory = false;
x_petinv = 11 * global.escala;
y_petinv = 9 * global.escala;

// total numbers of slots
petslots_h = 8;
petslots_v = 3;
pettotal_slots = petslots_h * petslots_v;
size_petslots = 24 * global.escala;
petbuffer = 2 * global.escala;

// length and hight sprite vs camera scale or room Idk
petbelly_L = sprite_get_width(spr_inventory_belly) * global.escala;
petbelly_A = sprite_get_height(spr_inventory_belly) * global.escala;

petInvFull = false;
// mouse selector
mb_pet_select = -1;
mb_pet_posselect = -1;
mb_pet_quant = -1;
#endregion

#region  ---------------------------------- Craft Inventory ------------------------------------------------
//Craft slots coord 6, 4, 11
craft_L = sprite_get_width(spr_craft)* global.escala;
craft_A = sprite_get_height(spr_craft)* global.escala;
x_craft = 6 * global.escala;
y_craft = 4 * global.escala;
//Craft slot 
craft_h = 2
craft_y = 2
total_craftSlot = craft_h * craft_y;
size_craftslot = 16 * global.escala;
craftbuffer = 12 *global.escala;
//mouse selectores
mb_craft_select = -1;
mb_craft_posselect = -1;
mb_craft_quant = -1;
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

#region //////////////////////// - Shop grids - ////////////////////////////////////////////////////////////
grid_shop1 = ds_grid_create(Infos.altura,total_cards);
ds_grid_set_region(grid_shop1,0,0, Infos.altura -1, total_cards - 1, -1);

grid_shop2 = ds_grid_create(Infos.altura,total_cards);
ds_grid_set_region(grid_shop2,0,0, Infos.altura -1, total_cards - 1, -1);
#endregion

#region /////////////////////////////// - Pet grid - ///////////////////////////////////////////////////////
// Types of pets
grid_pet = ds_grid_create(pet_info.height, total_petS);
ds_grid_set_region(grid_pet, 0,0,pet_info.height - 1, total_petS -1, -1);
// Show the summonet pet
grid_active = ds_grid_create(pet_info.height, total_active);
ds_grid_set_region(grid_active, 0, 0, pet_info.height - 1, total_active -1, -1);
// pet's inventory
grid_petiInv = ds_grid_create(Infos.altura,pettotal_slots);
ds_grid_set_region(grid_petiInv, 0,0, Infos.altura -1, pettotal_slots -1, -1);
#endregion

#region //////////////////////// - Craft grid /////////////////////////////////////////////////////////////
grid_craft = ds_grid_create(Infos.altura, total_craftSlot);
ds_grid_set_region(grid_craft, 0,0, Infos.altura -1, total_craftSlot -1, -1);
#endregion

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
	["Scout Saber", "A saber used by explorers, ideal for quick but not precise attacks. " , true, 1, 1,10 ],
    ["Hunter Bow", "Made of wood and string and not so good.",true,1, 1, 20],
    ["Rod of Whispers", "Bring insanity for the weak ones.",true, 1, 1, 20],
	["Gooheal Potion", " A strange and gooey texture clinging to the edges of the flask." , true, 2, 1, 70 ],
	["Feline Shield", "A symbol of honor and protection.", true, 1,1, 25],
	["Slime Essence Ring", "Crafted from enchanted slime essence. Looks kind familiar", true, 1, 5, 80],
	["Cute Ribbon", " A ribbon made sweet with tenderness." , true, 2,1, 30 ],
	["Cute Dress", " Cute dress made by hand." , true,2, 1, 40],
	["Cute Pants", " Cute pants with little flowers", true, 2, 1, 50],
	["Old shoes", "A old girl shoes" , true, 2, 1, 60],
	["Instabooom", " Small explosive device with an unpredictable twist." , true, 1, 2,21]
	
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
/*
#region //------------- Shop Intrances ----------------------------------//
ds_grid_add_to_shop(itens_armas.little_bomb, 5 , spr_items, names_weapons_info[10][0],names_weapons_info[10][1],names_weapons_info[10][2], names_weapons_info[10][3], names_weapons_info[10][4], names_weapons_info[10][5]);
ds_grid_add_to_shop(itens_armas.old_bots, 1 , spr_items, names_weapons_info[9][0],names_weapons_info[9][1],names_weapons_info[9][2], names_weapons_info[9][3], names_weapons_info[9][4], names_weapons_info[9][5]);
ds_grid_add_to_shop(item_inimigos.Slime_jelly, 10 , spr_items_inimigos, names_foe_info[0][0], names_foe_info[0][1],names_foe_info[0][2], names_foe_info[0][3], names_foe_info[0][4], names_foe_info[0][5]);
ds_grid_add_to_shop(itens_armas.small_health_pot, 10 , spr_items, names_weapons_info[3][0],names_weapons_info[3][1],names_weapons_info[3][2], names_weapons_info[3][3], names_weapons_info[3][4], names_weapons_info[3][5]);
ds_grid_add_to_shop(itens_armas.cat_shield, 1 , spr_items, names_weapons_info[4][0],names_weapons_info[4][1],names_weapons_info[4][2], names_weapons_info[4][3], names_weapons_info[4][4], names_weapons_info[4][5]);
ds_grid_add_to_shop(itens_armas.arco, 1 , spr_items, names_weapons_info[1][0],names_weapons_info[1][1],names_weapons_info[1][2], names_weapons_info[1][3], names_weapons_info[1][4], names_weapons_info[1][5]);
#endregion
*/
ds_grid_add_itemPET(itens_armas.ring_slime1, 5 , spr_items, names_weapons_info[5][0],names_weapons_info[5][1],names_weapons_info[5][2], names_weapons_info[5][3], names_weapons_info[5][4], names_weapons_info[5][5]);
ds_grid_add_itemPET(itens_armas.little_bomb, 1 , spr_items, names_weapons_info[10][0],names_weapons_info[10][1],names_weapons_info[10][2], names_weapons_info[10][3], names_weapons_info[10][4], names_weapons_info[10][5]);
ds_grid_add_itemPET(itens_armas.old_bots, 1 , spr_items, names_weapons_info[9][0],names_weapons_info[9][1],names_weapons_info[9][2], names_weapons_info[9][3], names_weapons_info[9][4], names_weapons_info[9][5]);
ds_grid_add_itemPET(itens_armas.ring_slime1, 5 , spr_items, names_weapons_info[5][0],names_weapons_info[5][1],names_weapons_info[5][2], names_weapons_info[5][3], names_weapons_info[5][4], names_weapons_info[5][5]);
ds_grid_add_itemPET(itens_armas.little_bomb, 1 , spr_items, names_weapons_info[10][0],names_weapons_info[10][1],names_weapons_info[10][2], names_weapons_info[10][3], names_weapons_info[10][4], names_weapons_info[10][5]);

ds_grid_add_itemPET(itens_armas.small_health_pot, 5 , spr_items, names_weapons_info[3][0],names_weapons_info[3][1],names_weapons_info[3][2], names_weapons_info[3][3], names_weapons_info[3][4], names_weapons_info[3][5]);
ds_grid_add_itemPET(item_inimigos.apple_bite, 2 , spr_items_inimigos, names_foe_info[3][0], names_foe_info[3][1],names_foe_info[3][2], names_foe_info[3][3], names_foe_info[3][4], names_foe_info[3][5]);
ds_grid_add_itemPET(itens_armas.cat_shield, 1 , spr_items, names_weapons_info[4][0],names_weapons_info[4][1],names_weapons_info[4][2], names_weapons_info[4][3], names_weapons_info[4][4], names_weapons_info[4][5]);




ds_grid_add_item(itens_armas.ring_slime1, 5 , spr_items, names_weapons_info[5][0],names_weapons_info[5][1],names_weapons_info[5][2], names_weapons_info[5][3], names_weapons_info[5][4], names_weapons_info[5][5]);
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