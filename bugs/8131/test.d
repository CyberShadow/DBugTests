import std.range;
void f(R)(R, void delegate(ElementType!R)) { }
void main() { f([1], (int x) { }); }
