void test1(alias pred = "a == b", T)(T a)
{
    pragma(msg, "1");
}

void test1(int flag = 0, T)(T a)
{
    pragma(msg, "2");
}

void main()
{
    test1(1);
}
