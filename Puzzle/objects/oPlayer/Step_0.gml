/// @description Movement Code
if (global.gameState == 1) {

	function spriteFlip() {
	
		if(keyUp) {
			image_speed = 0.25;
			sprite_index = sPlayerUp;
		
		} else if(keyDown) {
			image_speed = 0.25;
			sprite_index = sPlayerDown;
		
		} else if(keyLeft) {
			image_speed = 0.25;
			sprite_index = sPlayerLeft;
		
		} else if(keyRight) {
			image_speed = 0.25;
			sprite_index = sPlayerRight;
		} else {
			image_speed = 0;
		}
	
	}



	// You can write your code in this editor
	keyUp = keyboard_check(ord("W"));
	keyDown = keyboard_check(ord("S"));
	keyLeft = keyboard_check(ord("A"));
	keyRight = keyboard_check(ord("D"));

	screenR = oViewMove.x+80;
	screenL = oViewMove.x-80;
	screenU = oViewMove.y-80;
	screenD = oViewMove.y+80;


	hspeed = (keyRight - keyLeft) * spd;

	vspeed = (keyDown - keyUp) * spd;


	//Room Transition
	if (x > screenR) {
		oViewMove.x += 160;
	} else if (x < screenL) {
		oViewMove.x -= 160;
	}

	if (y > screenD) {
		oViewMove.y += 160;
	} else if (y < screenU) {
		oViewMove.y -= 160;
	}

	spriteFlip();
	
} else if(global.gameState == 2) {
	
	//grid movement with cursor
	keySelect = keyboard_check_pressed(ord("W"));
	keyCancel = keyboard_check_pressed(ord("E"));
	
	keyUp = keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(vk_down);
	keyLeft = keyboard_check_pressed(vk_left);
	keyRight = keyboard_check_pressed(vk_right);
	
	if(!isSelecting) {
		if (oCursor.y > 1536) {
			if(keyUp) {
				oCursor.y -= 13;
				oCursor.currCell[1] -= 1;
			} 
		
		}
	
		if (oCursor.y < 1625) {
			if(keyDown) {
				oCursor.y += 13;
				oCursor.currCell[1] += 1;
			} 
		
		}
	
		if (oCursor.x > 1502) { 
			if(keyLeft) {
				oCursor.x -= 13;
				oCursor.currCell[0] -= 1;
			} 
		
		}
	
		if (oCursor.x < 1591) { 
			if(keyRight) {
				oCursor.x += 13;
				oCursor.currCell[0] += 1;
			} 
		
		}
	}
	
	if(keySelect) { isSelecting = true; }
	
	if (isSelecting) {
		selectedCell = oCursor.currCell;
		
		if (oCursor.y > 1536) {
			if(keyUp) {
				moveCell = [selectedCell[0],selectedCell[1]-1];
				oGameLoop.flipCells(selectedCell,moveCell);
				oCursor.y -= 13;
				oCursor.currCell[1] -= 1;
				isSelecting = false;
			}
		}
	
		if (oCursor.y < 1625) {
			if(keyDown) {
				moveCell = [selectedCell[0],selectedCell[1]+1];
				oGameLoop.flipCells(selectedCell,moveCell);
				oCursor.y += 13;
				oCursor.currCell[1] += 1;
				isSelecting = false;
			} 
		
		}
	
		if (oCursor.x > 1502) { 
			if(keyLeft) {
				moveCell = [selectedCell[0]-1,selectedCell[1]];
				oGameLoop.flipCells(selectedCell,moveCell);
				oCursor.x -= 13;
				oCursor.currCell[0] -= 1;
				isSelecting = false;
			} 
		
		}
	
		if (oCursor.x < 1591) { 
			if(keyRight) {
				moveCell = [selectedCell[0]+1,selectedCell[1]];
				oGameLoop.flipCells(selectedCell,moveCell);
				oCursor.x += 13;
				oCursor.currCell[0] += 1;
				isSelecting = false;
			} 
		
		}
		
		
		
	}
	
}

