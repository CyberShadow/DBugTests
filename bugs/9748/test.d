template Tuple(T...) { alias T Tuple; }

void main()
{
    foreach (i; Tuple!(1, 2, 3))
    {
        uint j;
        void set()(int n) { j = n; }
        set(i);
        assert(j==i);
    }
}
