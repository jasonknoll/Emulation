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

-- Chip object
Chip = {}

ChipMemory = {}
ChipMemory:load()

function love.load()
    love.window.setMode(WIN_W, WIN_H)
end

function love.update()
end

function love.draw()
end
