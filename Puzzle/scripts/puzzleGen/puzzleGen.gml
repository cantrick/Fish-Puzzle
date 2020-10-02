/// @description Game State Logic

function getNumMoves() {
	numMoves = 0;	
	
	
	
	return numMoves;
}

function createGrid() {
	for(i=0;i<8;i++) {
		for(j=0;j<8;j++) {
			tempNum = irandom(5)+1;
			ds_grid_set(global.bGrid,j,i,tempNum);
		}
	}
		numMoves = getNumMoves();
	
}

function deleteGrid() {
	elements = layer_get_all_elements("Gems");
	for (var i = 0; i < array_length_1d(elements); i++)
    {
     if (layer_get_element_type(elements[i]) == layerelementtype_instance)
        {
        var inst = layer_instance_get_instance(elements[i]);
        instance_destroy(inst);
        }
    }
}


function readGrid() {
	deleteGrid();
	
	tempX = 1502;
	tempY = 1536;
	
		for(i=0;i<8;i++) {
			for(j=0;j<8;j++) {
				
				if(tempX == 1606) {
					tempX = 1502;
					tempY += 13;
				}
				switch(ds_grid_get(global.bGrid,j,i)) {
					case 1:
						instance_create_layer(tempX,tempY,"Gems",oBlock1);
						break;
					case 2:
						instance_create_layer(tempX,tempY,"Gems",oBlock2);
						break;
					case 3:
						instance_create_layer(tempX,tempY,"Gems",oBlock3);
						break;
					case 4:
						instance_create_layer(tempX,tempY,"Gems",oBlock4);
						break;
					case 5:
						instance_create_layer(tempX,tempY,"Gems",oBlock5);
						break;
					case 6:
						instance_create_layer(tempX,tempY,"Gems",oBlock6);
						break;
					}
					tempX += 13;
				
			}
		}
		//then add the cursor
		//instance_create_layer(1526,1560,"Gems",oCursor);
}


function checkRight(cX,cY) {
	c1 = ds_grid_get(global.bGrid,cX,cY);
	c2 = ds_grid_get(global.bGrid,cX+1,cY);
	c3 = ds_grid_get(global.bGrid,cX+2,cY);
	
	
	if(c1 != "X") {
		if(c1 == c2 and c2 == c3) {
			show_debug_message("X: " + string(cX) + " - Y: " + string(cY));
			return true;	
		} else {
			return false;	
		}
	}
}

function checkLeft(cX,cY) {
	c1 = ds_grid_get(global.bGrid,i,j);
	c2 = ds_grid_get(global.bGrid,i-1,j);
	c3 = ds_grid_get(global.bGrid,i-2,j);
	
	if(c1 != "X") {
		if(c1 == c2 and c2 == c3) {
			return true;	
		} else {
			return false;	
		}
	}
}

function checkUp(cX,cY) {
	c1 = ds_grid_get(global.bGrid,i,j);
	c2 = ds_grid_get(global.bGrid,i,j-1);
	c3 = ds_grid_get(global.bGrid,i,j-2);
	
	if(c1 != "X") {
		if(c1 == c2 and c2 == c3) {
			return true;	
		} else {
			return false;	
		}
	}
}

function checkDown(cX,cY) {
	c1 = ds_grid_get(global.bGrid,cX,cY);
	c2 = ds_grid_get(global.bGrid,cX,cY+1);
	c3 = ds_grid_get(global.bGrid,cX,cY+2);
	
	if(c1 != "X") {
		if(c1 == c2 and c2 == c3) {
			return true;	
		} else {
			return false;	
		}
	}
}

