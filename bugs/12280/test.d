void f(int i)()
{
	static if (i < 10)
		f!(i+1);
	else
		nonexistent();
}

alias f0 = f!0;
