// See https://aka.ms/new-console-template for more information

using Chip8;
using Terminal.Gui;


Application.Init();

Application.Run<Chip8Window>().Dispose();

Application.Shutdown();