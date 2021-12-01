/// @description Insert description here
// You can write your code in this editor


//show timer bar for bejeweled mode
if(global.gameState == 0) {
	//main menu state
	
} else if(global.gameState == 1) {
	//walking around town state
	
} else if(global.gameState == 2) {
	
	//this timer sucks, not out of 100 like it needs to be
	timerDiv = global.puzTime div 10;
	show_debug_message(timerDiv);
	timerPcntg = ((timer/room_speed)*10)/timerDiv;
	
	show_debug_message(timer);
	show_debug_message(timerPcntg);
	
	draw_healthbar(450,500,550,510,timerPcntg,custPurp,custWhite,custWhite,0,true,true);
	
	if (timer > 0) {
	   timer --;
	}
}