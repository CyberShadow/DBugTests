class Boo(alias func) {} 

class Foo
{    
    final auto Try()
    {
        return new Boo!((x) { return x; })();    
    }
}

void main()
{
    auto a = (new Foo()).Try();    
}
