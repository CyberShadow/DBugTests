alias foo = (int x) => x;
alias foo = (string x) => x;

void main()
{
    foo(1);
    foo("a");    // line 7
}
