mixin template Foo() { }

void main()
{
    mixin Foo F;
    F.x;
}
