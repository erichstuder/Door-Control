$fn = 90;

outterDiameter = 25;
width = 13;

difference(){
	union(){
		cylinder(d=outterDiameter, h=width, center=true);
		translate([0, outterDiameter/2-width/2, 0])
			cube([12, width, width], center=true);
	}
	#cylinder(d=13, h=width, center=true);
	#rotate([90, 0, 0])
		cylinder(d=3.5, h=outterDiameter, center=true);
	#translate([0, -3, 0])
		rotate([90, 0, 0])
			cylinder(d=7, h=outterDiameter, center=true);
}
