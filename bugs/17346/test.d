struct X { int x; }

struct Y1
{
    this(X x)
    {
        writeln("rvalue: ", x.x);
    }
    
    this(const ref X x) // const
    {
        writeln("const lvalue ref: ", x.x);
    }
}

struct Y2
{
    this(X x)
    {
        writeln("rvalue: ", x.x);
    }
    
    this(ref X x) // non-const
    {
        writeln("lvalue ref: ", x.x);
    }
}

import std.stdio;

void main()
{
    auto y1_rval = Y1(X(1));
    auto x1_lval = X(2);
    auto y1_lval = Y1(x1_lval); // should call the ref-overload
    
    auto y2_rval = Y2(X(3));
    auto x2_lval = X(4);
    auto y2_lval = Y2(x2_lval); // should call the ref-overload
}
