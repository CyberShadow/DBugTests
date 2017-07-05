struct T { void* foo; bool opEquals(ref const(T) o) const { return false; } }
struct T2 { }

union U
{
    T a;
    T2 b;
}
void main()
{
	U u1, u2;
	assert (u1 == u2);
}
