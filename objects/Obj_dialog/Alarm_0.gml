/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor 
if inicializar ==true{
if caractere < string_length(text_grid[# conversation.text, pagina]){
	
caractere ++;
alarm[0] = 1;
}
}
// Lógica do alarme 0
if (alarm[0] == 0) {
    // Reproduzir som da caixa de diálogo
    var _snd = choose(snd_Hi1, snd_Hi2, snd_Hi3); // Escolher som
    audio_play_sound(_snd, 1, 0); // Reproduzir som com volume 1 e loop 0
    alarm[0] = -1; // Resetar o alarme
}