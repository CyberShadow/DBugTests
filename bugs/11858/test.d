class A { }
class B { }

void main()
{
    A a;
    B b;
    static assert(!__traits(compiles, a is b)); // fails
}
