
import derelict.sdl2.sdl;

import std.string;
import std.stdio;
import std.conv;
import std.file;

int main(string[] args)
{
    // Load the correct libraries
    version (Windows)
    {
        version (X86)
        {
            if (exists("lib/win32_x86/SDL2.dll"))
                DerelictSDL2.load("lib/win32_x86/SDL2.dll");
            else
                DerelictSDL2.load();
        }
        version (X86_64)
        {
            if (exists("lib/win32_x86/SDL2.dll"))
                DerelictSDL2.load("lib/win32_x86/SDL2.dll");
            else
                DerelictSDL2.load();
        }
    }


    if (SDL_Init(SDL_INIT_VIDEO) != 0)
    {
        writeln("Error initializing SDL2: " ~ SDL_GetError().to!string);
        return 1;
    }

    SDL_Window* window = SDL_CreateWindow(toStringz("Zum"),
                                          SDL_WINDOWPOS_CENTERED,
                                          SDL_WINDOWPOS_CENTERED,
                                          700, 500,
                                          SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    if (window is null)
    {
        writeln("Error creating window: " ~ SDL_GetError().to!string);
        return 1;
    }

    bool running = true;
    while (running)
    {
        SDL_Event event;

        if (SDL_WaitEvent(&event) == 1)
        {
            writeln("Got event: " ~ event.type.to!string);

            switch (event.type)
            {
                case SDL_QUIT:
                    running = false;
                    break;

                default:
                    break;
            }
        }
    }

    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}