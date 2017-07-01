void main() {
    import std.array: assocArray;
    import std.typecons: Tuple;
    Tuple!(int, immutable(char))[] a1;
    immutable(char)[int] aa = assocArray(a1);
}