function findMatch() {
	hasMatch = false;
	
	for(i=0;i<8;i++) {
		for(j=0;j<8;j++) {
			if((i == 0 or i == 1) and (j == 0 or j == 1)) {
				if (checkRight(i,j) or checkDown(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
				
			} else if((i == 6 or i == 7) and (j == 0 or j == 1)) {
				if (checkLeft(i,j) or checkDown(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
			} else if((i == 0 or i == 1) and (j == 6 or j == 7)) {
				if (checkRight(i,j) or checkUp(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
			} else if((i == 6 or i == 7) and (j == 6 or j == 7)) {
				if (checkLeft(i,j) or checkUp(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
			} else if (i == 0 or i == 1) {
				if (checkRight(i,j) or checkUp(i,j) or checkDown(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
			} else if (i == 6 or i == 7) {
				if (checkLeft(i,j) or checkUp(i,j) or checkDown(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
			} else if (j == 0 or j == 1) {
				if (checkRight(i,j) or checkLeft(i,j) or checkDown(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
			} else if (j == 6 or j == 7) {
				if (checkRight(i,j) or checkLeft(i,j) or checkUp(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
			} else {
				if (checkRight(i,j) or checkLeft(i,j) or checkUp(i,j) or checkDown(i,j)) {
					//if true, replace one and then exit the function
					tempNum = irandom(5)+1;
					ds_grid_set(global.bGrid,i,j,tempNum);
					hasMatch = true;
					break;
				}
			}
		}
		
		if(hasMatch) {
			break;
		}
		
	}
	
	if(!hasMatch) {
		noMatches = true;
	}
}	


function findMoveMatch() {
	//returns x and y values for the grid, and the direction which the match goes:
	//i = y
	//j = x
	
	//left to right matches
	
	for(i=0;i<8;i++) {
		combo = 0;
		for(j=0;j<8;j++) {
			if(j == 7) {
				if(combo >= 2) {
					for(c=0;c<=combo;c++) {
						ds_grid_set(global.bGrid,j-c,i,"X");
					}
				}
			} else {
				if((ds_grid_get(global.bGrid,j,i) == ds_grid_get(global.bGrid,j+1,i)) and ds_grid_get(global.bGrid,j,i) != "X") {

					combo++;
				} else {
					if(combo >= 2) {
						for(c=0;c<=combo;c++) {
							ds_grid_set(global.bGrid,j-c,i,"X");
						}
					}
					
					combo = 0;
				}
			}
		}	
	}
	
	//up and down matches
	for(i=0;i<8;i++) {
		combo = 0;
		for(j=0;j<8;j++) {
			if(j == 7) {
				if(combo >= 2) {
					for(c=0;c<=combo;c++) {
						ds_grid_set(global.bGrid,i,j-c,"X");
					}
				}
			} else {
				if((ds_grid_get(global.bGrid,i,j) == ds_grid_get(global.bGrid,i,j+1)) and ds_grid_get(global.bGrid,i,j) != "X") {

					combo++;
				} else {
					if(combo >= 2) {
						for(c=0;c<=combo;c++) {
							ds_grid_set(global.bGrid,i,j-c,"X");
						}
					}
					
					combo = 0;
				}
			}
		}	
	}
}	

function gemGravity() {
	//if you're not on the very bottom row, and you have an empty spot beneath you, fall down
	for(i=1;i<8;i++) {
		for(j=0;j<8;j++) {
			if (ds_grid_get(global.bGrid,j,i) == "X") {
				//move down, set current spot to X
				ds_grid_set(global.bGrid,j,i,ds_grid_get(global.bGrid,j,i-1));
				ds_grid_set(global.bGrid,j,i-1,"X");
			}
		}
	}
	
	//then run a for loop to check only the top row to generate new gems
	
	for(i=0;i<8;i++) {
		tempNum = irandom(5)+1;
		if (ds_grid_get(global.bGrid,i,0) == "X") {
				//move down, set current spot to X
				ds_grid_set(global.bGrid,i,0,tempNum);
			}
	}
	
}


function puzzle_main(difficulty) {

	if(!gridCreated) {
		createGrid();
		// Let's do some work to make sure there aren't any existing matches
		// Used only for initial board creation
		while(!noMatches) {
			findMatch();
		}
		readGrid();
		gridCreated = true;
	}
	
	findMoveMatch();
	gemGravity();
	readGrid();
}