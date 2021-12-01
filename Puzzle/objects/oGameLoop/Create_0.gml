/// @description Global Variables
randomize();

global.gameState = 2;
global.debug = true;
global.bGrid = ds_grid_create(8,8);
global.puzTime = 30;


gridCreated = false;
noMatches = false;

custLBlue = make_color_rgb(70,135,143);
custGreen = make_color_rgb(148,227,68);
custPurp = make_color_rgb(51,44,80);
custWhite = make_color_rgb(226,243,228);


timer = room_speed * global.puzTime;