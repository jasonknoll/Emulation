// install ratatui as graphics

fn main() {
    println!("Hello, world!");
}

struct Chip {}

struct ChipContext {
    memory: [u8; 4096],
    V: [u8; 16],
    stack: [u16; 16],
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
