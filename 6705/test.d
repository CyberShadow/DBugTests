int func(alias F)(int i)
{
    return i;
}

class C
{
    int b;
}

void main()
{
    auto a = &func!(C.b);
    assert(a(5) == 5);
    //auto i = func!(C.b)(5); // uncomment for a weird compiler error
}
