template foo(T)
{
    void foo()(auto ref T v) { }
}
alias foo!int bar;

void main()
{
	foo(5);
	foo!int(5);
    bar(5);
}
