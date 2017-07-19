int[1] foo1(int[1] a) {
    a[] += 10;
    return a;         // OK.
}
int[1] foo2(int[1] a) {
    return a[] += 10; // Error.
}
void main() {}
