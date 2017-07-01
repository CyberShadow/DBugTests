module main;

import std.stdio;
import std.file;
import std.array;

void main(string[] args)
{
    auto infile = File(args[1]);
    auto buffer = uninitializedArray!(char[])(10000);
    uint linect;
    while(infile.readln(buffer))
    {
        linect += 1;
    }
    writeln("There are: ", linect, " lines.");
}
