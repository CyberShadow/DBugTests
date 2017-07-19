private {
    import std.algorithm;
    import std.range;
    import std.typecons;
    alias Tuple!(int, string) Data;
}

private struct Hidden
{
    public static bool myCmp(Data a, Data b) {
        return a[0] < b[0];
    }
}

auto bar() {
    return [Data(1, "one"), Data(2, "two")].assumeSorted!(Hidden.myCmp);
}

void main()
{
    auto x = bar();
    auto d = Data.init;
    find(x, d);
    
}
