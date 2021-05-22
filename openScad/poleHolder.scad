$fn = 90;

cylinderDiameter = 15;
height = 20;
poleHoldingLength = 30;

difference(){
	union(){
		cylinder(d=cylinderDiameter, h=height);
		translate([(-poleHoldingLength+cylinderDiameter)/2, -9, height/2])
			rotate([0, 90, 0])
				cylinder(d=height, h=poleHoldingLength, center=true);
	}
	#servoAxisFit();
	#cylinder(d=3, h=height);
	#translate([0, 0, 2.5+1.5])
		cylinder(d=6, h=height);
	
	#translate([(-poleHoldingLength+cylinderDiameter)/2, -9, height/2])
		rotate([0, 90, 0])
			cylinder(d=12, h=poleHoldingLength, center=true);
}


module servoAxisFit(){
	toothAngle = 360/23;
	
	linear_extrude(2.5)
		for(angle = [0:toothAngle:360-toothAngle])
			rotate([0, 0, angle])
				tooth();
	
	module tooth(){
		triangle();
		rotate([180, 0, 0])
			triangle();
	}

	module triangle(){
		angleOverlap = 0.1;
		angle = toothAngle/2 + angleOverlap;
		innerRadius = 2.5;
		height = innerRadius * sin(angle);
		a = innerRadius * cos(angle);
		polygon([[0,0], [3.2,0], [a,height]]);
	}
}
