void main()
{
    const(int)* a;
    void* b;
    auto c = true ? a : b;
    pragma(msg, typeof(c).stringof); // const(int)*
}
