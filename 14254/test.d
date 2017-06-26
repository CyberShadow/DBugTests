unittest
{
    int[] upvalue;

    struct S
    {
        ~this()
        { 
            upvalue ~= 0; // segfault
        }
    }

    struct Outer
    {
        S s2 = S();
    }

    {
        Outer outer;
    } // destructor called here
}
