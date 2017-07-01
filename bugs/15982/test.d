import std.array : array;

void main()
{
	//immutable(int)[] a = [1, 2, 3];
	//assert(a.ptr == array(a).ptr); // fails
	string s = "foo";
	assert(s.ptr == s.idup.ptr);
}
