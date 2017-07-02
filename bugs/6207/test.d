mixin template expand(string code)
{
    static if (code.length >= 2 && code[0..2] == "$x")
    {
        enum expand = `x` ~ code[2..$];
        pragma(msg, expand);
    }
    else
        enum expand = code;
}

void main()
{
    int x = 1;
    int y = expand!q{$x+2};
        // Rhs is implicitly converted to mixin(expand!(q{$x+2}))
    assert(y == 3);
}
