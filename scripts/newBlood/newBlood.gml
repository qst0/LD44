///@arg tries
///@arg pixelScale
///@arg drySpeed
///@arg step
var tries = argument0;
var pixelScale = argument1;
var drySpeed = argument2;
var step = argument3;

image_xscale = pixelScale;
image_yscale = pixelScale;
if place_meeting(x,y,oBlood) {
	with other {
		deathStep = step + drySpeed;
	}
	if argument0 {
		newPixel = instance_create_layer(
			(floor(mouse_x / pixelScale) + choose(-1, 1)) * pixelScale,
			(floor(mouse_y / pixelScale) + choose(-1, 0)) * pixelScale,
			"Pixels",
			oBlood)
		with newPixel {
			newBlood(tries - 1, pixelScale, drySpeed, step);
		}
		instance_destroy();
	}
}
if place_meeting(x,y,oSolid) {
	if instance_exists(oQstPixel) {
		oQstPixel.pixelCount--;
	}
	instance_destroy();
}
deathStep = step + drySpeed;