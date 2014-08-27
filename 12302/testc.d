template isCallable(T...)
    if (T.length == 1)
{
    static if (is(typeof(& T[0].opCall) == delegate))
        enum bool isCallable = true;
    else 
    static if (is(typeof(& T[0].opCall) V : V*) && is(V == function))
        enum bool isCallable = true;
    else
        enum bool isCallable = true;
}

class A
{
    struct X {}
    X x; 
    auto opDispatch(string s, TArgs...)(TArgs args)
    {
        mixin("return x."~s~"(args);");
    }
}

A func() { return null; }
enum b = isCallable!func;
