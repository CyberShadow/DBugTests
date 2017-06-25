import std.range, std.stdio;

void main ()
{
	'a'.repeat (100).repeat (1000000).join ('\n').writeln;
}
