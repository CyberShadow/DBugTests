import std.range, std.stdio;

void main ()
{
	'a'.repeat (10000).repeat (10000).join ('\n').writeln;
}
