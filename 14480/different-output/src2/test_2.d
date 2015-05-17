import std.math;

alias Vector = double[3];

void fun(Vector vec, bool recursive = false)
{
    assert(vec[2].isNaN);
    if (recursive)
    	return;
    fun(vec, true);
}

int main()
{
    Vector vec;
    fun(vec);
    return 0;
}
