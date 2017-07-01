import core.simd;

import std.conv;

template MakeVecType(Base, ubyte length)
{
    mixin(`alias MakeVecType = ` ~ Base.stringof ~ length.to!string() ~ `;`);
}

alias BaseT = float;
static if(is(MakeVecType!(BaseT, 8)))
{
    enum vecLength = 8;
}
else static if(is(MakeVecType!(BaseT, 4)))
{
    enum vecLength = 4;
}
else static if(is(MakeVecType!(BaseT, 2)))
{
    enum vecLength = 2;
}
else
{
    static assert(false, "Insufficient SIMD support");
}
