import std.range, std.stdio;

void main ()
{
	'a'.repeat (1000000).repeat (100).join ('\n').writeln;
}
