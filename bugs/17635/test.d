alias T = immutable int;

T** f(const T** input) pure
{
    T** output;
    return output;
}

void main()
{
    T i;
    T* p = &i;
    immutable T** r = f(&p);
        /* Error: cannot implicitly convert expression f(& p) of type
        immutable(int)** to immutable(int**) */
}
