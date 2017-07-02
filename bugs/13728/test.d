void main() {
    import std.conv: to;
    string[] data = ["1.5", "2", "3"];
    static struct Foo { double a; uint b, c; }
    auto foo = data.to!Foo;
}
