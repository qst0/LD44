/// @desc ?
if step % 60 == 0 {
	while countDownScore {
		if countDownScore > 400 {
			makeBlood(0, room_width/2 - 32, room_width/2 + 32, -32, 32, 3, 5);
			countDownScore--;
			finalScore++;
		}
		if countDownScore > 100 {
			makeBlood(0, room_width/2 - 16, room_width/2 + 16, -16, 16, 3, 5);
			countDownScore--;
			finalScore++;
		}
		if countDownScore > 0 {
			makeBlood(0, room_width/2 - 8, room_width/2 + 8, -8, 0, 3, 5);
			countDownScore--;
			finalScore++;
		}
	}
}
step++;