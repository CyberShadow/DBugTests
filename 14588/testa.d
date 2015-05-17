module testa;

void func(alias a, T, R...)()
{
}

class A
{
    int i;
    void all(T...)()
    {
        func!(i,T)();
    }
}
