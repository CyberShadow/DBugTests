class Dummy: Exception
{
    int[] data;
    @safe pure nothrow this(immutable int[] data) immutable
    {
        super("Dummy");
        this.data = data;
    }
}
@safe pure void modifyImmutable(immutable int[] data)
{
    try
    {
        immutable Dummy e = new immutable Dummy(data);
        throw e;
    }
    catch(Dummy e)
    {
        e.data[1] = 42;
    }
}
@safe pure void main()
{
    immutable int[] data = [1,2,3];
    assert(data == [1,2,3]);
    modifyImmutable(data);
    assert(data == [1,42,3]);
}
