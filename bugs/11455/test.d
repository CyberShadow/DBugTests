module tmpoverr;

class A
{
	int f(T)(T t) {return 47;}
}

class B : A
{
	override int f(T)(T t) {return 11;}
}

void main ( )
{
	A b = new B;
	assert(b.f(0) == 47); // passes: A.f() called, not B.f()
	assert(b.f(0) == 11); // fails for the same reason
}
