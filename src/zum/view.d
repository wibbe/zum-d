
import derelict.sdl2.sdl;
import derelict.freetype.ft;

import index;


private struct Cell
{

}

private __gshared SDL_Renderer* _renderer;
private __gshared Cell[] _cells;
private __gshared int _width;
private __gshared int _height;


void initView(SDL_Renderer* renderer)
{
	_renderer = renderer;
}