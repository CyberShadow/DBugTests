alias I(alias X) = X;
alias foo = I!((int x) => x);
alias foo = I!((string x) => x);

void main()
{
    foo(1);
    foo("a");    // line 7
}
