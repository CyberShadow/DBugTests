enum Enum : ubyte
{
    Test
}

void main()
{
    ubyte[] array;
    array = array ~ [Enum.Test];
}
