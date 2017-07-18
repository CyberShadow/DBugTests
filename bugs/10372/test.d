struct S
{ @disable this(this); }

S makeS()
{
    S s = S();
    return s;
}

void main()
{
    S s = makeS();
}
