///@arg howmuchmore
///@arg xlow
///@arg xhigh
///@arg ylow
///@arg yhigh
///@arg pixelScale
///@arg dryspeed

var howmuchmore = argument0;
var xlow = argument1;
var xhigh = argument2;
var ylow = argument3;
var yhigh = argument4;
var pixelScale = argument5;
var step = argument6;
var drySpeed = 20;

if !layer_exists("Pixels") {
		layer_create(150, "Pixels")
	}
	
newPixel = instance_create_layer(
	floor((x + irandom_range(xlow,xhigh)) / pixelScale) * pixelScale,
	floor((y - irandom_range(ylow,yhigh)) / pixelScale) * pixelScale,
	"Pixels",
	oBlood)
with newPixel {
	if instance_exists(oQstPixel) {
		drySpeed = oQstPixel.drySpeed++;
	}
	newBlood(howmuchmore, pixelScale, drySpeed, step);
}
if instance_exists(oQstPixel) {
	oQstPixel.pixelCount++;
}