import std.stdio;
import std.string;
import std.c.windows.windows;

void main()
{
        writefln("Loading DLL...");
        HANDLE h = LoadLibraryA("library.dll");
        if(!h)
                return writefln("Failed to load DLL.");
        writefln("DLL loaded. Unloading...");
        if(!FreeLibrary(h))
                return writefln("Failed to unload DLL.");
        writefln("DLL unloaded.");
}
