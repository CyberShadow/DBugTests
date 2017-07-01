import std.typecons : Nullable;

class C
{
    Nullable!int nullable;

    this()
    {
        nullable = 0; // Warning: calling std.typecons.Nullable!int.Nullable.this without side effects discards return value of type Nullable!int, prepend a cast(void) if intentional
    }
}

void main()
{
    Nullable!int n;
    n = 0; // ok
}

