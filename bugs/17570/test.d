import std.traits;

struct S(T) {
    void func() if(isIntegral!T) {
    }
}
