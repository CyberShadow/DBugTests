struct S { int i; }

int main()
{
	auto s = S(1);
	switch (s)
	{
		case S(1): return 1;
		case S(2): return 2;
		case S(3): return 3;
		default: assert(false);
	}
}
