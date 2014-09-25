import std.traits;

mixin template MyTemplate()
{
    void foo()
    {
        pragma(msg, __traits(getMember, typeof(this), "foo"));
    }
}

class A
{
    mixin MyTemplate;
}

void main()
{
    auto a = new A();
}
