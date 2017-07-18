import subtype;

void main()
{
    auto b = new Bar;
    assert(b.a == 0);
    b.a = 10;
    assert(b.a == 10);
}
