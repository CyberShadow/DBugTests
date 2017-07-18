import std.math;

int main()
{
	float a = 0, b = 10_000;
	
	static assert (!__traits(compiles, q{
	        // isNaN wasn't removed during copy-paste
                // but code still compiles with wrong result
		assert (a.approxEqual(b.isNaN) == false);
	}), "This code must not compile!");
	
	return 0;
}
