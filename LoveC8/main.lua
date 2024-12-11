-- Chip 8 Love2D Lua implementation
-- Want to use Love2D because the graphics are just so easy (similar to pico)
-- Would love to port to Pico platform later on
-- So many attempts to get this working, but I will eventually

--[[
  TODO 
  Memory
  Registers
  Index pointer
  Stack pointer
  Program counter
  Display (64x32, 640x320)
  Font
  Load ROM into memory
  Keypad/input
  Fetch/decode/execute instruction
]]

-- Constants
WIN_W = 640
WIN_H = 320

PIXEL_SCALE = WIN_W / 64

-- TODO set a nice, 2-tone palette
BG_COLOR = love.math.colorFromBytes(0,0,0)
FG_COLOR = love.math.colorFromBytes(255,255,255)

RAM_SIZE = 4096 -- In bytes i.e. every 2 hex digits
REGISTER_COUNT = 16
ROM_START_ADR = 0x200

ROM_DIR = "../roms"

-- Chip object
Chip = {
    memory = {}, -- 4096 bytes
    v = {}, -- need 16 registers
    stack = {}, -- TODO how big to make stack? 16?
    I = 0, -- what to do with index pointer?
    SP = 0,
    PC = 0x200,
    --display = ChipDisplay.new()
}

-- NOTE might remove chip memory object to make it easier to interface with other components like display and registers
ChipMemory = {}

function Chip:new()
    -- local instance = {} 
    -- setmetatable(instance, self) 
    -- self.__index = self

    -- Init the chip
    for i = 1, RAM_SIZE do
        self.memory[i] = 0x00
    end
    
    for i = 1, REGISTER_COUNT do
        self.v[i] = 0
    end
end

-- Working with memory
function Chip:load_rom(rom)
    -- Insert rom instructions at address 0x200 (512)

    -- Each memory address holds two bytes
    -- Because a full instruction is 2 bytes (4 digits), some instructions will use up 2 memory addresses i.e. 0x200 and 0x201
    -- TODO check accuracy of this
    for i = ROM_START_ADR, string.len(rom), 2 do
        self.memory[i] = rom[i-ROM_START_ADR] .. rom[i-ROM_START_ADR+1] -- set equal to bytes
    end
end

-- Get next instruction
function Chip:fetch_instruction()
    -- uses the PC to see where the next instruction is at?
    -- What is the index for? 
    local instruction = self.memory[self.PC]

    if (instruction == "00") then
        -- check if there are other bytes to the instruction, then run it
    end
end

-- Match instruction with instruction functions
function Chip:decode_instruction()
end

-- Run the instruction's function
function Chip:execute_instruction()
end

function Chip:push_stack(data)
    table.insert(self.stack, data)
end

function Chip:pop_stack()
    table.remove(self.stack)
end

-- Display object to interface with Love2D(?)
ChipDisplay = {}

function ChipDisplay:new()
end

function ChipDisplay:draw_sprite()
end

-- Somehow need to turn individual pixels on and off
function ChipDisplay:draw_pixel(x, y)
-- Pixel scale x10 when in 640x320
    love.graphics.rectangle("fill", x*PIXEL_SCALE, y*PIXEL_SCALE, PIXEL_SCALE, PIXEL_SCALE)
end

function ChipDisplay:clear_pixel(x, y)
end

-- List of instructions used for executing Chip-8 code
instructions = {} 

-- functions that actually manipulate memory/registers
function nop()
end

function jmp()
end

-- MAIN LOVE2D LOOP
function love.load()
    love.window.setMode(WIN_W, WIN_H)

    chip = Chip:new()

    -- Make sure rom loads to correct memory address
    -- Will need extra attention because of Lua's indexing
    -- Load rom instructions as string of hex numbers
    chip.load_rom(ROMS_DIR .. "rom_name")

    -- Upon successful loading of the rom, start fetching the first instruction!
end

function love.update()
-- Get next instruction
    chip.fetch_instruction()

-- Check and execute the fetched instruction
end

function love.draw()
end
