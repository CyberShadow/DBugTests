struct Foo
{
    int test(string op)() { return 0; }
    alias test!"*" this;
}
