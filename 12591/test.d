struct S(T) //MUST BE TEMPLATE!
{
    this(this)
    {}   
}

void main()
{
    alias T1 = Tup!(S!int);
}

struct Tup(Types...)
{
    Types expand;
    this(Types values)
    {    
        expand[] = values[];
    }    
}
