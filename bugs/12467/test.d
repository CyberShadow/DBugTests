string dupit(ref char[3] array)
{
    return array[];
}

void main()
{
    char[3] arr = "foo";
    string str = arr.dupit;
    assert(str.ptr !is arr.ptr);  // oops
}
