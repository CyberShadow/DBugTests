void main () @safe @nogc
{
    Object o = leak();
    assert(o !is null);
}

Object leak () @safe @nogc
{
    Foo f;
    foreach (object; f)
        if (object !is null)
            return object;
    return null;
}

struct Foo
{
    alias DgType = int delegate (scope Object) @safe @nogc;
    public int opApply (scope DgType dg) @safe @nogc
    {
        scope o = new Object;
        return dg(o);
    }
}
