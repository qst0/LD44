/// @desc ?
if keyboard_check_pressed(vk_f1) {
	debug = !debug;
}

if keyboard_check_pressed(vk_escape) {
	game_restart();
}

playerHealthPercent = (oPlayer.playerHealth / oPlayer.playerMaxHealth) * 100;
if step % 60 == 0 { //use game fps later
	timeLeft--;
}
step++;