module main;

struct Foo
{
    void myFunction ( int a ) {}
}

void main()
{
    void function ( int x ) func;

    func = &Foo.myFunction;

    func(32);
}
