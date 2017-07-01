extern (C) Object _d_newclass(const TypeInfo_Class ci);

void main()
{
    int kittens;
    class Foo {
        this() { kittens = 1; }
        ~this() { kittens = 0; }
    }
    Foo f = new Foo();  // this works

    typeid(f).create(); // fails

}
