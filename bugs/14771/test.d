struct S(alias f)
{
    auto foo()() { return f(0); }
    void dummy() {}
}

auto makeS() @nogc
{
    int x = 10;
    S!(a => x) s;

    // instantiating foo inside makeS will raise the @nogc violation error.
    //assert(s.foo() == 10);

    return s;
}

void main() @nogc
{
    auto s = makeS();

    // the hidden field of s is actually non-null,
    // that points closure object on heap.
    assert(s.tupleof[$-1] !is null);

    // instantiating foo outside makeS will place the variable x in closure
    // *after* the semantic3 completion of the function.
    // --> @nogc attribute on makeS() is ignored!
    // --> @nogc on main() has no effect, so foo itself has no GC-allocation.
    assert(s.foo() == 10);
}
