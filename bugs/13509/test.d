import std.conv;
import std.typecons;

@nogc void fun()
{
	void[__traits(classInstanceSize, Exception)] data = void;
	emplace!Exception(data, "test");
}
