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

// description e animations
ShowingDespription = false;
Sequence = undefined;
silly_animation = false;
silly_count = 0;


#endregion

// equip Items

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



enum itens_armas{	
	espada ,
	arco,
	cajado ,
	obj_pickup_heart,
	altura	
	}
	
enum item_inimigos {	
	Slime_jelly,
	orc_helmet,
	orc_tooth,
	altura
	}	
	
enum Infos{	
	item,              //subimage
	quantity,         //quantity
	sprite,          //sprite
	name,           //name
	discription,   //discription
	altura
	}
	




#region               //--------- Grid create, inventory names e discriptions  ------//
grid_itens = ds_grid_create(Infos.altura,total_slots);
ds_grid_set_region(grid_itens, 0,0, Infos.altura -1, total_slots -1, -1);



// Infos.name and Infos.discriptions  |  itens_armas 
// names_weapons_info[0][0] for names
// and names_weapons_info[0][1] for discriptions
names_weapons_info = [   
	["Scout Saber", "A saber used by explorers, ideal for quick but not precise attacks"],
    ["Hunter Bow", "Made of wood and string and not so good"],
    ["Rod of Whispers", "Bring insanity for the weak ones"],
    ["Hearth", "Piece of someone heart"]
];

// Infos.name and Infos.discriptions  |  itens_inimigos 
// names_foe_info[0][0] for names
// names_foe_info[0][1] for discriptions
names_foe_info = [  
	["Slime Jelly", "A viscous and shiny substance"],
    ["Orc Helmet", "Rust and decay piece of metal"],
    ["Orc Tooth", "Someone maybe need a new one"]
];


// add item to grid argument 0 = item,
//argument 1 = quantity, 
//argument 2 = sprite,
//argument 3 = name,
//argument 4 = discription




ds_grid_add_item(itens_armas.arco, 1 , spr_items, names_weapons_info[1][0],names_weapons_info[1][1]);

ds_grid_add_item(itens_armas.espada, 52 , spr_items, names_weapons_info[0][0], names_weapons_info[0][1]);
ds_grid_add_item(itens_armas.cajado, 98 , spr_items, names_weapons_info[2][0], names_weapons_info[2][1]);
ds_grid_add_item(itens_armas.espada, 32 , spr_items, names_weapons_info[0][0], names_weapons_info[0][1]);

ds_grid_add_item(item_inimigos.Slime_jelly, 6 , spr_items_inimigos, names_foe_info[0][0], names_foe_info[0][1]);
ds_grid_add_item(item_inimigos.orc_helmet, 54 , spr_items_inimigos, names_foe_info[1][0], names_foe_info[1][1]);

ds_grid_add_item(item_inimigos.orc_tooth, 12 , spr_items_inimigos, names_foe_info[2][0], names_foe_info[2][1]);

ds_grid_add_item(item_inimigos.Slime_jelly, 5 , spr_items_inimigos, names_foe_info[0][0], names_foe_info[0][1]);
ds_grid_add_item(itens_armas.obj_pickup_heart, 5 ,spr_life_recorver,names_weapons_info[3][0], names_weapons_info[3][1]);

#endregion