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
WIN_H = 640
WIN_W = 320

RAM_SIZE = 4096 -- In bytes i.e. every 2 hex digits
REGISTER_COUNT = 16

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
        self.memory[i] = 0
    end
    
    for i = 1, REGISTER_COUNT do
        self.v[i] = 0
    end
end

-- Working with memory
function Chip:load_rom(rom)
    -- Insert rom instructions at address 0x200 (512)
end

-- Get next instruction
function Chip:fetch_instruction()
  -- uses the PC to see where the next instruction is at?
  -- What is the index for? 
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
function ChipDisplay:draw_pixel()
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
    love.window.setMode(WIN_H, WIN_W)
    -- TODO pick a nice 2-tone palette (B&W for now)

    chip = Chip:new()
end

function love.update()
end

function love.draw()
end
