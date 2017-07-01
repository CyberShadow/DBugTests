import std.stdio;
import std.array;

void main()
{
    string[] ary = ["","aa","bb","cc"]; // leaded by _empty_ element
    writeln(ary.join(" @"));
        // In 2.067b2, this outputs "aa @bb @cc" or asserts inside of join()

    assert(ary.join(" @") == " @aa @bb @cc"); // OK in 2.067b1 and olders
}
