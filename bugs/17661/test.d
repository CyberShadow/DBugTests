import std.range.primitives;
struct C {
    private S* impl;
}
struct S {
    bool empty;
    @property C front() return { return C(&this); }
    void popFront() { }

    static assert(isInputRange!S); // FAILS
}
