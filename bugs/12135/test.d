import std.string;

void main()
{
    assert(format("%(%s:<%s>%|,%)", [1:2]) == "1:<2>"); // ok
    assert(format("%(%s:<%s>%|%)" , [1:2]) == "1:<2>"); // fails, "1:<2"
}
