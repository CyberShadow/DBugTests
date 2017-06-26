void main()
{    
    void f() { }

    void* t1 = (&f).ptr;
    void* t2 = (&f).ptr;
    assert(t1 == t2);
}
