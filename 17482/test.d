import std.variant, std.typecons;

void main()
{
    Nullable!Variant a;
    a == 11; // Yes, comparison intended
}
