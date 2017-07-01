mixin template foobar()
{
    this() { }
}

class One
{
    mixin foobar;
    this(int a) //without this ctor all will be fine
    {
        this(); //default ctor is available from here, but not from Two 
    }
};

class Two:One 
{
}
