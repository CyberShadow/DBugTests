alias TypeTuple(T...) = T;

auto before(alias Hook)(string parameter_name)
{
    return 0;
}

template checkUDAs(alias Function, string name)
{
    alias attributes = TypeTuple!(
        __traits(getAttributes, Function)
    );
}

//int foo() { return 42; }  // -> OK

void main()
{
    int foo() { return 42; }    // -> NG

    @before!foo("name1")
    void bar(int name1, double name2) {}

    alias X = checkUDAs!(bar, "name1");
}
