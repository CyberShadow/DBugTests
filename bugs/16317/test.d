int add8ret3(ref int s)
{
    s += 8;
    return 3;
}

int binAdd(int val)
{
    val = val + add8ret3(val);
    return val;
}

void main()
{
    assert(binAdd(1) == (1 + 3));
    static assert(binAdd(1) == (1 + 3));
}
