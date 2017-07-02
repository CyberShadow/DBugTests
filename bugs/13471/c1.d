//version = check;

enum buggy1 = foo("Hello World!");

ubyte[4] foo(string str) 
{
    uint _state = uint.max;
    ubyte[4] result = nativeToLittleEndian(~_state);

    version(check)
    {
        import std.exception;
        enforce(result != (ubyte[4]).init, "this should not be thrown");
    }
    return result;
}

union EndianSwapper(T)
{
    T value;
    ubyte[T.sizeof] array;
}

auto nativeToLittleEndian(T)(T val)
{
    return nativeToLittleEndianImpl(val);
}

auto nativeToLittleEndianImpl(T)(T val)
{
    EndianSwapper!T es = void;
    es.value = val;
    return es.array;
}
