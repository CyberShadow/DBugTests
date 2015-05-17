alias Vector = ulong[3];

void fun(Vector vec, bool recursive = false)
{
    assert(vec[2] == 0);
    if (recursive)
    	return;
    fun(vec, true);
}

void main()
{
    Vector vec;
    fun(vec);
}
