import std.functional;

void main(string[] args)
{
    foo!(binaryFun!"a + b")();
    foo!((a,b) => a + b)();
}

void foo(alias pred)()
{
    alias A = Test1!int.Test2!pred;
}

template Test1(E)
{
    static template Test2(alias pred)
    {    
    }    
}
