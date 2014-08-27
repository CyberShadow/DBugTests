import std.stdio, std.algorithm;

void main(string[] args)
{
    {
        enum foo = "a + 0.5 * b";
        auto r = [0, 1, 2, 3];
        //auto r1 = reduce!foo(r); //<-- HERE
        auto r2 = reduce!(foo, foo,)(r);
        //writeln(r1);
        writeln(r2);
    }

    {
        const(char)[] foo(const(char)[], const(char)[]);
        string[] r = ["hello", "world"];
        //auto r1 = reduce!foo(r); //<-- HERE
        auto r2 = reduce!(foo, foo,)(r);
        //writeln(r1);
        writeln(r2);
    }
}
