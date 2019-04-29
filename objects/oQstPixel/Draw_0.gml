/// @desc draw the pixels we have made
if room != roomGame {
	return;
}

if playerHealthPercent > 90 {
	cursor_sprite = sprBoneCursor9;
} else if playerHealthPercent > 80 {
	cursor_sprite = sprBoneCursor8;
} else if playerHealthPercent > 70 {
	cursor_sprite = sprBoneCursor7;
} else if playerHealthPercent > 60 {
	cursor_sprite = sprBoneCursor6;
} else if playerHealthPercent > 50 {
	cursor_sprite = sprBoneCursor5;
} else if playerHealthPercent > 40 {
	cursor_sprite = sprBoneCursor4;
} else if playerHealthPercent > 30 {
	cursor_sprite = sprBoneCursor3;
} else if playerHealthPercent > 20 {
	cursor_sprite = sprBoneCursor2;
} else if playerHealthPercent > 10 {
	cursor_sprite = sprBoneCursor1;
} else if playerHealthPercent == 0 {
	cursor_sprite = sprBoneCursor0;
}
window_set_cursor(cr_none);


/*
draw_rectangle(
	floor(mouse_x / 8) * 8,
	floor(mouse_y / 8) * 8,
	floor(mouse_x / 8) * 8 + 8,
	floor(mouse_y / 8)* 8 + 8, false);
*/

playerToMouseDistance = point_distance(mouse_x, mouse_y, oPlayer.x, oPlayer.y);

if mouse_check_button_pressed(mb_left) {
	//despawnOffSet = step - 1;
}

//Click to make a pixel
if mouse_check_button(mb_left) && oPlayer.playerHealth != 0
	//&& oQstPixel.playerToMouseDistance > 24
	//&& oQstPixel.playerToMouseDistance < 240
	{
	oPlayer.playerHealth--;
	// How we'll save the draw pixels [x, y, color]
	//newPixel = [floor(mouse_x / 8) * 8, floor(mouse_y / 8) * 8, c_red]
	if !layer_exists("Pixels") {
		layer_create(150, "Pixels")
	}
	
	newPixel = instance_create_layer(
		floor(mouse_x / pixelScale) * pixelScale,
		floor(mouse_y / pixelScale) * pixelScale,
		"Pixels",
		oBlood)
	with newPixel {
		newBlood(1, oQstPixel.pixelScale, oQstPixel.drySpeed, oQstPixel.step);
	}
	pixelCount++;
} else {
	if oQstPixel.step % 6
	&& (!oPlayer.dying && oPlayer.playerHealth < oPlayer.playerMaxHealth) {
		oPlayer.playerHealth++;
	}
}

if mouse_check_button_released(mb_left) {
	// ? sfxs
}