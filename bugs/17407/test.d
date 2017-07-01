bool foo ()
{
    void delegate ( ) longest_convert;
    return __traits(compiles, longest_convert = &doesNotExists);
}

static assert(!foo);
