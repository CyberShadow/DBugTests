struct S
{
    int[0] a;

    void do_it()
    {
        foo(a);
    }
}

void foo(int[0] arg)
{
	// if (arg.ptr == null)
	// 	return;

    bar(arg);
}

void bar(int[0] arg)
{
	if (arg.ptr == null)
		return;
}

void main()
{}
