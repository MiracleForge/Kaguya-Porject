/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (other.vida < other.max_vida){	
	other.vida +=1;
	
	instance_destroy();
	
	effect_create_above(ef_ring, x , y , 0.1, c_silver); //efeito de destroição
	}