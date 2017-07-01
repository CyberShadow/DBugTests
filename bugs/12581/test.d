struct S
{
    int[3] a;
    alias a this;
}
struct T
{
    S s;
    alias s this;
}
void main()
{
    T x;
    x[] = (undef = 1);
}
