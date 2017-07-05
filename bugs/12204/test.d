struct Set(alias less = "a < b", T)
{
	import std.algorithm;
	import std.functional;
	alias lessFun = binaryFun!(less);

	int[] someContents;
	this(R)(R r)
	{
		sort!(lessFun)(someContents);
	}
}

unittest {
	auto as2 = Set!((x,y) => x < y , int)([2, 1, 3]);
}
