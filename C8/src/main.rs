// install ratatui as graphics

fn main() {
    println!("Hello, world!");
}

struct Chip {}

struct ChipContext {
    memory: Vec<u8>,
    V: Vec<u8>,
    stack: Vec<u16>,
    index: u16,
    PC: u16,
    SP: u16,
    todo!("Add sound and delay timers")
}

impl ChipContext {
    pub fn new() -> Self {
        todo!("Init all member vars")
    }

    pub fn push() {}
    pub fn pop() {}

    pub fn loadIntoMemory() {}
}

struct ChipDisplay {}
