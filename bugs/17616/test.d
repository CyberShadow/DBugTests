void main()
{
    import std.algorithm, std.range;

    ubyte[256] index = void;
    iota(256).makeIndex(index[]);
    assert(index[].equal(iota(256)));
}
