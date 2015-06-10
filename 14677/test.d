void main()
{
    void* x;
    // Error: e2ir: cannot cast x of type void* to type int[30]
    //auto y = cast (int[30]) x;
    // But this passes
    static assert (!is(typeof({ auto y = cast(int[30])x; })));
}
