template canBeAlias(T...)
if (T.length == 1)
{
    enum canBeAlias = is(typeof({ alias T[0] _; }));
}

static assert(canBeAlias!(canBeAlias!canBeAlias));
//Error: static assert (!true) is false
static assert(!canBeAlias!true);
