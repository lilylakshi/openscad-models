Mount_Base = 30;
Mount_Thickness = 10;
Mount_Height = 20;

difference() {

    cube([Mount_Base, Mount_Thickness, Mount_Height]);

    color("green")
    translate([Mount_Base/2, Mount_Thickness + 1, Mount_Thickness])
        rotate([90, 0, 0])
            cylinder(h = 12, d = 10);
        
}