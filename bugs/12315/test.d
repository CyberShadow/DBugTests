import std.array: array;
struct Foo1 {
    int i;
}
struct Foo2 {
    immutable int i;
}
void main() {
    enum r1 = [Foo1(1)].array; // OK
    enum r2 = [Foo2(1)].array; // Error
}
