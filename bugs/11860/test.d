import std.stdio;

void main()
{
	struct MyStruct
	{
		static void doIt(string thing)
		{
			writeln(thing);
		}
	}
	
	with(MyStruct)
	{
		"print me".doIt();
	}
}
