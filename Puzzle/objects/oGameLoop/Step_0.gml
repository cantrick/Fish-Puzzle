/// @description Game State Logic

function flipCells(cell1,cell2) {
	tempNum = ds_grid_get(global.bGrid,cell1[0],cell1[1]);
	
	ds_grid_set(global.bGrid,cell1[0],cell1[1],ds_grid_get(global.bGrid,cell2[0],cell2[1]));
	ds_grid_set(global.bGrid,cell2[0],cell2[1],tempNum);
	
	readGrid();
}


if(global.gameState == 0) {
	//main menu state
	
} else if(global.gameState == 1) {
	//walking around town state
	
} else if(global.gameState == 2) {
	
	puzzle_main(3);
	
}