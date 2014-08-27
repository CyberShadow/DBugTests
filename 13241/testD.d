import std.stdio;

void main()
{
    fprintf(core.stdc.stdio.stderr, "--- Starting Test1\n");
    writeln("Test1");
    fprintf(core.stdc.stdio.stderr, "--- Starting Test2\n");
    writeln("Test", "2");
}
