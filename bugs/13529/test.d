import std.string;

void main()
{
	ptrdiff_t idx = lastIndexOf("Hällö Wörldö ö"d, "ö öd"d);
	assert(idx == -1); // fails
}
