T[] copyArray(T=I, I)(I[] input)
{
    auto result = new T[input.length];
    foreach (n, ref i; input)
        result[n] = i;
    return result;
}

void main()
{
    // copy as is
    int[] r1 = copyArray([1, 2, 3]);
    // copy to another type
    long[] r2 = copyArray!long([1, 2, 3]);
}
