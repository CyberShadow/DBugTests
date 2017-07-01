struct Foo {
    Foo opBinary(string op="-")(Foo f) {
        return Foo();
    }
}
void main() {
    auto Foo = Foo() + Foo();
}
