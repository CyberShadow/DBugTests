import std.stdio;

struct Test
{
	void delegate() testBody;
	Exception unexpected;

	void opBinary(string op)(void delegate() fun)
	{
		testBody = fun;

		// Call it
		try
			testBody();
		catch (Exception ex)
			unexpected = ex;
	}
}

struct URL
{
	string fragment;

}

struct JsonCube
{
	URL dataURL;
}

struct JsonCubeDef
{
	JsonCube _def;
	this(string)
	{
	}
}

immutable TEST_JSON = `{}`;

void main()
{
	auto def = cast(immutable) JsonCubeDef(TEST_JSON);

	Test() in
	{ writeln(def); };
}
