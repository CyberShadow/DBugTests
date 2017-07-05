module test;
import std.algorithm;

struct DummyRange
{
	auto opSlice()
	{
		int[] ints;
		return ints.map!(i => i);
	}
}

void main()
{
	DummyRange r1, r2, r3;
	auto r = cartesianProduct(r1[], r2[], r3[]);
}
