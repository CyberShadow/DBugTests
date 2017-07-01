import std.stdio : writeln;
import std.array : split;

void main()
{
  writeln("one,two,three".split(","));
  assert("one,two,three".split(",") == ["one", "two", "three"]);
}
