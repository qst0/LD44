/// @desc ?
if room != roomGame {
	return;
}

if !debug {
	
	draw_set_color(c_white);
	draw_rectangle(22, 22,
		22 + sprite_get_width(sprPlayerIcon),
		20 + sprite_get_height(sprPlayerIcon),
		false);
	for (var i = 0; i < 100; i++) {
		draw_circle(24 + i, 80, 18, false)
	}
	
	draw_set_color(c_black);
	
	//time bg
	draw_rectangle(64, 26,
		140,
		56,
		false);
	
	// score bg
	displayScore = pixelCount;
	draw_rectangle(160, 26,
	    160 + string_width(displayScore) + 10,
		56,
		false);
	
	draw_rectangle(24, 24,
		20 + sprite_get_width(sprPlayerIcon),
		16 + sprite_get_height(sprPlayerIcon),
		false);
	offset = 16;
	if step % 60 == 0 {
		playerIconFrame = (playerIconFrame + 1) % playerIconFrames;
	}
	draw_sprite(sprPlayerIcon, playerIconFrame, 22, offset - 4);
	/*
	draw_text(8, offset,"qst0 ld44 untitled blood magic");
	*/
	offset += 64;
	for (var i = 0; i < 100; i++) {
		draw_circle(24 + i, offset, 16, false)
	}
	
	//DRAW TIME
	draw_set_color(c_red);
	displayTime = string(floor(timeLeft / 60)) + ":" + string(timeLeft % 60);
	draw_text(68, 18, displayTime);
	
	//DRAW SCORE
	draw_text(168, 18, displayScore);
	
	for (var i = 0; i < playerHealthPercent; i++) {
		rad = 2 + playerHealthPercent / 10;
		draw_circle(24 + i, offset, rad, false)
	}
	offset += 32;
}

if oPlayer.dying {
	draw_set_color(c_black);
	draw_rectangle(
		300,
		offset - 16,
		930,
		offset + 96,
		false);
	draw_set_color(c_red);
	draw_text(320, offset,"Restarting...");
	offset += 32;
	draw_text(320, offset, oPlayer.deathMessage);
}


if debug {
	offset = 16;
	draw_text(8, offset,"DEV MODE: Qst0 LD44 Untitled Blood Magic");
	offset += 32;
	draw_text(8, offset,"hsp:" + string(oPlayer.hsp));
	offset += 32;
	draw_text(8, offset,"vsp:" + string(oPlayer.vsp));
	offset += 32;
	draw_text(8, offset,"cam:" + string(oCamera.x)
				+ " " + string(oCamera.xTo)
				+ " " + string(floor(oCamera.xTo) - floor(oCamera.x))
				+ " " + string(floor(oCamera.xTo) - floor(oCamera.x) == 0));
	offset += 32;
	draw_text(8, offset,"dist" + string(playerToMouseDistance) );
	offset += 32;
	draw_text(8, offset, "pCount" + string(pixelCount) );
	offset += 32;
}