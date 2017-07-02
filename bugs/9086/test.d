import std.typecons;

void main() nothrow
{
	alias Nothing = Nullable!int;
	Nothing[] items;
	foreach (i; 0 .. 10)
		items ~= (i % 2) ? Nothing(i) : Nothing();

	int[] result;
	foreach (x; items)
		if (!x.isNull)
			result ~= x.get; // Error: x.get is not nothrow
}
