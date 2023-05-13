/// @description Inserir descrição aqui

if global.pauseON ==true {	exit;}

// increment time
seconds += time_increment;
minutes = seconds/60
hours = minutes/60;

if draw_daylight{	
	#region
	var _darks, colours, _pstart, _pend;
	if (hours > phase_day.sunrise and hours <= phase_day.daytime){
		_darks = [max_darkness, 0.2];
		colours = [merge_color(c_black, c_navy, 0.3), c_orange];
		_pstart = phase_day.sunrise;
		_pend  =  phase_day.daytime;
	}else if (hours > phase_day.daytime and hours <= phase_day.sunset){	
		_darks = [0.2,0,0,0,0.2];
		colours = [c_orange, c_yellow, c_white,c_orange,c_navy];
		_pstart = phase_day.daytime;
		_pend =  phase_day.sunset;
		}else if (hours > phase_day.sunset and hours <= phase_day.nightime) {
		_darks = [0.2, max_darkness];
		colours = [c_orange, c_navy, merge_color(c_black, c_navy, 0.3),];
		_pstart = phase_day.sunset;
		_pend =  phase_day.nightime;
		}else{	
		_darks = [max_darkness];
		colours = [merge_color(c_black, c_green, 0.3)];
		_pstart = phase_day.nightime;
		_pend =  phase_day.sunrise;
		}
		#endregion
#region
// colours
if (_pstart == phase_day.nightime) {light_colour = colours[0];}
else {
	 var _cc = ((hours - _pstart) /  (_pend - _pstart)) * (array_length_1d(colours)-1); 
	 var _c1 = colours[	floor(_cc)];
	 var _c2 = colours [ceil(_cc)];
 
	 light_colour = merge_color(_c1, _c2, _cc - floor(_cc));
}
 
 //darkness
 if (_pstart == phase_day.nightime) {darkness = _darks[0];}
 else{
	  var _dd = ((hours - _pstart) /  (_pend - _pstart)) * (array_length_1d(_darks)-1); 
	 var _d1 = _darks[floor(_dd)];
	 var _d2 = _darks [ceil(_dd)];
 
	 darkness = lerp(_d1, _d2, _dd-floor(_dd));
 }
#endregion
}



//cicle check
	
if (hours >= 24) {	
	seconds = 0;
	day += 1;
	}
