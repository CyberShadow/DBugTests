interface I
{
    void m1();
    void m2();
    void m3();

    final void mf()
    {
        m3();
    }
}

class C1 : I
{
    void m1() {}
    void m2() {}
    void m3() {}
}

class C2 : C1
{
    void ml()
    {
        super.mf();
    }
}

void main()
{
    auto l = new C2();
    l.ml();
}
