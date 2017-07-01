struct S
{
    bool opEquals(ref const S s) pure { return false; }    
}

void fun()
{
    S a, b;
    a == b;
}
