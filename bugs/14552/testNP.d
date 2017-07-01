template map(fun...)
{
    template AppliedReturnType(alias f)
    {
        alias typeof(f(0)) AppliedReturnType;
    }

    auto map(int[] r)
    {
        assert(!is(AppliedReturnType!fun));
        return MapResult!fun();
    }
}

struct MapResult(alias fun)
{
    @property front()
    {
        fun(0);
    }
}

class Outer
{
    auto test()
    {
        [1].map!( (j) { return new Inner; } );
    }
    class Inner {}
}
