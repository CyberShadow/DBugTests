struct S
{
    int a = 0;
    int b = 1;
}

int f1(S s)
{
    switch (s.a)
    {
        case 0: return 10;
        case 1: return 20;
        case 2: return 30;
        case 3: return 40;
        default: return 99;
    }
}

void main()
{
    S s;
    assert(f1(s) == 10); /* fails */
}
