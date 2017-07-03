void main()
{
    import core.simd;
    import std.stdio;
    import std.math;

    union Matrix4x4 { float[16] a; float4[4] b; float8[2] c; alias a this; }
    float8 onStackA;
    float8 onStackB;

    writeln("SIMD vector types inherit their base type's alignment:");
    writefln("float8.alignof yields %s but should yield 32.", float8.alignof);
    writefln("void16.alignof yields %s but should yield 16.", void16.alignof);
    writefln("When embedded, a float4 exposes some hidden alignment, as it changes to %s.", Matrix4x4.alignof);
    writeln("The float8 needs a 32 byte alignment though or we SEGFAULT as soon as we load c[0] or c[1].");
    writefln("Even worse, the stack space occupied by these %s byte vectors is only %s!",
        float8.sizeof, abs(cast(ptrdiff_t)&onStackB - cast(ptrdiff_t)&onStackA));
}
