mod mach_speed;

fn main() {
    println!("{}", mach_speed::kmh_to_mach(100.0,   mach_speed::GROUND_AIR_TEMP_C));
    println!("{}", mach_speed::mileh_to_mach(100.0, mach_speed::GROUND_AIR_TEMP_F));
    println!("{}", mach_speed::mach_to_kmh(100.0,   mach_speed::GROUND_AIR_TEMP_C));
    println!("{}", mach_speed::mach_to_mileh(100.0, mach_speed::GROUND_AIR_TEMP_F));
}
