void foo(T)(auto ref T t)
{
}

void bar()
{
    int v = 12;
    foo!long(v);
}
