// compile on windows with "dmd -m64 -O test.d" => BAD

import std.stdio;
import std.array;
import std.math;
import std.algorithm;
import std.range;

struct Vector(T, alias N)
{
    enum size = N;
    alias T ValueType;
    alias v this;

    this (T...) (T args)
    {
        static if(args.length == 1)
            v[] = args[0];
        else static if(args.length == N)
            v[] = [args];
        else
            static assert("wrong number of arguments");
    }
    Vector opUnary(string op)() const
        if( op =="-" )
    {
        mixin("return Vector(" ~ Unroll!("v[%] * (-1)", N, ",") ~ ");");
    }
    Vector opBinary(string op)(auto ref in T rhs) const
        if( op == "+" || op =="-" || op=="*" || op=="/" )
    {
        mixin("return Vector(" ~ Unroll!("v[%]"~op~"rhs", N, ",") ~ ");");
    }
    Vector opBinary(string op)(auto ref in Vector rhs) const
        if( op == "+" || op =="-" || op=="*" || op=="/" )
    {
        mixin("return Vector(" ~ Unroll!("v[%]"~op~"rhs.v[%]", N, ",") ~ ");");
    }
    ref Vector opOpAssign(string op)(auto ref in Vector rhs)
        if( op == "+" || op =="-" || op=="*" || op=="/" )
    {
        mixin("v[]"~op~"=rhs.v[];");
        return this;
    }

    static if (N >= 1)
    {
        T x() const { return v[0]; }
        ref T x()   { return v[0]; }
    }
    static if (N >= 2)
    {
        T y() const { return v[1]; }
        ref T y()   { return v[1]; }
    }
    static if (N >= 3)
    {
        T z() const { return v[2]; }
        ref T z()   { return v[2]; }
    }

    alias v this;

    T[N] v;
}
protected template Unroll(alias CODE, alias N, alias SEP="")
{
    import std.string;
    enum t = replace(CODE, "%", "%1$d");
    enum Unroll = iota(N).map!(i => format(t, i)).join(SEP);
}

V.ValueType dot(V, V2)(auto ref in V v1, auto ref in V2 v2)
    if( is(V.ValueType == V2.ValueType) )
{
    return mixin(Unroll!("v1[%]*v2[%]", V.size, "+"));
}

void bezier(T)(in T p1, in T p2, in T p3, in T p4, int indent)
{
    writefln("%s%s %s %s %s", replicate(" ", indent), p1, p2, p3, p4);
    
    auto p12   = (p1 + p2) / 2;
    auto p23   = (p2 + p3) / 2;
    auto p34   = (p3 + p4) / 2;
    auto p123  = (p12 + p23) / 2;
    auto p234  = (p23 + p34) / 2;
    auto p1234 = (p123 + p234) / 2;

    auto d = p4 - p1;
    auto d2 = fabs(((p2.x - p4.x) * d.y - (p2.y - p4.y) * d.x));
    auto d3 = fabs(((p3.x - p4.x) * d.y - (p3.y - p4.y) * d.x));

    if((d2 + d3)*(d2 + d3) < 0.25 * dot(d, d))
    {
        return;
    }

    bezier(p1, p12, p123, p1234, indent+2);
    bezier(p1234, p234, p34, p4, indent+2);
}

int main(string[] args)
{
    alias Vector!(double, 2) VEC;
    auto p1 = VEC(563.022, 319.849);
    auto p2 = VEC(534.772, 266.534);
    auto p3 = VEC(551.44, 365.862);
    auto p4 = VEC(551.44, 365.862);
    bezier(p1,p2,p3,p4,0);
    return 0;
}
