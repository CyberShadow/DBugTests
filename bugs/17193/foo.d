import core.stdc.stdio;

deprecated("To be removed November 2017. Please use std.utf.encode instead.")
void toUTF8(return out char[4] buf, dchar c)
{
    pragma(msg, "bar CTFE");
    printf("bar()");
}

void toUTF8(S)(S s)
{
    pragma(msg, "foo CTFE");
    printf("foo()");
}
