mount_base = 35;
mount_thickness = 25;
mount_height = 35;

slit_thickness = 2;
slit_depth = 11;

monitor_thickness = 18;
interface_depth = 7;
interface_offset = 2;

cutout_width = 4;
cutout_height = 7;

groove_height = interface_depth;
slope_angle = 67.2;
groove_base =  groove_height / tan(slope_angle);
groove_slope = sqrt(groove_height^2 + groove_base^2);

interface_thickness = monitor_thickness - groove_base;

difference() {
    cube([mount_base, mount_thickness, mount_height]);

    color("green")
    // mount_thickness / 2 - slit_thickness / 2
    translate([0, cutout_width, mount_height - slit_depth])
        cube([mount_base, slit_thickness, slit_depth]);
    
    color("red")
    translate([0, interface_offset, 0])
        cube([mount_base, interface_thickness + 0.1^5, interface_depth]);

    pyramid();
    
    color("purple")
    translate([0, 0, mount_height - cutout_height])
        // mount_thickness / 2 - slit_thickness / 2
        cube([mount_base + 2, cutout_width, cutout_height]);
    
    translate([2, mount_thickness * .45, mount_height * .52])
        cube([mount_base - 4, mount_thickness * .4, mount_height * .4]);
}

module pyramid() {
    translate([mount_base, groove_base + interface_offset + interface_thickness, 0]) {
        rotate([90, 0, 270]) {
            difference(){
                color("brown")
                cube([groove_base, groove_height, mount_base]);
                translate([0, 0, 0]){
                    rotate([0, 0, slope_angle]){
                        cube([groove_slope, 20, mount_base]);
                    }
               }
            }
        }
    }
}
