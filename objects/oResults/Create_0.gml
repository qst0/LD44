/// @desc ?
if oHighScore.highScore < oHighScore.lastScore {
	oHighScore.highScore = oHighScore.lastScore;
}

countDownScore = oHighScore.lastScore * 5;
step = 0;
finalScore = 0;