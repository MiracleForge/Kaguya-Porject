
script_execute(state);

depth = bbox_bottom;

estamina = clamp(estamina, 0 , max_stamina[level]);

if level < 5{
     
if xp >= max_exp[level]{
	
	xp = xp -max_exp[level];
	level +=1;
	
	vida = max_vida[level];
	estamina = max_stamina[level];
	

	
	
	}
	
}else if level = 5 {	
	level = 5;
	xp = 0;
	
	}