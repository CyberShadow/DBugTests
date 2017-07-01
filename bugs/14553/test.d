import std.stdio;
import std.array;
import std.traits;
import std.typetuple;

void main() {
    foreach(T; TypeTuple!(char, wchar))
    {
        writeln(ReturnType!(array!(T[])).stringof);
        writeln(ReturnType!(array!(const(T)[])).stringof);
        writeln(ReturnType!(array!(immutable(T)[])).stringof);
    }
}
