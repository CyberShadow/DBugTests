struct S
{
    int x;
}

template Foo(T, alias u)
{
    static assert(is(typeof(u) == T)); //fails
}

void main()
{
    immutable s = S();
    alias Foo!(typeof(s.x), s.x) foo;
}
