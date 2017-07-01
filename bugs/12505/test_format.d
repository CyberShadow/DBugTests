import std.string;

void main()
{
    void* p = null;
	assert(format("%08X", p) == "00000000");
}
