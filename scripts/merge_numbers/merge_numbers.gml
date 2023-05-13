// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
///@arg num1
	///@arg num2
	///@arg amount
function merge_numbers(){
	
	
	
	var num1 = argument0;
	var num2 = argument1;
	var amount = argument2;
	
    var _diff = num1 - num2;
	var _merged = num1 - (_diff * amount);
	
	return _merged;
}