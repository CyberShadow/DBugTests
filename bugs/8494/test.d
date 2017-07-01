import std.typecons;
int foo() {
    int[2] a;
    return a[1] = 5; // ok
}
Tuple!int bar() {
    Tuple!(int)[2] a;
    return a[1] = tuple(5); // error
}
void main() {}
