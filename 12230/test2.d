static template T(alias a, alias anchor = Object)
{
    void foo() { writeln(a); }
}

struct S
{
    int i = 1;
    @property int p() { return 2; }

    alias ti = T!(i);    // bound to S implicitly
    alias tp = T!(p, i); // bound to S via anchor
}
