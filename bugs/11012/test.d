void main()
{
	auto f = (int i) {};
	static assert(is(typeof(f) == function));
}
