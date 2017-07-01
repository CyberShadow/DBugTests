struct S
{
    static string g()() { return ""; }
}

void f()
{
    mixin(S.g!()());
}
