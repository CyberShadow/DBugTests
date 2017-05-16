import std.range;
import std.stdio;

void main()
{
	writeln(iota(int(byte.max), int(byte.min), -2).length);
	writeln(iota(int(byte.max), int(byte.min), -2).walkLength);
}
