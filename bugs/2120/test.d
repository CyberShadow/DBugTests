class Scope
{
    int i;
    int j;
}

void func(Scope m)
{
    scope Scope save=m;
    m.i=4;
    assert(save.i==3);
}

void main()
{
    Scope t=new Scope;
    t.i=3;
    t.j=3;
    func(t);
}
