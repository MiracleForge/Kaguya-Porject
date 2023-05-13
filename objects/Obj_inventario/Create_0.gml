/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
 
global.coin = (0);
global.silver = (0);
global.nebulite = (0);

global.escala = 3;
inventory = false;


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

desc_x = 1190;
desc_y =  115 ;



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
	

	
#region   /add inf description




#endregion
	
grid_itens = ds_grid_create(Infos.altura,total_slots);
ds_grid_set_region(grid_itens, 0,0, Infos.altura -1, total_slots -1, -1);




item_names = [  "Scout Saber", 
"Hunter Bow",
"Rod of Whispers", 
" Hearth",  
"Slime Jelly",
"Orc Helmet",
"Orc Tooth"

];

item_Info = [ " A saber used by explorers,  ideal for quick but not precise attacks ",
"Made of wood and string and not so good ",
"Bring insanity for the weak ones",
"Piece of someone heart",
"A viscous and shiny substance",
"Rust and deacay piece of metal",
"Someone maybe need a new one",

]






ds_grid_add_item(itens_armas.arco, 1 , spr_items, "Hunter Bow", "Made of wood and string and not so good ");

ds_grid_add_item(itens_armas.espada, 52 , spr_items, "Scout Saber", " A saber used by explorers,  ideal for quick but not precise attacks ");
ds_grid_add_item(itens_armas.cajado, 98 , spr_items, "Rod of Whispers", "Bring insanity for the weak ones");
ds_grid_add_item(itens_armas.espada, 32 , spr_items, "Scout Saber", " A saber used by explorers,  ideal for quick but not precise attacks ");

ds_grid_add_item(item_inimigos.Slime_jelly, 6 , spr_items_inimigos, "Slime Jelly", "A viscous and shiny substance");
ds_grid_add_item(item_inimigos.orc_helmet, 54 , spr_items_inimigos, "Orc Helmet", "Rust and deacay piece of metal");

ds_grid_add_item(item_inimigos.orc_tooth, 12 , spr_items_inimigos, "Orc Tooth", "Someone maybe need a new one");

ds_grid_add_item(item_inimigos.Slime_jelly, 5 , spr_items_inimigos, "Slime Jelly", "A viscous and shiny substance");
ds_grid_add_item(itens_armas.obj_pickup_heart, 5 ,spr_life_recorver," Hearth", "Piece of someone heart");

