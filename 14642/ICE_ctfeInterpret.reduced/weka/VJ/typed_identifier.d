import std.string;

string UN(string DD, WI)(WI VN = WI.max, WI XN = WI.init)
{
    string ZN = q{
        alias %sAlias = WJ!("%s", %s%s%s);

        struct %s {
            alias DO = %s;
            alias EO = %sAlias;
            alias FO = %s;

        }
    }.format(DD, DD, WI.stringof, VN, XN, DD, DD, DD, WI.stringof);

    //pragma(msg, "Typed identifier mixin for " ~ NAME ~ " is \n" ~ ret);
    return ZN;
}

mixin(UN!("ErrNo", int));
mixin(UN!"InodeId"(0));
