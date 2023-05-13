/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (chest_open) {
    instance_create_layer(obj_Player.x, obj_Player.y - 20, "Instances", dropChest);
    
    for (var i = 0; i < 3; i++) {
        var coin_type;
        switch (i) {
            case 0:
                coin_type = oCoin_gold;
                break;
            case 1:
                coin_type = oCoin_silver;
                break;
            case 2:
                coin_type = oCoin_Nebulonita;
                break;
        }
        
        var num_coins = baus[bau_atual][i];
        for (var j = 0; j < num_coins; j++) {
            instance_create_layer(obj_Player.x, obj_Player.y - 20, "Instances", coin_type);
        }
    }
    
    chest_open = false;
    chest_triggered = true;
}





/*

	 if   chest_open ==true  {
		
			instance_create_layer(obj_Player.x, obj_Player.y -20,"Instances", dropChest)
			
			repeat (gold_drops){	
				instance_create_layer(obj_Player.x, obj_Player.y -20,"Instances", oCoin_gold)
				}
			repeat (silver_drops){	
				instance_create_layer(obj_Player.x, obj_Player.y -20,"Instances", oCoin_silver)
				}
			repeat (nebulonita_drops){	
				instance_create_layer(obj_Player.x, obj_Player.y -20,"Instances", oCoin_Nebulonita)
				}
			
		 chest_open = false;
		 chest_triggered = true;
		}
	
	
	

	