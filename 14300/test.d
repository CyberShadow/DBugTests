import std.container.dlist;

interface ITest {}

class Test : ITest {}   

void main()
{
        DList!ITest().insertBack(new Test());
}
