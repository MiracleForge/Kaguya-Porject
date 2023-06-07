/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var scale = 1 + z/45;
image_xscale = scale;
image_yscale = scale;

z += zSpd - zGravity;

zSpd *= 0.9;

if z >= 0 and !fall{	
	zSpdMax *=0.5;
	zSpd = zSpdMax;
   
}  

z = clamp(z,0, 99999);

count_destroy ++;

if count_destroy > 180 {
	instance_create_layer(x,y, "Instances", obj_explosion1);
	instance_destroy();
	}
	

