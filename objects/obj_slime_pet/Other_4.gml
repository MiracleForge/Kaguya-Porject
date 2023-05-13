/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (room_get_name(obj_Player) != room_get_name(obj_slime_pet)) {
    obj_slime_pet.x = obj_Player.x;
    obj_slime_pet.y = obj_Player.y;
}