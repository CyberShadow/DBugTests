mixin template methodMix()
{
    void foo(int n) { }
}

mixin template operatorMix()
{
    void opBinary(string op)(int n) { }
}

mixin template ctorMix()
{
    this(int n) { }
}

struct MethodTest
{
    mixin methodMix mix;

    alias foo = mix.foo;

    void foo(string s) { }
}

struct OperatorTest
{
    mixin operatorMix mix;

    alias opBinary = mix.opBinary;

    void opBinary(string op)(string s) { } // [1]
}

struct CtorTest
{
    mixin ctorMix mix;

    // If only I could do the following to bring the
    // mixed-in constructor to the overload set:
    //alias this = mix.this;

    this(string s) { }
}

void main()
{
    MethodTest mt;
    mt.foo(3);

    OperatorTest ot;
    ot + 3;

    auto ct = CtorTest(3); // [2]
}
