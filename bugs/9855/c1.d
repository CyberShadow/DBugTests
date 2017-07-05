struct Tuple(Types...)
{
    alias TypeTuple = Types;
    alias TypeTuple this;
}

alias list = Tuple!int;

void main()
{
    static assert(is(list.TypeTuple[0] == int));  // ok
    pragma(msg, list[0]);  // 'int'
    //static assert(is(list[0] == int));  // ng
}
