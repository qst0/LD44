/// @desc ?

if place_meeting(x, y, oBloodContainer) {
	if oQstPixel.step == deathStep {
		deathStep++;
		if image_xscale > 2 {
			image_xscale--;
			image_yscale--;
			x += choose(image_xscale, 0);
		}
	}

	
} else {
	if place_meeting(x, y, oPlayer) {
		if oPlayer.playerHealth < oPlayer.playerMaxHealth {
			oPlayer.playerHealth += oPlayer.recoveryRate;
		}
		makeBlood(0, -8, 8, -2, 16, oQstPixel.pixelScale, oQstPixel.step);
		oQstPixel.pixelCount--;
		instance_destroy();
	}
}

if deathStep != -1 {
	if oQstPixel.step == deathStep {
		if image_xscale > 1 {
			image_xscale--;
			image_yscale--;
			x += choose(image_xscale, 0);
			deathStep += 10;
		} else {
			oQstPixel.pixelCount--;
			instance_destroy();
		}
	}
}

if (vsp < oQstPixel.gameMaxVertSpeed) { 
	vsp += oPlayer.grv;
}
// do floor detections.

if place_meeting(x, y + vsp, oSolid){
	while !place_meeting(x, y + sign(vsp)/10, oSolid) {
		y += sign(vsp)/10;
	}
	
	hsp += choose(vsp, -vsp) / 2;
	vsp = -vsp/2;
}

if oQstPixel.step % frictionRate == 0 {
	if vsp != 0 {
		if vsp > 0{
			vsp -= frictionFactor;
		} else if hsp < 0 {
			vsp += frictionFactor;
		}
	}
}
if oQstPixel.step % frictionRate == 0 {
	if hsp != 0 {
		if hsp > 0{
			hsp -= frictionFactor;
		} else if hsp < 0 {
			hsp += frictionFactor;
		}
	}
}

y += vsp;

// will hit oSolid left or right
if place_meeting(x + hsp, y, oSolid){
	while !place_meeting(x + sign(hsp)/10, y, oSolid) {
		x += sign(hsp)/10;
	}
	if place_meeting(x, y, oBlood) {
		inst = instance_position(x, y, oBlood)
		if (instance_exists(inst)){
			if inst.image_xscale > 1 {
				inst.image_xscale--;
				inst.image_yscale--;
			} else {
				oQstPixel.pixelCount--;
				instance_destroy();
			}
		}
		if image_xscale > 1 {
			image_xscale--;
			image_yscale--;
		} else {
			oQstPixel.pixelCount--;
			instance_destroy();
		}
		hsp = -hsp;
	} else {
		hsp = 0;
	}
}

x += hsp;