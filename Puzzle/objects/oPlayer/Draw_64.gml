/// @description Insert description here
// You can write your code in this editor

if (global.debug == true) {
	draw_text(3,10,"Player X: " + string(x));
	draw_text(3,22,"ViewObj X: " + string(oViewMove.x));
	draw_text(3,34,"ViewObj Y: " + string(oViewMove.y));
	draw_text(3,46,"screenR: " + string(view_xview));
	draw_text(3,58,"screenL: " + string(view_yview));
	
	if(global.gameState == 2) {
		draw_text(3,70,"cursX: " + string(oCursor.x));
		draw_text(3,82,"cursY: " + string(oCursor.y));
		draw_text(3,94,"cCell: " + string(oCursor.currCell));
		draw_text(3,106,"selCell: " + string(selectedCell));
	}
	
	
	gx = 3;
	gy = 300;
	for(i=0;i<8;i++) {
		for(j=0;j<8;j++) {
			draw_text(gx,gy,string(ds_grid_get(global.bGrid,j,i)));
			gx += 12;
		}
		gy += 14;
		gx = 3;
	}
}