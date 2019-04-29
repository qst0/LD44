/// @desc qstPixel


debug = false;
layer_set_visible("Triggers", false);
layer_set_visible("GobletTriggers", false);

timeLeft = 165; //2:44

pixelCount = 0;
step = 0;

gameMaxVertSpeed = 4;

drySpeed = 20;
pixelScale = 3;
playerIconFrame = 0;
playerIconFrames = sprite_get_number(sprPlayerIcon);

//custom sprite font
/*
mapString = "0123456789-.:?!abcdefghijklmnopqrstuvwxyz";
fontQst = font_add_sprite_ext(sprFontQst, mapString, false, 2);
*/ //  Me No working?
draw_set_font(StarbounD);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
