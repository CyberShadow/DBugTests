template Foo(X)
{
	alias int Foo;
}

int m;
alias Foo!(m) XXX;
