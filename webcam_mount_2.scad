mount_base = 30;
mount_thickness = 10;
mount_height = 20;

slit_thickness = 2;
slit_depth = 5;

monitor_thickness = 5;
interface_depth = 3;
interface_offset = 2;

slope_base = 2;
monitor_slope_angle = 45;

cutout_width = 2;
cutout_height = 1;

groove_height = interface_depth;
slope_angle = 60;
groove_base =  groove_height / tan(slope_angle);
groove_slope = sqrt(groove_height^2 + groove_base^2);

interface_thickness = monitor_thickness - groove_base;

difference() {
    cube([mount_base, mount_thickness, mount_height]);

    color("green")
    translate([0, mount_thickness / 2 - slit_thickness / 2, mount_height - slit_depth])
        cube([mount_base, slit_thickness, slit_depth]);
    
    color("red")
    translate([0, interface_offset, 0])
        cube([mount_base, interface_thickness + 0.1^5, interface_depth]);

    pyramid();
    
    color("purple")
    translate([0, 0, mount_height - cutout_height])
        cube([mount_base + 2, mount_thickness / 2 - slit_thickness / 2, cutout_height]);
    
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
