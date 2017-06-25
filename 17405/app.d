import std.stdio;
import bar : foo;

void main()
{
    import b = baz : foo;
    writeln(foo);
}
