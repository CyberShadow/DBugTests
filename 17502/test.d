class Foo
{
    auto foo()
    in {}
    out {} // uncomment it to get dmd segfault
    body{}
}

void main()
{
    auto foo = new Foo();
    foo.foo();
}
