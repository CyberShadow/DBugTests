shared const int i;

static if (is(typeof(i) == shared U, U))
{
    pragma(msg, U);
}

void main()
{
}
