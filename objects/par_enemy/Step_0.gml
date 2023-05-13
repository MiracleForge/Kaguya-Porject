if global.pauseON == true {exit;}

script_execute(state);



if vida <= 0{
    obj_slime_pet.xp += 50;
	
	 var random_index = irandom(array_length(possible_itens) - 1);
    var random_item = possible_itens[random_index];
    if (random(1) <= 0.45) {
      if Slime_grande{  instance_create_layer(x, y, "instances", random_item);
	  }
	
		
    }
    instance_destroy();
}