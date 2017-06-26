import std.typecons;

struct A(T)
{
private:
    T* _p;
    ref inout(T) _instance() inout { return *cast(inout(T)*)_p; }
    ref immutable(T) _instance() immutable { return *cast(immutable(T)*)_p; }
    ref shared(T) _instance() shared { return *cast(shared(T)*)_p; }
    ref const(shared(T)) _instance() const shared { return
*cast(const(shared(T))*)_p; }
public:
    mixin Proxy!(_instance);
}

struct B(T)
{
private:
    T* _p;
    @property ref inout(T) _instance() inout { return *cast(inout(T)*)_p; }
    @property ref immutable(T) _instance() immutable { return
*cast(immutable(T)*)_p; }
    @property ref shared(T) _instance() shared { return *cast(shared(T)*)_p; }
    @property ref const(shared(T)) _instance() const shared { return
*cast(const(shared(T))*)_p; }
public:
    mixin Proxy!(_instance);
}

void main()
{
    static struct Foo { @property int foo(){return 0;} }
    alias A!Foo AFoo;
    AFoo af;
    af._p = new Foo;
    assert(af.foo == 0); // NG
    alias B!Foo BFoo; // NG
    BFoo bf;
    bf._p = new Foo;
    assert(bf.foo == 0);
}
