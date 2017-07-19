struct Foo {
	import std.array : empty;

	bool empty() {
		return true;
	}
}

unittest {
	Foo f;
	assert(f.empty);
}
