import std.string;

string AM(string OB, JB)(JB BM = JB.max, JB DM = JB.init)
{
    string FM = q{
        alias %sAlias = MD!("%s", %s%s%s);

        struct %s {
            alias KM = %s;
            alias LM = %sAlias;
            alias MM = %s;

        }
    }.format(OB, OB, JB.stringof, BM, DM, OB, OB, OB, JB.stringof);

    //pragma(msg, "Typed identifier mixin for " ~ NAME ~ " is \n" ~ ret);
    return FM;
}

mixin(AM!("ErrNo", int));
mixin(AM!"InodeId"(0));
