import std.stdio;
struct Foo {
    int val;
    this(int val) {
        writefln("%s.this(int)", val);
        this.val = val;
    }
    this(this) {
        writefln("%s.this(this)", val);
        this.val = val;
    }
    ~this() {
        writefln("%s.~this()", val);
        this.val = val;
    }
}
struct Bar {
    Foo foo;
    this(Foo foo, bool) { this.foo = foo; }
}

bool fun(bool val) { return !val; }

auto genBar(bool flag) {
    return flag ? Bar() : Bar(Foo(10), fun(!flag));
}

void main(string[] args) {
    auto bar = genBar(args.length == 0);
}
