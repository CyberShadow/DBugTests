import std.traits;

struct Foo {
    ref Foo opAssign(ref Foo rhs) return { return this; }
}

void main() {
    alias tup = ParameterStorageClassTuple!(__traits(getOverloads, Foo, "opAssign")[0]);
}
