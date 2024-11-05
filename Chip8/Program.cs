// See https://aka.ms/new-console-template for more information

using Chip8;
using Terminal.Gui;

var chip8 = new Chip8.Chip8();

Application.Init();

Application.Run<Chip8Window>().Dispose();

Application.Shutdown();