import std.traits : ParameterTypeTuple;

void foo()() {}

void main() {
    assert(!__traits(compiles, {struct A{ParameterTypeTuple!foo tmp;}}));
}
