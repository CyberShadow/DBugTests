class Foo
{
    InPlace!Bar inside;
}

class Bar { }

struct InPlace(T)
{
    static assert(__traits(classInstanceSize, T) != 0);
}
