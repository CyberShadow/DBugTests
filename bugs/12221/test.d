enum Key : short
{
    a
}

void main()
{
    short[short] hash;
    auto a = hash.get(Key.a, Key.a);
    short x = a;
}
