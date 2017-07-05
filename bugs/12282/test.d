void main() {
    import std.array: array;
    const a = [1];
    immutable b = fun(a);
}

const(int)[] fun(const(int)[] a) pure
{
    import std.array: array;
	return a.array;
}
