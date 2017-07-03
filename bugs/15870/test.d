import std.algorithm : map;

template test(alias fun)
{
	enum test = "it works";
}

immutable a = [1,2,3];

pragma(msg, test!(a[].map!(x => x))); // OK
pragma(msg, test!(a.map!(x => x)));   // map is not a member of a
pragma(msg, test!(map!(x => x)(a)));   // OK (no UFCS)

// but a.map does work at runtime ...
unittest {
    auto r = a.map!(x => x);
}
