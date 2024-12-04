// install ratatui as graphics

use std::fs::File;
use std::io::Read;

use crossterm::event::{self, Event};
use ratatui::{text::Text, Frame};

const CHIP_DISPLAY_WIDTH: u8 = 64;
const CHIP_DISPLAY_HEIGHT: u8 = 32;

const PROGRAM_START_ADDRESS: u16 = 0x200;

// TODO make it a relative path
const ROM_PATH: &str = "C:\\Dev\\Emulation\\C8\\roms\\test_opcode.ch8";

fn main() {
    let mut chip = Chip::new();

    chip.load_rom(ROM_PATH);

    chip.hex_dump(&chip.context.memory, 4, Option::from(PROGRAM_START_ADDRESS as usize));

    // ratatui hello world
    let mut terminal = ratatui::init();

    loop {
        terminal.draw(draw).expect("failed to draw frame");
        if matches!(event::read().expect("failed to read event"), Event::Key(_)) {
            break;
        }
    }

    ratatui::restore()
}

// NOTE example draw function
fn draw(frame: &mut Frame) {
    let text = Text::raw("Hello World!");
    frame.render_widget(text, frame.area());
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

        self.context.load_into_memory(&buffer);
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

    pub fn load_into_memory(&mut self, buffer: &[u8]) {
        self.memory[PROGRAM_START_ADDRESS as usize..(PROGRAM_START_ADDRESS as usize + buffer.len())].copy_from_slice(&buffer);
    }
}

struct ChipDisplay {}
impl ChipDisplay {
    pub fn new() {
        todo!("Implement a Ratatui based display")
    }

    // TODO setup window
    // TODO setup 'pixels'
    // TODO setup input
}
