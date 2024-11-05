namespace Chip8;

public class Chip8
{
    public byte[] Memory; // 4 Kb of RAM
    public byte[] Registers; // V0 - VF

    public short[] Stack; // 16 slots on the stack

    public ushort I;  // Address pointer?
    public ushort PC; // Program counter
    public byte SP; // Stack pointer
    public byte DelayTimer;
    public byte SoundTimer;

    public bool[] FrameBuffer; // 64x32 array of pixels that are either on or off -- no rgb value
    
    Chip8()
    {
        Memory = new byte[4096];
        Registers = new byte[0xF]; // V0 - VF

        Stack = new short[16];

        // TODO other registers 

        SP = 0;
        
        // TODO draw pixels
        
        FrameBuffer = new bool[64 * 32];
    }
}