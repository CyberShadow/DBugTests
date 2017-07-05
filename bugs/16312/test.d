struct Deprecated
{
	this(int i = 0) {}
}

class Bogus
{
	Deprecated* a = null;
	int seems_to_overlap = 0;
}
