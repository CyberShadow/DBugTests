enum int[] a = [1, 2];
enum int[int] aa = [1: 2, 3: 4];

// Mimics builtin dup semantics for dynamic arrays
int[] mydup(int[] src)
{
    int[] dst;
    dst.length = src.length;
    foreach (i, n; dst)
        src[i] = n;
    return dst;
}

// Mimics builtin dup semantics for associative arrays
int[int] mydup(int[int] src)
{
    int[int] dst;
    foreach (k, v; src)
        dst[k] = v;
    return dst;
}

void main()
{
    assert(a !is a.dup);            // OK
    assert(a !is a.mydup);          // OK
    assert(aa !is aa.dup);          // OK
    assert(aa !is aa.mydup);        // OK

    static assert(a !is a.dup);     // Assert error
    static assert(a !is a.mydup);   // OK
    static assert(aa !is aa.dup);   // Assert error
    static assert(aa !is aa.mydup); // Assert error
}

