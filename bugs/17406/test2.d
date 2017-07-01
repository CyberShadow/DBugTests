void f(int a, int b, int c)
{
	assert(c == 81);
}

void main()
{
    int num = 10;
    f(--num, num*num, num^^2);
}
