template S(T)
{
    struct S {}

    int x;
    static assert(__traits(isSame, __traits(parent, S),
                                   __traits(parent, x)));
}
alias s = S!int;

