use std::{fs::File, io::prelude::*, path::Path, str::FromStr};

fn main() {
    let path = Path::new("input.txt");
    let display = path.display();

    let mut file = match File::open(&path) {
        Err(e) => panic!("Could not open {}: {}", display, e),
        Ok(file) => file,
    };

    let mut input = String::new();
    match file.read_to_string(&mut input) {
        Err(e) => panic!("Could not stringify file: {}", e),
        Ok(_) => {},
    };

    let mut res: i64 = 0;

    {{_cursor_}}

    println!("{}", res);
}
