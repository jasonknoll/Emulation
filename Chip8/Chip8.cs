namespace Chip8;

public class Chip8
{
    public byte[] Memory; // 4 Kb of RAM
    public byte[] Registers; // V0 - VF

    public ushort[] Stack; // 16 slots on the stack

    public ushort I;  // Index pointer
    public ushort PC; // Program counter
    public byte SP; // Stack pointer
    public byte DelayTimer;
    public byte SoundTimer;

    public byte[] Keypad;

    public bool[] FrameBuffer; // 64x32 array of pixels that are either on or off -- no rgb value

    public ushort Opcode;

    private const ushort _startAddress = 0x200;
    
    public Chip8()
    {
        Memory = new byte[0x1000]; // 0x000 - 0xFFF
        Registers = new byte[16]; // V0 - VF

        Stack = new ushort[16];

        Keypad = new byte[16]; // 0-F

        // TODO other registers 

        PC = _startAddress;
        SP = 0;
        
        // TODO draw pixels
        
        FrameBuffer = new bool[64 * 32];
    }

    public void DrawFrameBuffer()
    {
        
    }
}