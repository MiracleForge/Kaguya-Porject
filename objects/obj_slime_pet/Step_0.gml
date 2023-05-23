active_pet = (Obj_inventario.grid_active[# pet_info.item, 0] != -1);


if active_pet{
script_execute(state);

estamina = clamp(estamina, 0 , max_stamina[level]);

if obj_Player.transformed == false {
    if level < 5 && xp >= max_exp[level] {
        xp -= max_exp[level];
        level += 1;
        
        vida = max_vida[level];
        estamina = max_stamina[level];
        transform = transformation_time[level];
    }
}

if level == 5 {
    level = 5;
    xp = 0;
}

}

