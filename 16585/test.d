int[] fun(long[] arg) pure
{
    return cast(int[]) arg;
}
void main()
{ 
    long[] a = [1];
    immutable i = fun(a); /* Should be rejected. Only ok when fun(a) is
        actually unique. */
    immutable copy = i.dup;
    assert(copy == i); /* Passes. */
    a[0] = 2; /* Affects the immutable i. */
    assert(copy == i); /* Fails now. */
}
