/// @description Insert description here
// You can write your code in this editor
if (global.gameState == 1) {
	
} else if (global.gameState == 2) {
	//move to bejeweled screen area
	x = 1552;
	y = 1600;
} else {
	//move to title screen area	
}


halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight = camera_get_view_height(view_camera[0]) / 2;
camera_set_view_pos(view_camera[0],x - halfViewWidth, y - halfViewHeight);