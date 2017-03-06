mod mach_speed_calculator {
    pub fn hello() -> String {
        return String::from("Hello, world!");
    }
}


fn main() {
    let x = mach_speed_calculator::hello();
    println!("{}", x);
}
