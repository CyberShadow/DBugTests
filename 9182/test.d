struct Foo {
    static immutable F = Foo();
    static immutable Foo[1] foos1 = [F];
    static immutable foos3 = [F];
}
void main() {}
