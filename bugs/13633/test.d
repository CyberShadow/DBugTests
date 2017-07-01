module test1;

struct A
{
    this(this)
    {
    }
}

struct B
{
    A a;
}

struct C
{
    const B b;
    @disable this(this);
} 
