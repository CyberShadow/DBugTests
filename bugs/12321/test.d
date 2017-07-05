interface IA 
{
    shared void foo();
}

synchronized class A : IA
{
    void foo()
    in 
    {
        assert(false);
    }
    body
    {

    }

}

void main()
{
    shared IA a1 = new shared A();

    a1.foo();
}
