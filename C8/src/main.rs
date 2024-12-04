// install ratatui as graphics

use std::fs::File;
use std::io::Read;

const CHIP_DISPLAY_WIDTH: u8 = 64;
const CHIP_DISPLAY_HEIGHT: u8 = 32;

const PROGRAM_START_ADDRESS: u16 = 0x200;

// TODO make it a relative path
const ROM_PATH: &str = "C:\\Dev\\Emulation\\C8\\roms\\test_opcode.ch8";

fn main() {
    let mut chip = Chip::new();

    chip.load_rom(ROM_PATH);

    chip.hex_dump(&chip.context.memory, 4, Option::from(PROGRAM_START_ADDRESS as usize))
}

struct Chip {
    context: ChipContext
}

impl Chip {
    fn new() -> Self {
        Self {
            context: ChipContext::new()
        }
    }

    pub fn load_rom(&mut self, file_path: &str)  {
        let mut file = File::open(file_path);

        let mut buffer = Vec::new();

        file.unwrap().read_to_end(&mut buffer).expect("TODO: panic message");

        self.context.memory[0x200..(0x200 + buffer.len())].copy_from_slice(&buffer);
    }

    pub fn hex_dump(&self, buf: &[u8], bytes: usize, start: Option<usize>) {
        if (start.is_some()){
            for i in start.unwrap()..start.unwrap() + bytes {
                self.print_hex_byte(buf[i])
            }
        } else {
            for i in 0..bytes {
                self.print_hex_byte(buf[i])
            }
        }
    }

    pub fn print_hex_byte(&self, byte: u8) {
        print!("0x{:02X} ", byte);
    }

    pub fn fetch() {}

    pub fn decode() {}

    pub fn execute() {}
}

struct ChipContext {
    memory: [u8; 4096],
    v: [u8; 16],
    stack: [u16; 16],
    index: u16,
    pc: u16,
    sp: u16,
    delay: u8,
    sound: u8
}
impl ChipContext {
    pub fn new() -> Self {
        Self {
            memory: [0; 4096],
            v: [0; 16],
            stack: [0; 16],
            index: 0,
            pc: 0x200,
            sp: 0,
            delay: 0,
            sound: 0,
        }
    }

    pub fn push() {}
    pub fn pop() {}

    pub fn load_into_memory() {}
}

struct ChipDisplay {}
impl ChipDisplay {
    pub fn new() {
        todo!("Implement a Ratatui based display")
    }
}
