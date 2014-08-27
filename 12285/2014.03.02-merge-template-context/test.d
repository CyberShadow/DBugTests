struct S
{
	int a, c;

	template toA(alias s)
	{
		void copy()
		{
			a = s;
		}
	}

	alias cToA = toA!c;
}

unittest
{
	S s;
	s.c = 42;
	s.cToA.copy();
	assert(s.a == 42);
}
