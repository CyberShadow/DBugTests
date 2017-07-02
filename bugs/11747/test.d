struct Foo {
    @disable string toString();
}
void main() {
    import std.stdio;
    Foo f;
    writeln(f);
}
