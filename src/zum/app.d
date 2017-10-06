
import derelict.glfw3.glfw3;
import derelict.freetype.ft;

import std.string;
import std.stdio;
import std.conv;
import std.file;

import index;
import view;

version (Windows)
{
    version (X86)
    {
        enum libPath = "lib/win32_x86";
    }
    version (X86_64)
    {
        enum libPath = "lib/win32_x64";
    }
}

int main(string[] args)
{
    writeln("Main");

    // Load the correct libraries
    if (exists(libPath ~ "/glfw3.dll"))
        DerelictGLFW3.load(libPath ~ "/glfw3.dll");
    else
        DerelictGLFW3.load();

    if (exists(libPath ~ "/freetype271.dll"))
        DerelictFT.load(libPath ~ "/freetype271.dll");
    else
        DerelictFT.load();

    if (!DerelictGLFW3.isLoaded())
    {
        writeln("Could not load glfw3");
        return 1;
    }

        

    //if (!glfwInit())
    if (glfwInit is null)
    {
        writeln("Error initializing GLFW3");
        return 1;
    }
/*

    GLFWwindow* window = glfwCreateWindow(640, 480, "Zum", null, null);
    if (window is null)
    {
        writeln("Error creating window");
        return 1;
    }

    glfwMakeContextCurrent(window);

    while (!glfwWindowShouldClose(window))
    {
        glfwWaitEvents();
        glfwSwapBuffers(window);
    }


    glfwDestroyWindow(window);
    glfwTerminate();
*/
/*
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

    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);


    initView(renderer);

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

            // Repaint window
            SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
            SDL_RenderClear(renderer);
            SDL_RenderPresent(renderer);
        }
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
*/
    return 0;
}