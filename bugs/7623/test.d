struct Foo
{
    @property bool isOne() { return true; }
}

struct Bar
{
    Foo foo;
    alias foo this;
    alias isOne isTwo;
}

void main() { }
