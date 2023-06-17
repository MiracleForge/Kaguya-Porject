// preciso criar um loop que vai passar pelo  array da quantidade de item dos npc
// e restaurar a quantidade original após certo periodo de tempo
if npc_select == Obj_inventario.grid_shop1 {
   
    npc_itens = [
        [
            itens_armas.little_bomb,
            5,
            spr_items,
            Obj_inventario.names_weapons_info[10][0],
            Obj_inventario.names_weapons_info[10][1],
            Obj_inventario.names_weapons_info[10][2],
            Obj_inventario.names_weapons_info[10][3],
            Obj_inventario.names_weapons_info[10][4],
            Obj_inventario.names_weapons_info[10][5]
        ]
    ];
} else if npc_select == Obj_inventario.grid_shop2 {
 
    npc_itens = [
        [
            itens_armas.little_bomb,
            3,
            spr_items,
            Obj_inventario.names_weapons_info[10][0],
            Obj_inventario.names_weapons_info[10][1],
            Obj_inventario.names_weapons_info[10][2],
            Obj_inventario.names_weapons_info[10][3],
            Obj_inventario.names_weapons_info[10][4],
            Obj_inventario.names_weapons_info[10][5]
        ],
        [
            itens_armas.little_bomb,
            5,
            spr_items,
            Obj_inventario.names_weapons_info[10][0],
            Obj_inventario.names_weapons_info[10][1],
            Obj_inventario.names_weapons_info[10][2],
            Obj_inventario.names_weapons_info[10][3],
            Obj_inventario.names_weapons_info[10][4],
            Obj_inventario.names_weapons_info[10][5]
        ]
    ];
}

if npc_select != undefined{
var j = 0;
repeat(array_length(npc_itens)) {
    ds_grid_add_to_shop(
        npc_itens[j][0],
        npc_itens[j][1],
        npc_itens[j][2],
        npc_itens[j][3],
        npc_itens[j][4],
        npc_itens[j][5],
        npc_itens[j][6],
        npc_itens[j][7],
        npc_itens[j][8]
    );
    j++;
}
}