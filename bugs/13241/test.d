import std.stdio;

extern(System) void ExitProcess(int code);

void main()
{
    writeln("Test!");
    ExitProcess(0);
}
