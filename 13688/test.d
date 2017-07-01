struct KeyType
{
    int x;

    size_t toHash() const @safe nothrow
    {
        return x;
    }

    bool opEquals(in KeyType r) const
    {
        return x == r.x;
    }
}

ulong func(ulong[KeyType] aa) @nogc
{
    if (auto p = KeyType(10) in aa) // can call KeyType.toHash/opEquals
        return *p;

    return aa.length;
}
