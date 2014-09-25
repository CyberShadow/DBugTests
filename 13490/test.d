struct S
{
    int i;
    alias i this;
}

struct T
{
    S[] a1, a2;
}


void main()
{
    T t;
    (1 ? t.a1 : t.a2) ~= S.init;
}
