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

-- Chip object
Chip = {
    memory = {}, -- 4096 bytes
    v = {}, -- need 16 registers
    stack = {},
    I = 0,
    SP = 0,
    PC = 0x200,
    display = ChipDisplay.new()
}

-- NOTE might remove chip memory object to make it easier to interface with other components like display and registers
ChipMemory = {}

function Chip:new()
    -- Init the chip

    for i = 1, RAM_SIZE do
        self.memory[i] = 0
    end
    
    for i = 1, 16 do
        self.v[i] = 0
    end
end

-- Working with memory
function Chip:load_rom(rom)
    -- Insert rom instructions at address 0x200
end

function Chip:fetch_instruction()
end

function Chip:decode_instruction()
end

function Chip:execute_instruction()
end

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

function nop()
end

-- MAIN LOVE2D LOOP
function love.load()
    love.window.setMode(WIN_W, WIN_H)
    -- TODO pick a nice 2-tone palette (B&W for now)

    chip = Chip.new()
end

function love.update()
end

function love.draw()
end
