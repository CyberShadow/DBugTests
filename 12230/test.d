import std.stdio;

static template T(alias a)
{
    void foo() { writeln(a()); }
}

struct S
{
    int i = 1;
    int p() { return 2; }

    alias tp = T!p; // Error
}
