/// @desc ?
if instance_exists(follow) {
	xTo = follow.x // + xOffset;
	yTo = follow.y // + yOffset;
}

x += (xTo - x) / (followSpeed / (250 - (oQstPixel.step / 60))) //this should be slow enough // fast smooth enough.
y += (yTo - y) / (followSpeed / (250 - (oQstPixel.step / 60)));