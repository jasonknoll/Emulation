namespace Chip8;

using Terminal.Gui;

public class Chip8Window : Window
{
    private Chip8 chip8 = new Chip8();
    
    public Chip8Window()
    {
        // TODO Draw pixels with '#' or filled in space (' ') 

        Title = "CHIP-8 Emulator";
        
        Width = 64;
        Height = 32;

    }
}