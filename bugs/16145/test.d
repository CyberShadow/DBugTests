void main()
{
	import std.range;
	auto arr = [1, 2, 3];
	auto r = arr.retro();
	foreach (i, ref el; r.enumerate)
		el = 3;
	assert(arr == [3, 3, 3]);
}
