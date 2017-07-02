module test;

import std.algorithm;

struct Set(E)
{
    E[] sortedElements() inout
    {
        E[] elems = payload.keys;
        sort(elems);  // Causes error
        return elems;
    }

    int[E] payload;
}

enum E { a, b }

struct S
{
    Set!E e;
}

void main()
{
    S s;
}
